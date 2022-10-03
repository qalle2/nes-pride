# convert images of pride flags into NES-compatible format

import itertools, os, sys
from PIL import Image  # Pillow, https://python-pillow.org

IMAGE_DIR  = "img"          # read images from here
IMAGE_EXT  = ".png"         # read images with this extension
PT_FILE    = "chr-bg.bin"   # write pattern table data here
ASM_FILE   = "autogen.asm"  # write data in ASM6 format here

# NES color number for background and unused colors (black)
NES_BG_COLOR = 0x0f

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
    minDiff = min(color_diff(NES_PALETTE[i], rgb) for i in NES_PALETTE)
    return [
        i for i in sorted(NES_PALETTE)
        if color_diff(NES_PALETTE[i], rgb) == minDiff
    ][0]

def get_color_sets(image):
    # for each attribute block (16*16 px), generate set of PNG color indexes,
    # e.g. {0, 2}
    for ay in range(0, 13 * 16, 16):
        for ax in range(0, 16 * 16, 16):
            yield set(image.crop((ax, ay, ax + 16, ay + 16)).getdata())

def create_subpalettes(colorSets):
    # split sets of color indexes into subpalettes
    # colorSets: set of sets of color indexes in attribute blocks
    # return: list of 4 subpalettes (sets) with up to 3 color indexes each

    # sort sets by decreasing length
    colorSets = sorted(colorSets)
    colorSets.sort(key=lambda s: len(s), reverse=True)

    subpals = [set() for i in range(4)]

    for colorSet in colorSets:
        # get maximum number of common colors with a subpalette in which
        # the new colors fit
        try:
            maxCnt = max(
                len(s & colorSet) for s in subpals if len(s | colorSet) <= 3
            )
        except ValueError:
            # an ugly hack for rainbow3.png (will stop working if palette order
            # changes)
            subpals = [{1, 5, 9}, {2, 6, 7}, {3, 4, 8}, {6, 9, 10}]
            if all(any(c.issubset(s) for s in subpals) for c in colorSets):
                return subpals
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
    # e.g. (0, 2, ...)
    for ty in range(0, 26 * 8, 8):
        for tx in range(0, 32 * 8, 8):
            yield tuple(image.crop((tx, ty, tx + 8, ty + 8)).getdata())

def convert_tiles(image, attrData, palette, subpalsNes):
    # generate tiles as tuples of 64 2-bit ints
    for (i, tile) in enumerate(get_tiles(image)):
        # get subpalette for this tile
        # (bits: tile YYYYyXXXXx, attr YYYYXXXX)
        subpal = attrData[(i >> 2) & 0b11110000 | (i >> 1) & 0b1111]
        # convert PNG indexes to subpalette indexes
        yield tuple(subpalsNes[subpal].index(palette[i]) for i in tile)

def process_image(image, mode=0, uniqueTiles=None):
    # If mode=0: return NES palette for image (ignore uniqueTiles arg).
    # If mode=1: return set of unique tiles   (ignore uniqueTiles arg).
    # If mode=2: return name & attribute table data using uniqueTiles arg.

    if image.width != 256 or image.height != 208 or image.mode != "P":
        sys.exit("Image must be 256*208 pixels and have a palette.")

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
    # convert subpalettes into NES colors and pad with background color;
    # note: the order of colors affects the number of unique tiles a lot; this
    # isn't currently taken advantage of
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

    # encode AT data
    atBytes = bytearray(8 * b"\x00")  # first 2 rows of blocks
    attrData.extend(16 * [0])  # pad to 14 rows of blocks
    for y in range(7):
        for x in range(8):
            s = y * 32 + x * 2  # source index
            atBytes.append(
                attrData[s]
                | (attrData[s+1] << 2)
                | (attrData[s+16] << 4)
                | (attrData[s+17] << 6)
            )

    return bytes(ntData) + atBytes

# --- get_unique_tiles() and functions called by it ---------------------------

def encode_pt_data(tiles):
    # return pattern table data for all images as bytes; each tile is 64 ints

    ptData = bytearray()
    for tile in tiles:
        for bp in range(2):  # bitplane
            for py in range(8):  # pixel Y
                ptData.append(sum(
                    ((tile[py*8+i] >> bp) & 1) << (7 - i) for i in range(8)
                ))
    # pad to a multiple of 16 tiles
    ptData.extend((256 - len(ptData) % 256) * b"\xff")
    return ptData

def get_unique_tiles(filenames):
    # return a list of unique tiles in all images
    # (each tile is a tuple of 64 2-bit ints)

    # make sure we have a blank tile (for nonsafe screen area)
    uniqueTiles = {tuple(64 * [0])}
    for filename in filenames:
        path = os.path.join(IMAGE_DIR, filename) + IMAGE_EXT
        with open(path, "rb") as source:
            source.seek(0)
            tiles = process_image(Image.open(source), 1)
            if any(any(t.count(c) == 1 for c in range(4)) for t in tiles):
                print(f"{filename}: has tile with only 1 px of some color.")
            uniqueTiles.update(tiles)
            print(
                f"{'':4}{filename:8}: {len(tiles):3} unique tiles, "
                + f"{len(uniqueTiles):3} total so far"
            )
            if len(uniqueTiles) > 256:
                sys.exit("Error: more than 256 unique tiles.")
    # sort by number of colors
    uniqueTiles = sorted(uniqueTiles)
    uniqueTiles.sort(key = lambda t: len(set(t)))
    return uniqueTiles

# --- generate_asm_file() and functions called by it --------------------------

def asmcomment(comment):
    # return an ASM6 line with a comment
    return f"{'':16}; {comment}"

def asmlabel(label, comment=""):
    # return an ASM6 line with an optional label and an optional comment
    delim = (16 - len(label)) * " " + "; " if comment else ""
    return f"{label}{delim}{comment}"

def asminstr(instruction):
    # return an ASM6 line with an instruction (no label/comment)
    return f"{'':16}{instruction}"

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
    # 0b00000001     : (forbidden)
    # note: the ability to output 128-byte runs is important because there
    # are lots of exactly 128-byte runs

    # maximum length of direct/non-direct byte runs: 128/127
    assert len(data) <= 128

    # the direct byte (the most common byte that begins a run)
    runStartBytes = [r[1] for r in rle_encode_raw(data)]
    mostCommonBytes = sorted(set(runStartBytes))
    directByte = sorted(
        mostCommonBytes, key=lambda b: runStartBytes.count(b), reverse=True
    )[0]
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
    yield f"{'image_count':15} equ {len(filenames)}  ; number of images"
    yield ""

    # descriptions
    yield asmlabel("image_names", "descriptions (8 bytes/image)")
    for (i, filename) in enumerate(filenames):
        filename = filename.lower()
        # NES can't show more than 8 sprites per scanline
        if len(filename) > 8 or not filename.isascii():
            sys.exit(
                "image filenames must be 8 ASCII characters or less "
                "(excluding extension)."
            )
        yield asminstr(f'db "{filename:>8}"')
    yield ""

    # addresses in NT/AT/palette data
    yield asmcomment("addresses in RLE compressed name & attribute table data")
    yield asmcomment("and uncompressed background palette data")
    #
    yield asmlabel("grafix_ptrs_lo", "low bytes")
    for fi in range(len(filenames)):
        for si in range(7):
            yield asminstr(f"dl img{fi}_slice{si}")
        yield asminstr(f"dl img{fi}_palette")
    #
    yield asmlabel("grafix_ptrs_hi", "high bytes")
    for fi in range(len(filenames)):
        for si in range(7):
            yield asminstr(f"dh img{fi}_slice{si}")
        yield asminstr(f"dh img{fi}_palette")
    yield ""

    # NT/AT/palette data
    yield asmcomment("RLE compressed name & attribute table data")
    yield asmcomment("(each slice decompresses into exactly $80 bytes)")
    yield asmcomment("and uncompressed background palette data")
    totalDataLen = 0
    for (fi, filename) in enumerate(filenames):
        path = os.path.join(IMAGE_DIR, filename) + IMAGE_EXT
        with open(path, "rb") as source:
            source.seek(0)
            image = Image.open(source)
            # NT & AT data
            ntAtData = process_image(image, 2, uniqueTiles)
            for si in range(7):
                rleData = bytes(rle_encode(ntAtData[si*0x80:(si+1)*0x80]))
                totalDataLen += len(rleData)
                yield asmlabel(f"img{fi}_slice{si}")
                for i in range(0, len(rleData), 16):
                    yield asminstr("hex " + rleData[i:i+16].hex())
            # palette
            palette = bytes(process_image(image, 0))
            yield asmlabel(f"img{fi}_palette")
            yield asminstr("hex " + palette.hex())
    print(f"{'':4}total NT/AT/palette data length: {totalDataLen}")

# -----------------------------------------------------------------------------

def get_filenames():
    # generate names of PNG files without extensions
    with os.scandir(IMAGE_DIR) as dirIter:
        yield from (
            os.path.splitext(e.name)[0] for e in dirIter
            if e.is_file() and os.path.splitext(e.name)[1] == IMAGE_EXT
        )

def main():
    filenames = sorted(get_filenames())

    print(f"Writing pattern table data to {PT_FILE}...")
    uniqueTiles = get_unique_tiles(filenames)
    with open(PT_FILE, "wb") as handle:
        handle.seek(0)
        handle.write(encode_pt_data(uniqueTiles))

    print(f"Writing other data to {ASM_FILE}...")
    with open(ASM_FILE, "wt", encoding="ascii") as handle:
        handle.seek(0)
        for line in generate_asm_file(filenames, uniqueTiles):
            print(line, file=handle)

main()
