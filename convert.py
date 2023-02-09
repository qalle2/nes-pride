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

IMAGE_DIR  = "img"           # read images from here
IMAGE_EXT  = ".png"          # read images with this extension
TITLE_FILE = "title_screen"  # sort this first (no extension)
PT_FILE    = "chr-bg.bin"    # write PT data here
ASM_FILE   = "imgdata.asm"   # write filename/palette/NT/AT data in ASM6 format

# image height in AT blocks
# (1-15; changing this requires changing NES program as well as images)
VERT_AT_BLKS = 12

# NES color number for background and unused colors (black)
NES_BG_COLOR = 0x0f

# optional manually-defined palettes by filename;
# 4 tuples with up to 3 NES colors each (order matters);
# must have exactly the same colors as the image, minus NES_BG_COLOR
MANUAL_SUBPALS = {
    # together, these save 14 tiles
    "title_screen": (
        (0x21, 0x30, 0x13),
        (0x30, 0x15),
        (0x30, 0x27),
        (0x30, 0x19, 0x12)
    ),
    "autism": (
        (0x37, 0x14, 0x25),
        (0x37, 0x21, 0x2c),
        (0x37, 0x27, 0x29),
        (0x21, 0x27)
    ),
    "intersex": (
        (0x28, 0x04),
        (),
        (),
        ()
    ),
}
assert all(len(v) == 4 for v in MANUAL_SUBPALS.values())

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

def create_subpalettes(nesPixels):
    # nesPixels: image pixels as NES colors
    # return: list of 4 subpalettes (sets) with up to 3 color indexes each
    # TODO: speed this up

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

    # try all permutations
    for colorSetsPerm in itertools.permutations(colorSets):
        subpals = [set() for i in range(4)]
        success = True
        for colorSet in colorSetsPerm:
            # get maximum number of common colors with a subpalette in which
            # the new colors fit
            try:
                maxCnt = max(
                    len(s & colorSet) for s in subpals
                    if len(s | colorSet) <= 3
                )
            except ValueError:
                success = False
                break
            # which subpalette was it (first one if several)
            bestSubpal = [
                i for (i, s) in enumerate(subpals)
                if len(s & colorSet) == maxCnt and len(s | colorSet) <= 3
            ][0]
            # add colors there
            subpals[bestSubpal].update(colorSet)
        if success:
            break

    if not success:
        sys.exit(
            "Couldn't arrange colors into 4 subpalettes with 3 unique colors "
            f"plus ${NES_BG_COLOR:02x} each."
        )

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

def process_image(image, filename, mode, uniqueTiles=None):
    # If mode=0: return NES palette for image (ignore uniqueTiles arg).
    # If mode=1: return set of unique tiles   (ignore uniqueTiles arg).
    # If mode=2: return NT & AT data using uniqueTiles arg.

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

    # get subpalettes
    if filename in MANUAL_SUBPALS:
        # manually-defined
        subpals = MANUAL_SUBPALS[filename]
        definedColors = set(itertools.chain.from_iterable(subpals))
        actualColors = set(nesPixels) - {NES_BG_COLOR}
        if actualColors - definedColors:
            sys.exit("Manual subpalette definition lacks colors.")
        if definedColors - actualColors:
            sys.exit("Manual subpalette definition has extra colors.")
        # already ordered; restore background color and pad
        subpals = [
            [NES_BG_COLOR] + list(sp) + (3 - len(sp)) * [NES_BG_COLOR]
            for sp in subpals
        ]
    else:
        # get automatically
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

    # get NT data using predetermined list of unique tiles; pad to 13*2 rows
    # with black tiles (doesn't work if VERT_AT_BLKS > 13)
    ntData = (13 - VERT_AT_BLKS) * 2 * 32 * b"\x00" + bytes(
        uniqueTiles.index(tile) for tile in
        convert_tiles(nesPixels, atData, subpals)
    )

    return ntData + encode_at_data(atData)

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

def get_unique_tiles(filenames):
    # return a list of unique tiles in all images
    # (each tile is a tuple of 64 2-bit ints)

    # make sure we have a blank tile for borders
    uniqueTiles = {tuple(64 * [0])}
    for filename in filenames:
        print(f"{'':4}{filename}:")
        path = os.path.join(IMAGE_DIR, filename) + IMAGE_EXT
        with open(path, "rb") as handle:
            handle.seek(0)
            tiles = process_image(Image.open(handle), filename, 1)
            if any(any(t.count(c) == 1 for c in range(4)) for t in tiles):
                print(
                    "Warning: a tile with only 1 px of some color.",
                    file=sys.stderr
                )
            oldCnt = len(uniqueTiles)
            uniqueTiles.update(tiles)
            print(
                f"{'':8}Unique/new unique/total unique tiles: "
                f"{len(tiles):3}/"
                f"{len(uniqueTiles)-oldCnt:3}/"
                f"{len(uniqueTiles):3}"
            )
            if len(uniqueTiles) > 256:
                sys.exit("Error: more than 256 unique tiles total.")
    # sort by pixels, by which colors are used and by number of colors
    uniqueTiles = sorted(uniqueTiles)
    uniqueTiles.sort(key=lambda t: sorted(set(t)))
    uniqueTiles.sort(key=lambda t: len(set(t)))
    return uniqueTiles

# --- generate_asm_file() and functions called by it --------------------------

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
    # 0bLLLLLLL1     : output direct_byte 0bLLLLLLL+1 times (1-128)
    # 0bLLLLLLL0 0xBB: output byte 0xBB   0bLLLLLLL   times (1-127)
    # 0b00000000     : terminator (end of data)
    # note: the ability to output 128-byte runs is important because there
    # are lots of exactly 128-byte runs

    # maximum length of direct/non-direct byte runs: 128/127
    assert len(data) <= 128

    # the direct byte (the most common byte that begins a run)
    directByte = collections.Counter(
        r[1] for r in rle_encode_raw(data)
    ).most_common(1)[0][0]
    yield directByte
    # RLE data itself
    for (length, byte) in rle_encode_raw(data):
        if byte == directByte:
            yield ((length - 1) << 1) | 0b1
        else:
            yield length << 1
            yield byte
    # terminator
    yield 0x00

def generate_asm_file(filenames, uniqueTiles):
    yield "; Image data excluding pattern tables."
    yield "; This file was generated automatically by convert.py."
    yield ""
    yield "; number of images"
    yield "image_count equ " + str(len(filenames))
    yield ""

    yield "; pointers to the following array"
    yield "image_ptrs"
    ptrs = [f"image{i}_ptrs" for i in range(len(filenames))]
    for i in range(0, len(ptrs), 4):
        yield "  dw " + ", ".join(ptrs[i:i+4])
    yield ""

    # pointers
    yield "; pointers to the following arrays"
    for fi in range(len(filenames)):
        yield f"image{fi}_ptrs"
        ptrs = [f"img{fi}_nt_at{si}" for si in range(7)] \
        + [f"img{fi}_palette", f"img{fi}_descr"]
        for pi in range(0, len(ptrs), 4):
            yield "  dw " + ", ".join(ptrs[pi:pi+4])
    yield ""

    yield "; for each image: compressed NT & AT data in 7 slices, background "
    yield "; palette data (16 bytes), description"
    yield ""

    # data for each image
    totalNtAtDataLen = 0
    for (fi, filename) in enumerate(filenames):
        print(f"{'':4}{filename}:")
        # open file
        path = os.path.join(IMAGE_DIR, filename) + IMAGE_EXT
        with open(path, "rb") as handle:
            handle.seek(0)
            image = Image.open(handle)
            # NT & AT data
            ntAtData = process_image(image, filename, 2, uniqueTiles)
            ntAtDataLen = 0
            for si in range(7):
                rleData = bytes(rle_encode(ntAtData[si*0x80:(si+1)*0x80]))
                ntAtDataLen += len(rleData)
                yield f"img{fi}_nt_at{si}"
                yield "  hex " + rleData[:1].hex()
                for i in range(0, len(rleData) - 2, 16):
                    yield "  hex " + rleData[1:-1][i:i+16].hex()
                yield "  hex " + rleData[-1:].hex()
            print(f"{'':8}NT/AT data size: {ntAtDataLen}")
            totalNtAtDataLen += ntAtDataLen
            # palette
            palette = bytes(itertools.chain.from_iterable(
                process_image(image, filename, 0)
            ))
            palette = " ".join(
                palette[i:i+4].hex() for i in range(0, len(palette), 4)
            )
            print(f"{'':8}Palette:{'':8} {palette}")
            yield f"img{fi}_palette"
            yield f"  hex {palette}"
        # description
        yield f"img{fi}_descr"
        descr = filename_to_descr(filename).lstrip(" ")
        yield f'  db {len(descr)}, "{descr}"'
        yield ""

    print("Total NT/AT data size:", totalNtAtDataLen)

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
    if not 1 <= len(filenames) <= 256:
        sys.exit("Must have 1-256 images.")
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

    print(f"Writing PT data to {PT_FILE}...")
    uniqueTiles = get_unique_tiles(filenames)
    with open(PT_FILE, "wb") as handle:
        handle.seek(0)
        handle.write(encode_pt_data(uniqueTiles))
        size = handle.tell()
    print(f"{'':4}Wrote {size} bytes.")
    print()

    print(f"Writing NT/AT/palette data to {ASM_FILE}...")
    with open(ASM_FILE, "wt", encoding="ascii") as handle:
        handle.seek(0)
        for line in generate_asm_file(filenames, uniqueTiles):
            print(line, file=handle)
    print()

main()
