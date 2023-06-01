; NES/ASM6: Qalle's Pride Flag Show, https://github.com/qalle2/nes-pride

; --- Call graph --------------------------------------------------------------

; reset
;     wait_vbl_start
;     init_main_ram
;     prep_ppu_upd
;         nt_at_to_buffer
;             get_sect_addr
;         pal_to_buffer
;             get_sect_addr
;         update_sprites
;             get_sect_addr
;     init_ppu_mem
;         set_ppu_addr
;     set_ppu_regs
;     main_loop
;         read_joypad
;         button_logic
;         prep_ppu_upd
;             (see above)
; nmi
;     do_oam_dma
;     buffer_to_ppu
;     set_ppu_regs
; irq

; --- Constants ---------------------------------------------------------------

; Notes:
; - addresses are little-endian (low byte first)
; - boolean variables: $00-$7f = false, $80-$ff = true
; - ppu_buffer: what to copy *backwards* to PPU memory on next VBlank;
;     only the first ppu_buf_length indexes are used
; - ppu_upd_phase: how to update PPU memory:
;     0-6: copy one seventh of name & attribute table ($80 bytes) via PPU
;          buffer to non-visible name table
;     7: do OAM DMA, copy background palettes (16 bytes) via PPU buffer to PPU
;        and flip visible name table
;     8: do OAM DMA (previous PPU buffer also copied to PPU)

; RAM
ppu_buffer      equ $00    ; see above ($80 bytes)
grafix_ptr      equ $80    ; pointer to imgdata.asm (2 bytes)
ppu_dst_addr    equ $82    ; destination address in PPU memory (2 bytes)
run_main_loop   equ $84    ; main loop allowed to run? (boolean)
pad_status      equ $85    ; joypad status
prev_pad_status equ $86    ; previous joypad status
which_image     equ $87    ; which image is being shown
ppu_upd_phase   equ $88    ; PPU update phase; see above
ppu_buf_length  equ $89    ; length of PPU buffer
text_visible    equ $8a    ; flag description visible? (boolean)
rle_src_ind     equ $8b    ; RLE decoder - source index
rle_dst_ind     equ $8c    ; RLE decoder - destination index
rle_direct      equ $8d    ; RLE direct (implied) byte
visible_nt      equ $8e    ; which name table to show (0/1)
frame_counter   equ $8f    ; counts between image_count-2...0; for random flag
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

                ; image data excluding pattern tables; automatically generated
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

                lda #$00                ; fill zero page with $00
                tax
-               sta $00,x
                inx
                bne -

                lda #$ff                ; fill sprite page with $ff to hide
                ldx #0                  ; all sprites
-               sta sprite_data,x
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
                lda #(29*8)
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

                rts

init_ppu_mem    ; initialize PPU memory

                ; fill background palettes and colors 0-1 of sprite palette 0
                ; with black (while still in VBlank)
                ldy #$3f
                lda #$00
                jsr set_ppu_addr        ; Y*$100 + A -> address
                lda #$0f                ; black
                ldx #18
-               sta ppu_data
                dex
                bne -

                ; set color 2 of sprite palette 0 white
                lda #$30
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

main_loop       bit run_main_loop       ; wait until NMI routine has set flag
                bpl main_loop

                lsr run_main_loop       ; clear flag

                dec frame_counter
                bpl +
                lda #image_count-2
                sta frame_counter

+               lda pad_status
                sta prev_pad_status
                jsr read_joypad
                jsr button_logic
                jsr prep_ppu_upd

                lda ppu_upd_phase       ; flip visible name table on phase 7
                cmp #7
                bne +
                lda visible_nt
                eor #%00000001
                sta visible_nt

+               jmp main_loop

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

random_image    ; get random image (add 1 if frame_counter >= which_image)
                ldx frame_counter
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

                lda text_visible        ; toggle MSB
                eor #%10000000
                sta text_visible

                bmi +                   ; get index for sprite Y positions
                ldy #0
                jmp ++
+               ldy #3

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

prep_ppu_upd    ; prepare a PPU memory update according to ppu_upd_phase

                lda ppu_upd_phase
                cmp #7
                beq +
                bpl ++                  ; phase 8
                jsr nt_at_to_buffer     ; phases 0-6
                rts
+               jsr pal_to_buffer       ; phase 7
++              jsr update_sprites
                rts

nt_at_to_buffer ; copy one seventh of name & attribute table data of current
                ; image ($80 bytes) backwards to ppu_buffer according to
                ; ppu_upd_phase (must be 0-6)

                ldy ppu_upd_phase
                jsr get_sect_addr

                ; decode RLE data from nt_at_data backwards into PPU buffer
                ; (always decodes into $80 bytes)
                ; 1st byte of data is the direct (implied) byte; other bytes
                ; are runs of 1/2 bytes:
                ; 0bLLLLLLL1     : output direct_byte 0bLLLLLLL+1 times (1-128)
                ; 0bLLLLLLL0 0xBB: output byte 0xBB   0bLLLLLLL   times (1-127)
                ; 0b00000000     : terminator (end of data)
                ;
                ldx ppu_upd_phase
                lda slice_lengths,x
                tax
                dex
                stx rle_dst_ind         ; destination index
                ;
                ldy #0
                lda (grafix_ptr),y
                sta rle_direct          ; direct (implied) byte
                iny
                sty rle_src_ind         ; source index
                ;
--              ldy rle_src_ind
                lda (grafix_ptr),y      ; type & repeat count of run
                beq rle_end             ; terminator?
                lsr a                   ; type -> carry
                tax                     ; repeat count
                iny
                ;
                bcc +
                lda rle_direct          ; value to repeat: direct byte
                inx
                jmp ++
+               lda (grafix_ptr),y      ; value to repeat: following byte
                iny
++              sty rle_src_ind
                ;
                ldy rle_dst_ind         ; repeat value
-               sta ppu_buffer,y
                dey
                dex
                bne -
                sty rle_dst_ind
                ;
                jmp --

rle_end         ; PPU destination address; use non-visible NT
                ldx ppu_upd_phase
                ldy visible_nt
                lda ppu_dst_highs,x
                ora nt_high_invis,y
                sta ppu_dst_addr+1
                lda ppu_dst_lows,x
                sta ppu_dst_addr+0

                ; length
                ldx ppu_upd_phase
                lda slice_lengths,x
                sta ppu_buf_length

                rts

                ; PPU destination address within NT and length for each slice
                ; (we use bottom of NT and entire AT)
ppu_dst_highs   hex 20 21 21 22 22 23 23  ; high bytes of addresses
ppu_dst_lows    hex c0 40 c0 40 c0 40 c0  ; low bytes of addresses
slice_lengths   hex 80 80 80 80 80 80 40  ; lengths

nt_high_invis   ; ORA high byte of NT address with these to get non-visible NT
                hex 04 00

pal_to_buffer   ; copy background palettes (16 bytes) of current image from
                ; nt_at_data backwards to ppu_buffer

                ldy #7
                jsr get_sect_addr

                ldy #0                  ; source index
                ldx #(16-1)             ; destination index
-               lda (grafix_ptr),y
                sta ppu_buffer,x
                iny
                dex
                bpl -

                lda #$3f                ; PPU address
                sta ppu_dst_addr+1
                lda #$00
                sta ppu_dst_addr+0

                lda #16                 ; length
                sta ppu_buf_length

                rts

update_sprites  ; update tiles of image description sprites

                ldy #8
                jsr get_sect_addr

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
                lda #$20                ; space
-               sta sprite_data+1,x
                dex
                dex
                dex
                dex
                bpl -

+               rts

get_sect_addr   ; in: which_image = which image
                ; in: Y = which section (0-6 = NT/AT slice, 7 = palette,
                ;         8 = description)
                ; out: grafix_ptr = pointer

                ; image address in graphics data
                lda which_image
                asl a
                tax
                lda image_ptrs+0,x
                sta grafix_ptr+0
                lda image_ptrs+1,x
                sta grafix_ptr+1

                ; section address in this image's data -> grafix_ptr
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

+               jsr buffer_to_ppu       ; copy PPU buffer
                jsr set_ppu_regs        ; set PPU registers

                lda ppu_upd_phase       ; increment phase on phases 0-7
                cmp #8
                beq +
                inc ppu_upd_phase

+               sec                     ; set flag to let main loop run once
                ror run_main_loop

                pla                     ; pull Y, X, A
                tay
                pla
                tax
                pla

irq             rti                     ; IRQ unused

do_oam_dma      lda #$00
                sta oam_addr
                lda #>sprite_data
                sta oam_dma
                rts

buffer_to_ppu   ; copy PPU buffer backwards to PPU memory
                ; (partially unrolled loop for speed)
                ;
                lda ppu_dst_addr+1
                sta ppu_addr
                lda ppu_dst_addr+0
                sta ppu_addr
                ;
                ldx ppu_buf_length
                dex
-               lda ppu_buffer,x
                sta ppu_data
                dex
                lda ppu_buffer,x
                sta ppu_data
                dex
                bpl -
                ;
                rts

set_ppu_regs    lda #0                  ; horizontal scroll
                sta ppu_scroll
                lda #3*8                ; vertical scroll: 3 tiles up
                sta ppu_scroll
                lda #%10001000          ; enable NMI, use PT1 for sprites
                ora visible_nt
                sta ppu_ctrl
                lda #%00011110          ; show background & sprites
                sta ppu_mask
                rts

; --- Interrupt vectors -------------------------------------------------------

                pad $fffa, $ff
                dw nmi, reset, irq      ; IRQ unused

; --- CHR ROM -----------------------------------------------------------------

                base $0000
                incbin "chr-bg.bin"     ; background

                pad $1000, $ff
                incbin "chr-spr.bin"    ; sprites
                pad $2000, $ff
