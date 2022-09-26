# convert images of pride flags into NES-compatible format
# under construction

import itertools, os, sys
from PIL import Image  # Pillow, https://python-pillow.org

IMAGE_DIR = "img"
IMAGE_EXT = ".png"
NES_BG_COLOR = 0x0f  # NES background color (black)

# NES master palette
# key=index, value=(red, green, blue); source: FCEUX (fceux.pal)
# colors omitted (hexadecimal): 00, 0d-0e, 10, 1d-20, 2d-2f, 3d-3f
NES_PALETTE = {
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

def get_filenames():
    # generate names of PNG files without extensions
    with os.scandir(IMAGE_DIR) as dirIter:
        yield from (
            os.path.splitext(e.name)[0] for e in dirIter
            if e.is_file() and os.path.splitext(e.name)[1] == IMAGE_EXT
        )

def color_diff(rgb1, rgb2):
    # get difference of two colors (0-768)
    return abs(rgb1[0] - rgb2[0]) + abs(rgb1[1] - rgb2[1]) \
    + abs(rgb1[2] - rgb2[2])

def closest_nes_color(rgb):
    # get best match (NES color number) for color (red, green, blue)

    minDiff = 9999
    for nesColor in NES_PALETTE:
        diff = color_diff(rgb, NES_PALETTE[nesColor])
        if diff < minDiff:
            minDiff = diff
            bestColor = nesColor
    return bestColor

def get_color_sets(image):
    # for each attribute block (16*16 px), generate set of PNG color indexes,
    # e.g. {0, 2}

    for ay in range(14):
        for ax in range(16):
            indexes = set()
            for py in range(16):
                for px in range(16):
                    indexes.add(image.getpixel((ax * 16 + px, ay * 16 + py)))
            yield indexes

def get_tiles(image):
    # for each tile (8*8 px), generate PNG indexes of all pixels,
    # e.g. [0, 2, ...]

    tile = []
    for ty in range(28):
        for tx in range(32):
            tile.clear()
            for py in range(8):
                for px in range(8):
                    tile.append(image.getpixel((tx * 8 + px, ty * 8 + py)))
            yield tile

def create_subpalettes(colorSets):
    # colorSets: set of sets of color indexes in attribute blocks
    # return: 4 subpalettes (sets) with up to 3 color indexes each

    subpals = [set(), set(), set(), set()]

    for colorSet in colorSets:
        # get maximum number of common colors with a subpalette in which
        # the new colors fit
        maxCnt = max(
            len(subpal & colorSet) for subpal in subpals
            if len(subpal | colorSet) <= 3
        )
        # which subpalette was it (first one if several)
        bestSubpal = [
            i for i in range(4)
            if len(subpals[i] & colorSet) == maxCnt
            and len(subpals[i] | colorSet) <= 3
        ][0]
        # add colors there
        subpals[bestSubpal].update(colorSet)

    return subpals

def get_attr_data(image, subpals, bgIndex):
    # generate attribute table data (int 0-3 for each attribute block)

    subpals = [sp | {bgIndex} for sp in subpals]
    yield from (
        [i for i in range(4) if subpals[i].issuperset(colorSet)][0]
        for colorSet in get_color_sets(image)
    )

def tile_slice_encode(pixels):
    # encode 8*1 pixels of one tile of CHR data
    # pixels: eight 2-bit ints
    # return: (low_bitplane, high_bitplane); both 0x00-0xff

    loByte = hiByte = 0
    for pixel in pixels:
        loByte = (loByte << 1) | (pixel &  1)
        hiByte = (hiByte << 1) | (pixel >> 1)
    return (loByte, hiByte)

def process_flag(image):
    if image.width != 256 or image.height != 224 or image.mode != "P":
        sys.exit("Image must be 256*224 pixels and have a palette.")

    # get used color indexes and best NES equivalents:
    # {pngIndex: nesColor, ...}
    palette = image.getpalette()  # [R, G, B, ...]
    palette = dict(
        (i[1], closest_nes_color(palette[i[1]*3:(i[1]+1)*3]))
        for i in image.getcolors()
    )
    if len(set(palette.values())) < len(palette):
        sys.exit("Oops! More than one PNG color maps to same NES color.")

    # get PNG index of NES background color
    try:
        bgIndex = [i for i in palette if palette[i] == NES_BG_COLOR][0]
    except IndexError:
        bgIndex = -1

    # get unique sets of color indexes in attr. blocks, e.g. {{1, 2}, {1, 3}}
    colorSets = {frozenset(s - {bgIndex}) for s in get_color_sets(image)}

    # split sets of color indexes into subpalettes
    subpals = create_subpalettes(colorSets)
    subpalsNes = [
        [NES_BG_COLOR]
        + sorted(palette[c] for c in sp) + (3 - len(sp)) * [NES_BG_COLOR]
        for sp in subpals
    ]
    print("Subpalettes:")
    print(
        16 * " " + "hex",
        " ".join("".join(f"{c:02x}" for c in sp) for sp in subpalsNes)
    )

    attrData = list(get_attr_data(image, subpals, bgIndex))
    print("Attribute table data:")
    atBytes = bytearray()
    for y in range(7):
        for x in range(8):
            s = y * 32 + x * 2  # source index
            atBytes.append(
                attrData[s]
                | (attrData[s+1] << 2)
                | (attrData[s+16] << 4)
                | (attrData[s+17] << 6)
            )
    for i in range(0, len(atBytes), 8):
        print(16 * " " + "hex", atBytes[i:i+8].hex())

    # get pattern & name table data
    uniqueTiles = []  # each tile is 64 subpalette indexes
    ntData      = []  # name table data
    for (i, tile) in enumerate(get_tiles(image)):
        # get subpalette for this tile (bits: tile YYYYyXXXXx, attr YYYYXXXX)
        subpal = attrData[(i >> 2) & 0b11110000 | (i >> 1) & 0b1111]
        # convert PNG indexes to subpalette indexes
        tile = [subpalsNes[subpal].index(palette[i]) for i in tile]
        # add to pattern & name table data
        if tile not in uniqueTiles:
            uniqueTiles.append(tile)
        ntData.append(uniqueTiles.index(tile))
    print("Name table data:")
    for i in range(0, len(ntData), 32):
        print(16 * " " + "hex", bytes(ntData[i:i+32]).hex())

    # convert pattern table data into NES format
    ptData = bytearray(len(uniqueTiles) * 16)
    for (i, tile) in enumerate(uniqueTiles):
        for y in range(8):
            (ptData[i*16+y%8], ptData[i*16+y%8+8]) \
            = tile_slice_encode(tile[y*8+x] for x in range(8))
    ptData = bytes(ptData)
    print("Pattern table data:")
    for i in range(0, len(ptData), 16):
        print(
            16 * " " + "hex",
            bytes(ptData[i:i+8]).hex(), bytes(ptData[i+8:i+16]).hex()
        )

def main():
    #for file_ in sorted(get_filenames()):
    for file_ in ("rainbow2",):
        print("Flag:", file_)
        path = os.path.join(IMAGE_DIR, file_) + IMAGE_EXT

        try:
            with open(path, "rb") as handle:
                handle.seek(0)
                image = Image.open(handle)
                process_flag(image)
        except OSError:
            sys.exit("Error reading file.")

        print()

main()
