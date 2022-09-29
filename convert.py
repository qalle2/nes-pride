# convert images of pride flags into NES-compatible format

import itertools, os, sys
from PIL import Image  # Pillow, https://python-pillow.org

IMAGE_DIR  = "img"         # read images from here
IMAGE_EXT  = ".png"        # read images with this extension
NAME_FILE  = "names.bin"   # write names of flags here
PAL_FILE   = "pal.bin"     # write palette data here
PT_FILE    = "chr-bg.bin"  # write pattern table data here
NT_AT_FILE = "nt-at.bin"   # write name & attribute table data here

# NES color number for background and unused colors (black)
NES_BG_COLOR = 0x0f

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

# --- process_image() and functions used by it --------------------------------

def color_diff(rgb1, rgb2):
    # get difference (0-768) of two colors (red, green, blue)
    return sum(abs(comp[0] - comp[1]) for comp in zip(rgb1, rgb2))

def closest_nes_color(rgb):
    # get best match (NES color number) for color (red, green, blue)
    minDiff = min(color_diff(NES_PALETTE[i], rgb) for i in NES_PALETTE)
    return [
        i for i in sorted(NES_PALETTE)
        if color_diff(NES_PALETTE[i], rgb) == minDiff
    ][0]

def get_color_sets(image):
    # for each attribute block (16*16 px), generate set of PNG color indexes,
    # e.g. {0, 2}
    indexes = set()
    for ay in range(14):
        for ax in range(16):
            indexes.clear()
            for py in range(16):
                for px in range(16):
                    indexes.add(image.getpixel((ax * 16 + px, ay * 16 + py)))
            yield indexes

def create_subpalettes(colorSets):
    # split sets of color indexes into subpalettes
    # colorSets: set of sets of color indexes in attribute blocks
    # return: list of 4 subpalettes (sets) with up to 3 color indexes each
    # note: I tried to limit the number of colors per subpalette to reduce the
    # number of unique tiles, but the savings (4 tiles) were not worth the
    # additional complexity

    # sort sets by decreasing length
    colorSets = sorted(colorSets)
    colorSets.sort(key=lambda s: len(s), reverse=True)

    # try algorithm 1 (less colors per subpalette and thus less unique tiles)
    subpals = [set() for i in range(4)]
    for colorSet in colorSets:
        # get minimum number of colors when adding these colors to a subpalette
        minCnt = min(len(s | colorSet) for s in subpals)
        if minCnt > 3:
            # failed; try algorithm 2
            subpals = None
            break
        # which subpalette was it (first one if several)
        bestSubpal = [
            i for (i, s) in enumerate(subpals) if len(s | colorSet) == minCnt
        ][0]
        # add colors there
        subpals[bestSubpal].update(colorSet)
    if subpals is not None:
        return subpals

    # try algorithm 2 (if 1 failed)
    subpals = [set() for i in range(4)]
    for colorSet in colorSets:
        # get maximum number of common colors with a subpalette in which
        # the new colors fit
        try:
            maxCnt = max(
                len(s & colorSet) for s in subpals if len(s | colorSet) <= 3
            )
        except ValueError:
            sys.exit(
                "Couldn't arrange colors into 4 subpalettes with 3 unique "
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

def get_attr_data(image, subpals, bgIndex):
    # generate attribute table data (int 0-3 for each attribute block)
    subpals = [sp | {bgIndex} for sp in subpals]
    yield from (
        [i for i in range(4) if subpals[i].issuperset(colorSet)][0]
        for colorSet in get_color_sets(image)
    )

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

def convert_tiles(image, attrData, palette, subpalsNes):
    # generate tiles as tuples of 64 2-bit ints
    for (i, tile) in enumerate(get_tiles(image)):
        # get subpalette for this tile
        # (bits: tile YYYYyXXXXx, attr YYYYXXXX)
        subpal = attrData[(i >> 2) & 0b11110000 | (i >> 1) & 0b1111]
        # convert PNG indexes to subpalette indexes
        tile = [subpalsNes[subpal].index(palette[i]) for i in tile]
        yield tuple(tile)

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
    if len(set(palette.values()) - {NES_BG_COLOR}) > 12:
        sys.exit(f"Can only have 12 unique colors plus ${NES_BG_COLOR:02x}.")
    if len(set(palette.values())) < len(palette):
        sys.exit("More than one PNG color maps to same NES color.")

    # get PNG index of NES background color
    try:
        bgIndex = [i for i in palette if palette[i] == NES_BG_COLOR][0]
    except IndexError:
        bgIndex = -1

    # get unique sets of color indexes in attr. blocks, e.g. {{1, 2}, {1, 3}}
    colorSets = {frozenset(s - {bgIndex}) for s in get_color_sets(image)}
    if max(len(s) for s in colorSets) > 3:
        sys.exit(
            f"Can only have 3 unique colors plus ${NES_BG_COLOR:02x} per "
            "attribute block."
        )

    # split sets of color indexes into subpalettes
    subpals = create_subpalettes(colorSets)
    # convert subpalettes into NES colors and pad with background color
    subpalsNes = [
        [NES_BG_COLOR]
        + sorted(palette[c] for c in sp) + (3 - len(sp)) * [NES_BG_COLOR]
        for sp in subpals
    ]
    if mode == 0:
        return list(itertools.chain.from_iterable(subpalsNes))

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

# --- Functions not used by process_image() -----------------------------------

def get_filenames():
    # generate names of PNG files without extensions
    with os.scandir(IMAGE_DIR) as dirIter:
        yield from (
            os.path.splitext(e.name)[0] for e in dirIter
            if e.is_file() and os.path.splitext(e.name)[1] == IMAGE_EXT
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

def encode_pt_data(tiles):
    # return pattern table data for all images as bytes; each tile is 64 ints

    ptData = bytearray(len(tiles) * 16)
    for (i, tile) in enumerate(tiles):
        for y in range(8):
            (ptData[i*16+y%8], ptData[i*16+y%8+8]) \
            = tile_slice_encode(tile[y*8+x] for x in range(8))
    # pad to a multiple of 16 tiles
    ptData.extend((256 - len(ptData) % 256) * b"\xff")
    return ptData

def main():
    filenames = sorted(get_filenames())

    print("Copy this constant manually to pride.asm:")
    print(f"{'image_count':15s} equ {len(filenames)}")

    print(f"Writing names of flags to {NAME_FILE}...")
    with open(NAME_FILE, "wb") as target:
        target.seek(0)
        for filename in filenames:
            filename = filename.upper()
            # NES can't show more than 8 sprites per scanline
            if len(filename) > 8 or not filename.isascii():
                sys.exit(
                    "Flag filenames must be 8 ASCII characters or less "
                    "(excluding extension)."
                )
            target.write(f"{filename:8s}".encode("ascii"))

    print(f"Writing palette data to {PAL_FILE}...")
    with open(PAL_FILE, "wb") as target:
        target.seek(0)
        for filename in filenames:
            path = os.path.join(IMAGE_DIR, filename) + IMAGE_EXT
            with open(path, "rb") as source:
                source.seek(0)
                image = Image.open(source)
                palette = bytes(process_image(image, 0))
                print(
                    f"{filename:8}: {len(set(palette)):2} colors including "
                    f"${NES_BG_COLOR:02x}: "
                    + " ".join(palette[i:i+4].hex() for i in range(0, 16, 4))
                )
                target.write(palette)

    print(f"Writing pattern table data to {PT_FILE}...")
    # make sure we have a blank tile (for nonsafe screen area)
    uniqueTiles = {tuple(64 * [0])}
    # gather unique tiles from all images
    for filename in filenames:
        path = os.path.join(IMAGE_DIR, filename) + IMAGE_EXT
        with open(path, "rb") as source:
            source.seek(0)
            tiles = process_image(Image.open(source), 1)
            uniqueTiles.update(tiles)
            print(
                f"{filename:8}: {len(tiles):3} unique tiles, "
                f"{len(uniqueTiles):3} total so far"
            )
            if len(uniqueTiles) > 256:
                sys.exit("Error: more than 256 unique tiles.")
    # sort tiles by number of colors
    uniqueTiles = sorted(uniqueTiles)
    uniqueTiles.sort(key = lambda t: len(set(t)))
    # write tiles
    with open(PT_FILE, "wb") as handle:
        handle.seek(0)
        handle.write(encode_pt_data(uniqueTiles))

    print(f"Writing name & attribute table data to {NT_AT_FILE}...")
    with open(NT_AT_FILE, "wb") as target:
        target.seek(0)
        for filename in filenames:
            print(filename)
            path = os.path.join(IMAGE_DIR, filename) + IMAGE_EXT
            with open(path, "rb") as source:
                source.seek(0)
                target.write(process_image(Image.open(source), 2, uniqueTiles))

main()
