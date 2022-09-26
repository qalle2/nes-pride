; Show a pride flag on the NES
; under construction

; --- Constants ---------------------------------------------------------------

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

; --- iNES header -------------------------------------------------------------

                ; see https://wiki.nesdev.org/w/index.php/INES
                ;
                base $0000
                db "NES", $1a            ; file id
                db 1, 1                  ; 16 KiB PRG ROM, 8 KiB CHR ROM
                db %00000001, %00000000  ; NROM mapper, vertical mirroring
                pad $0010, $00           ; unused

; --- Initialization ----------------------------------------------------------

                base $c000              ; last 16 KiB of CPU address space

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

                jsr wait_vbl_start      ; wait until next VBlank starts

                ldy #$3f                ; set up palette (while still in VBlnk)
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

palette         ; copied from Python script, for now
                hex 0f162728 0f04111b 0f303135 0f08310f

nt_data         ; copied from Python script, for now
                hex 0001010203040405010101010101010101010101010101010101010101010101
                hex 0600010102030404050101010101010101010101010101010101010101010101
                hex 0606000101020304040501010101010101010101010101010101010101010101
                hex 0706060001010203040405010101010101010101010101010101010101010101
                hex 0807060600010102030404090a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a
                hex 0b08070606000101020304040c06060606060606060606060606060606060606
                hex 0b0b08070606000101020304040c060606060606060606060606060606060606
                hex 0d0b0b08070606000101020304040c0606060606060606060606060606060606
                hex 010d0b0b08070606000101020304040c06060606060606060606060606060606
                hex 01010d0b0b08070606000101020304040e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f
                hex 0101010d0b0b0807060600010102030404100b0b0b0b0b0b0b0b0b0b0b0b0b0b
                hex 010101010d0b0b0807060600010102030404100b0b0b0b0b0b0b0b0b0b0b0b0b
                hex 01010101010d0b0b0807060600010102030404100b0b0b0b0b0b0b0b0b0b0b0b
                hex 0101010101010d0b0b0807060600010102030404100b0b0b0b0b0b0b0b0b0b0b
                hex 010101010101110b0b1213060614010115160404170b0b0b0b0b0b0b0b0b0b0b
                hex 0101010101110b0b1213060614010115160404170b0b0b0b0b0b0b0b0b0b0b0b
                hex 01010101110b0b1213060614010115160404170b0b0b0b0b0b0b0b0b0b0b0b0b
                hex 010101110b0b1213060614010115160404170b0b0b0b0b0b0b0b0b0b0b0b0b0b
                hex 0101110b0b121306061401011516040418191919191919191919191919191919
                hex 01110b0b12130606140101151604041a06060606060606060606060606060606
                hex 110b0b12130606140101151604041a0606060606060606060606060606060606
                hex 0b0b12130606140101151604041a060606060606060606060606060606060606
                hex 0b12130606140101151604041a06060606060606060606060606060606060606
                hex 12130606140101151604041b1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c
                hex 130606140101151604041d010101010101010101010101010101010101010101
                hex 0606140101151604041d01010101010101010101010101010101010101010101
                hex 06140101151604041d0101010101010101010101010101010101010101010101
                hex 140101151604041d010101010101010101010101010101010101010101010101

                pad nt_data+$3c0, $ff

at_data         ; copied from Python script, for now
                hex eff3000000000000
                hex aaeff30000000000
                hex aaaaeff300000000
                hex aaaaaaff73505050
                hex aaaafe7f55555555
                hex aafe7f5555555555
                hex fe7f555555555555

                pad nt_data+$400, $ff

; --- Main loop ---------------------------------------------------------------

main_loop       bit run_main_loop       ; wait until NMI routine has set flag
                bpl main_loop

                lsr run_main_loop       ; clear flag

                jmp main_loop

; --- Interrupt routines ------------------------------------------------------

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
                lda #248
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

                ; copied from Python script, for now
                hex 7f3f1f0f07030100 80c0e0f0f8fcfeff
                hex ffffffffffffffff 0000000000000000
                hex f8fcfeffffffffff 0000000000000000
                hex 0000000080c0e0f0 0000000000000000
                hex 0000000000000000 0000000000000000
                hex 7f3f1f0f07030100 0000000000000000
                hex 0000000000000000 ffffffffffffffff
                hex 000000000080c0e0 ffffffffffffffff
                hex f0f8fcfeffffffff ffffffffffffffff
                hex 7f3f1f0f07000000 0000000000030100
                hex ffffffffff000000 0000000000ffffff
                hex ffffffffffffffff ffffffffffffffff
                hex 0000000000000000 7f3f1f0f07030100
                hex ffffffffffffffff ff7f3f1f0f070301
                hex 0000000f07030100 7f3f1f0f07030100
                hex 000000ffffffffff ffffffffffffffff
                hex 7f3f1f0f07030100 7f3f1f0f07030100
                hex ffffffffffffffff 0103070f1f3f7fff
                hex fffffffffefcf8f0 ffffffffffffffff
                hex e0c0800000000000 ffffffffffffffff
                hex 000103070f1f3f7f fffefcf8f0e0c080
                hex fffffffffffefcf8 0000000000000000
                hex f0e0c08000000000 0000000000000000
                hex 000103070f1f3f7f 000103070f1f3f7f
                hex 000103070f000000 000103070f1f3f7f
                hex ffffffffff000000 ffffffffffffffff
                hex 0000000000000000 000103070f1f3f7f
                hex 000000070f1f3f7f 0001030000000000
                hex 000000ffffffffff ffffff0000000000
                hex 000103070f1f3f7f 0000000000000000

                pad $2000, $ff
