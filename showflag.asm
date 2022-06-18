; Show a pride flag on the NES
; under construction

; --- Constants -----------------------------------------------------------------------------------

; RAM
run_main_loop   equ $00  ; main loop allowed to run? (MSB: 0=no, 1=yes)

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

; --- iNES header ---------------------------------------------------------------------------------

                ; see https://wiki.nesdev.org/w/index.php/INES
                ;
                base $0000
                db "NES", $1a            ; file id
                db 1, 1                  ; 16 KiB PRG ROM, 8 KiB CHR ROM
                db %00000001, %00000000  ; NROM mapper, vertical name table mirroring
                pad $0010, $00           ; unused

; --- Initialization ------------------------------------------------------------------------------

                base $c000              ; last 16 KiB of CPU address space

reset           ; initialize the NES; see https://wiki.nesdev.org/w/index.php/Init_code
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

                jsr wait_vbl_start      ; wait until next VBlank starts

                ldy #$3f                ; set up palette (while still in VBlank)
                jsr set_ppu_addr_pg     ; 0 -> A; Y*$100 + A -> address
                ;
                ldx #0
-               lda palette,x
                sta ppu_data
                inx
                cpx #16
                bne -

                ; clear name & attribute table 0 & 1
                ;
                ldy #$20                ; VRAM address $2000
                jsr set_ppu_addr_pg     ; 0 -> A; Y*$100 + A -> address
                ;
                ldy #8                  ; write $800 * $00
                tax
-               sta ppu_data
                inx
                bne -
                dey
                bne -

                ; copy NT & AT data
                ;
                ldy #$20
                jsr set_ppu_addr_pg
                ;
                ldx #0
-               lda nt_data,x
                sta ppu_data
                inx
                bne -
                ;
                ldx #0
-               lda nt_data+$100,x
                sta ppu_data
                inx
                bne -
                ;
                ldx #0
-               lda nt_data+$200,x
                sta ppu_data
                inx
                bne -
                ;
                ldx #0
-               lda nt_data+$300,x
                sta ppu_data
                inx
                bne -

                jsr wait_vbl_start      ; wait until next VBlank starts
                jsr set_ppu_regs        ; set ppu_scroll/ppu_ctrl/ppu_mask
                jmp main_loop

wait_vbl_start  bit ppu_status          ; wait until next VBlank starts
-               lda ppu_status
                bpl -
                rts

palette         ; copied from Python script
                hex 0f020415 0f0f0f0f 0f0f0f0f 0f0f0f0f

nt_data         ; copied from Python script
                hex 0000000000000000000000000000000000000000000000000000000000000000
                hex 0000000000000000000000000000000000000000000000000000000000000000
                hex 0000000000000000000000000000000000000000000000000000000000000000
                hex 0000000000000000000000000000000000000000000000000000000000000000
                hex 0000000000000000000000000000000000000000000000000000000000000000
                hex 0000000000000000000000000000000000000000000000000000000000000000
                hex 0000000000000000000000000000000000000000000000000000000000000000
                hex 0000000000000000000000000000000000000000000000000000000000000000
                hex 0000000000000000000000000000000000000000000000000000000000000000
                hex 0000000000000000000000000000000000000000000000000000000000000000
                hex 0000000000000000000000000000000000000000000000000000000000000000
                hex 0101010101010101010101010101010101010101010101010101010101010101
                hex 0202020202020202020202020202020202020202020202020202020202020202
                hex 0202020202020202020202020202020202020202020202020202020202020202
                hex 0202020202020202020202020202020202020202020202020202020202020202
                hex 0202020202020202020202020202020202020202020202020202020202020202
                hex 0303030303030303030303030303030303030303030303030303030303030303
                hex 0404040404040404040404040404040404040404040404040404040404040404
                hex 0404040404040404040404040404040404040404040404040404040404040404
                hex 0404040404040404040404040404040404040404040404040404040404040404
                hex 0404040404040404040404040404040404040404040404040404040404040404
                hex 0404040404040404040404040404040404040404040404040404040404040404
                hex 0404040404040404040404040404040404040404040404040404040404040404
                hex 0404040404040404040404040404040404040404040404040404040404040404
                hex 0404040404040404040404040404040404040404040404040404040404040404
                hex 0404040404040404040404040404040404040404040404040404040404040404
                hex 0404040404040404040404040404040404040404040404040404040404040404
                hex 0404040404040404040404040404040404040404040404040404040404040404

                pad nt_data+$3c0, $ff

                ; copied from Python script
at_data         hex 0000000000000000
                hex 0000000000000000
                hex 0000000000000000
                hex 0000000000000000
                hex 0000000000000000
                hex 0000000000000000
                hex 0000000000000000

; --- Main loop -----------------------------------------------------------------------------------

main_loop       bit run_main_loop       ; wait until NMI routine has set flag
                bpl main_loop

                lsr run_main_loop       ; clear flag

                jmp main_loop

; --- Interrupt routines --------------------------------------------------------------------------

nmi             pha                     ; push A, X, Y
                txa
                pha
                tya
                pha

                bit ppu_status          ; reset ppu_scroll/ppu_addr latch

                jsr set_ppu_regs        ; set ppu_scroll/ppu_ctrl/ppu_mask

                sec                     ; set flag to let main loop run once
                ror run_main_loop

                pla                     ; pull Y, X, A
                tay
                pla
                tax
                pla

irq             rti                     ; IRQ unused

; --- Subs used in many places --------------------------------------------------------------------

set_ppu_addr_pg lda #$00                ; clear A and set PPU address page from Y
set_ppu_addr    sty ppu_addr            ; set PPU address from Y and A
                sta ppu_addr
                rts

set_ppu_regs    lda #0                  ; set scroll value
                sta ppu_scroll
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

                ; copied from Python script
                hex 0000000000000000ffffffffffffffff
                hex 0000ffffffffffffffffffffffffffff
                hex ffffffffffffffffffffffffffffffff
                hex ffffffffffffffffffffffffffff0000
                hex ffffffffffffffff0000000000000000

                pad $2000, $ff
