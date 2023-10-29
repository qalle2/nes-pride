; NES/ASM6: Qalle's Pride Flag Show
;     https://github.com/qalle2/nes-pride
;     https://qalle.itch.io/qalles-pride-flag-show

; --- Constants ---------------------------------------------------------------

; Notes:
; - addresses are little-endian (low byte first)
; - boolean variables: $00-$7f = false, $80-$ff = true
; - ppu_buffer: what to copy to PPU memory on next VBlank; read using PLA;
;     only the first ppu_buf_length bytes are used
; - ppu_upd_phase: how to update PPU memory:
;     0-5: update NT/AT data (up 140 bytes/phase) to non-visible NT via
;          ppu_buffer
;     6:   update other PPU memory/registers via various buffers in main RAM;
;          do OAM DMA
;     7:   do OAM DMA (in case user toggles descriptions on/off)

; RAM
grafix_ptr      equ $00    ; pointer to imgdata.asm (2 bytes)
ppu_dst_addr    equ $02    ; destination address in PPU memory (2 bytes)
run_main_loop   equ $04    ; main loop allowed to run? (boolean)
prng            equ $05    ; pseudorandom number generator for random flag
pad_status      equ $06    ; joypad status
prev_pad_status equ $07    ; previous joypad status
which_image     equ $08    ; which image is being shown
ppu_ctrl_copy   equ $09    ; copy of ppu_ctrl
ppu_upd_phase   equ $0a    ; PPU update phase; see above
ppu_buf_length  equ $0b    ; length of ppu_buffer
stack_ptr       equ $0c    ; copy of stack pointer
rle_src_ind     equ $0d    ; RLE decoder - source index
rle_dst_ind     equ $0e    ; RLE decoder - destination index
chr_bank        equ $0f    ; CHR bank to switch to
temp            equ $10    ; temporary variable
ppu_buffer      equ $0100  ; see above (140 bytes)
sprite_data     equ $0200  ; OAM page ($100 bytes)

; memory-mapped registers
ppu_ctrl        equ $2000
ppu_mask        equ $2001
ppu_status      equ $2002
oam_addr        equ $2003
ppu_scroll      equ $2005
ppu_addr        equ $2006
ppu_data        equ $2007
dmc_freq        equ $4010
oam_dma         equ $4014
snd_chn         equ $4015
joypad1         equ $4016
joypad2         equ $4017

; PPU memory space
ppu_nt0         equ $2000
ppu_palette     equ $3f00

; --- iNES header -------------------------------------------------------------

                ; see https://wiki.nesdev.org/w/index.php/INES
                ;
                base $0000
                db "NES", $1a            ; file id
                db 1, 4                  ; 16 KiB PRG ROM, 32 KiB CHR ROM
                db %00110001, %00000000  ; CNROM (mapper 3), vertical mirroring
                pad $0010, $00           ; unused

; --- Start of PRG ROM --------------------------------------------------------

                base $c000              ; last 16 KiB of CPU address space

; --- Interrupt routines (here for page alignment) ----------------------------

nmi             pha                     ; push A, X, Y
                txa
                pha
                tya
                pha

                bit ppu_status          ; reset ppu_scroll/ppu_addr latch

                lda ppu_upd_phase       ; do OAM DMA on phases 6-7
                cmp #6
                bmi +

                lda #$00                ; do OAM DMA
                sta oam_addr
                lda #>sprite_data
                sta oam_dma

+               lda ppu_upd_phase       ; increment phase up to 7
                cmp #7
                beq +
                inc ppu_upd_phase

+               ; flush PPU buffer (length must be a multiple of 4)
                ;
                lda ppu_buf_length      ; skip if empty
                beq +
                ;
                lsr a                   ; length / 4 -> Y
                lsr a
                tay
                ;
                lda ppu_dst_addr+1      ; set PPU address
                sta ppu_addr
                lda ppu_dst_addr+0
                sta ppu_addr
                ;
                tsx                     ; back up actual stack pointer
                stx stack_ptr
                ;
                ldx #$ff                ; copy data from stack to PPU
                txs
-               pla
                sta ppu_data
                pla
                sta ppu_data
                pla
                sta ppu_data
                pla
                sta ppu_data
                dey
                bne -
                ;
                sty ppu_buf_length      ; clear PPU buffer
                ldx stack_ptr           ; restore actual stack pointer
                txs

+               jsr set_ppu_regs        ; set PPU registers and CHR bank

                sec                     ; set flag to let main loop run once
                ror run_main_loop

                pla                     ; pull Y, X, A
                tay
                pla
                tax
                pla

irq             rti                     ; IRQ unused

set_ppu_regs    ; set PPU registers and CHR bank
                ;
                lda #0                  ; horizontal scroll
                sta ppu_scroll
                lda #3*8                ; vertical scroll: 3 tiles up
                sta ppu_scroll
                lda ppu_ctrl_copy       ; use precalculated BG PT/NT numbers
                sta ppu_ctrl
                lda #%00011110          ; show background & sprites
                sta ppu_mask
                ;
                ; note: mapper has bus conflicts
                lda chr_bank
                tax
                sta bank_numbers,x
                ;
                rts

bank_numbers    db 0, 1, 2, 3           ; CHR bank numbers

; --- Pregenerated image data -------------------------------------------------

; image data excluding pattern tables; generated by convert.py; constants
; defined there:
;     IMAGE_COUNT:        number of images
;     BG_COLOR:           global background color
;     RLE_SLICE_LEN:      uncompressed length of RLE slices, except for the
;                         last one
;     LAST_RLE_SLICE_LEN: uncompressed length of the last RLE slice
;     NT_TOP_PADDING:     bytes (tiles) of padding at the start of the NT
;     image_pts:          which pattern table to use for each image
;     image_ptrs:         pointers to pointers to variable-length image data
                include "imgdata.asm"

; --- Initialization ----------------------------------------------------------

wait_vbl_start  bit ppu_status          ; wait until next VBlank starts
-               lda ppu_status
                bpl -
                rts

set_ppu_addr    sty ppu_addr            ; Y*$100 + A -> address
                sta ppu_addr
                rts

reset           ; initialize the NES;
                ; see https://wiki.nesdev.org/w/index.php/Init_code
                ;
                sei                     ; ignore IRQs
                cld                     ; disable decimal mode
                ldx #%01000000
                stx joypad2             ; disable APU frame IRQ
                ldx #$ff
                txs                     ; initialize stack pointer
                inx
                stx ppu_ctrl            ; disable NMI
                stx ppu_mask            ; disable rendering
                stx dmc_freq            ; disable DMC IRQs
                stx snd_chn             ; disable sound channels

                jsr wait_vbl_start      ; wait until next VBlank starts

                ; initialize main RAM
                ;
                lda #$00                ; clear zero page
                tax
-               sta $00,x
                inx
                bne -
                ;
                lda #$ff                ; hide all sprites
                ldx #0
-               sta sprite_data,x
                inx
                inx
                inx
                inx
                bne -
                ;
                ldx #(23*4)             ; set attributes of text sprites (0-23)
-               lda #%00000000          ; subpalette 0, no mirroring
                sta sprite_data+2,x
                dex
                dex
                dex
                dex
                bpl -
                ;
                ldx #(7*4)              ; set X positions of text sprites
                lda #(29*8)             ; rightmost
-               sta sprite_data+3,x
                sta sprite_data+8*4+3,x
                sta sprite_data+16*4+3,x
                sec
                sbc #8
                dex
                dex
                dex
                dex
                bpl -
                ;
                lda #%10001000          ; NMI on, PT0&NT0 for BG, PT1 for spr
                sta ppu_ctrl_copy

                jsr prep_ppu_upd        ; prepare for first NMI

                jsr wait_vbl_start      ; wait until next VBlank starts

                ; initialize PPU memory
                ;
                ldy #>ppu_palette       ; while still in VBlank, fill first 18
                lda #<ppu_palette       ; colors with BG color
                jsr set_ppu_addr        ; Y*$100 + A -> address
                lda #BG_COLOR
                ldx #18
-               sta ppu_data
                dex
                bne -
                ;
                lda #$30                ; next color = white
                sta ppu_data
                ;
                ldy #$20                ; clear NTs & ATs ($800 bytes)
                lda #$00
                jsr set_ppu_addr        ; Y*$100 + A -> address
                ldy #8
                tax
-               sta ppu_data
                inx
                bne -
                dey
                bne -

                jsr set_ppu_regs        ; set PPU registers and CHR bank

                ; fall through to main loop

; --- Main loop ---------------------------------------------------------------

main_loop       ; wait until NMI routine sets flag, then clear it
                bit run_main_loop
                bpl main_loop
                lsr run_main_loop

                ; update PRNG (there are only IMAGE_COUNT-1 values because we
                ; never want the random flag to be the current flag)
                dec prng
                bpl +
                lda #IMAGE_COUNT-2
                sta prng

+               lda pad_status          ; save previous joypad status
                sta prev_pad_status

                ; read 1st joypad or Famicom expansion port controller
                ; see https://www.nesdev.org/wiki/Controller_reading_code
                ; bits: A, B, select, start, up, down, left, right
                ;
                lda #1
                sta joypad1
                sta pad_status
                lsr a
                sta joypad1
                ;
-               lda joypad1
                and #%00000011
                cmp #1
                rol pad_status
                bcc -

                jsr button_logic

                ; update copy of PPU memory/registers in main RAM according to
                ; ppu_upd_phase
                jsr prep_ppu_upd

                jmp main_loop

; -----------------------------------------------------------------------------

button_logic    lda prev_pad_status     ; exit if button pressed on prev frame
                bne +
                ;
                lda pad_status
                bmi random_image        ; A
                lsr a
                bcs next_image          ; right
                lsr a
                bcs prev_image          ; left
                lsr a
                lsr a
                lsr a
                bcs toggle_text         ; start
+               rts

random_image    ; get random image (add 1 if PRNG >= which_image)
                ldx prng
                cpx which_image
                bcc +
                inx
+               stx which_image
                jmp +

next_image      inc which_image
                lda which_image
                cmp #IMAGE_COUNT
                bne +
                lda #0
                sta which_image
                jmp +

prev_image      dec which_image
                bpl +
                lda #(IMAGE_COUNT-1)
                sta which_image
                ;
+               lda #0                  ; set up image redraw
                sta ppu_upd_phase
                rts

toggle_text     ; show or hide image description (sprites 0-23)

                ; index for new sprite Y positions -> Y
                ldx sprite_data+0+0     ; sprites currently visible?
                inx
                beq +
                ldy #0                  ; yes, hide
                jmp ++
+               ldy #3                  ; no, show

++              ldx #(7*4)
-               lda spr_y_pos+0,y
                sta sprite_data+0,x
                lda spr_y_pos+1,y
                sta sprite_data+8*4+0,x
                lda spr_y_pos+2,y
                sta sprite_data+16*4+0,x
                dex
                dex
                dex
                dex
                bpl -

                rts

spr_y_pos       ; Y positions of 1st/2nd/3rd sprite row
                db $ff, $ff, $ff            ; hidden
                db 24*8-1, 25*8-1, 26*8-1   ; visible

; -----------------------------------------------------------------------------

prep_ppu_upd    ; update ppu_buffer, ppu_ctrl_copy or sprite_data according to
                ; ppu_upd_phase

                lda ppu_upd_phase
                cmp #6
                beq +
                bpl ++
                ;
                jsr nt_at_to_buffer     ; phases 0-5
                rts
                ;
+               jsr pal_to_buffer       ; phase 6
                jsr set_ppu_ctrl
                jsr update_sprites
                ;
++              rts                     ; phase 7

nt_at_to_buffer ; copy one sixth of NT/AT data of current image (up to 140
                ; bytes) to ppu_buffer according to ppu_upd_phase (must be 0-5)

                ldy ppu_upd_phase       ; get RLE data address
                jsr get_sect_addr       ; address -> grafix_ptr

                ; decode RLE data from grafix_ptr and write it to ppu_buffer;
                ; first byte of each run:
                ;     $00:     terminator   (end of data)
                ;     $01-$7f: uncompressed (output next 1-127 bytes verbatim)
                ;     $81-$ff: compressed   (output next byte 1-127 times)

                lda #0                  ; clear source & destination index
                sta rle_src_ind
                sta rle_dst_ind

rle_loop        ldy rle_src_ind
                lda (grafix_ptr),y
                beq rle_end             ; terminator?
                bmi +                   ; compressed run?
                ;
                clc                     ; uncompressed run
                adc rle_dst_ind         ; temp = current dst + length
                sta temp
                ;
                ldx rle_dst_ind         ; copy from (grafix_ptr) to buffer
                iny
-               lda (grafix_ptr),y
                iny
                sta ppu_buffer,x
                inx
                cpx temp
                bne -
                sty rle_src_ind
                stx rle_dst_ind
                jmp rle_loop
                ;
+               and #%01111111          ; compressed run; X = length, A = byte
                tax
                iny
                lda (grafix_ptr),y
                iny
                sty rle_src_ind
                ;
                ldy rle_dst_ind         ; copy A to buffer X times
-               sta ppu_buffer,y
                iny
                dex
                bne -
                sty rle_dst_ind
                jmp rle_loop

rle_end         ; PPU destination address
                ;
                lda ppu_ctrl_copy       ; visible NT -> Y
                and #%00000001
                tay
                ;
                lda ppu_upd_phase       ; index to ppu_dst_adrses -> X
                asl a
                tax
                ;
                lda ppu_dst_adrses+1,x  ; high byte; use non-visible NT
                ora nt_high_nonvis,y
                sta ppu_dst_addr+1
                ;
                lda ppu_dst_adrses+0,x  ; low byte
                sta ppu_dst_addr+0

                ldx ppu_upd_phase       ; data length (must be set last)
                lda decoded_lengths,x
                sta ppu_buf_length

                rts

decoded_lengths ; lengths of decoded NT/AT slices; must be multiples of 4
                db RLE_SLICE_LEN, RLE_SLICE_LEN
                db RLE_SLICE_LEN, RLE_SLICE_LEN
                db RLE_SLICE_LEN, LAST_RLE_SLICE_LEN

ppu_dst_adrses  ; PPU destination address within NT/AT for each slice
                ; (we use bottom of NT and entire AT)
                dw ppu_nt0+NT_TOP_PADDING+0*RLE_SLICE_LEN
                dw ppu_nt0+NT_TOP_PADDING+1*RLE_SLICE_LEN
                dw ppu_nt0+NT_TOP_PADDING+2*RLE_SLICE_LEN
                dw ppu_nt0+NT_TOP_PADDING+3*RLE_SLICE_LEN
                dw ppu_nt0+NT_TOP_PADDING+4*RLE_SLICE_LEN
                dw ppu_nt0+NT_TOP_PADDING+5*RLE_SLICE_LEN

nt_high_nonvis  ; visible NT -> OR mask for non-visible NT in PPU high byte
                hex 04 00

pal_to_buffer   ; copy background palettes (16 bytes) of current image from
                ; NT/AT data to ppu_buffer

                ; fill PPU buffer with background color
                ldx #(16-1)
                lda #BG_COLOR
-               sta ppu_buffer,x
                dex
                bpl -

                ldy #6
                jsr get_sect_addr       ; palette address -> grafix_ptr

                ; 1st byte = length
                ldy #0
                lda (grafix_ptr),y
                tay                     ; source index

                ; copy bytes length...1 to PPU buffer
-               lda (grafix_ptr),y
                sta ppu_buffer-1,y
                dey
                bne -

                lda #>ppu_palette       ; PPU address
                sta ppu_dst_addr+1
                lda #<ppu_palette
                sta ppu_dst_addr+0

                lda #16
                sta ppu_buf_length      ; data length (must be set last)

                rts

set_ppu_ctrl    ; set CHR bank, background PT and NT in chr_bank and
                ; ppu_ctrl_copy

                ; get CHR bank and PT to use
                ldx which_image
                lda image_pts,x         ; bits %BBP
                lsr a
                sta chr_bank            ; bits %BB
                rol a
                and #%00000001
                tax                     ; bit %P

                lda ppu_ctrl_copy
                eor #%00000001          ; flip visible NT
                and #%11101111          ; set new background PT bit
                ora bg_pt_values,x
                sta ppu_ctrl_copy
                rts

bg_pt_values    db %00000000, %00010000

update_sprites  ; update tiles of description sprites

                ; get description address
                ldy #7
                jsr get_sect_addr       ; address -> grafix_ptr

                ; 1st byte = length
                ldy #0
                lda (grafix_ptr),y
                tay                     ; source index

                ; other bytes are tile numbers
                ldx #(23*4)             ; destination index
-               lda (grafix_ptr),y
                sta sprite_data+1,x
                dex
                dex
                dex
                dex
                dey
                bne -

                ; pad if necessary
                txa
                beq +
                ;
                lda #$00                ; space
-               sta sprite_data+1,x
                dex
                dex
                dex
                dex
                bpl -

+               rts

get_sect_addr   ; Get address in graphics data.
                ; in: which_image, Y = which section (0-5 = NT/AT slice,
                ;     6 = palette, 7 = description)
                ; out: grafix_ptr

                ; get image address
                lda which_image
                asl a
                tax
                lda image_ptrs+0,x
                sta grafix_ptr+0
                lda image_ptrs+1,x
                sta grafix_ptr+1

                ; get section address
                tya
                asl a
                tay
                lda (grafix_ptr),y
                pha
                iny
                lda (grafix_ptr),y
                sta grafix_ptr+1
                pla
                sta grafix_ptr+0

                rts

                ; NESDev Compo requires $ffd0-$fff9 to be unused
                pad $ffd0, $ff

; --- Interrupt vectors -------------------------------------------------------

                pad $fffa, $ff
                dw nmi, reset, irq      ; IRQ unused

; --- CHR ROM -----------------------------------------------------------------

                ; For each bank:
                ; - background (256+208 tiles)
                ; - sprites (48 tiles, same in each bank)

                base $0000

                ; bank 0
                incbin "chr-bg0.bin"
                pad $1000, $ff
                incbin "chr-bg1.bin"
                pad $1d00, $ff
                incbin "chr-spr.bin"
                pad $2000, $ff

                ; bank 1
                incbin "chr-bg2.bin"
                pad $3000, $ff
                incbin "chr-bg3.bin"
                pad $3d00, $ff
                incbin "chr-spr.bin"
                pad $4000, $ff

                ; bank 2
                incbin "chr-bg4.bin"
                pad $5000, $ff
                incbin "chr-bg5.bin"
                pad $5d00, $ff
                incbin "chr-spr.bin"
                pad $6000, $ff

                ; bank 3
                incbin "chr-bg6.bin"
                pad $7000, $ff
                incbin "chr-bg7.bin"
                pad $7d00, $ff
                incbin "chr-spr.bin"
                pad $8000, $ff
