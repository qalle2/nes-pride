# convert images of pride flags into NES-compatible format

# NES graphics glossary (assuming NROM/CNROM and no raster effects):
#
# Palettes:
# - master palette: 64 colors (not all different)
# - (sub)palette = 4 color indexes from master palette
# - palette(s) = 8 subpalettes (4 for background, 4 for sprites); stored in PPU
# - background color = first color of every subpalette
#
# Background & sprite graphics:
# - tile = 8*8 pixels, 2 bits/pixel
# - PT = pattern table; pixel data (16 bytes/tile) for 256 tiles
# - CHR ROM = all PTs (NROM has 2, CNROM has 8); stored on cartridge
#
# Background graphics:
# - screen = NT + AT = 256*240 pixels = 32*30 tiles = 16*15 attribute blocks
#        (not all visible without scrolling)
# - VRAM = 2 screens; separate RAM chip inside the NES
# - NT = name table; 1 PT index (byte) for each tile position on screen; can't
#        have tiles from more than one PT at the same time
# - attribute block = 2*2 tiles
# - AT = attribute table; 1 subpalette index (2 bits) for each attribute block
#        position on screen; 1 byte = 2*2 indexes; actual size is 8*8 bytes
#        (16*16 attribute blocks) but bottom attribute block row is unused
#
# Sprite graphics:
# - sprite = 1*1 or 1*2 tiles; 1*1-tile sprites can't have tiles from more than
#            one PT at the same time; subpalette selectable for each sprite;
#            background color is transparent
# - OAM = object attribute memory; data for 64 sprites; stored in PPU

import os, sys
from collections import Counter
from itertools import chain, combinations
from re import search
from PIL import Image  # Pillow, https://python-pillow.org

IMAGE_DIR  = "img"           # read images from this path
IMAGE_EXT  = ".png"          # read images with this extension
TITLE_FILE = "title_screen"  # sort this image first (no extension)
ASM_FILE   = "imgdata.asm"   # write all data except PTs in ASM6 format here

BANK_COUNT = 4  # number of CHR banks

# write PT data here
PT_FILES = tuple(f"chr-bg{n}.bin" for n in range(BANK_COUNT * 2))

# maximum number of tiles in PT0/PT1 in each bank
PT_MAX_TILES = (256, 208)

# optional manually-specified pattern tables by filename;
# makes sure similar images end up in the same PT;
# automatic assignment takes place after this;
# the order of this dict does not matter
IMAGE_PTS = {
    # white pawprint
    "asexual_furry2":         0,
    "bisexual_furry2":        0,
    "lesbian_5stripes_furry": 0,
    "non-_binary_furry":      0,
    "pan-_sexual_furry2":     0,
    "rainbow_furry2":         0,
    "trans-_gender_furry2":   0,
    # black pawprint
    "asexual_furry1":       1,
    "bisexual_furry1":      1,
    "pan-_sexual_furry1":   1,
    "trans-_gender_furry1": 1,
    # infinity symbol
    "autism":          2,
    "autism_hstripes": 2,
    "autism_vstripes": 2,
}

# optional manually-defined palettes by filename;
# up to 4 tuples with up to 3 NES colors each (no NES_BG_COLOR);
# must have exactly the same colors as the image, minus NES_BG_COLOR;
# these reduce the number of unique tiles by making sure the PT colors are
# similar as well as the actual colors,
MANUAL_SUBPALS = {
    # --- white pawprint ---

    "asexual_furry2": (          # 3 colors + black
        (0x30, 0x14, 0x00),      # white, purple, gray
        (0x30, 0x00),            # white, gray
    ),
    "bisexual_furry2": (         # 4 colors
        (0x30, 0x13, 0x15),      # white-purple-pink
        (0x30, 0x13, 0x12),      # white-purple-blue
        (0x30, 0x15),            # white-pink
        (0x30, 0x12),            # white-blue
    ),
    "lesbian_5stripes_furry": (  # 5 colors
        (0x30, 0x14, 0x24),      # white, dark magenta, light magenta
        (0x30, 0x14, 0x27),      # white, dark magenta, orange
        (0x30, 0x17, 0x27),      # white, brown, orange
        (0x30, 0x27),            # white, orange
    ),
    "non-_binary_furry": (       # 3 colors + black
        (0x30, 0x13, 0x28),      # white, purple, yellow
        (0x30, 0x28),            # white, yellow
    ),
    "pan-_sexual_furry2": (      # 4 colors
        (0x30, 0x15, 0x21),      # white-pink-cyan
        (0x30, 0x21),            # white-cyan
        (0x30, 0x28),            # white-yellow
    ),
    "rainbow_furry2": (          # 7 colors
        (0x30, 0x04, 0x27),      # white-purple-orange
        (0x30, 0x04, 0x12),      # white-purple-blue
        (0x30, 0x16, 0x28),      # white-red-yellow
        (0x30, 0x19),            # white-green
    ),
    "trans-_gender_furry2": (    # 3 colors
        (0x30, 0x21, 0x25),      # white, cyan, pink
        (0x30, 0x25),            # white, pink
        (0x21, 0x25),            # cyan, pink
    ),

    # --- black pawprint ---

    "asexual_furry1": (        # 3 colors + black
        (0x00,),               # gray
        (0x30,),               # white
        (0x14,),               # purple
    ),
    "bisexual_furry1": (       # 3 colors + black
        (0x15,),               # pink
        (0x13, 0x15),          # purple-pink
        (0x13, 0x12),          # purple-blue
        (0x12,),               # blue
    ),
    "pan-_sexual_furry1": (    # 3 colors + black
        (0x15,),               # red
        (0x28,),               # yellow
        (0x21,),               # blue
    ),
    "trans-_gender_furry1": (  # 3 colors + black
        (0x30, 0x25),          # white, pink
        (0x25, 0x21),          # pink, cyan
    ),

    # --- autism (try to have the infinity symbol as color 2 on color 1) ---

    "autism": (              # 5 colors
        (0x37, 0x27),        # yellow, orange
        (0x37, 0x21, 0x27),  # yellow, blue, orange
        (0x37, 0x25),        # yellow, red
        (0x37, 0x29),        # yellow, green
    ),
    "autism_hstripes": (     # 6 colors
        (0x16, 0x26),        # dark red, light red
        (0x28, 0x30, 0x26),  # yellow, white, light red
        (0x28, 0x30, 0x2a),  # yellow, white, light green
        (0x1a, 0x2a),        # dark green, light green
    ),
    "autism_vstripes": (     # 4 colors
        (0x16, 0x30, 0x1a),  # red, white, green
        (0x1a, 0x30, 0x12),  # green, white, blue
        (0x12, 0x30),        # blue, white
        (0x16, 0x1a),        # red, green
    ),
}
assert all(1 <= len(p) <= 4                 for p in MANUAL_SUBPALS.values())
assert all(all(1 <= len(s) <= 3 for s in p) for p in MANUAL_SUBPALS.values())

# Changing these requires changing the NES program as well.
#
# NES color for background and unused colors; also the border color (top &
# bottom of NT), which is why supporting other BG colors is not useful at all
NES_BG_COLOR = 0x0f  # black
VERT_AT_BLKS = 12  # image height in AT blocks
# RLE-compressed NT/AT data slices: count, uncompressed size (last one may be
# smaller)
RLE_SLICE_COUNT = 6
RLE_SLICE_SIZE = 140

# NT data size + AT data size <= storage capacity
assert VERT_AT_BLKS * 2 * 32 + 8 * 8 <= RLE_SLICE_COUNT * RLE_SLICE_SIZE

# NES master palette
# key=index, value=(red, green, blue); source: FCEUX (fceux.pal)
# colors omitted (hexadecimal): 0d-0e, 1d-20, 2d-2f, 3d-3f
NES_PALETTE = {
    0x00: (0x74, 0x74, 0x74),  # dark gray
    0x01: (0x24, 0x18, 0x8c),  # x1 = cyan/blue
    0x02: (0x00, 0x00, 0xa8),  # x2 = blue
    0x03: (0x44, 0x00, 0x9c),  # x3 = purple
    0x04: (0x8c, 0x00, 0x74),  # x4 = magenta
    0x05: (0xa8, 0x00, 0x10),  # x5 = magenta/red
    0x06: (0xa4, 0x00, 0x00),  # x6 = red/orange
    0x07: (0x7c, 0x08, 0x00),  # x7 = gold
    0x08: (0x40, 0x2c, 0x00),  # x8 = yellow
    0x09: (0x00, 0x44, 0x00),  # x9 = yellow/green
    0x0a: (0x00, 0x50, 0x00),  # xA = green
    0x0b: (0x00, 0x3c, 0x14),  # xB = green/cyan
    0x0c: (0x18, 0x3c, 0x5c),  # xC = cyan
    0x0f: (0x00, 0x00, 0x00),  # black
    0x10: (0xbc, 0xbc, 0xbc),  # light gray
    0x11: (0x00, 0x70, 0xec),
    0x12: (0x20, 0x38, 0xec),
    0x13: (0x80, 0x00, 0xf0),
    0x14: (0xbc, 0x00, 0xbc),
    0x15: (0xe4, 0x00, 0x58),
    0x16: (0xd8, 0x28, 0x00),
    0x17: (0xc8, 0x4c, 0x0c),
    0x18: (0x88, 0x70, 0x00),
    0x19: (0x00, 0x94, 0x00),
    0x1a: (0x00, 0xa8, 0x00),
    0x1b: (0x00, 0x90, 0x38),
    0x1c: (0x00, 0x80, 0x88),
    0x21: (0x3c, 0xbc, 0xfc),
    0x22: (0x5c, 0x94, 0xfc),
    0x23: (0xcc, 0x88, 0xfc),
    0x24: (0xf4, 0x78, 0xfc),
    0x25: (0xfc, 0x74, 0xb4),
    0x26: (0xfc, 0x74, 0x60),
    0x27: (0xfc, 0x98, 0x38),
    0x28: (0xf0, 0xbc, 0x3c),
    0x29: (0x80, 0xd0, 0x10),
    0x2a: (0x4c, 0xdc, 0x48),
    0x2b: (0x58, 0xf8, 0x98),
    0x2c: (0x00, 0xe8, 0xd8),
    0x30: (0xfc, 0xfc, 0xfc),  # white
    0x31: (0xa8, 0xe4, 0xfc),
    0x32: (0xc4, 0xd4, 0xfc),
    0x33: (0xd4, 0xc8, 0xfc),
    0x34: (0xfc, 0xc4, 0xfc),
    0x35: (0xfc, 0xc4, 0xd8),
    0x36: (0xfc, 0xbc, 0xb0),
    0x37: (0xfc, 0xd8, 0xa8),
    0x38: (0xfc, 0xe4, 0xa0),
    0x39: (0xe0, 0xfc, 0xa0),
    0x3a: (0xa8, 0xf0, 0xbc),
    0x3b: (0xb0, 0xfc, 0xcc),
    0x3c: (0x9c, 0xfc, 0xf0),
}

# --- Used in many places -----------------------------------------------------

def filename_to_path(filename):
    return os.path.join(IMAGE_DIR, filename) + IMAGE_EXT

def color_diff(rgb1, rgb2):
    # get difference (0-768) of two colors (red, green, blue)
    return sum(abs(comp[0] - comp[1]) for comp in zip(rgb1, rgb2))

def closest_nes_color(rgb):
    # get best match (NES color index) for color (red, green, blue)
    minDiff = 9999
    for nesColor in sorted(NES_PALETTE):
        diff = color_diff(NES_PALETTE[nesColor], rgb)
        if diff < minDiff:
            minDiff = diff
            bestNesColor = nesColor
    return bestNesColor

def get_color_conv_table(image):
    # return a dict for converting image's original color indexes into NES
    # color indexes

    # color indexes actually used in image data
    indexesUsed = set(i for (cnt, i) in image.getcolors() if cnt > 0)
    # [R, G, B, ...]; may contain unused colors
    palette = image.getpalette()
    # {origIndex: nesColorIndex, ...}
    return dict(
        (i, closest_nes_color(palette[i*3:(i+1)*3])) for i in indexesUsed
    )

def get_nes_pixels(image):
    # return image pixels as NES color indexes
    origToNes = get_color_conv_table(image)  # {origIndex: nesColorIndex, ...}
    return tuple(origToNes[i] for i in image.getdata())

# --- Image validation & palette generation -----------------------------------

def validate_image(image):
    if image.width != 256 or image.height != VERT_AT_BLKS * 16:
        sys.exit(f"Image must be 256*{VERT_AT_BLKS*16} pixels.")
    if image.mode != "P":
        sys.exit("Image must have a palette.")

    nesColors = get_color_conv_table(image).values()
    if len(set(nesColors) - {NES_BG_COLOR}) > 12:
        sys.exit(
            f"Can't have more than 12 unique colors plus ${NES_BG_COLOR:02x}."
        )
    if len(set(nesColors)) < len(nesColors):
        sys.exit(
            "More than one image color corresponds to the same NES color. Try "
            "making the colors more distinct."
        )

def get_color_sets(nesPixels):
    # generate set of NES color indexes for each attribute block
    # nesPixels: image pixels as NES color indexes

    colors = set()
    for ay in range(0, VERT_AT_BLKS * 16, 16):
        for ax in range(0, 16 * 16, 16):
            colors.clear()
            for py in range(16):
                si = (ay + py) * 256 + ax  # source index
                colors.update(nesPixels[si:si+16])
            yield frozenset(colors)

def get_sorted_color_sets(nesPixels):
    # get color sets, clean up and sort
    # nesPixels: image pixels as NES color indexes

    # get unique sets of color indexes in attribute blocks
    colorSets = {
        frozenset(s - {NES_BG_COLOR}) for s in get_color_sets(nesPixels)
    }
    if max(len(s) for s in colorSets) > 3:
        sys.exit(
            f"Can only have 3 unique colors plus ${NES_BG_COLOR:02x} per "
            "attribute block."
        )

    # delete sets that are a subset of another set
    colorSets = {
        s1 for s1 in colorSets
        if not any(s1.issubset(s2) and s1 != s2 for s2 in colorSets)
    }

    # sort sets by number of colors (important) and by colors they contain
    # (for determinism)
    colorSets = sorted(colorSets, key=lambda s: sorted(s))
    return sorted(colorSets, key=lambda s: len(s), reverse=True)

def create_subpalettes(nesPixels):
    # return a list of 4 subpalettes (sets) with up to 3 color indexes each
    # nesPixels: image pixels as NES color indexes
    # printExtraInfo: print intermediate results (bool)

    colorSets = get_sorted_color_sets(nesPixels)
    subpals = [set() for i in range(4)]

    for colorSet in colorSets:
        # get maximum number of common colors with a subpalette in which
        # the new colors fit
        try:
            maxCnt = max(
                len(s & colorSet) for s in subpals
                if len(s | colorSet) <= 3
            )
        except ValueError:
            sys.exit(
                f"Couldn't arrange colors into 4 subpalettes with 3 unique "
                f"colors plus ${NES_BG_COLOR:02x} each."
            )
        # which subpalette was it (first one if several)
        bestSubpal = [
            i for (i, s) in enumerate(subpals)
            if len(s & colorSet) == maxCnt and len(s | colorSet) <= 3
        ][0]
        # add colors there
        subpals[bestSubpal].update(colorSet)

    return subpals

def get_palette(nesPixels, filename):
    # return palette for image as a tuple of 4 tuples of NES color indexes
    # nesPixels: image pixels as NES color indexes

    print(f"\t\tUnique colors: " + ", ".join(
        format(c, "02x") for c in sorted(set(nesPixels) - {NES_BG_COLOR})
    ))
    colorSets = get_sorted_color_sets(nesPixels)
    print(f"\t\tColor sets   : " + ", ".join(
        "+".join(f"{c:02x}" for c in sorted(s)) for s in colorSets
    ))

    # get subpalettes
    if filename in MANUAL_SUBPALS:
        # manually-defined
        subpals = MANUAL_SUBPALS[filename]
        definedColors = set(chain.from_iterable(subpals))
        actualColors = set(nesPixels) - {NES_BG_COLOR}
        if actualColors - definedColors:
            sys.exit(
                "Manual subpalette definition lacks some of the image's "
                "colors."
            )
        if definedColors - actualColors:
            sys.exit(
                "Manual subpalette definition contains colors not present in "
                "the image."
            )
        # pad number of subpalettes to 4
        subpals = list(subpals) + (4 - len(subpals)) * [()]
        # restore background colors and pad each subpalette
        subpals = tuple(
            tuple([NES_BG_COLOR] + list(sp) + (3 - len(sp)) * [NES_BG_COLOR])
            for sp in subpals
        )
    else:
        # get automatically
        subpals = create_subpalettes(nesPixels)
        # order subpalettes, restore background color and pad each subpalette
        subpals = tuple(
            tuple([NES_BG_COLOR] + sorted(sp) + (3 - len(sp)) * [NES_BG_COLOR])
            for sp in subpals
        )

    return subpals

# --- PT data generation ------------------------------------------------------

def get_subpal_index(colorSet, subpals):
    # Return subpalette index (int 0-3) for one attribute block.
    # Prefer subpalettes where the needed colors are at low indexes.
    # colorSet: unique NES color indexes in attribute block (including
    #           background color)
    # subpals: list of 4 lists of 4 NES colors

    lowestScore = 999999
    bestSubpal = -1

    for (si, subpal) in enumerate(subpals):
        try:
            score = sum(2 ** subpal.index(c) for c in colorSet)
        except ValueError:
            score = 999999
        if score < lowestScore:
            lowestScore = score
            bestSubpal = si

    if bestSubpal == -1:
        sys.exit(
            "Couldn't find proper subpalette. Error in manual palette "
            "definition?"
        )

    return bestSubpal

def get_tiles(nesPixels):
    # generate each tile as NES color indexes (a tuple of 64 ints)
    # nesPixels: image pixels as NES color indexes

    pixels = []

    for ty in range(VERT_AT_BLKS * 2):  # tile Y
        for tx in range(32):  # tile X
            pixels.clear()
            for py in range(8):  # pixel Y
                si = (ty * 8 + py) * 256 + tx * 8  # source index
                pixels.extend(nesPixels[si:si+8])
            yield tuple(pixels)

def convert_tiles(nesPixels, atData, subpals):
    # generate each tile as a tuple of 64 2-bit ints
    # nesPixels: image pixels as NES color indexes
    # subpals: a tuple of 4 tuples of 4 NES color indexes

    # invert subpalettes: [{nesColorIndex: indexInSubpal, ...}, ...]
    subpalsInv = [dict((c, s.index(c)) for c in set(s)) for s in subpals]

    for (ntI, tile) in enumerate(get_tiles(nesPixels)):
        # get inverted subpalette for tile;
        # bits: NT index YYYYyXXXXx -> AT index YYYYXXXX
        subpalInv = subpalsInv[atData[(ntI >> 2) & 0xf0 | (ntI >> 1) & 0xf]]
        # convert NES color indexes into indexes to subpalette
        yield tuple(subpalInv[i] for i in tile)

def get_unique_tiles(filename, palette):
    # get unique tiles as tuples of 64 2-bit ints
    with open(filename_to_path(filename), "rb") as handle:
        handle.seek(0)
        nesPixels = get_nes_pixels(Image.open(handle))
    atData = [get_subpal_index(s, palette) for s in get_color_sets(nesPixels)]
    return set(convert_tiles(nesPixels, atData, palette))

def encode_pt_data(tiles):
    # generate encoded PT data for all images in one PT as 8-bit ints
    # tiles: each tile as 64 2-bit ints
    for tile in tiles:
        for bp in range(2):  # bitplane
            bits = [(c >> bp) & 1 for c in tile]
            for py in range(8):  # pixel Y
                yield sum(bits[py*8+i] << (7 - i) for i in range(8))

# --- ASM file generation -----------------------------------------------------

def write_asm_preamble(filenames, handle):
    # write ASM6-compatible assembly code for table of contents etc.
    # handle: destination file handle

    print(
        "; Image data excluding pattern tables. Generated by convert.py.",
        file=handle
    )
    print("", file=handle)

    print("image_count equ " + str(len(filenames)), file=handle)
    print("", file=handle)

    print("image_ptrs", file=handle)
    ptrs = [f"img{i}_ptrs" for i in range(len(filenames))]
    for i in range(0, len(ptrs), 5):
        print("\tdw " + ", ".join(ptrs[i:i+5]), file=handle)
    print("", file=handle)

    for fi in range(len(filenames)):
        print(f"img{fi}_ptrs", file=handle)
        ptrs = (
            [f"img{fi}_nt_at{si}" for si in range(RLE_SLICE_COUNT)]
            + [f"img{fi}_pt"]
            + [f"img{fi}_pal", f"img{fi}_txt"]
        )
        for pi in range(0, len(ptrs), 4):
            print("\tdw " + ", ".join(ptrs[pi:pi+4]), file=handle)
    print("", file=handle)

def encode_at_data(atData):
    # pad AT data and generate it as 64 bytes (ints)
    # atData: VERT_AT_BLKS*16 2-bit ints

    # pad to 16 rows (last one unused by the NES)
    atData = (15 - VERT_AT_BLKS) * 16 * [0] + atData + 16 * [0]

    atBytes = bytearray()
    for y in range(8):
        for x in range(8):
            si = (y * 16 + x) * 2  # source index
            yield (
                atData[si]
                | (atData[si+1] << 2)
                | (atData[si+16] << 4)
                | (atData[si+16+1] << 6)
            )

def rle_encode_raw(data):
    # generate runs: (length, byte); length = 1-127

    start = -1  # start position of current run
    prev = -1   # previous byte

    for (i, byte) in enumerate(data):
        if start == -1:
            # start first run
            start = i
        elif prev != byte or i - start == 127:
            # restart run
            yield (i - start, prev)
            start = i
        prev = byte
    if start > -1:
        # end last run
        yield (len(data) - start, prev)

def rle_encode(data):
    # generate bytes: direct_byte, run, run, ..., 0
    # 1st byte of data is the direct (implied) byte; other bytes are runs of
    # 1-2 bytes:
    #     0x00     : terminator (end of data)
    #     0x80     : (unused)
    #     0x01-0x7f: output direct_byte    1-127 times
    #     0x81-0xff: output following byte 1-127 times

    rawRleData = tuple(rle_encode_raw(data))

    # direct byte (the most common byte that begins a run)
    directByte = Counter(r[1] for r in rawRleData).most_common(1)[0][0]
    yield directByte

    # RLE data itself
    for (length, byte) in rawRleData:
        if byte == directByte:
            yield length
        else:
            yield 0x80 | length
            yield byte

    # terminator
    yield 0x00

def create_rle_slices(nesPixels, subpals, uniqueTiles):
    # generate RLE-compressed NT/AT data in slices

    atData = [get_subpal_index(s, subpals) for s in get_color_sets(nesPixels)]
    ntAtData = bytes(
        uniqueTiles.index(tile) for tile in
        convert_tiles(nesPixels, atData, subpals)
    ) + bytes(encode_at_data(atData))

    for si in range(RLE_SLICE_COUNT):
        yield bytes(rle_encode(
            ntAtData[si*RLE_SLICE_SIZE:(si+1)*RLE_SLICE_SIZE]
        ))

def rle_slice_to_chunks(rleSlice):
    # generate RLE slice (bytes) as chunks (1 or 2 bytes each) for
    # human-readability
    i = 0
    while True:
        chunkLen = 2 if i > 0 and rleSlice[i] & 0x80 else 1
        yield rleSlice[i:i+chunkLen]
        if i > 0 and rleSlice[i] == 0x00:
            break  # terminator
        i += chunkLen

def filename_to_descr(filename):
    # format a string (filename without extension) into three eight-character
    # lines aligned right & bottom; replace "_" with newline; examples:
    #     "X"   -> 23 spaces + "x"
    #     "X_Y" -> 15 spaces + "x" + 7 spaces + "y"

    if search("^[0-9a-z_-]+$", filename) is None:
        sys.exit(
            "Only 0-9, a-z, _, - allowed in filenames (excluding extension)."
        )

    lines = filename.split("_")
    if len(lines) > 3:
        sys.exit("No more than 2 underscores allowed in filenames.")
    if max(len(l) for l in lines) > 8:
        sys.exit(
            "No more than 8 consecutive non-underscore characters allowed "
            "in filenames (excluding extension)."
        )

    lines = (3 - len(lines)) * [""] + lines
    return "".join(l.rjust(8) for l in lines)

def char_to_tile_index(char):
    # convert character into NES tile index
    if char == " ":
        return 0x00
    if char == "-":
        return 0xd0
    cp = ord(char)
    if ord("0") <= cp <= ord("9"):
        return 0xd1 + cp - ord("0")
    if ord("a") <= cp <= ord("z"):
        return 0xdb + cp - ord("a")
    sys.exit("Unknown character.")

def write_image_asm(index_, name, ptTiles, ptIndex, subpals, dstHnd):
    # write ASM6-compatible assembly code for one image, return RLE data size
    # index_:  file index
    # name:    filename
    # ptTiles: one PT as tuples of 64 2-bit ints
    # ptIndex: which PT to use
    # subpals: 4*4 NES color indexes
    # dstHnd:  destination file handle

    print(f"\t; {name}", file=dstHnd)

    # get pixels as NES color indexes
    with open(filename_to_path(name), "rb") as srcHnd:
        srcHnd.seek(0)
        nesPixels = get_nes_pixels(Image.open(srcHnd))

    # RLE-compressed NT/AT data in slices
    rleDataSize = 0
    for (si, rleSlice) in enumerate(create_rle_slices(
        nesPixels, subpals, ptTiles
    )):
        rleDataSize += len(rleSlice)
        rleChunks = tuple(rle_slice_to_chunks(rleSlice))
        print(f"img{index_}_nt_at{si}", file=dstHnd)
        for i in range(0, len(rleChunks), 13):
            print(
                "\thex " + " ".join(c.hex() for c in rleChunks[i:i+13]),
                file=dstHnd
            )

    # PT to use
    print(f"img{index_}_pt", file=dstHnd)
    print(f"\tdb {ptIndex}", file=dstHnd)

    # palette
    palette = bytes(chain.from_iterable(subpals))
    palette = " ".join(
        palette[i:i+4].hex() for i in range(0, len(palette), 4)
    )
    print(f"img{index_}_pal", file=dstHnd)
    print(f"\thex {palette}", file=dstHnd)

    # description
    descr = filename_to_descr(name).lstrip(" ")
    descr = bytes(char_to_tile_index(c) for c in descr)
    print(f"img{index_}_txt", file=dstHnd)
    print(f"\tdb {len(descr)}", file=dstHnd)
    for i in range(0, len(descr), 22):
        print(
            f"\thex " + " ".join(f"{b:02x}" for b in descr[i:i+22]),
            file=dstHnd
        )
    print("", file=dstHnd)

    return rleDataSize

# --- High-level functions ----------------------------------------------------

def get_filenames():
    # generate image filenames without extensions
    with os.scandir(IMAGE_DIR) as dirIter:
        for entry in dirIter:
            (filename, extension) = os.path.splitext(entry.name)
            if entry.is_file() and extension == IMAGE_EXT:
                yield filename

def validate_filenames(filenames):
    if not 1 <= len(filenames) <= 255:
        sys.exit("Must have 1-255 images.")
    if TITLE_FILE not in filenames:
        sys.exit(f"Title screen image {TITLE_FILE+IMAGE_EXT} not found.")
    if set(IMAGE_PTS) - set(filenames):
        sys.exit("IMAGE_PTS contains nonexistent filenames.")
    if set(MANUAL_SUBPALS) - set(filenames):
        sys.exit("MANUAL_SUBPALS contains nonexistent filenames.")

def sort_filenames(filenames):
    # sort without punctuation, title screen first
    filenames.sort()
    filenames.sort(key=lambda f: f.replace("_", "").replace("-", ""))
    filenames.sort(key=lambda f: f != TITLE_FILE)
    return tuple(filenames)

def get_palette_from_file(filename):
    # validate image; print and return its palette

    print(f"\t{filename}:")

    # validate image and get pixels as NES color indexes
    with open(filename_to_path(filename), "rb") as handle:
        handle.seek(0)
        image = Image.open(handle)
        validate_image(image)
        nesPixels = get_nes_pixels(image)

    # print and return palette
    palette = get_palette(nesPixels, filename)
    print(f"\t\tPalette      : " + ", ".join(
        "+".join(f"{b:02x}" for b in s) for s in palette
    ))

    return palette

def find_best_pt(fileTiles, tilesByPt):
    # automatically find the best pattern table for a file's tiles;
    # return: PT index, or -1 on error

    bestPt = bestScore = -1

    for pt in range(BANK_COUNT * 2):
        if len(tilesByPt[pt] | fileTiles) <= PT_MAX_TILES[pt%2]:
            # based on number of shared tiles and free tiles
            score = (
                10 * len(tilesByPt[pt] & fileTiles)
                + PT_MAX_TILES[pt%2] - len(tilesByPt[pt])
            )
            if score > bestScore:
                bestScore = score
                bestPt = pt

    return bestPt

def assign_tiles_to_pts(filenames, palettesByFile):
    # automatically assign tiles in all images to pattern tables;
    # return a tuple with one set of tiles per PT

    # get unique tiles in each file as tuples of 64 2-bit ints
    tilesByFile = {}
    for file_ in filenames:
        tilesByFile[file_] = get_unique_tiles(file_, palettesByFile[file_])

    # initialize each PT with a blank tile (for unused visible area)
    tilesByPt = dict((k, {tuple(64 * [0])}) for k in range(8))

    # process files: first those with manually-specified PTs, then by
    # decreasing tile count
    fileOrder = sorted(
        filenames, key=lambda f: len(tilesByFile[f]), reverse=True
    )
    fileOrder.sort(key=lambda f: f in IMAGE_PTS, reverse=True)
    for file_ in fileOrder:
        if file_ in IMAGE_PTS:
            # get PT manually
            bestPt = IMAGE_PTS[file_]
            if len(tilesByPt[bestPt] | tilesByFile[file_]) \
            > PT_MAX_TILES[bestPt%2]:
                sys.exit("Cannot satisfy IMAGE_PTS definitions.")
        else:
            # get PT automatically
            bestPt = find_best_pt(tilesByFile[file_], tilesByPt)
            if bestPt == -1:
                sys.exit("Failed to autoassign tiles to pattern tables.")
        # add tiles to that PT
        sharedTileCnt = len(tilesByPt[bestPt] & tilesByFile[file_])
        tilesByPt[bestPt].update(tilesByFile[file_])
        print("{:4}{:26} ({:3} tiles): PT{} ({:3} shared, {:3} free)".format(
            "",
            file_,
            len(tilesByFile[file_]),
            bestPt,
            sharedTileCnt,
            PT_MAX_TILES[bestPt%2] - len(tilesByPt[bestPt])
        ))

    return tuple(tilesByPt[pt] for pt in range(BANK_COUNT * 2))

def get_pattern_tables_for_files(filenames, palettesByFile, tilesByPt):
    # which pattern table to use for each file;
    # generate: (filename, PT)
    for file_ in filenames:
        tiles = get_unique_tiles(file_, palettesByFile[file_])
        pt = min(
            i for i in range(BANK_COUNT * 2) if tilesByPt[i].issuperset(tiles)
        )
        yield (file_, pt)

def sort_pattern_table_data(tilesByPt):
    # sort pattern table data; yield one PT per call

    # within each pattern table, sort tiles by pixels, by unique colors and by
    # number of unique colors (for prettiness and determinism)
    for pt in range(BANK_COUNT * 2):
        tiles = sorted(tilesByPt[pt])
        tiles.sort(key=lambda t: sorted(set(t)))
        tiles.sort(key=lambda t: len(set(t)))
        yield tuple(tiles)

def main():
    filenames = list(get_filenames())
    validate_filenames(filenames)
    filenames = sort_filenames(filenames)

    print("Images:", len(filenames))
    print()

    print("Generating palettes...")
    print(
        "All colors are hexadecimal NES colors. 'Unique colors' and 'color "
        f"sets' don't include the background color {NES_BG_COLOR:02x}."
    )
    palettesByFile = dict((f, get_palette_from_file(f)) for f in filenames)
    print()

    print("Assigning background tiles to pattern tables...")
    # one set per PT in a tuple
    tilesByPt = assign_tiles_to_pts(filenames, palettesByFile)

    print("Used tiles in PT0-PT7:", "/".join(
        format(len(pt), "3") for pt in tilesByPt
    ))
    print("Free tiles in PT0-PT7:", "/".join(
        format(PT_MAX_TILES[i%2] - len(pt), "3")
        for (i, pt) in enumerate(tilesByPt)
    ))
    print("{} globally unique tiles, {} including duplicates.".format(
        len(set(chain.from_iterable(tilesByPt))),
        sum(len(pt) for pt in tilesByPt)
    ))

    # which pattern table to use for each file (while tilesByPt still contains
    # sets)
    ptsByFile = dict(get_pattern_tables_for_files(
        filenames, palettesByFile, tilesByPt
    ))

    # sort pattern table data (one tuple per PT in a tuple)
    tilesByPt = tuple(sort_pattern_table_data(tilesByPt))

    print(f"Writing background PT data to {PT_FILES[0]} to {PT_FILES[-1]}...")
    for (i, tiles) in enumerate(tilesByPt):
        with open(PT_FILES[i], "wb") as handle:
            handle.seek(0)
            handle.write(bytes(encode_pt_data(tiles)))
    print()

    print(f"Writing NT/AT/PT number/palette/description data to {ASM_FILE}...")
    print("Compressed NT&AT data size after each file.")
    totalRleSize = 0
    with open(ASM_FILE, "wt", encoding="ascii") as handle:
        handle.seek(0)
        write_asm_preamble(filenames, handle)
        for (fi, filename) in enumerate(filenames):
            rleSize = write_image_asm(
                fi,
                filename,
                tilesByPt[ptsByFile[filename]],
                ptsByFile[filename],
                palettesByFile[filename],
                handle
            )
            totalRleSize += rleSize
            print(f"\t{filename:26}: {rleSize:3}")

    print("Total compressed NT&AT data size:", totalRleSize)
    print()

main()
