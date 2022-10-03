; Image data excluding pattern tables.
; This file was generated automatically by convert.py.

image_count     equ 17  ; number of images

image_names     ; descriptions (8 bytes/image)
                db "aaatitle"
                db "aromanti"
                db "    asex"
                db "    bear"
                db "   bisex"
                db "  gaymen"
                db "gndrquer"
                db "intersex"
                db "lesbian1"
                db "lesbian2"
                db "nonbinar"
                db "  pansex"
                db " polysex"
                db "rainbow1"
                db "rainbow2"
                db "rainbow3"
                db "trnsgndr"

                ; addresses in RLE compressed name & attribute table data
                ; and uncompressed background palette data
grafix_ptrs_lo  ; low bytes
                dl img0_slice0
                dl img0_slice1
                dl img0_slice2
                dl img0_slice3
                dl img0_slice4
                dl img0_slice5
                dl img0_slice6
                dl img0_palette
                dl img1_slice0
                dl img1_slice1
                dl img1_slice2
                dl img1_slice3
                dl img1_slice4
                dl img1_slice5
                dl img1_slice6
                dl img1_palette
                dl img2_slice0
                dl img2_slice1
                dl img2_slice2
                dl img2_slice3
                dl img2_slice4
                dl img2_slice5
                dl img2_slice6
                dl img2_palette
                dl img3_slice0
                dl img3_slice1
                dl img3_slice2
                dl img3_slice3
                dl img3_slice4
                dl img3_slice5
                dl img3_slice6
                dl img3_palette
                dl img4_slice0
                dl img4_slice1
                dl img4_slice2
                dl img4_slice3
                dl img4_slice4
                dl img4_slice5
                dl img4_slice6
                dl img4_palette
                dl img5_slice0
                dl img5_slice1
                dl img5_slice2
                dl img5_slice3
                dl img5_slice4
                dl img5_slice5
                dl img5_slice6
                dl img5_palette
                dl img6_slice0
                dl img6_slice1
                dl img6_slice2
                dl img6_slice3
                dl img6_slice4
                dl img6_slice5
                dl img6_slice6
                dl img6_palette
                dl img7_slice0
                dl img7_slice1
                dl img7_slice2
                dl img7_slice3
                dl img7_slice4
                dl img7_slice5
                dl img7_slice6
                dl img7_palette
                dl img8_slice0
                dl img8_slice1
                dl img8_slice2
                dl img8_slice3
                dl img8_slice4
                dl img8_slice5
                dl img8_slice6
                dl img8_palette
                dl img9_slice0
                dl img9_slice1
                dl img9_slice2
                dl img9_slice3
                dl img9_slice4
                dl img9_slice5
                dl img9_slice6
                dl img9_palette
                dl img10_slice0
                dl img10_slice1
                dl img10_slice2
                dl img10_slice3
                dl img10_slice4
                dl img10_slice5
                dl img10_slice6
                dl img10_palette
                dl img11_slice0
                dl img11_slice1
                dl img11_slice2
                dl img11_slice3
                dl img11_slice4
                dl img11_slice5
                dl img11_slice6
                dl img11_palette
                dl img12_slice0
                dl img12_slice1
                dl img12_slice2
                dl img12_slice3
                dl img12_slice4
                dl img12_slice5
                dl img12_slice6
                dl img12_palette
                dl img13_slice0
                dl img13_slice1
                dl img13_slice2
                dl img13_slice3
                dl img13_slice4
                dl img13_slice5
                dl img13_slice6
                dl img13_palette
                dl img14_slice0
                dl img14_slice1
                dl img14_slice2
                dl img14_slice3
                dl img14_slice4
                dl img14_slice5
                dl img14_slice6
                dl img14_palette
                dl img15_slice0
                dl img15_slice1
                dl img15_slice2
                dl img15_slice3
                dl img15_slice4
                dl img15_slice5
                dl img15_slice6
                dl img15_palette
                dl img16_slice0
                dl img16_slice1
                dl img16_slice2
                dl img16_slice3
                dl img16_slice4
                dl img16_slice5
                dl img16_slice6
                dl img16_palette
grafix_ptrs_hi  ; high bytes
                dh img0_slice0
                dh img0_slice1
                dh img0_slice2
                dh img0_slice3
                dh img0_slice4
                dh img0_slice5
                dh img0_slice6
                dh img0_palette
                dh img1_slice0
                dh img1_slice1
                dh img1_slice2
                dh img1_slice3
                dh img1_slice4
                dh img1_slice5
                dh img1_slice6
                dh img1_palette
                dh img2_slice0
                dh img2_slice1
                dh img2_slice2
                dh img2_slice3
                dh img2_slice4
                dh img2_slice5
                dh img2_slice6
                dh img2_palette
                dh img3_slice0
                dh img3_slice1
                dh img3_slice2
                dh img3_slice3
                dh img3_slice4
                dh img3_slice5
                dh img3_slice6
                dh img3_palette
                dh img4_slice0
                dh img4_slice1
                dh img4_slice2
                dh img4_slice3
                dh img4_slice4
                dh img4_slice5
                dh img4_slice6
                dh img4_palette
                dh img5_slice0
                dh img5_slice1
                dh img5_slice2
                dh img5_slice3
                dh img5_slice4
                dh img5_slice5
                dh img5_slice6
                dh img5_palette
                dh img6_slice0
                dh img6_slice1
                dh img6_slice2
                dh img6_slice3
                dh img6_slice4
                dh img6_slice5
                dh img6_slice6
                dh img6_palette
                dh img7_slice0
                dh img7_slice1
                dh img7_slice2
                dh img7_slice3
                dh img7_slice4
                dh img7_slice5
                dh img7_slice6
                dh img7_palette
                dh img8_slice0
                dh img8_slice1
                dh img8_slice2
                dh img8_slice3
                dh img8_slice4
                dh img8_slice5
                dh img8_slice6
                dh img8_palette
                dh img9_slice0
                dh img9_slice1
                dh img9_slice2
                dh img9_slice3
                dh img9_slice4
                dh img9_slice5
                dh img9_slice6
                dh img9_palette
                dh img10_slice0
                dh img10_slice1
                dh img10_slice2
                dh img10_slice3
                dh img10_slice4
                dh img10_slice5
                dh img10_slice6
                dh img10_palette
                dh img11_slice0
                dh img11_slice1
                dh img11_slice2
                dh img11_slice3
                dh img11_slice4
                dh img11_slice5
                dh img11_slice6
                dh img11_palette
                dh img12_slice0
                dh img12_slice1
                dh img12_slice2
                dh img12_slice3
                dh img12_slice4
                dh img12_slice5
                dh img12_slice6
                dh img12_palette
                dh img13_slice0
                dh img13_slice1
                dh img13_slice2
                dh img13_slice3
                dh img13_slice4
                dh img13_slice5
                dh img13_slice6
                dh img13_palette
                dh img14_slice0
                dh img14_slice1
                dh img14_slice2
                dh img14_slice3
                dh img14_slice4
                dh img14_slice5
                dh img14_slice6
                dh img14_palette
                dh img15_slice0
                dh img15_slice1
                dh img15_slice2
                dh img15_slice3
                dh img15_slice4
                dh img15_slice5
                dh img15_slice6
                dh img15_palette
                dh img16_slice0
                dh img16_slice1
                dh img16_slice2
                dh img16_slice3
                dh img16_slice4
                dh img16_slice5
                dh img16_slice6
                dh img16_palette

                ; RLE compressed name & attribute table data
                ; (each slice decompresses into exactly $80 bytes)
                ; and uncompressed background palette data
img0_slice0
                hex 028b0298020102940702730272042602
                hex 1b028202742306012d00
img0_slice1
                hex 020b0278020102593b02013d02012403
                hex 19020102031f02030b00
img0_slice2
                hex 030e0202010102020401070402030a02
                hex 011a0202010102020201028e0102ab01
                hex 02bc0202025b0102a90a02011a020201
                hex 0102020201027a0102ac0102bc020202
                hex 660102af0a02011a0202010102020401
                hex 070402030a02010c0200
img0_slice3
                hex 030e020201010a02024d01027a020102
                hex b601027c0802011a020201010a02026a
                hex 01027b020102ae0102650802011a0202
                hex 010112020704010202011a020201010e
                hex 02027d020202680102b701027e020102
                hex 02010c0200
img0_slice4
                hex 020d020102030d028c010269020302ad
                hex 0203027f020101020319020102031108
                hex 03040101020319020102031f02031902
                hex 0124030b00
img0_slice5
                hex 020d02013d02013d02013d0201070281
                hex 01028301027402710272021c02711500
img0_slice6
                hex aa0e0202013e0202013002100013080a
                hex 028a0502cc0255024402000288050200
                hex 0204024702d002880504000204020d02
                hex 8811100a00
img0_palette
                hex 0f1925300f1215250f13210f0f25280f
img1_slice0
                hex 01ff00
img1_slice1
                hex 013f4054800200
img1_slice2
                hex 027f40a8400300
img1_slice3
                hex 03bf40d200
img1_slice4
                hex 01ff00
img1_slice5
                hex 00403dbf00
img1_slice6
                hex 008f105510054f00
img1_palette
                hex 0f0029300f1a290f0f0f0f0f0f0f0f0f
img2_slice0
                hex 00ff00
img2_slice1
                hex 007f400c400100
img2_slice2
                hex 01ff00
img2_slice3
                hex 013fc00300
img2_slice4
                hex 03bf40cf00
img2_slice5
                hex 02ff00
img2_slice6
                hex 0080027f00
img2_palette
                hex 0f0014300f0f0f0f0f0f0f0f0f0f0f0f
img3_slice0
                hex 0149023c023b39023004000224010239
                hex 023a2904470233023202e002da020502
                hex d902e3040002dd284700
img3_slice1
                hex 000402020f01022102a50280021f02a3
                hex 021a0302912a02028702090212028a03
                hex 0220028b0210020d029d029a02a12802
                hex 028f0225110222220204a802e4022a02
                hex e502070d020e02dc22a800
img3_slice2
                hex 00040302b101021d02bd090204021502
                hex 2d280302c30211021302d807020b021e
                hex 28030401023602350238022f05021602
                hex 292a01045502e102060102e203021402
                hex de2c5500
img3_slice3
                hex 030502b4020802230206020a02273902
                hex b802282f40d7400200
img3_slice4
                hex 01800240a23f00
img3_slice5
                hex 00800140343f00
img3_slice6
                hex 00af025002100c50105510a510aa0f00
img3_palette
                hex 0f0717270f2730370f00300f0f0f0f0f
img4_slice0
                hex 03ff00
img4_slice1
                hex 03ff00
img4_slice2
                hex 02800340cd3f00
img4_slice3
                hex 02bf40a200
img4_slice4
                hex 01ff00
img4_slice5
                hex 01ff00
img4_slice6
                hex 0080017f00
img4_palette
                hex 0f1213150f0f0f0f0f0f0f0f0f0f0f0f
img5_slice0
                hex 01bf404700
img5_slice1
                hex 01bf404b00
img5_slice2
                hex 03bf40c600
img5_slice3
                hex 02800340d73f00
img5_slice4
                hex 01800240a23f00
img5_slice5
                hex 017f409b3f00
img5_slice6
                hex 0080010f10ff20aa1f1050100500
img5_palette
                hex 0f1222300f01120f0f1c303a0f0b1c0f
img6_slice0
                hex 01ff00
img6_slice1
                hex 01ff00
img6_slice2
                hex 034048bf00
img6_slice3
                hex 03ff00
img6_slice4
                hex 02400340cd7f00
img6_slice5
                hex 02ff00
img6_slice6
                hex 0080027f00
img6_palette
                hex 0f1319300f0f0f0f0f0f0f0f0f0f0f0f
img7_slice0
                hex 02ff00
img7_slice1
                hex 02ff00
img7_slice2
                hex 021902a00296027502560292029f3102
                hex 97020102430249024a0245020102932d
                hex 029902010251070253020102952b0285
                hex 024c0b024e025d1500
img7_slice3
                hex 02150276025e0b028602572b0241025f
                hex 0b028802402b0277025c0b028402582b
                hex 02890201026e070290020102601500
img7_slice4
                hex 0217025202010267029c029e028d0201
                hex 02503102790246023f023e0244025a99
                hex 00
img7_slice5
                hex 02ff00
img7_slice6
                hex 0080027f00
img7_palette
                hex 0f13280f0f0f0f0f0f0f0f0f0f0f0f0f
img8_slice0
                hex 01ff00
img8_slice1
                hex 013f4054800200
img8_slice2
                hex 027f40a8400300
img8_slice3
                hex 03bf40d200
img8_slice4
                hex 01ff00
img8_slice5
                hex 0140a4bf00
img8_slice6
                hex 0080010f10aa100a2f1055100500
img8_palette
                hex 0f2427300f14240f0f17270f0f0f0f0f
img9_slice0
                hex 01bf404700
img9_slice1
                hex 02bf40a800
img9_slice2
                hex 0180033f405400
img9_slice3
                hex 02800340d73f00
img9_slice4
                hex 01800240a23f00
img9_slice5
                hex 017f409b3f00
img9_slice6
                hex 0080010f20aa10fa1f1050100500
img9_palette
                hex 0f1424300f04140f0f0717270f27300f
img10_slice0
                hex 02ff00
img10_slice1
                hex 027f40a7400300
img10_slice2
                hex 03ff00
img10_slice3
                hex 014003bf00
img10_slice4
                hex 01bf403700
img10_slice5
                hex 00ff00
img10_slice6
                hex 00ff00
img10_palette
                hex 0f1328300f0f0f0f0f0f0f0f0f0f0f0f
img11_slice0
                hex 01ff00
img11_slice1
                hex 01ff00
img11_slice2
                hex 034048bf00
img11_slice3
                hex 03ff00
img11_slice4
                hex 02400340cd7f00
img11_slice5
                hex 02ff00
img11_slice6
                hex 0080027f00
img11_palette
                hex 0f1521280f0f0f0f0f0f0f0f0f0f0f0f
img12_slice0
                hex 01ff00
img12_slice1
                hex 01ff00
img12_slice2
                hex 034048bf00
img12_slice3
                hex 03ff00
img12_slice4
                hex 02400340cd7f00
img12_slice5
                hex 02ff00
img12_slice6
                hex 0080027f00
img12_palette
                hex 0f14212b0f0f0f0f0f0f0f0f0f0f0f0f
img13_slice0
                hex 01ff00
img13_slice1
                hex 02404fbf00
img13_slice2
                hex 0340a6bf00
img13_slice3
                hex 0140023f800300
img13_slice4
                hex 01400340cc7f00
img13_slice5
                hex 013f4042800200
img13_slice6
                hex 0080023f105a2055100500
img13_palette
                hex 0f1627280f1213190f19280f0f0f0f0f
img14_slice0
                hex 0102b201022e0200022b3602020302b2
                hex 01022e0200022b340202780102b20102
                hex 2e0200022b34020278020302b201022e
                hex 0200022b300200
img14_slice1
                hex 0202b3010278020102b20201022e0200
                hex 022b2d020302b3010278020302b20201
                hex 022e0200022b2b040302b30102780201
                hex 02b20201022e0200022b29060302b301
                hex 0278020302b20201022e0200022b2700
img14_slice2
                hex 030702b302020278020102b20201022e
                hex 020002df26a70902b3020202780102b2
                hex 0201022e0200022c2f02b30202027802
                hex 0102b20201022e0200022c2f02b30202
                hex 02780102b20201022e0200022c1f00
img14_slice3
                hex 01100302b3020202780102b201022e02
                hex 00022c2e0302c9020202980102c80102
                hex 31020002171d0e0302c9020202980203
                hex 02c8010231020002171f0c0302c90202
                hex 02980102c8010231020002172100
img14_slice4
                hex 010a0302c902020298020302c8010231
                hex 020002192c0302c9020202980102c801
                hex 0231020002db26ce060302c902020298
                hex 020302c80102310200021727040302c9
                hex 020202980102c8010231020002172900
img14_slice5
                hex 01020302c902020298020302c8010231
                hex 020002172b02c9020202980102c80102
                hex 31020002172d02020298020302c80102
                hex 3102000218300202980102c801023102
                hex 000218320200
img14_slice6
                hex 00020302c802010231010218340202c8
                hex 0201023101021836020f02df0eff0255
                hex 02df023009045502df023007045502d5
                hex 023f07025502d502bf0aaa02d502bf0c
                hex aa020f0e0a00
img14_palette
                hex 0f1927280f2125300f1213190f081621
img15_slice0
                hex 0202b30102780201022e0200022b3102
                hex 0302b30102780201022e0200022b2f02
                hex b2020102b30102780201022e0200022b
                hex 2d020302b2020302b30102780201022e
                hex 0200022b2b00
img15_slice1
                hex 0302b00102b2020102b3020202780201
                hex 022e0200022c29020202b00102b20102
                hex b3020202780201022e0200022c2b02b0
                hex 0102b2020102b3020202780201022e02
                hex 00022c29020202b00102b20102b30202
                hex 02780201022e0200022c2300
img15_slice2
                hex 030702b00102b2020102b30202027802
                hex 01022e0200022c29020202b00102b201
                hex 02b3020202780201022e0200022c2102
                hex d002c702c502cb02d302b00102b20201
                hex 02b3020202780201022e0200022c1d02
                hex d102b5026d0102c00261020202b00102
                hex b20102b3020202780201022e0200022c
                hex 1b00
img15_slice3
                hex 0302c1026c0502bf026f0102b00102b2
                hex 020102b3020202780201022e0200022c
                hex 1902be02700502c2026b0102aa0102c8
                hex 020102c9020202980201023102000218
                hex 1a0202c4026302d60102d502ba020202
                hex aa0102c80102c9020202980201023102
                hex 0002181c020102bb026202ca02b90264
                hex 02aa0102c8020102c902020298020102
                hex 31020002181e0200
img15_slice4
                hex 0307020202aa0102c80102c902020298
                hex 020102310200021820020702aa0102c8
                hex 020102c9020202980201023102000218
                hex 220203020202aa0102c80102c9020202
                hex 98020102310200021724010302aa0102
                hex c8020102c90202029802010231020002
                hex 17260100
img15_slice5
                hex 01020202aa020302c8020302c9020202
                hex 98010231020002172702aa020302c801
                hex 02c90202029801023102000217290203
                hex 02c8020302c902020298010231020002
                hex 172b02c80102c9020202980102310200
                hex 02172d00
img15_slice6
                hex 00020302c90202029802010231010217
                hex 300102c9020202980201023101021732
                hex 010f027502590caa02cf027502590aaa
                hex 0102cf027502510902c0027f02550201
                hex 0502c0027f025502a108a0027f025502
                hex 090a0a020502010b00
img15_palette
                hex 0f1319280f0821250f1216270f252830
img16_slice0
                hex 01ff00
img16_slice1
                hex 013f4054800200
img16_slice2
                hex 027f40a8400300
img16_slice3
                hex 03bf40d400
img16_slice4
                hex 02ff00
img16_slice5
                hex 0140a4bf00
img16_slice6
                hex 0080017f00
img16_palette
                hex 0f2125300f0f0f0f0f0f0f0f0f0f0f0f
