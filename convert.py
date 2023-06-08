# convert images of pride flags into NES-compatible format

# NES graphics glossary:
# - tile = 8*8 pixels, 2 bits/pixel
# - attribute block = 2*2 tiles
# - (sub)palette = 4 colors
# - palette(s) = 8 subpalettes (4 for background, 4 for sprites)
# - PT = pattern table (16 bytes/tile; what the tiles look like)
# - NT = name table (1 byte/tile; which tile at each screen position)
# - AT = attribute table (2 bits / attribute block; which subpalette for each
#   attribute block)

import collections, itertools, os, re, sys
from PIL import Image  # Pillow, https://python-pillow.org

IMAGE_DIR  = "img"           # read images from this path
IMAGE_EXT  = ".png"          # read images with this extension
TITLE_FILE = "title_screen"  # sort this image first (no extension)
ASM_FILE   = "imgdata.asm"   # write all data except PTs in ASM6 format here

# write PT0/PT1 data here
PT_FILES = ("chr-bg0.bin", "chr-bg1.bin")
# maximum number of tiles in PT0/PT1
PT_MAX_TILES = (256, 208)
# images that use PT1 instead of PT0
PT1_IMAGES = frozenset(("title_screen",))

# image height in AT blocks
# (changing this would require changing the NES program as well)
VERT_AT_BLKS = 12

# NES color number for background and unused colors; on NTSC, this is also
# the border color; see https://www.nesdev.org/wiki/PAL_video
NES_BG_COLOR = 0x0f  # black

# optional manually-defined palettes by filename;
# up to 4 tuples with up to 3 NES colors each (order matters);
# must have exactly the same colors as the image, minus NES_BG_COLOR;
# these reduce the number of unique tiles a little
MANUAL_SUBPALS = {
    "title_screen": (        # 7 colors (+ black):
        (0x21, 0x30, 0x13),  # cyan, white, purple
        (0x30, 0x15),        # white, red
        (0x30, 0x27),        # white, yellow
        (0x30, 0x19, 0x12)   # white, green, blue
    ),
    "autism": (              # 7 colors:
        (0x37, 0x14, 0x25),  # yellow, purple, red
        (0x37, 0x21, 0x2c),  # yellow, blue, cyan
        (0x37, 0x27, 0x29),  # yellow, orange, green
        (0x21, 0x27)         # blue, orange
    ),
    "bear": (                # 6 colors (+ black):
        (0x17, 0x27, 0x37),  # darkish brown, lightish brown, light brown
        (0x00, 0x30, 0x37),  # gray, white, light brown
        (0x07, 0x17),        # dark brown, darkish brown
    ),
    "inter-_sex": (          # 2 colors:
        (0x28, 0x04),        # yellow, purple
    ),
    "sapphic": (             # 4 colors:
        (0x25,),             # pink
        (0x30, 0x13, 0x27),  # white, purple, yellow
    ),
}
assert all(len(p) <= 4 for p in MANUAL_SUBPALS.values())
assert all(all(len(v) <= 3 for v in p) for p in MANUAL_SUBPALS.values())

# NES master palette
# key=index, value=(red, green, blue); source: FCEUX (fceux.pal)
# colors omitted (hexadecimal): 0d-0e, 1d-20, 2d-2f, 3d-3f
NES_PALETTE = {
    0x00: (0x74, 0x74, 0x74),
    0x01: (0x24, 0x18, 0x8c),
    0x02: (0x00, 0x00, 0xa8),
    0x03: (0x44, 0x00, 0x9c),
    0x04: (0x8c, 0x00, 0x74),
    0x05: (0xa8, 0x00, 0x10),
    0x06: (0xa4, 0x00, 0x00),
    0x07: (0x7c, 0x08, 0x00),
    0x08: (0x40, 0x2c, 0x00),
    0x09: (0x00, 0x44, 0x00),
    0x0a: (0x00, 0x50, 0x00),
    0x0b: (0x00, 0x3c, 0x14),
    0x0c: (0x18, 0x3c, 0x5c),
    0x0f: (0x00, 0x00, 0x00),
    0x10: (0xbc, 0xbc, 0xbc),
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
    0x30: (0xfc, 0xfc, 0xfc),
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

# --- process_image() and functions called by it ------------------------------

def color_diff(rgb1, rgb2):
    # get difference (0-768) of two colors (red, green, blue)
    return sum(abs(comp[0] - comp[1]) for comp in zip(rgb1, rgb2))

def closest_nes_color(rgb):
    # get best match (NES color number) for color (red, green, blue)
    minDiff = 9999
    for nesColor in sorted(NES_PALETTE):
        diff = color_diff(NES_PALETTE[nesColor], rgb)
        if diff < minDiff:
            minDiff = diff
            bestNesColor = nesColor
    return bestNesColor

def get_palette(image):
    # get closest NES color index for each PNG color index used in image:
    # {pngIndex: nesColor, ...}

    indexesUsed = [c[1] for c in image.getcolors()]
    palette = image.getpalette()  # [R, G, B, ...]
    palette = dict((i, tuple(palette[i*3:(i+1)*3])) for i in indexesUsed)
    palette = dict((i, closest_nes_color(palette[i])) for i in palette)

    if len(set(palette.values()) - {NES_BG_COLOR}) > 12:
        sys.exit(f"Can only have 12 unique colors plus ${NES_BG_COLOR:02x}.")
    if len(set(palette.values())) < len(palette):
        sys.exit("More than one image color corresponds to same NES color.")
    return palette

def get_color_sets(nesPixels):
    # generate attribute blocks as sets of NES color indexes
    colors = set()
    for ay in range(0, VERT_AT_BLKS * 16, 16):
        for ax in range(0, 16 * 16, 16):
            colors.clear()
            for py in range(16):
                srcInd = (ay + py) * 256 + ax
                colors.update(nesPixels[srcInd:srcInd+16])
            yield frozenset(colors)

def get_sorted_color_sets(nesPixels, printExtraInfo=False):
    # get color sets, clean up and sort
    # printExtraInfo: print intermediate results (bool)

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
    colorSets.sort(key=lambda s: len(s), reverse=True)

    if printExtraInfo:
        print(
            f"{'':8}Color sets:   ", " ".join(
                "".join(f"{c:02x}" for c in sorted(s)) for s in colorSets
            )
        )

    return colorSets

def create_subpalettes(nesPixels):
    # nesPixels: image pixels as NES colors
    # printExtraInfo: print intermediate results (bool)
    # return: list of 4 subpalettes (sets) with up to 3 color indexes each

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

def get_at_data(nesPixels, subpals):
    # generate AT data (int 0-3 for each attribute block)
    subpals = [frozenset(s) for s in subpals]
    yield from (
        [i for i in range(4) if subpals[i].issuperset(s)][0]
        for s in get_color_sets(nesPixels)
    )

def get_tiles(nesPixels):
    # generate tiles as tuples of NES color indexes (64 ints)
    pixels = []
    for ay in range(0, 24 * 8, 8):
        for ax in range(0, 32 * 8, 8):
            pixels.clear()
            for py in range(8):
                srcInd = (ay + py) * 256 + ax
                pixels.extend(nesPixels[srcInd:srcInd+8])
            yield tuple(pixels)

def convert_tiles(nesPixels, atData, orderedSubpals):
    # generate tiles as tuples of 64 2-bit ints
    for (i, tile) in enumerate(get_tiles(nesPixels)):
        # get subpalette for this tile (bits: YYYYyXXXXx -> YYYYXXXX)
        subpal = atData[(i >> 2) & 0b1111_0000 | (i >> 1) & 0b1111]
        # convert NES color index to subpalette index
        yield tuple(orderedSubpals[subpal].index(i) for i in tile)

def encode_at_data(atData):
    # encode AT data (VERT_AT_BLKS*16 2-bit ints) into 64 bytes

    # pad to 16 rows
    atData = (16 - VERT_AT_BLKS - 1) * 16 * [0] + atData + 16 * [0]

    atBytes = bytearray()
    for y in range(8):
        for x in range(8):
            s = y * 32 + x * 2  # source index
            atBytes.append(
                atData[s]
                | (atData[s+1] << 2)
                | (atData[s+16] << 4)
                | (atData[s+17] << 6)
            )
    return atBytes

def process_image(image, filename, mode, uniqueTiles=None, extraInfo=False):
    # If mode=0: return NES palette for image (ignore uniqueTiles arg).
    # If mode=1: return set of unique tiles   (ignore uniqueTiles arg).
    # If mode=2: return NT & AT data using uniqueTiles arg.
    # extraInfo: print extra palette info (usually used with mode 0 only)

    if image.width != 256:
        sys.exit("Image width must be 256.")
    if image.height != VERT_AT_BLKS * 16:
        sys.exit(f"Image height must be {VERT_AT_BLKS*16}.")
    if image.mode != "P":
        sys.exit("Image must have a palette.")

    # read pixels, convert into NES colors
    pngToNesIndex = get_palette(image)  # {pngIndex: nesColor, ...}
    nesPixels = [pngToNesIndex[i] for i in image.getdata()]
    del pngToNesIndex

    if extraInfo:
        print(f"{'':8}Unique colors:", " ".join(
            format(c, "02x") for c in sorted(set(nesPixels) - {NES_BG_COLOR})
        ))
        get_sorted_color_sets(nesPixels, True)

    # get subpalettes
    if filename in MANUAL_SUBPALS:
        # manually-defined
        if extraInfo:
            print(f"{'':8}Final palette manually defined.")
        subpals = MANUAL_SUBPALS[filename]
        definedColors = set(itertools.chain.from_iterable(subpals))
        actualColors = set(nesPixels) - {NES_BG_COLOR}
        if actualColors - definedColors:
            sys.exit("Manual subpalette definition lacks colors.")
        if definedColors - actualColors:
            sys.exit("Manual subpalette definition has extra colors.")
        # already ordered; restore background color and pad
        subpals = list(subpals) + (4 - len(subpals)) * [()]
        subpals = [
            [NES_BG_COLOR] + list(sp) + (3 - len(sp)) * [NES_BG_COLOR]
            for sp in subpals
        ]
    else:
        # get automatically
        if extraInfo:
            print(f"{'':8}Getting final palette automatically.")
        subpals = create_subpalettes(nesPixels)
        # order subpalettes, restore background color and pad
        subpals = [
            [NES_BG_COLOR] + sorted(sp) + (3 - len(sp)) * [NES_BG_COLOR]
            for sp in subpals
        ]

    if mode == 0:
        return subpals

    # generate AT data using subpalettes
    atData = list(get_at_data(nesPixels, subpals))

    if mode == 1:
        # return set of unique tiles
        return set(convert_tiles(nesPixels, atData, subpals))

    # get NT data using predetermined list of unique tiles
    ntData = bytes(
        uniqueTiles.index(tile) for tile in
        convert_tiles(nesPixels, atData, subpals)
    )

    return ntData + encode_at_data(atData)

# --- palette_test() ----------------------------------------------------------

def palette_test(filename):
    # just convert image palette; print intermediate and final results but
    # don't store them
    path = os.path.join(IMAGE_DIR, filename) + IMAGE_EXT
    with open(path, "rb") as handle:
        handle.seek(0)
        palette = bytes(itertools.chain.from_iterable(
            process_image(Image.open(handle), filename, 0, None, True)
        ))
        palette = " ".join(
            palette[i:i+4].hex() for i in range(0, len(palette), 4)
        )
        print(f"{'':8}Final palette: {palette}")

# --- get_unique_tiles() and functions called by it ---------------------------

def encode_pt_data(tiles):
    # return PT data for all images as bytes; each tile is 64 ints

    ptData = bytearray()
    for tile in tiles:
        for bp in range(2):  # bitplane
            for py in range(8):  # pixel Y
                ptData.append(sum(
                    ((tile[py*8+i] >> bp) & 1) << (7 - i) for i in range(8)
                ))

    # pad to a multiple of 16 tiles
    paddingLength = (256 - len(ptData) % 256) % 256
    ptData.extend(paddingLength * b"\xff")
    return ptData

def get_unique_tiles(filenames, maxTiles):
    # return a list of unique tiles in all images
    # (each tile is a tuple of 64 2-bit ints)

    # make sure we have a blank tile for visible unused area
    uniqueTiles = {tuple(64 * [0])}

    for filename in filenames:
        path = os.path.join(IMAGE_DIR, filename) + IMAGE_EXT
        with open(path, "rb") as handle:
            handle.seek(0)
            tiles = process_image(Image.open(handle), filename, 1)
            if any(any(t.count(c) == 1 for c in range(4)) for t in tiles):
                print(
                    f"Warning: {filename} has a tile with only one pixel of "
                    "some color; consider optimizing.", file=sys.stderr
                )
            oldCnt = len(uniqueTiles)
            uniqueTiles.update(tiles)
            print(
                f"{'':4}{filename:26}: "
                f"{len(tiles):3} "
                f"{len(uniqueTiles)-oldCnt:3} "
                f"{len(uniqueTiles):3}"
            )
            if len(uniqueTiles) > maxTiles:
                sys.exit(f"Error: more than {maxTiles} unique tiles total.")
    # sort by pixels, by which colors are used and by number of colors
    uniqueTiles = sorted(uniqueTiles)
    uniqueTiles.sort(key=lambda t: sorted(set(t)))
    uniqueTiles.sort(key=lambda t: len(set(t)))
    return uniqueTiles

# --- generate_asm_file() and functions called by it --------------------------

def rle_encode_raw(data):
    # generate runs: (length, byte)
    start = None  # start position of current run
    prev = None   # previous byte
    for (i, byte) in enumerate(data):
        if start is None:
            # start first run
            start = i
        elif prev != byte:
            # restart run
            yield (i - start, prev)
            start = i
        prev = byte
    if start is not None:
        # end last run
        yield (len(data) - start, prev)

def rle_encode(data):
    # generate bytes: direct_byte, run, run, ..., 0
    # 1st byte of data is the direct (implied) byte; other bytes are runs of
    # 1/2 bytes:
    # 0b1LLLLLLL     : output direct_byte 0bLLLLLLL+1 times (1-128)
    # 0b0LLLLLLL 0xBB: output byte 0xBB   0bLLLLLLL   times (1-127)
    # 0b00000000     : terminator (end of data)
    # note: the ability to output 128-byte runs is important because there
    # are lots of exactly 128-byte runs

    # the direct byte (the most common byte that begins a run)
    directByte = collections.Counter(
        r[1] for r in rle_encode_raw(data)
    ).most_common(1)[0][0]
    yield directByte
    # RLE data itself
    for (length, byte) in rle_encode_raw(data):
        if byte == directByte:
            if length > 128:
                yield 0x80 | (128 - 1)
                yield 0x80 | (length - 128 - 1)
            else:
                yield 0x80 | (length - 1)
        else:
            if length > 127:
                yield 127
                yield byte
                yield length - 127
                yield byte
            else:
                yield length
                yield byte
    # terminator
    yield 0x00

def get_rle_and_pal_data(filename, uniqueTilesByPt):
    # get RLE-compressed NT/AT data and NES palette from file
    # uniqueTilesByPt: unique tiles in PT0/PT1
    # return: (RLE data as a tuple of bytes, palette as bytes)

    path = os.path.join(IMAGE_DIR, filename) + IMAGE_EXT
    with open(path, "rb") as handle:
        handle.seek(0)
        image = Image.open(handle)
        # RLE-compressed NT/AT data in 6 slices
        ntAtData = process_image(
            image, filename, 2, uniqueTilesByPt[filename in PT1_IMAGES]
        )
        rleData = tuple(
            bytes(rle_encode(ntAtData[i*140:(i+1)*140])) for i in range(6)
        )
        # palette
        palette = bytes(itertools.chain.from_iterable(
            process_image(image, filename, 0)
        ))
    return(rleData, palette)

def rle_slice_to_chunks(rleSlice):
    # generate RLE slice (bytes) as chunks (1 or 2 bytes each) for
    # human-readability
    i = 0
    while True:
        if i == 0 or rleSlice[i] & 0x80 or rleSlice[i] == 0x00:
            chunkLen = 1  # direct byte definition/reference or terminator
        else:
            chunkLen = 2  # reference to following byte
        yield rleSlice[i:i+chunkLen]
        if i > 0 and rleSlice[i] == 0x00:
            break  # terminator
        i += chunkLen

def filename_to_descr(filename):
    # format a string (filename without extension) into three eight-character
    # lines aligned right & bottom; replace "_" with newline; examples:
    #     "X"   -> 23 spaces + "x"
    #     "X_Y" -> 15 spaces + "x" + 7 spaces + "y"

    if re.search("^[0-9a-z_-]+$", filename) is None:
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

def char_to_tile_number(char):
    # convert character into NES tile number
    cp = ord(char)
    if cp == ord(" "):
        return 0x00
    if cp == ord("-"):
        return 0xd0
    if ord("0") <= cp <= ord("9"):
        return 0xd1 + cp - ord("0")
    if ord("a") <= cp <= ord("z"):
        return 0xdb + cp - ord("a")
    sys.exit("Unknown character.")

def generate_asm_file(filenames, uniqueTilesByPt):
    # uniqueTilesByPt: unique tiles in PT0/PT1

    yield "; Image data excluding pattern tables. Generated by convert.py."
    yield ""

    yield "image_count equ " + str(len(filenames))
    yield ""

    # PT to use (least significant bit first)
    ptBytes = bytes(
        sum(
            1 << i for (i, f) in enumerate(filenames[firstIndex:firstIndex+8])
            if f in PT1_IMAGES
        )
        for firstIndex in range(0, len(filenames), 8)
    )
    yield "pts_to_use"
    yield "\tdb " + ", ".join(f"%{b:08b}" for b in ptBytes)
    yield ""

    yield "image_ptrs"
    ptrs = [f"img{i}_ptrs" for i in range(len(filenames))]
    for i in range(0, len(ptrs), 5):
        yield "\tdw " + ", ".join(ptrs[i:i+5])
    yield ""

    for fi in range(len(filenames)):
        yield f"img{fi}_ptrs"
        ptrs = [f"img{fi}_nt_at{si}" for si in range(6)] \
        + [f"img{fi}_pal", f"img{fi}_txt"]
        yield "\tdw " + ", ".join(ptrs[:4])
        yield "\tdw " + ", ".join(ptrs[4:])
    yield ""

    totalRleSize = 0
    for (fi, filename) in enumerate(filenames):
        (rleData, palette) = get_rle_and_pal_data(filename, uniqueTilesByPt)
        totalRleSize += sum(len(s) for s in rleData)

        # RLE-compressed NT/AT data in 6 slices
        for si in range(6):
            rleChunks = tuple(rle_slice_to_chunks(rleData[si]))
            yield f"img{fi}_nt_at{si}"
            for i in range(0, len(rleChunks), 13):
                yield "\thex " + " ".join(c.hex() for c in rleChunks[i:i+13])
        print(
            f"{'':4}{filename:26}:", format(sum(len(s) for s in rleData), "3")
        )

        # palette
        palette = " ".join(
            palette[i:i+4].hex() for i in range(0, len(palette), 4)
        )
        yield f"img{fi}_pal"
        yield f"\thex {palette}"

        # description
        descr = filename_to_descr(filename).lstrip(" ")
        descr = bytes(char_to_tile_number(c) for c in descr)
        yield f"img{fi}_txt"
        yield f"\tdb {len(descr)}"
        for i in range(0, len(descr), 22):
            yield f"\thex " + " ".join(f"{b:02x}" for b in descr[i:i+22])
        yield ""

    print("Total compressed NT/AT data size:", totalRleSize)

# -----------------------------------------------------------------------------

def get_filenames():
    # generate PNG filenames without extensions
    with os.scandir(IMAGE_DIR) as dirIter:
        for entry in dirIter:
            (filename, extension) = os.path.splitext(entry.name)
            if entry.is_file() and extension == IMAGE_EXT:
                yield filename

def main():
    # get filenames
    filenames = list(get_filenames())
    if not 1 <= len(filenames) <= 255:
        sys.exit("Must have 1-255 images.")
    if TITLE_FILE not in filenames:
        sys.exit(f"Title screen image {TITLE_FILE+IMAGE_EXT} not found.")
    if set(MANUAL_SUBPALS) - set(filenames):
        sys.exit(
            "Manual subpalette definitions contain nonexistent filenames."
        )

    # sort filenames without punctuation, title screen first
    filenames.sort()
    filenames.sort(key=lambda f: f.replace("_", "").replace("-", ""))
    filenames.sort(key=lambda f: f != TITLE_FILE)

    print("Palette test...")
    print(
        f"'Unique colors': hexadecimal NES colors excluding background color "
        f"${NES_BG_COLOR:02x}."
    )
    print(
        "'Color sets': sets of hexadecimal NES colors used in AT blocks "
        "excluding background color; subsets of other sets excluded."
    )
    print(
        "'Final palette': 4*4 hexadecimal NES colors including background "
        "color."
    )
    for filename in filenames:
        print(f"{'':4}{filename}:")
        palette_test(filename)
    print()

    uniqueTilesByPt = []
    for pt in range(2):
        print(f"Writing PT{pt} data to {PT_FILES[pt]}...")
        print("Unique/new unique/total unique tile count after each file.")
        files = (f for f in filenames if int(f in PT1_IMAGES) == pt)
        uniqueTilesByPt.append(get_unique_tiles(files, PT_MAX_TILES[pt]))
        with open(PT_FILES[pt], "wb") as handle:
            handle.seek(0)
            handle.write(encode_pt_data(uniqueTilesByPt[pt]))
            size = handle.tell()
        print(f"Wrote {size} bytes.")
        print()

    print(
        "Identical background tiles in PT0 and PT1:",
        len(set(uniqueTilesByPt[0]) & set(uniqueTilesByPt[1]))
    )
    print()

    print(f"Writing NT/AT/PT number/palette/description data to {ASM_FILE}...")
    print("Compressed NT/AT data size after each file.")
    with open(ASM_FILE, "wt", encoding="ascii") as handle:
        handle.seek(0)
        for line in generate_asm_file(filenames, uniqueTilesByPt):
            print(line, file=handle)
    print()

main()
