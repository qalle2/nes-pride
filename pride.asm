; NES/ASM6: pride flag show

; --- Constants ---------------------------------------------------------------

; Notes:
; - addresses are little-endian (low byte first)
; - boolean variables: $00-$7f = false, $80-$ff = true
; - ppu_buffer: what to copy *backwards* to PPU memory on next VBlank
; - ppu_upd_phase: what to update in PPU memory on next VBlank:
;     255: copy blank background palettes from buffer (16 bytes) & do OAM DMA
;     0-7: copy one eighth of name & attribute table from buffer ($80 bytes)
;     8  : copy correct background palettes from buffer (16 bytes) & do OAM DMA

; RAM
ppu_buffer      equ $00    ; see above ($80 bytes)
nt_at_addr      equ $80    ; source      address in NT/AT data (2 bytes)
ppu_upd_addr    equ $82    ; destination address in PPU memory (2 bytes)
run_main_loop   equ $84    ; main loop allowed to run? (boolean)
pad_status      equ $85    ; joypad status
prev_pad_status equ $86    ; previous joypad status
which_image     equ $87    ; which image is being shown
ppu_upd_phase   equ $88    ; see above
ppu_upd_length  equ $89    ; how many bytes to copy from buffer to PPU
text_visible    equ $8a    ; flag description visible? (boolean)
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

; misc
image_count     equ 13

; --- iNES header -------------------------------------------------------------

                ; see https://wiki.nesdev.org/w/index.php/INES
                ;
                base $0000
                db "NES", $1a            ; file id
                db 1, 1                  ; 16 KiB PRG ROM, 8 KiB CHR ROM
                db %00000001, %00000000  ; NROM mapper, vertical mirroring
                pad $0010, $00           ; unused

; --- NT/AT/palette data ------------------------------------------------------

                base $c000              ; last 16 KiB of CPU address space

                ; name & attribute table data for each image
                ; (here to simplify address calculations)
nt_at_data      incbin "nt-at.bin"

                ; background palette data for each image (16 bytes/image)
bg_pal_data     incbin "pal.bin"

                ; name of each image (8 bytes/image)
img_name_data   incbin "names.bin"

; --- Initialization ----------------------------------------------------------

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

                lda #$00                ; fill zero page with $00
                tax
-               sta $00,x
                inx
                bne -

                lda #$ff                ; fill sprite page with $ff to
                ldx #0                  ; hide all sprites
-               sta sprite_data,x
                inx
                bne -

                ; set attributes of sprites 0-7
                ldx #0
-               lda #%00000000          ; subpalette 0, no mirroring
                sta sprite_data+2,x
                inx
                inx
                inx
                inx
                cpx #(8*4)
                bne -

                ; set X positions of sprites 0-7
                ldx #0
                lda #(22*8)
-               sta sprite_data+3,x
                clc
                adc #8
                inx
                inx
                inx
                inx
                cpx #(8*4)
                bne -

                lda #255
                sta ppu_upd_phase

                ; prepare PPU update (must be done before NMI routine runs the
                ; first time)
                jsr prep_ppu_upd

                jsr wait_vbl_start      ; wait until next VBlank starts

                ; set sprite palette
                ldy #$3f
                lda #$11
                jsr set_ppu_addr
                lda #$0f                ; black
                sta ppu_data
                lda #$30                ; white
                sta ppu_data

                jsr set_ppu_regs        ; set ppu_scroll/ppu_ctrl/ppu_mask
                jmp main_loop

wait_vbl_start  bit ppu_status          ; wait until next VBlank starts
-               lda ppu_status
                bpl -
                rts

; --- Main loop ---------------------------------------------------------------

main_loop       bit run_main_loop       ; wait until NMI routine has set flag
                bpl main_loop

                lsr run_main_loop       ; clear flag

                lda pad_status
                sta prev_pad_status
                jsr read_joypad
                jsr button_logic
                jsr prep_ppu_upd

                jmp main_loop

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
                lsr a
                bcs next_image          ; right
                lsr a
                bcs prev_image          ; left
                lsr a
                lsr a
                lsr a
                bcs toggle_text         ; start
+               rts

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
+               lda #255                ; NT & AT must be updated
                sta ppu_upd_phase
                rts

toggle_text     ; show or hide image description (sprites 0-7)

                lda text_visible        ; toggle MSB
                eor #%10000000
                sta text_visible

                bmi +                   ; A = Y position of sprites
                lda #$ff
                jmp ++
+               lda #(26*8-1)

++              ldx #0
-               sta sprite_data+0,x
                inx
                inx
                inx
                inx
                cpx #(8*4)
                bne -

                rts

prep_ppu_upd    ; prepare a PPU memory update according to ppu_upd_phase

                lda ppu_upd_phase
                bmi +
                cmp #8
                beq +
                jsr nt_at_to_buffer     ; phases 0-7
                rts
+               jsr pal_to_buffer       ; phases 255 and 8
                jsr update_sprites
                rts

nt_at_to_buffer ; copy one eighth of name & attribute table data of current
                ; image ($80 bytes) backwards to ppu_buffer according to
                ; ppu_upd_phase (must be 0-7)

                ; nt_at_addr:
                ; nt_at_data + which_image * $400 + ppu_upd_phase * $80
                ;
                lda which_image         ; high byte
                asl a
                asl a
                sta nt_at_addr+1
                lda ppu_upd_phase
                lsr a
                ora #>nt_at_data
                ora nt_at_addr+1
                sta nt_at_addr+1
                ;
                lda ppu_upd_phase       ; low byte
                lsr a
                lda #0
                ror a
                sta nt_at_addr+0

                ; copy backwards
                ldy #0                  ; source index
                ldx #($80-1)            ; destination index
-               lda (nt_at_addr),y
                sta ppu_buffer,x
                iny
                dex
                bpl -

                ; PPU address: $2000 + ppu_upd_phase * $80
                ;
                lda ppu_upd_phase       ; high byte
                lsr a
                ora #$20
                sta ppu_upd_addr+1
                ;
                lda ppu_upd_phase       ; low byte
                lsr a
                lda #0
                ror a
                sta ppu_upd_addr+0

                lda #$80                ; length
                sta ppu_upd_length

                rts

pal_to_buffer   ; copy background palettes (16 bytes) to ppu_buffer according
                ; to ppu_upd_phase (must be 255 or 8)

                lda ppu_upd_phase
                bpl +

                ; phase 255: copy gray only
                ;
                lda #$00
                ldx #(16-1)
-               sta ppu_buffer,x
                dex
                bpl -
                ;
                jmp ++

+               ; phase 8: copy background palettes of current image backwards
                ;
                lda which_image         ; X = source index
                asl a
                asl a
                asl a
                asl a
                tax
                ldy #(16-1)             ; Y = destination index
                ;
-               lda bg_pal_data,x
                sta ppu_buffer,y
                inx
                dey
                bpl -

++              lda #$3f                ; PPU address
                sta ppu_upd_addr+1
                lda #$00
                sta ppu_upd_addr+0

                lda #16                 ; length
                sta ppu_upd_length

                rts

update_sprites  ; update tiles of image description sprites

                lda which_image
                asl a
                asl a
                asl a
                tax
                ldy #0
                ;
-               lda img_name_data,x
                sta sprite_data+1,y
                inx
                iny
                iny
                iny
                iny
                cpy #(8*4)
                bne -

                rts

; --- Interrupt routines ------------------------------------------------------

                align $100, $ff

nmi             pha                     ; push A, X, Y
                txa
                pha
                tya
                pha

                bit ppu_status          ; reset ppu_scroll/ppu_addr latch

                lda ppu_upd_phase       ; do OAM DMA on phases 255 and 8
                cmp #8
                bcc +
                ;
                lda #$00
                sta oam_addr
                lda #>sprite_data
                sta oam_dma

+               jsr upd_ppu_mem         ; update PPU memory (on every phase)
                jsr set_ppu_regs        ; set ppu_scroll/ppu_ctrl/ppu_mask

                lda ppu_upd_phase       ; increment phase up to 8
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

upd_ppu_mem     ; copy data backwards from ppu_buffer to PPU memory

                ldy ppu_upd_addr+1
                lda ppu_upd_addr+0
                jsr set_ppu_addr        ; Y*$100 + A -> address

                ldx ppu_upd_length
                dex
-               lda ppu_buffer,x
                sta ppu_data
                dex
                bpl -

                rts

; --- Subs used in many places ------------------------------------------------

set_ppu_addr    sty ppu_addr            ; Y*$100 + A -> address
                sta ppu_addr
                rts

set_ppu_regs    lda #0                  ; set scroll value
                sta ppu_scroll
                lda #(240-8)
                sta ppu_scroll
                lda #%10001000          ; enable NMI, use PT1 for sprites
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
