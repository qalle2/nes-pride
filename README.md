# Qalle's Pride Flag Show
Browse 27 pride flags on the [NES](https://en.wikipedia.org/wiki/Nintendo_Entertainment_System).

![screenshot](snap1.png)
![screenshot](snap2.png)
![screenshot](snap3.png)

Table of contents:
* [List of files](#list-of-files)
* [How to assemble](#how-to-assemble)
* [How to use the NES program](#how-to-use-the-nes-program)
* [Technical info of the NES program](#technical-info-of-the-nes-program)
* [Sources of flags](#sources-of-flags)

## List of files
Images:
* `img/*.png`: pride flags (256&times;192 pixels)
* `chr-spr.png`: sprite pattern table data; can be encoded using `nes_chr_encode.py` from [my NES utilities](https://github.com/qalle2/nes-util/)
* `snap*.png`: screenshots

Text:
* `convert.py`: a Python program that converts images of pride flags into NES graphics data; writes `imgdata.asm` and `chr-bg.bin`
* `pride.asm`: an NES program that shows the flags; assembles with [ASM6](https://www.romhacking.net/utilities/674/)
* `imgdata.asm`: data used by `pride.asm` (generated by `convert.py`)
* `assemble.sh`: a Linux script that assembles `pride.asm` (overwrites files; don't run it before reading it)

Other (gzip compressed):
* `pride.nes.gz`: the assembled NES program
* `chr-bg.bin.gz`: background pattern table data in NES format (generated by `convert.py`)
* `chr-spr.bin.gz`: sprite pattern table data in NES format

## How to assemble
* run `convert.py` to generate `imgdata.asm` and `chr-bg.bin` (or just download them directly)
* encode `chr-spr.png` into `chr-spr.bin` using `nes_chr_encode.py` from [my NES utilities](https://github.com/qalle2/nes-util/) (or just extract `chr-spr.bin` from the `.gz` file)
* assemble: `asm6 pride.asm pride.nes` (or just extract `pride.nes` from the `.gz` file)

## How to use the NES program
* left arrow: previous flag
* right arrow: next flag
* A button: random flag
* start button: toggle flag descriptions on or off

## Technical info of the NES program
* mapper: NROM
* PRG ROM: 16 KiB
* CHR ROM: 8 KiB
* name table mirroring: vertical
* pattern table 0: background (flag images)
* pattern table 1: sprites (flag descriptions)
* each image has its own background palettes (black and 4&times;3 other colors)
* the visible flag images are 256&times;192 pixels (32&times;24 tiles or 16&times;12 attribute blocks)
* the flag images are internally stored with a padding of two rows of black tiles at the beginning
* the flag images are shown at the bottom of a name/attribute table
* name/attribute table data of each flag image:
  * uncompressed size (including padding): 896 = 7&times;128 bytes
  * saved as seven run-length encoded slices, each of which decompresses into 128 bytes
* an image is updated during eight frames:
  * first seven frames: extract one slice of name/attribute table data to an invisible name/attribute table
  * eighth frame: copy background palettes, do OAM DMA, flip visible name/attribute table
  * for speed, all PPU memory updates (VRAM/palette) go through a buffer on the zero page

## Sources of flags
* [Wikimedia Commons &ndash; Autistic Pride Flag](https://commons.wikimedia.org/wiki/File:Autistic_Pride_Flag.png)
* [Wikipedia &ndash; Pride flag](https://en.wikipedia.org/wiki/Pride_flag)
* [Wikipedia &ndash; Rainbow flag (LGBT)](https://en.wikipedia.org/wiki/Rainbow_flag_%28LGBT%29)
* [Wikipedia &ndash; Demigirl Pride Flag](https://en.wikipedia.org/wiki/File:Demigirl_Pride-Flag.png)
* [Wikipedia &ndash; Demiguy Pride Flag](https://en.wikipedia.org/wiki/File:Demiguy_Pride-Flag.png)

The license of this project does not apply to the flag images (I guess).
