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
                hex 3201010c04000008010101010101010101010101010101010101010101010101
                hex 023201010c040000080101010101010101010101010101010101010101010101
                hex 02023201010c0400000801010101010101010101010101010101010101010101
                hex 5a02023201010c04000008010101010101010101010101010101010101010101
                hex 5f5a02023201010c040000691616161616161616161616161616161616161616
                hex 035f5a02023201010c0400000902020202020202020202020202020202020202
                hex 03035f5a02023201010c04000009020202020202020202020202020202020202
                hex 6003035f5a02023201010c040000090202020202020202020202020202020202
                hex 016003035f5a02023201010c0400000902020202020202020202020202020202
                hex 01016003035f5a02023201010c0400006a5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c
                hex 0101016003035f5a02023201010c0400000a0303030303030303030303030303
                hex 010101016003035f5a02023201010c0400000a03030303030303030303030303
                hex 01010101016003035f5a02023201010c0400000a030303030303030303030303
                hex 0101010101016003035f5a02023201010c0400000a0303030303030303030303
                hex 010101010101220303635e02024601010d0b0000070303030303030303030303
                hex 0101010101220303635e02024601010d0b000007030303030303030303030303
                hex 01010101220303635e02024601010d0b00000703030303030303030303030303
                hex 010101220303635e02024601010d0b0000070303030303030303030303030303
                hex 0101220303635e02024601010d0b000068656565656565656565656565656565
                hex 01220303635e02024601010d0b00000602020202020202020202020202020202
                hex 220303635e02024601010d0b0000060202020202020202020202020202020202
                hex 0303635e02024601010d0b000006020202020202020202020202020202020202
                hex 03635e02024601010d0b00000602020202020202020202020202020202020202
                hex 635e02024601010d0b0000674a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a
                hex 5e02024601010d0b000005010101010101010101010101010101010101010101
                hex 02024601010d0b00000501010101010101010101010101010101010101010101
                hex 024601010d0b0000050101010101010101010101010101010101010101010101
                hex 4601010d0b000005010101010101010101010101010101010101010101010101

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
                hex 0000000000000000 0000000000000000
                hex ffffffffffffffff 0000000000000000
                hex 0000000000000000 ffffffffffffffff
                hex ffffffffffffffff ffffffffffffffff
                hex 0000000080c0e0f0 0000000000000000
                hex 000103070f1f3f7f 0000000000000000
                hex 0000000000000000 000103070f1f3f7f
                hex 000103070f1f3f7f 000103070f1f3f7f
                hex 7f3f1f0f07030100 0000000000000000
                hex 0000000000000000 7f3f1f0f07030100
                hex 7f3f1f0f07030100 7f3f1f0f07030100
                hex f0e0c08000000000 0000000000000000
                hex f8fcfeffffffffff 0000000000000000
                hex fffffffffffefcf8 0000000000000000
                hex fffffffffffffffe 0000000000000001
                hex ffffffffffffff7f 0000000000000080
                hex fffffffffffff8c0 000000000000073f
                hex fffffffffffff880 000000000000077f
                hex ffffffffffff1f03 000000000000e0fc
                hex ffffffffffff1f01 000000000000e0fe
                hex fffffffffffef8f0 000000000001070f
                hex ffffffffff7f1f0f 000000000080e0f0
                hex ffffffffff000000 0000000000ffffff
                hex ffffffffffffffff 0000000000ffffff
                hex fffffffffefefcf8 0000000001010307
                hex ffffffff7f7f3f1f 000000008080c0e0
                hex fffffffefefefcfc 0000000101010303
                hex ffffff7f7f7f3f3f 000000808080c0c0
                hex ffffff0000000000 000000ffffffffff
                hex ffffffffffffffff 000000ffffffffff
                hex fffffef8e0800000 000001071f7fffff
                hex ffff7f1f07010000 000080e0f8feffff
                hex fffcf8e0c0800000 0003071f3f7fffff
                hex ff3f1f0703010000 00c0e0f8fcfeffff
                hex ffffffffffffffff 0103070f1f3f7fff
                hex fcfefeffffffffff 0301010000000000
                hex fcfefefeffffffff 0301010100000000
                hex fcfcfcf8f8f8f8f8 0303030707070707
                hex fcf8f8f8f0f0e0e0 030707070f0f1f1f
                hex fcf8f0e0e0c0c080 03070f1f1f3f3f7f
                hex f8ffffffffffffff 0700000000000000
                hex f8feffffffffffff 0701000000000000
                hex f8f8f8f8fcfcfcfc 0707070703030303
                hex f0e0c08000000000 0f1f3f7fffffffff
                hex e0f0f0f8f8f8fcfc 1f0f0f0707070303
                hex e080000000000000 1f7fffffffffffff
                hex c0c0e0e0f0f8fcfe 3f3f1f1f0f070301
                hex c080800000000000 3f7f7fffffffffff
                hex 8080808080000000 7f7f7f7f7fffffff
                hex 8000000000000000 7fffffffffffffff
                hex 7f3f1f0f07030100 80c0e0f0f8fcfeff
                hex 3f7f7fffffffffff c080800000000000
                hex 3f7f7f7fffffffff c080808000000000
                hex 3f3f3f1f1f1f1f1f c0c0c0e0e0e0e0e0
                hex 3f1f1f1f0f0f0707 c0e0e0e0f0f0f8f8
                hex 3f1f0f0707030301 c0e0f0f8f8fcfcfe
                hex 1fffffffffffffff e000000000000000
                hex 1f7fffffffffffff e080000000000000
                hex 1f1f1f1f3f3f3f3f e0e0e0e0c0c0c0c0
                hex 0f07030100000000 f0f8fcfeffffffff
                hex 070f0f1f1f1f3f3f f8f0f0e0e0e0c0c0
                hex 0701000000000000 f8feffffffffffff
                hex 030307070f1f3f7f fcfcf8f8f0e0c080
                hex 0301010000000000 fcfefeffffffffff
                hex 0101010101000000 fefefefefeffffff
                hex 0100000000000000 feffffffffffffff
                hex 0080e0f8feffffff ff7f1f0701000000
                hex 0080c0e0f8fcffff ff7f3f1f07030000
                hex 0001071f7fffffff fffef8e080000000
                hex 000103071f3fffff fffefcf8e0c00000
                hex 000103070f1f3f7f fffefcf8f0e0c080
                hex 0000ffffffffffff ffff000000000000
                hex 0000808080808080 ffff7f7f7f7f7f7f
                hex 0000010101010101 fffffefefefefefe
                hex 000000ffffffffff ffffff0000000000
                hex 00000080c0e0f0f8 ffffff7f3f1f0f07
                hex 0000000103070f1f fffffffefcf8f0e0
                hex 000000008080c0e0 ffffffff7f7f3f1f
                hex 0000000001010307 fffffffffefefcf8
                hex 000000000080e0f0 ffffffffff7f1f0f
                hex 000000000001070f fffffffffffef8f0
                hex 000000000000ffff ffffffffffff0000
                hex 0000000000008080 ffffffffffff7f7f
                hex 0000000000000101 fffffffffffffefe
                hex 00000000000000ff ffffffffffffff00
                hex 00000000000000c0 ffffffffffffff3f
                hex 0000000000000080 ffffffffffffff7f
                hex 0000000000000003 fffffffffffffffc
                hex 0000000000000001 fffffffffffffffe
                hex 000000000000ffff ffffffffffffffff
                hex 000000000080c0e0 ffffffffffffffff
                hex 0000000000ffffff ffffffffffffffff
                hex 000000ffffffffff ffffffffffffffff
                hex 0000ffffffffffff ffffffffffffffff
                hex e0c0800000000000 ffffffffffffffff
                hex f0f8fcfeffffffff ffffffffffffffff
                hex ffffffffffffffff ff7f3f1f0f070301
                hex ffff000000000000 ffffffffffffffff
                hex ffffffffffffffff ffffff0000000000
                hex fffffffffefcf8f0 ffffffffffffffff
                hex ffffffffffffffff ffffffffff000000
                hex ffffffffff000000 ffffffffffffffff
                hex ffffffffffffffff ffffffffffff0000
                hex 000000070f1f3f7f 0001030000000000
                hex 000103070f000000 000103070f1f3f7f
                hex 7f3f1f0f07000000 0000000000030100
                hex 0000000f07030100 7f3f1f0f07030100

                pad $2000, $ff
