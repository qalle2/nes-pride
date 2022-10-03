; Image data excluding pattern tables.
; This file was generated automatically by convert.py.

image_count     equ 25  ; number of images

image_names     ; descriptions (8 bytes/image)
                db "aaatitle"
                db " agender"
                db "aromanti"
                db "    asex"
                db "    bear"
                db "bigender"
                db "   bisex"
                db " demisex"
                db "  gaymen"
                db "gndrflui"
                db "gndrquer"
                db "intersex"
                db " leather"
                db "lesbian5"
                db "lesbian7"
                db "nonbinar"
                db "  pansex"
                db "polyamor"
                db " polysex"
                db " rainbo6"
                db " rainbo7"
                db " rainbo8"
                db " rainbop"
                db "rainbopi"
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
                dl img17_slice0
                dl img17_slice1
                dl img17_slice2
                dl img17_slice3
                dl img17_slice4
                dl img17_slice5
                dl img17_slice6
                dl img17_palette
                dl img18_slice0
                dl img18_slice1
                dl img18_slice2
                dl img18_slice3
                dl img18_slice4
                dl img18_slice5
                dl img18_slice6
                dl img18_palette
                dl img19_slice0
                dl img19_slice1
                dl img19_slice2
                dl img19_slice3
                dl img19_slice4
                dl img19_slice5
                dl img19_slice6
                dl img19_palette
                dl img20_slice0
                dl img20_slice1
                dl img20_slice2
                dl img20_slice3
                dl img20_slice4
                dl img20_slice5
                dl img20_slice6
                dl img20_palette
                dl img21_slice0
                dl img21_slice1
                dl img21_slice2
                dl img21_slice3
                dl img21_slice4
                dl img21_slice5
                dl img21_slice6
                dl img21_palette
                dl img22_slice0
                dl img22_slice1
                dl img22_slice2
                dl img22_slice3
                dl img22_slice4
                dl img22_slice5
                dl img22_slice6
                dl img22_palette
                dl img23_slice0
                dl img23_slice1
                dl img23_slice2
                dl img23_slice3
                dl img23_slice4
                dl img23_slice5
                dl img23_slice6
                dl img23_palette
                dl img24_slice0
                dl img24_slice1
                dl img24_slice2
                dl img24_slice3
                dl img24_slice4
                dl img24_slice5
                dl img24_slice6
                dl img24_palette
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
                dh img17_slice0
                dh img17_slice1
                dh img17_slice2
                dh img17_slice3
                dh img17_slice4
                dh img17_slice5
                dh img17_slice6
                dh img17_palette
                dh img18_slice0
                dh img18_slice1
                dh img18_slice2
                dh img18_slice3
                dh img18_slice4
                dh img18_slice5
                dh img18_slice6
                dh img18_palette
                dh img19_slice0
                dh img19_slice1
                dh img19_slice2
                dh img19_slice3
                dh img19_slice4
                dh img19_slice5
                dh img19_slice6
                dh img19_palette
                dh img20_slice0
                dh img20_slice1
                dh img20_slice2
                dh img20_slice3
                dh img20_slice4
                dh img20_slice5
                dh img20_slice6
                dh img20_palette
                dh img21_slice0
                dh img21_slice1
                dh img21_slice2
                dh img21_slice3
                dh img21_slice4
                dh img21_slice5
                dh img21_slice6
                dh img21_palette
                dh img22_slice0
                dh img22_slice1
                dh img22_slice2
                dh img22_slice3
                dh img22_slice4
                dh img22_slice5
                dh img22_slice6
                dh img22_palette
                dh img23_slice0
                dh img23_slice1
                dh img23_slice2
                dh img23_slice3
                dh img23_slice4
                dh img23_slice5
                dh img23_slice6
                dh img23_palette
                dh img24_slice0
                dh img24_slice1
                dh img24_slice2
                dh img24_slice3
                dh img24_slice4
                dh img24_slice5
                dh img24_slice6
                dh img24_palette

                ; RLE compressed name & attribute table data
                ; (each slice decompresses into exactly $80 bytes)
                ; and uncompressed background palette data
img0_slice0
                hex 028b02690201026607024e024d041602
                hex 0f0259024f2306012d00
img0_slice1
                hex 020b0251020102343b02013d02012403
                hex 19020102031f02030b00
img0_slice2
                hex 030e0202010102020401070402030a02
                hex 011a0202010102020201026101027701
                hex 028a020202350102750a02011a020201
                hex 0102020201025201027a01028a020202
                hex 4101027e0a02011a0202010102020401
                hex 070402030a02010c0200
img0_slice3
                hex 030e020201010a02022b010252020102
                hex 850102550802011a020201010a020246
                hex 0102530201027c0102400802011a0202
                hex 010112020704010202011a020201010e
                hex 02025402020243010286010256020102
                hex 02010c0200
img0_slice4
                hex 020d020102030d025f0102440203027b
                hex 02030257020101020319020102031108
                hex 03040101020319020102031f02031902
                hex 0124030b00
img0_slice5
                hex 020d02013d02013d02013d0201070258
                hex 01025a01024f024c024d0211024c1500
img0_slice6
                hex aa0e0202013e0202013002100013080a
                hex 028a0502cc0255024402000288050200
                hex 0204024702d002880504000204020d02
                hex 8811100a00
img0_palette
                hex 0f1925300f1215250f13210f0f25280f
img1_slice0
                hex 00bf400400
img1_slice1
                hex 01bf402900
img1_slice2
                hex 02c0033f00
img1_slice3
                hex 02bf400300
img1_slice4
                hex 018003409a3f00
img1_slice5
                hex 008001401e3f00
img1_slice6
                hex 00ff00
img1_palette
                hex 0f0029300f0f0f0f0f0f0f0f0f0f0f0f
img2_slice0
                hex 01ff00
img2_slice1
                hex 013fc00200
img2_slice2
                hex 027f4074400300
img2_slice3
                hex 03bf409a00
img2_slice4
                hex 01ff00
img2_slice5
                hex 004001bf00
img2_slice6
                hex 008f105510054f00
img2_palette
                hex 0f0029300f1a290f0f0f0f0f0f0f0f0f
img3_slice0
                hex 00ff00
img3_slice1
                hex 007f4004400100
img3_slice2
                hex 01ff00
img3_slice3
                hex 013fc00300
img3_slice4
                hex 03bf409b00
img3_slice5
                hex 02ff00
img3_slice6
                hex 0080027f00
img3_palette
                hex 0f0014300f0f0f0f0f0f0f0f0f0f0f0f
img4_slice0
                hex 01830220021f021b021201021e02212d
                hex 042802a7020002a802060228020502a4
                hex 2e2800
img4_slice1
                hex 0203026b027102680200026403026f02
                hex 6c2d020502140c00021531024b080002
                hex 0e2b047402aa02130274060002a32e74
                hex 00
img4_slice2
                hex 03030290020701040002103702950200
                hex 0210310801021c020d34013f00
img4_slice3
                hex 02c0033f00
img4_slice4
                hex 018002406d3f00
img4_slice5
                hex 008001401e3f00
img4_slice6
                hex 00af1050105510a510aa0f00
img4_palette
                hex 0f0717270f2730370f00300f0f0f0f0f
img5_slice0
                hex 01bf402800
img5_slice1
                hex 02bf407400
img5_slice2
                hex 02c0033f00
img5_slice3
                hex 02bf400300
img5_slice4
                hex 018003409a3f00
img5_slice5
                hex 017f406d3f00
img5_slice6
                hex 0080010f20552f10a0100a00
img5_palette
                hex 0f2130330f1424330f11210f0f0f0f0f
img6_slice0
                hex 03ff00
img6_slice1
                hex 03ff00
img6_slice2
                hex 028003409b3f00
img6_slice3
                hex 02bf406d00
img6_slice4
                hex 01ff00
img6_slice5
                hex 01ff00
img6_slice6
                hex 0080017f00
img6_palette
                hex 0f1213150f0f0f0f0f0f0f0f0f0f0f0f
img7_slice0
                hex 0302193d020002193b04000219390600
                hex 02193700
img7_slice1
                hex 00070219360309021934030b02193203
                hex 0d0219300300
img7_slice2
                hex 000f02192e031102192c031302192a03
                hex 150217280100
img7_slice3
                hex 00170217260117020926011502092801
                hex 13020a2a0200
img7_slice4
                hex 0011020a2c020f020a2e020d020a3002
                hex 0b020a320200
img7_slice5
                hex 0009020a340207020a360205020a3802
                hex 03020a3a0200
img7_slice6
                hex 0001020a3c02020a3e027f00
img7_palette
                hex 0f0410300f0f0f0f0f0f0f0f0f0f0f0f
img8_slice0
                hex 01bf402800
img8_slice1
                hex 01bf402800
img8_slice2
                hex 02bf400300
img8_slice3
                hex 02c0033f00
img8_slice4
                hex 018002406d3f00
img8_slice5
                hex 017f406d3f00
img8_slice6
                hex 0080010f10ff20aa1f1050100500
img8_palette
                hex 0f1222300f03120f0f1b2b300f0b1b0f
img9_slice0
                hex 02ff00
img9_slice1
                hex 023fc00300
img9_slice2
                hex 018003409a3f00
img9_slice3
                hex 01bf401e00
img9_slice4
                hex 00ff00
img9_slice5
                hex 003fc00100
img9_slice6
                hex 0080015f1055100500
img9_palette
                hex 0f1425300f020f0f0f0f0f0f0f0f0f0f
img10_slice0
                hex 01ff00
img10_slice1
                hex 01ff00
img10_slice2
                hex 034029bf00
img10_slice3
                hex 03ff00
img10_slice4
                hex 024003409b7f00
img10_slice5
                hex 02ff00
img10_slice6
                hex 0080027f00
img10_palette
                hex 0f1319300f0f0f0f0f0f0f0f0f0f0f0f
img11_slice0
                hex 02ff00
img11_slice1
                hex 02ff00
img11_slice2
                hex 02190270026704010265026e31026202
                hex 01022404280226020102482d02630201
                hex 022f070231020102492b025c022a0b02
                hex 2c02371500
img11_slice3
                hex 0215020102390b025d02012b02010239
                hex 0b025d02012b025002360b025b02332b
                hex 025e020102480702620201023a1500
img11_slice4
                hex 0118020231010242046d026001022f32
                hex 020232022703022502309a0200
img11_slice5
                hex 02ff00
img11_slice6
                hex 0080027f00
img11_palette
                hex 0f04280f0f0f0f0f0f0f0f0f0f0f0f0f
img12_slice0
                hex 004b020a0402020c35020a0802020c29
                hex 0a010c022a0100
img12_slice1
                hex 020601022f0d2a01042202a90f2a2204
                hex 00112e00112a0000
img12_slice2
                hex 01040402a610022a040502480e026940
                hex 2900
img12_slice3
                hex 018003409a3f00
img12_slice4
                hex 004001401e7f00
img12_slice5
                hex 00400880013f00
img12_slice6
                hex 00ff00
img12_palette
                hex 0f0115300f0f0f0f0f0f0f0f0f0f0f0f
img13_slice0
                hex 01ff00
img13_slice1
                hex 013fc00200
img13_slice2
                hex 027f4074400300
img13_slice3
                hex 03bf409a00
img13_slice4
                hex 01ff00
img13_slice5
                hex 014002bf00
img13_slice6
                hex 0080010f10aa100a2f1055100500
img13_palette
                hex 0f2427300f14240f0f17270f0f0f0f0f
img14_slice0
                hex 01bf402800
img14_slice1
                hex 02bf407400
img14_slice2
                hex 0180033f400200
img14_slice3
                hex 02c0033f00
img14_slice4
                hex 018002406d3f00
img14_slice5
                hex 017f406d3f00
img14_slice6
                hex 0080010f20aa10fa1f1050100500
img14_palette
                hex 0f1424300f04140f0f0717270f27300f
img15_slice0
                hex 02ff00
img15_slice1
                hex 027f4074400300
img15_slice2
                hex 03ff00
img15_slice3
                hex 014003bf00
img15_slice4
                hex 01bf401e00
img15_slice5
                hex 00ff00
img15_slice6
                hex 00ff00
img15_palette
                hex 0f1328300f0f0f0f0f0f0f0f0f0f0f0f
img16_slice0
                hex 01ff00
img16_slice1
                hex 01ff00
img16_slice2
                hex 034029bf00
img16_slice3
                hex 03ff00
img16_slice4
                hex 024003409b7f00
img16_slice5
                hex 02ff00
img16_slice6
                hex 0080027f00
img16_palette
                hex 0f1521280f0f0f0f0f0f0f0f0f0f0f0f
img17_slice0
                hex 01ff00
img17_slice1
                hex 01ff00
img17_slice2
                hex 024028990278029c029d029c029d028b
                hex 1900
img17_slice3
                hex 021b027901027939027d01027d39028e
                hex 01028f5d00
img17_slice4
                hex 004002406b7f00
img17_slice5
                hex 00ff00
img17_slice6
                hex 00ff00
img17_palette
                hex 0f0215280f0f0f0f0f0f0f0f0f0f0f0f
img18_slice0
                hex 01ff00
img18_slice1
                hex 01ff00
img18_slice2
                hex 034029bf00
img18_slice3
                hex 03ff00
img18_slice4
                hex 024003409b7f00
img18_slice5
                hex 02ff00
img18_slice6
                hex 0080027f00
img18_palette
                hex 0f14212b0f0f0f0f0f0f0f0f0f0f0f0f
img19_slice0
                hex 01ff00
img19_slice1
                hex 02402dbf00
img19_slice2
                hex 034074bf00
img19_slice3
                hex 0140023f800300
img19_slice4
                hex 024003409b7f00
img19_slice5
                hex 01400240727f00
img19_slice6
                hex 0080013f105a2055100500
img19_palette
                hex 0f1627280f0412190f19280f0f0f0f0f
img20_slice0
                hex 01bf402800
img20_slice1
                hex 02bf407400
img20_slice2
                hex 01c0023f00
img20_slice3
                hex 01bf400300
img20_slice4
                hex 018003409a3f00
img20_slice5
                hex 017f4028400200
img20_slice6
                hex 0080020f20aa1f10501055100500
img20_palette
                hex 0f19282c0f03042c0f1627280f0f0f0f
img21_slice0
                hex 02bf406a00
img21_slice1
                hex 017f4028400200
img21_slice2
                hex 023f40737f00
img21_slice3
                hex 014002bf00
img21_slice4
                hex 03402e7f409a00
img21_slice5
                hex 017f4023400200
img21_slice6
                hex 0080020f10ff105510050f10a010aa10
                hex 0a00
img21_palette
                hex 0f19282c0f1627280f03042c0f16250f
img22_slice0
                hex 01028101021a02000218360202030281
                hex 01021a02000218340202510102810102
                hex 1a02000218340202510203028101021a
                hex 02000218300200
img22_slice1
                hex 020282010251020102810201021a0200
                hex 02182d02030282010251020302810201
                hex 021a020002182b040302820102510201
                hex 02810201021a02000218290603028201
                hex 0251020302810201021a020002182700
img22_slice2
                hex 0307028202020251020102810201021a
                hex 020002a5267409028202020251010281
                hex 0201021a020002192f02820202025102
                hex 0102810201021a020002192f02820202
                hex 02510102810201021a020002191f00
img22_slice3
                hex 01100302820202025101028101021a02
                hex 0002192e030297020202690102960102
                hex 1d020002091d0e030297020202690203
                hex 029601021d020002091f0c0302970202
                hex 026901029601021d020002092100
img22_slice4
                hex 010a030297020202690203029601021d
                hex 0200020b2c0302970202026901029601
                hex 021d020002a2269b0603029702020269
                hex 0203029601021d0200020a2802040302
                hex 970202026901029601021d0200020a2a
                hex 0200
img22_slice5
                hex 0102030297020202690203029601021d
                hex 0200020a2c0202970202026901029601
                hex 021d0200020a30020269020302960102
                hex 1d020002092f026901029601021d0200
                hex 02093100
img22_slice6
                hex 00020302960201021d01020934010296
                hex 0201021d01020936010f02df0eff0255
                hex 02df023009045502df023007045502d5
                hex 023f07025502d502bf0aaa02d502bf0c
                hex aa020f0e0a00
img22_palette
                hex 0f1927280f2125300f0412190f081621
img23_slice0
                hex 0202820102510201021a020002183102
                hex 0302820102510201021a020002182f02
                hex 81020102820102510201021a02000218
                hex 2d02030281020302820102510201021a
                hex 020002182b00
img23_slice1
                hex 03027f01028102010282020202510201
                hex 021a02000219290202027f0102810102
                hex 82020202510201021a020002192b027f
                hex 01028102010282020202510201021a02
                hex 000219290202027f0102810102820202
                hex 02510201021a020002192300
img23_slice2
                hex 0307027f010281020102820202025102
                hex 01021a02000219290202027f01028101
                hex 0282020202510201021a020002192102
                hex 9e02940293029802a0027f0102810201
                hex 0282020202510201021a020002191d02
                hex 990283023f010289023b0202027f0102
                hex 81010282020202510201021a02000219
                hex 1b00
img23_slice3
                hex 030291023d050287024a01027f010281
                hex 02010282020202510201021a02000219
                hex 19028d024505028c0247010276010296
                hex 02010297020202690201021d0200020a
                hex 1a020292023c02a101029f0284020202
                hex 76010296010297020202690201021d02
                hex 00020a1c02010288023802930280023e
                hex 02760102960201029702020269020102
                hex 1d0200020a1e0200
img23_slice4
                hex 03070202027601029601029702020269
                hex 0201021d0200020a2002070276010296
                hex 02010297020202690201021d0200020a
                hex 22020302020276010296010297020202
                hex 690201021d0200020924010302760102
                hex 9602010297020202690201021d020002
                hex 09260100
img23_slice5
                hex 01020202760203029602030297020202
                hex 6901021d020002092702760203029601
                hex 02970202026901021d02000209290203
                hex 0296020302970202026901021d020002
                hex 092b02960102970202026901021d0200
                hex 02092d00
img23_slice6
                hex 0002030297020202690201021d010209
                hex 30010297020202690201021d01020932
                hex 010f027502590caa02cf027502590aaa
                hex 0102cf027502510902c0027f02550201
                hex 0502c0027f025502a108a0027f025502
                hex 090a0a020502010b00
img23_palette
                hex 0f0419280f0821250f1216270f252830
img24_slice0
                hex 01ff00
img24_slice1
                hex 013fc00200
img24_slice2
                hex 027f4074400300
img24_slice3
                hex 03bf409b00
img24_slice4
                hex 02ff00
img24_slice5
                hex 014002bf00
img24_slice6
                hex 0080017f00
img24_palette
                hex 0f2125300f0f0f0f0f0f0f0f0f0f0f0f
