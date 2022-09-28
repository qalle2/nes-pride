# convert images of pride flags into NES-compatible format

import itertools, os, sys
from PIL import Image  # Pillow, https://python-pillow.org

IMAGE_DIR        = "img"
IMAGE_EXT        = ".png"
NT_AT_PAL_FILE   = "nt-at-pal-data.asm"  # write NT/AT/palette data here
PT_FILE          = "chr-bg.bin"          # write pattern table data here
NES_BG_COLOR     = 0x0f                  # NES background color (black)
NES_UNUSED_COLOR = 0x00                  # NES unused color (gray)

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
    return (
        abs(rgb1[0] - rgb2[0]) + abs(rgb1[1] - rgb2[1])
        + abs(rgb1[2] - rgb2[2])
    )

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

    # sort by decreasing length
    colorSets = sorted(colorSets)
    colorSets.sort(key=lambda s: len(s), reverse=True)

    subpals = [set(), set(), set(), set()]

    for colorSet in colorSets:
        # get maximum number of common colors with a subpalette in which
        # the new colors fit
        try:
            maxCnt = max(
                len(subpal & colorSet) for subpal in subpals
                if len(subpal | colorSet) <= 3
            )
        except ValueError:
            sys.exit("Can't arrange colors into subpalettes.")
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

def convert_tiles(image, attrData, palette, subpalsNes):
    # generate tiles as tuples of 64 2-bit ints
    for (i, tile) in enumerate(get_tiles(image)):
        # get subpalette for this tile
        # (bits: tile YYYYyXXXXx, attr YYYYXXXX)
        subpal = attrData[(i >> 2) & 0b11110000 | (i >> 1) & 0b1111]
        # convert PNG indexes to subpalette indexes
        tile = [subpalsNes[subpal].index(palette[i]) for i in tile]
        yield tuple(tile)

def tile_slice_encode(pixels):
    # encode 8*1 pixels of one tile of CHR data
    # pixels: eight 2-bit ints
    # return: (low_bitplane, high_bitplane); both 0x00-0xff

    loByte = hiByte = 0
    for pixel in pixels:
        loByte = (loByte << 1) | (pixel &  1)
        hiByte = (hiByte << 1) | (pixel >> 1)
    return (loByte, hiByte)

def process_image(image, mode=0, uniqueTiles=None):
    # If mode=0: return NES palette for image (ignore uniqueTiles arg).
    # If mode=1: return set of unique tiles   (ignore uniqueTiles arg).
    # If mode=2: return name & attribute table data using uniqueTiles arg.

    if image.width != 256 or image.height != 224 or image.mode != "P":
        sys.exit("Image must be 256*224 pixels and have a palette.")

    # get used color indexes and best NES equivalents:
    # {pngIndex: nesColor, ...}
    palette = image.getpalette()  # [R, G, B, ...]
    if len(image.getcolors()) > 13:
        sys.exit("Image has more than 13 unique colors.")
    palette = dict(
        (i[1], closest_nes_color(palette[i[1]*3:(i[1]+1)*3]))
        for i in image.getcolors()
    )
    if len(set(palette.values())) < len(palette):
        sys.exit("More than one PNG color maps to same NES color.")

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
        + sorted(palette[c] for c in sp) + (3 - len(sp)) * [NES_UNUSED_COLOR]
        for sp in subpals
    ]
    if mode == 0:
        return subpalsNes

    # generate AT data using subpalettes
    attrData = list(get_attr_data(image, subpals, bgIndex))

    if mode == 1:
        # return set of unique tiles
        return set(convert_tiles(image, attrData, palette, subpalsNes))

    # get name table data using predetermined list of unique tiles
    ntData = list(
        uniqueTiles.index(tile) for tile in
        convert_tiles(image, attrData, palette, subpalsNes)
    )
    ntData.extend(2 * 32 * [0])  # pad to 30 rows

    # encode AT data
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
    atBytes.extend(8 * b"\x00")  # pad to 64 bytes

    return bytes(ntData) + atBytes

def generate_image_tiles(filenames):
    # generate unique tiles in image (tuples of 64 2-bit ints)
    for filename in filenames:
        path = os.path.join(IMAGE_DIR, filename) + IMAGE_EXT
        try:
            with open(path, "rb") as handle:
                handle.seek(0)
                image = Image.open(handle)
                tiles = process_image(image, 1)
                print(f"{filename:8}: {len(tiles):3} unique tiles")
                yield tiles
        except OSError:
            sys.exit("Error reading file.")

def generate_palette_data(filenames):
    # generate palette data for each image in ASM6 format

    yield f"{'bg_pal_data':16s}; background palettes for each image"
    for filename in filenames:
        path = os.path.join(IMAGE_DIR, filename) + IMAGE_EXT
        try:
            with open(path, "rb") as handle:
                handle.seek(0)
                image = Image.open(handle)
                palettes = process_image(image, 0)
        except OSError:
            sys.exit("Error reading file.")
        yield (
            f"{'':16}hex "
            + " ".join("".join(f"{c:02x}" for c in sp) for sp in palettes)
            + f"  ; {filename}"
        )

def encode_pt_data(tiles):
    # return PT data for all images as bytes; each tile is 64 ints

    ptData = bytearray(len(tiles) * 16)
    for (i, tile) in enumerate(tiles):
        for y in range(8):
            (ptData[i*16+y%8], ptData[i*16+y%8+8]) \
            = tile_slice_encode(tile[y*8+x] for x in range(8))
    # pad to a multiple of 16 tiles
    ptData.extend((256 - len(ptData) % 256) * b"\xff")
    return ptData

def generate_nt_at_data(filenames, uniqueTiles):
    # generate NT/AT data for each image in ASM6 format

    yield f"{'nt_at_data':15} ; name/attribute table data for each image"
    yield ""

    for filename in filenames:
        path = os.path.join(IMAGE_DIR, filename) + IMAGE_EXT
        try:
            with open(path, "rb") as source:
                source.seek(0)
                image = Image.open(source)
                ntAtData = process_image(image, 2, uniqueTiles)
        except OSError:
            sys.exit("Error reading file.")

        yield f"{'':16}; name table data for {filename}"
        for i in range(0, 30 * 32, 32):
            yield f"{'':16}hex " + bytes(ntAtData[i:i+32]).hex()
        yield f"{'':16}; attribute table data for {filename}"
        for i in range(30 * 32, len(ntAtData), 8):
            yield f"{'':16}hex " + ntAtData[i:i+8].hex()

def main():
    filenames = sorted(get_filenames())

    print("Copy this constant manually to showflag.asm:")
    print(f"{'image_count':15s} equ {len(filenames)}")

    print("Generating pattern table data...")
    # gather unique tiles from all images
    uniqueTiles = set()
    for imgTiles in generate_image_tiles(filenames):
        uniqueTiles.update(imgTiles)
    # make sure we have a blank tile (for nonsafe screen area)
    uniqueTiles.add(tuple(64 * [0]))
    if len(uniqueTiles) > 256:
        sys.exit("Error: more than 256 unique tiles.")
    # sort tiles by number of colors
    uniqueTiles = sorted(uniqueTiles)
    uniqueTiles.sort(key = lambda t: len(set(t)))
    # write tiles
    with open(PT_FILE, "wb") as handle:
        handle.seek(0)
        handle.write(encode_pt_data(uniqueTiles))
    print(f"Wrote {len(uniqueTiles)} tiles to {PT_FILE}.")

    print("Generating name table, attribute table & palette data...")
    # generate NT/AT/palette data for each image
    with open(NT_AT_PAL_FILE, "wt", encoding="ascii") as target:
        target.seek(0)
        for line in generate_nt_at_data(filenames, uniqueTiles):
            print(line, file=target)
        print("", file=target)
        for line in generate_palette_data(filenames):
            print(line, file=target)
    print(f"Wrote NT/AT/palette data to {NT_AT_PAL_FILE}.")

main()
