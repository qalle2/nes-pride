; NES/ASM6: Qalle's Pride Flag Show, https://github.com/qalle2/nes-pride

; --- Constants ---------------------------------------------------------------

; Notes:
; - addresses are little-endian (low byte first)
; - boolean variables: $00-$7f = false, $80-$ff = true
; - ppu_buffer: what to copy to PPU memory on next VBlank; read using PLA;
;     only the first ppu_buf_length bytes are used
; - ppu_upd_phase: how to update PPU memory:
;     0-6: update NT/AT data (up $80 bytes/phase) to non-visible NT via PPU
;          buffer
;     7:   update other PPU memory/registers via various buffers in main RAM;
;          do OAM DMA
;     8:   do OAM DMA (in case user toggles descriptions on/off)

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
ppu_buf_length  equ $0b    ; length of PPU buffer
stack_ptr       equ $0c    ; copy of stack pointer
rle_src_ind     equ $0d    ; RLE decoder - source index
rle_dst_ind     equ $0e    ; RLE decoder - destination index
rle_direct      equ $0f    ; RLE decoder - direct (implied) byte
ppu_buffer      equ $0100  ; see above ($80 bytes)
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

; --- iNES header -------------------------------------------------------------

                ; see https://wiki.nesdev.org/w/index.php/INES
                ;
                base $0000
                db "NES", $1a            ; file id
                db 1, 1                  ; 16 KiB PRG ROM, 8 KiB CHR ROM
                db %00000001, %00000000  ; NROM mapper, vertical mirroring
                pad $0010, $00           ; unused

; --- Start of PRG ROM --------------------------------------------------------

                base $c000              ; last 16 KiB of CPU address space
                pad $e000, $ff          ; only use last 8 KiB

                ; image data excluding pattern tables; automatically generated;
                ; constants defined there: image_count, pts_to_use, image_ptrs
                include "imgdata.asm"

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
                jsr init_main_ram       ; initialize main RAM
                jsr prep_ppu_upd        ; prepare for first NMI

                jsr wait_vbl_start      ; wait until next VBlank starts
                jsr init_ppu_mem        ; initialize PPU memory
                jsr set_ppu_regs        ; set PPU registers
                jmp main_loop           ; start main loop

wait_vbl_start  bit ppu_status          ; wait until next VBlank starts
-               lda ppu_status
                bpl -
                rts

init_main_ram   ; initialize main RAM

                ; clear zero page
                lda #$00
                tax
-               sta $00,x
                inx
                bne -

                ; hide all sprites (set Y positions to $ff)
                lda #$ff
                ldx #0
-               sta sprite_data,x
                inx
                inx
                inx
                inx
                bne -

                ; set attributes of image description sprites (0-23)
                ldx #(23*4)
-               lda #%00000000          ; subpalette 0, no mirroring
                sta sprite_data+2,x
                dex
                dex
                dex
                dex
                bpl -

                ; set X positions of image description sprites (0-23)
                ldx #(7*4)
                lda #(29*8)             ; rightmost X position
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

                ; enable NMI; use PT0 & NT0 for background, PT1 for sprites
                lda #%10001000
                sta ppu_ctrl_copy

                rts

init_ppu_mem    ; initialize PPU memory

                ; while still in VBlank, fill background palettes and colors
                ; 0-1 of sprite palette 0
                ldy #$3f
                lda #$00
                jsr set_ppu_addr        ; Y*$100 + A -> address
                lda #$0f                ; black
                ldx #18
-               sta ppu_data
                dex
                bne -

                ; while still in VBlank, set color 2 of sprite palette 0
                lda #$30                ; white
                sta ppu_data

                ; fill NTs and ATs ($800 bytes) with tile $00
                ldy #$20
                lda #$00
                jsr set_ppu_addr        ; Y*$100 + A -> address
                ldy #8
                tax
-               sta ppu_data
                inx
                bne -
                dey
                bne -

                rts

set_ppu_addr    sty ppu_addr            ; Y*$100 + A -> address
                sta ppu_addr
                rts

; --- Main loop ---------------------------------------------------------------

main_loop       ; wait until NMI routine sets flag, then clear it
                bit run_main_loop
                bpl main_loop
                lsr run_main_loop

                ; update PRNG (there are only image_count-1 values because we
                ; never want the random flag to be the current flag)
                dec prng
                bpl +
                lda #image_count-2
                sta prng

+               ; handle buttons
                lda pad_status
                sta prev_pad_status
                jsr read_joypad
                jsr button_logic

                ; update copy of PPU memory/registers in main RAM according to
                ; ppu_upd_phase
                jsr prep_ppu_upd

                jmp main_loop

; -----------------------------------------------------------------------------

read_joypad     ; read 1st joypad or Famicom expansion port controller
                ; see https://www.nesdev.org/wiki/Controller_reading_code
                ; bits: A, B, select, start, up, down, left, right

                lda #1
                sta joypad1
                sta pad_status
                lsr a
                sta joypad1

-               lda joypad1
                and #%00000011
                cmp #1
                rol pad_status
                bcc -
                rts

button_logic    ; exit if anything pressed on previous frame
                lda prev_pad_status
                bne +

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

random_image    ; get random image (add 1 if prng >= which_image)
                ldx prng
                cpx which_image
                bcc +
                inx
+               stx which_image
                jmp +

next_image      inc which_image
                lda which_image
                cmp #image_count
                bne +
                lda #0
                sta which_image
                jmp +
                ;
prev_image      dec which_image
                bpl +
                lda #(image_count-1)
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

prep_ppu_upd    ; update PPU buffer, ppu_ctrl_copy or sprite_data according to
                ; ppu_upd_phase

                lda ppu_upd_phase
                cmp #7
                beq +
                bpl ++
                ;
                jsr nt_at_to_buffer     ; phases 0-6
                rts
                ;
+               jsr pal_to_buffer       ; phase 7
                jsr set_ppu_ctrl
                jsr update_sprites
                ;
++              rts                     ; phase 8

nt_at_to_buffer ; copy one seventh of NT/AT data of current image (up to $80
                ; bytes) to ppu_buffer according to ppu_upd_phase (must be 0-6)

                ; get RLE data address
                ldy ppu_upd_phase
                jsr get_sect_addr       ; address -> grafix_ptr

                ; decode RLE data from grafix_ptr and write it to PPU buffer;
                ; first byte in data: the direct (implied) byte;
                ; other bytes:
                ;     $80-$ff: output direct_byte    1-128 times
                ;     $01-$7f: output following byte 1-127 times
                ;     $00:     end of data

                ldy #0
                sty rle_dst_ind         ; destination index
                lda (grafix_ptr),y
                sta rle_direct          ; direct byte
                iny
                sty rle_src_ind         ; source index

rle_loop        ldy rle_src_ind
                lda (grafix_ptr),y
                beq rle_end             ; terminator?
                bpl +
                ;
                ; use direct byte
                iny
                and #%01111111
                tax
                inx                     ; length
                lda rle_direct          ; byte
                jmp ++
                ;
+               ; use following byte
                iny
                tax                     ; length
                lda (grafix_ptr),y      ; byte
                iny
                ;
++              ; write A to buffer X times
                sty rle_src_ind
                ldy rle_dst_ind
-               sta ppu_buffer,y
                iny
                dex
                bne -
                sty rle_dst_ind
                ;
                jmp rle_loop

rle_end         ; PPU destination address; use non-visible NT
                ;
                ldx ppu_upd_phase
                lda ppu_ctrl_copy
                and #%00000001
                tay
                ;
                lda ppu_dst_highs,x
                ora nt_high_invis,y
                sta ppu_dst_addr+1
                ;
                lda ppu_dst_lows,x
                sta ppu_dst_addr+0

                ; data length
                ldx ppu_upd_phase
                lda decoded_lengths,x
                sta ppu_buf_length

                rts

decoded_lengths ; lengths of decoded NT/AT slices; must be a multiple of 4
                hex 80 80 80 80 80 80 40

                ; PPU destination address within NT/AT for each slice
                ; (we use bottom of NT and entire AT)
ppu_dst_highs   hex 20 21 21 22 22 23 23  ; high bytes of addresses
ppu_dst_lows    hex c0 40 c0 40 c0 40 c0  ; low bytes of addresses

nt_high_invis   ; visible NT -> high byte of non-visible NT offset
                hex 04 00

pal_to_buffer   ; copy background palettes (16 bytes) of current image from
                ; NT/AT data to ppu_buffer

                ldy #7
                jsr get_sect_addr       ; address -> grafix_ptr

                ldy #0                  ; source/destination index
-               lda (grafix_ptr),y
                sta ppu_buffer,y
                iny
                cpy #16
                bne -

                sty ppu_buf_length      ; data length

                lda #$3f                ; PPU address
                sta ppu_dst_addr+1
                lda #$00
                sta ppu_dst_addr+0

                rts

set_ppu_ctrl    ; set background PT and NT in ppu_ctrl_copy

                ; which PT to use (0/1) -> X
                ;
                lda which_image         ; byte index -> Y
                lsr a
                lsr a
                lsr a
                tay
                lda which_image         ; bit index -> X
                and #%00000111
                tax
                ;
                lda pts_to_use,y        ; read byte
-               lsr a                   ; shift correct bit to carry
                dex
                bpl -
                lda #0                  ; carry -> X
                rol a
                tax

                lda ppu_ctrl_copy
                eor #%00000001          ; flip visible NT
                and #%11101111          ; set new background PT bit
                ora bg_pt_values,x
                sta ppu_ctrl_copy
                rts

bg_pt_values    db %00000000, %00010000

update_sprites  ; update tiles of description sprites

                ; get description address
                ldy #8
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
                ; in: which_image, Y = which section (0-6 = NT/AT slice,
                ;     7 = palette, 8 = description)
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

; --- Interrupt routines ------------------------------------------------------

                align $100, $ff         ; for speed

nmi             pha                     ; push A, X, Y
                txa
                pha
                tya
                pha

                bit ppu_status          ; reset ppu_scroll/ppu_addr latch

                lda ppu_upd_phase       ; do OAM DMA on phases 7-8
                cmp #7
                bmi +
                jsr do_oam_dma

+               lda ppu_upd_phase       ; increment phase on phases 0-7
                cmp #8
                beq +
                inc ppu_upd_phase

+               jsr flush_ppu_buf       ; always flush PPU buffer
                jsr set_ppu_regs        ; always set PPU registers

                sec                     ; set flag to let main loop run once
                ror run_main_loop

                pla                     ; pull Y, X, A
                tay
                pla
                tax
                pla

irq             rti                     ; IRQ unused

do_oam_dma      ; copy sprite data from main RAM to OAM
                lda #$00
                sta oam_addr
                lda #>sprite_data
                sta oam_dma
                rts

flush_ppu_buf   ; copy PPU buffer to PPU memory and empty it;
                ; buffer length must be a multiple of 4

                lda ppu_buf_length
                beq +

                lsr a                   ; ppu_buf_length / 4 -> Y
                lsr a
                tay

                lda ppu_dst_addr+1
                sta ppu_addr
                lda ppu_dst_addr+0
                sta ppu_addr

                tsx                     ; store actual stack pointer
                stx stack_ptr

                ldx #$ff                ; set SP for reading ppu_buffer
                txs

                ; copy ppu_buffer from stack to PPU
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

                ldx stack_ptr           ; restore actual stack pointer
                txs

                lda #0                  ; empty buffer
                sta ppu_buf_length

+               rts

set_ppu_regs    lda #0                  ; horizontal scroll
                sta ppu_scroll
                lda #3*8                ; vertical scroll: 3 tiles up
                sta ppu_scroll
                lda ppu_ctrl_copy       ; use precalculated BG PT/NT numbers
                sta ppu_ctrl
                lda #%00011110          ; show background & sprites
                sta ppu_mask
                rts

; --- Interrupt vectors -------------------------------------------------------

                pad $fffa, $ff
                dw nmi, reset, irq      ; IRQ unused

; --- CHR ROM -----------------------------------------------------------------

                base $0000
                incbin "chr-bg0.bin"    ; PT0 - background (256 tiles)
                pad $1000, $ff

                incbin "chr-bg1.bin"    ; PT1 - background (208 tiles)
                pad $1d00, $ff
                incbin "chr-spr.bin"    ; PT1 - sprites (48 tiles)
                pad $2000, $ff
