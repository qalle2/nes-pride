# Qalle's Pride Flag Show II
Browse 71 pride flags on the [NES](https://en.wikipedia.org/wiki/Nintendo_Entertainment_System).
This program can also be downloaded from [Itch.io](https://qalle.itch.io/qalles-pride-flag-show).

![screenshot](snap1.png)
![screenshot](snap2.png)
![screenshot](snap3.png)

Table of contents:
* [List of files](#list-of-files)
* [How to assemble](#how-to-assemble)
* [How to use the NES program](#how-to-use-the-nes-program)
* [How to add new flags](#how-to-add-new-flags)
* [Technical info on the NES program](#technical-info-on-the-nes-program)
* [Sources of flags](#sources-of-flags)

## List of files
Assembled NES programs (gzip compressed, from newest to oldest):
* `pride.nes.gz`: current version (download this if you're unsure)
* `pride-compo-2023.nes.gz`: [NESDev Compo 2023](https://itch.io/jam/nesdev-compo-2023) version
* `pride-nrom.nes.gz`: the last NROM version
* `pride-compo-2022.nes.gz`: [NESDev Compo 2022](https://itch.io/jam/nesdev-2022) version

Images:
* `img/*.png`: pride flags to be read by `convert.py` (256&times;192 pixels)
* `img-lq/*.png`: lower-quality backups of some flags
* `chr-spr.png`: sprite pattern table data; can be encoded using `nes_chr_encode.py` from [my NES utilities](https://github.com/qalle2/nes-util/)
* `snap*.png`: screenshots

Source code:
* `convert.py`: a Python program that converts images of pride flags into NES graphics data; generates `imgdata.asm` and `chr-bg*.bin`
* `pride.asm`: an NES program that shows the flags; assembles with [ASM6](https://www.romhacking.net/utilities/674/)
* `imgdata.asm`: data used by `pride.asm` (generated by `convert.py`)
* `assemble.sh`: a Linux script that assembles `pride.asm` (overwrites files; don't run it before reading it)

Other binaries (gzip compressed):
* `chr-bin.tar.gz`: pattern table (CHR ROM) data in NES format; contains these files:
  * `chr-bg*.bin`: background (one file per PT; see `convert.py` above)
  * `chr-spr.bin`: sprites (same data in PTs 1/3/5/7; see `chr-spr.png` above)

## How to assemble
* run `convert.py` to generate `imgdata.asm` and `chr-bg*.bin` (or just download them and extract the `.gz` files)
* encode `chr-spr.png` into `chr-spr.bin` using `nes_chr_encode.py` from [my NES utilities](https://github.com/qalle2/nes-util/) (or just extract `chr-spr.bin` from the `.gz` file)
* assemble: `asm6 pride.asm pride.nes` (or just extract `pride.nes` from the `.gz` file)

## How to use the NES program
* left arrow: previous flag
* right arrow: next flag
* A button: random flag
* start button: toggle flag descriptions on or off

## How to add new flags
You can add flags of your own to the NES program.
You need to have Python and ASM6 installed.
1. Open your flag image in an image editor (e.g. GNU IMP).
2. Resize the image to 256&times;192 pixels.
3. Convert the image into indexed color (so it has a palette).
4. Because of NES hardware limitations, the colors need to be optimized manually and the pixels may need to be edited as well. This is tricky, but follow these rules:
   * No more than 12 unique colors in addition to black.
   * All unique colors should be clearly distinct from each other.
   * Put a 16&times;16-pixel grid on the image (in GNU IMP, Image &rarr; Configure Grid&hellip; and View &rarr; Show Grid).
   * No grid square can have more than three distinct colors in addition to black.
   * In all grid squares combined, you can't use more than four unique sets of three distinct colors in addition to black.
5. Save the image in PNG format under the `img` directory. The filename before the extension (`.png`) is important:
   * It will be the flag description text (up to 8&times;3 characters) inside the NES program.
   * 26 characters or less.
   * Only `a`&ndash;`z`, `0`&ndash;`9`, comma (`,`), hyphen (`-`) and underscore (`_`) are allowed.
   * Underscores will be converted into newlines.
   * No more than two underscores.
   * No more than eight consecutive non-underscore characters.
   * See the existing filenames for examples.
6. Run `python3 convert.py`. It should not print any errors. However, the palette creation algorithm isn't very smart, so if you're sure you followed step 4 correctly and the program still complains, you can define the palette manually: edit `MANUAL_SUBPALS` in `convert.py`. The output just before the error message and `NES_PALETTE` in `convert.py` will be helpful.
7. Extract `chr-spr.bin` from the `.gz` file. (Use e.g. `gunzip` on Linux or 7-Zip on Windows.)
8. Assemble: `asm6 pride.asm pride.nes` &ndash; again, it should not print any errors.
9. Run `pride.nes` on an NES emulator (e.g. FCEUX, Nestopia, Mednafen).

## Technical info on the NES program
* mapper: CNROM (iNES mapper #3)
* PRG ROM: 16 KiB
* CHR ROM: 32 KiB
* name table mirroring: vertical
* pattern table 0 in each bank: background (flag images)
* pattern table 1 in each bank &ndash; first 208 tiles: background (flag images)
* pattern table 1 in each bank &ndash; last 48 tiles: sprites (flag descriptions; same in all banks)
* each image has its own background palettes (black and 4&times;3 other colors)
* flag images are 256&times;192 pixels (32&times;24 tiles or 16&times;12 attribute blocks)
* flag images are shown at the bottom of a name/attribute table
* name/attribute table data of each flag image:
  * uncompressed size: 24&times;32 + 8&times;8 = 832 bytes
  * stored as 6 run-length encoded slices; the first 5 decompress into 140 bytes each, the last into 132 bytes
* an image is updated during 7 frames:
  * first 6 frames: extract one slice of name/attribute table data to an invisible name/attribute table
  * 7th frame: copy background palettes, do OAM DMA, flip visible name/attribute table, switch to correct CHR bank and background pattern table
  * for speed, all PPU memory updates (VRAM/palette) go through a buffer on the stack page (can be read quickly with PLA)

## Sources of flags
* [Abrosexuality](https://sexuality.fandom.com/wiki/Abrosexuality)
* [Aegosexual](https://www.lgbtqia.wiki/wiki/Aegosexual) (black/gray/green/purple)
* [Aegosexuality](https://sexuality.fandom.com/wiki/Aegosexuality) (black/gray/white/purple)
* [Androgyne](https://lgbtqia.fandom.com/wiki/Androgyne) &ndash; LGBTQIA+ Wiki
* [Androsexual](https://sexuality.fandom.com/wiki/Androsexual)
* [Aromantic Asexual](https://lgbtqia.fandom.com/wiki/Aromantic_asexual) &ndash; LGBTQIA+ Wiki
* [Asexual Furry Pride Fandom Flag](https://www.amazon.com/Asexual-Furry-Pride-Fandom-Flag/dp/B07F1K57P1) (black pawprint) &ndash; Amazon
* [Autism pride flag](https://commons.wikimedia.org/wiki/File:Autism_pride_flag.svg) (vertical stripes) &ndash; Wikimedia Commons
* [Autistic Pride Flag](https://commons.wikimedia.org/wiki/File:Autistic_Pride_Flag.png) (no stripes) &ndash; Wikimedia Commons
* [Autistic Pride Flag](https://commons.wikimedia.org/wiki/File:The_Autistic_Pride_Flag.png) (horizontal stripes) &ndash; Wikimedia Commons
* [Autosexuality](https://sexuality.fandom.com/wiki/Autosexuality)
* [Bear Brotherhood flag](https://commons.wikimedia.org/wiki/File:Bear_Brotherhood_flag.svg) &ndash; Wikimedia Commons
* [Butch Lesbian Pride Flag](https://www.sexualdiversity.org/edu/flags/1097.php) &ndash; SexualDiversity
* [Demigender](https://lgbtqia.fandom.com/wiki/Demigender) &ndash; LGBTQIA+ Wiki
* [Demigirl Pride Flag](https://commons.wikimedia.org/wiki/File:Demigirl_Pride-Flag.png) &ndash; Wikimedia Commons
* [Demiguy Pride Flag](https://commons.wikimedia.org/wiki/File:Demiguy_Pride-Flag.png) &ndash; Wikimedia Commons
* [Fraysexual](https://sexuality.fandom.com/wiki/Fraysexual)
* [Furry Bisexual Pride Flag](https://www.wackyprint.com/store/activism/lgbt/furry-bisexual-pride-flag-lgbt-colors-vibrant-bright) &ndash; Wacky Print (black pawprint)
* [Furry Flags](https://www.inanimorphs.com/furryflags) &ndash; Inanimorphs (Furry LGBT Pride Flags, white pawprint)
* [Furry Pride Flag](https://commons.wikimedia.org/wiki/File:Furry_Pride_Flag.png) &ndash; Wikimedia Commons
* [Graysexual](https://sexuality.fandom.com/wiki/Graysexual)
* [Leather, Latex, and BDSM pride - Light](https://commons.wikimedia.org/wiki/File:Leather,_Latex,_and_BDSM_pride_-_Light.svg) &ndash; Wikimedia Commons
* [Neptunic](https://www.lgbtqia.wiki/wiki/Neptunic)
* [Nonhuman Unity Flag](https://en.wikipedia.org/wiki/File:Nonhuman_Unity_Flag.svg) (otherkin) &ndash; Wikipedia (broken link)
* [Non-human Unity Flag](https://therian.fandom.com/wiki/Non-human_Unity_Flag) &ndash; Therian Wiki (not the flag I used, but similar to the above)
* [Omnisexual](https://lgbtqia.fandom.com/wiki/Omnisexual) &ndash; LGBTQIA+ Wiki
* [Pangender](https://gender.fandom.com/wiki/Pangender) &ndash; Gender Wiki (2nd flag by Cats670)
* [Pansexual Furry Pride Fandom Paw Flag](https://www.amazon.com/Pansexual-Furry-Pride-Fandom-Flag/dp/B07F1X4G6P) &ndash; Amazon (black pawprint)
* [Polyamory flag with infinity heart](https://commons.wikimedia.org/wiki/File:Polyamory_flag_with_infinity_heart.svg) &ndash; Wikimedia Commons (heart and infinity symbol)
* [Polyamory Pride Flag](https://commons.wikimedia.org/wiki/File:Polyamory_Pride_Flag.svg) &ndash; Wikimedia Commons (pi symbol)
* [Pride flag](https://en.wikipedia.org/wiki/Pride_flag) &ndash; Wikipedia (many flags)
* [Queer Pride Flag](https://queerintheworld.com/queer-pride-flag/) &ndash; Queer in the World
* [Rainbow flag (LGBT)](https://en.wikipedia.org/wiki/Rainbow_flag_%28LGBT%29) &ndash; Wikipedia
* [Sapiosexual](https://sexuality.fandom.com/wiki/Sapiosexual) (green/brown/blue)
* [Sapiosexual](https://www.lgbtqia.wiki/wiki/Sapiosexual) (gray/red/blue)
* [Sapphic](https://lgbtqia.fandom.com/wiki/Sapphic) &ndash; LGBTQIA+ Wiki
* [Transgender Furry Pride Fandom Paw Flag](https://www.amazon.com/Transgender-Furry-Pride-Fandom-Flag/dp/B07F1Y36D2) &ndash; Amazon
* [Tricolor Polyamory Pride Flag](https://commons.wikimedia.org/wiki/File:Tricolor_Polyamory_Pride_Flag.svg) &ndash; Wikimedia Commons
* [Trigender Pride Flag](https://www.sexualdiversity.org/edu/flags/1120.php) &ndash; SexualDiversity
* [Uranic](https://www.lgbtqia.wiki/wiki/Uranic)
* [Visually Safe Disability Pride Flag](https://commons.wikimedia.org/wiki/File:Visually_Safe_Disability_Pride_Flag.svg) &ndash; Wikimedia Commons

The license of this project does not apply to the flag images (I guess).
