; Show a pride flag on the NES
; under construction

; --- Constants ---------------------------------------------------------------

; RAM
vram_buffer     equ $00  ; NT/AT data to upload on next VBlank ($80 bytes)
pointer         equ $80  ; memory pointer (2 bytes)
run_main_loop   equ $82  ; main loop allowed to run? (MSB: 0=no, 1=yes)
pad_status      equ $83  ; joypad status
prev_pad_status equ $84  ; previous joypad status
which_flag      equ $85  ; which flag is being shown
frame_counter   equ $86  ; increments every frame

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
image_count     equ 12

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

                ; here to simplify address calculations
                include "nt-at-pal-data.asm"

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

                lda #0
                sta which_flag

                jsr wait_vbl_start      ; wait until next VBlank starts
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
                inc frame_counter       ; before write_buffer!
                jsr write_buffer

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

button_logic    lda prev_pad_status
                beq +
                rts

+               lda pad_status
                lsr a
                bcs +                   ; right
                lsr a
                bcs ++                  ; left
                rts

+               ; next flag
                inc which_flag
                lda which_flag
                cmp #image_count
                bne +
                lda #0
                sta which_flag
+               rts

++              ; previous flag
                dec which_flag
                bpl +
                lda #(image_count-1)
                sta which_flag
+               rts

write_buffer    ; copy one eighth of NT/AT data ($80 bytes) to vram_buffer
                ; according to frame counter

                ; pointer:
                ; nt_at_data + which_flag*$400 + (frame_counter & 7) * $80

                ; high byte: #>nt_at_data + which_flag*4 + (frame_counter/2)&3
                lda which_flag
                asl a
                asl a
                sta pointer+1
                lda frame_counter
                lsr a
                and #%00000011
                ora #>nt_at_data
                ora pointer+1
                sta pointer+1

                ; low byte: (frame_counter & 1) * $80
                lda frame_counter
                lsr a
                lda #0
                ror a
                sta pointer+0

                ; copy
                ldy #0
-               lda (pointer),y
                sta vram_buffer,y
                iny
                cpy #$80
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

                jsr copy_palette
                jsr copy_nt_at
                jsr set_ppu_regs        ; set ppu_scroll/ppu_ctrl/ppu_mask

                sec                     ; set flag to let main loop run once
                ror run_main_loop

                pla                     ; pull Y, X, A
                tay
                pla
                tax
                pla

irq             rti                     ; IRQ unused

copy_palette    ; copy background palette

                ldy #$3f
                lda #$00
                jsr set_ppu_addr        ; Y*$100 + A -> address

                lda which_flag
                asl a
                asl a
                asl a
                asl a
                tax
                ldy #16
-               lda bg_pal_data,x
                sta ppu_data
                inx
                dey
                bne -
                ;
                rts

copy_nt_at      ; copy one eighth of NT/AT data ($80 bytes) from VRAM buffer
                ; to PPU

                ; PPU address: $2000 + (frame_counter & 7) * $80
                ;
                lda frame_counter       ; high byte
                lsr a
                and #%00000011
                ora #$20
                sta ppu_addr
                sta $f0
                ;
                lda frame_counter       ; low byte
                lsr a
                lda #0
                ror a
                sta ppu_addr
                sta $f1

                ; copy
                ldx #0
-               lda vram_buffer,x
                sta ppu_data
                inx
                cpx #$80
                bne -

                rts

; --- Subs used in many places --------------------------------------------------------------------

set_ppu_addr    sty ppu_addr            ; Y*$100 + A -> address
                sta ppu_addr
                rts

set_ppu_regs    lda #0                  ; set scroll value
                sta ppu_scroll
                lda #232
                sta ppu_scroll
                lda #%10000000          ; enable NMI
                sta ppu_ctrl
                lda #%00001010          ; show background
                sta ppu_mask
                rts

; --- Interrupt vectors ---------------------------------------------------------------------------

                pad $fffa, $ff
                dw nmi, reset, irq      ; IRQ unused

; --- CHR ROM -------------------------------------------------------------------------------------

                base $0000
                include "pt-data.asm"
                pad $1000, $ff          ; make sure <= 256 tiles
                pad $2000, $ff
