asm6 pride.asm pride.nes
gzip -9fk pride.nes

tar -cf chr-bin.tar chr-*.bin
gzip -9f chr-bin.tar
