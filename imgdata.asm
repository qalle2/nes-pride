; Image data excluding pattern tables.
; This file was generated automatically by convert.py.

; number of images
image_count equ 25

; pointers to the following array
image_ptrs
    dw image0_ptrs
    dw image1_ptrs
    dw image2_ptrs
    dw image3_ptrs
    dw image4_ptrs
    dw image5_ptrs
    dw image6_ptrs
    dw image7_ptrs
    dw image8_ptrs
    dw image9_ptrs
    dw image10_ptrs
    dw image11_ptrs
    dw image12_ptrs
    dw image13_ptrs
    dw image14_ptrs
    dw image15_ptrs
    dw image16_ptrs
    dw image17_ptrs
    dw image18_ptrs
    dw image19_ptrs
    dw image20_ptrs
    dw image21_ptrs
    dw image22_ptrs
    dw image23_ptrs
    dw image24_ptrs

; for each image:
; - description (24 bytes)
; - background palette data (16 bytes)
; - compressed name & attribute table data in 7 slices
image0_ptrs
    dw img0_descr
    dw img0_palette
    dw img0_slice0
    dw img0_slice1
    dw img0_slice2
    dw img0_slice3
    dw img0_slice4
    dw img0_slice5
    dw img0_slice6
img0_descr
    db "           title  screen"
img0_palette
    hex 0f1227300f1321300f1519300f0f0f0f
img0_slice0
    hex 0299025502540416020f025a025623026c0266026b2d00
img0_slice1
    hex 020b025f0201023e3b02013d0201027a0280040302a4027b0476027a02800403
    hex 02a4027b0476027a028019020124030b00
img0_slice2
    hex 030e020201030277028a022a025002a1010278028a022b02440b1a0202010302
    hex 790287022e024b02a101028302860234024c0b1a020201231a020201230c0200
img0_slice3
    hex 030e0202010b022b0244028501029102500293028b071a0202010b0235024d02
    hex 8402bc022c024302810286071a020201231a020201230c0200
img0_slice4
    hex 030e0202010f02a80282029b029a02a60241029e02a9031a0202010f02ab027e
    hex 0295023902990298029d028f031a020201231a02020102bf02b804b402b602be
    hex 0302bf02b804b402b602be0302bf02b80c0200
img0_slice5
    hex 020d02013d02013d02013d020107025901025b01025602530254021102531500
img0_slice6
    hex 550e0202013e020201300210001302150102150902000202020a020002440504
    hex 00020802020244050250021002520212025411100500
image1_ptrs
    dw img1_descr
    dw img1_palette
    dw img1_slice0
    dw img1_slice1
    dw img1_slice2
    dw img1_slice3
    dw img1_slice4
    dw img1_slice5
    dw img1_slice6
img1_descr
    db "              a-  gender"
img1_palette
    hex 0f0029300f0f0f0f0f0f0f0f0f0f0f0f
img1_slice0
    hex 00bf400400
img1_slice1
    hex 01bf402900
img1_slice2
    hex 02c0033f00
img1_slice3
    hex 02bf400300
img1_slice4
    hex 01800340b33f00
img1_slice5
    hex 008001401e3f00
img1_slice6
    hex 00ff00
image2_ptrs
    dw img2_descr
    dw img2_palette
    dw img2_slice0
    dw img2_slice1
    dw img2_slice2
    dw img2_slice3
    dw img2_slice4
    dw img2_slice5
    dw img2_slice6
img2_descr
    db "              a-romantic"
img2_palette
    hex 0f0029300f1a290f0f0f0f0f0f0f0f0f
img2_slice0
    hex 01ff00
img2_slice1
    hex 013fc00200
img2_slice2
    hex 027f4076400300
img2_slice3
    hex 03bf40b300
img2_slice4
    hex 01ff00
img2_slice5
    hex 004001bf00
img2_slice6
    hex 008f105510054f00
image3_ptrs
    dw img3_descr
    dw img3_palette
    dw img3_slice0
    dw img3_slice1
    dw img3_slice2
    dw img3_slice3
    dw img3_slice4
    dw img3_slice5
    dw img3_slice6
img3_descr
    db "              a-  sexual"
img3_palette
    hex 0f0014300f0f0f0f0f0f0f0f0f0f0f0f
img3_slice0
    hex 00ff00
img3_slice1
    hex 007f4004400100
img3_slice2
    hex 01ff00
img3_slice3
    hex 013fc00300
img3_slice4
    hex 03bf40b400
img3_slice5
    hex 02ff00
img3_slice6
    hex 0080027f00
image4_ptrs
    dw img4_descr
    dw img4_palette
    dw img4_slice0
    dw img4_slice1
    dw img4_slice2
    dw img4_slice3
    dw img4_slice4
    dw img4_slice5
    dw img4_slice6
img4_descr
    db "                    bear"
img4_palette
    hex 0f0717270f2730370f00300f0f0f0f0f
img4_slice0
    hex 01830220021f021b021201021e02212d042802c5020002c602060228020502c2
    hex 2e2800
img4_slice1
    hex 0203026d0273026802000264030271026e2d020502140c000215310252080002
    hex 0e2b047602c802130276060002c12e7600
img4_slice2
    hex 030302a5020701040002103702ae02000210310801021c020d34013f00
img4_slice3
    hex 02c0033f00
img4_slice4
    hex 018002406f3f00
img4_slice5
    hex 008001401e3f00
img4_slice6
    hex 00af1050105510a510aa0f00
image5_ptrs
    dw img5_descr
    dw img5_palette
    dw img5_slice0
    dw img5_slice1
    dw img5_slice2
    dw img5_slice3
    dw img5_slice4
    dw img5_slice5
    dw img5_slice6
img5_descr
    db "             bi-  gender"
img5_palette
    hex 0f2130330f1424330f11210f0f0f0f0f
img5_slice0
    hex 01bf402800
img5_slice1
    hex 02bf407600
img5_slice2
    hex 02c0033f00
img5_slice3
    hex 02bf400300
img5_slice4
    hex 01800340b33f00
img5_slice5
    hex 017f406f3f00
img5_slice6
    hex 0080010f20552f10a0100a00
image6_ptrs
    dw img6_descr
    dw img6_palette
    dw img6_slice0
    dw img6_slice1
    dw img6_slice2
    dw img6_slice3
    dw img6_slice4
    dw img6_slice5
    dw img6_slice6
img6_descr
    db "             bi-  sexual"
img6_palette
    hex 0f1213150f0f0f0f0f0f0f0f0f0f0f0f
img6_slice0
    hex 03ff00
img6_slice1
    hex 03ff00
img6_slice2
    hex 02800340b43f00
img6_slice3
    hex 02bf406f00
img6_slice4
    hex 01ff00
img6_slice5
    hex 01ff00
img6_slice6
    hex 0080017f00
image7_ptrs
    dw img7_descr
    dw img7_palette
    dw img7_slice0
    dw img7_slice1
    dw img7_slice2
    dw img7_slice3
    dw img7_slice4
    dw img7_slice5
    dw img7_slice6
img7_descr
    db "           demi-  sexual"
img7_palette
    hex 0f0410300f0f0f0f0f0f0f0f0f0f0f0f
img7_slice0
    hex 0302193d020002193b0400021939060002193700
img7_slice1
    hex 00070219360309021934030b021932030d0219300300
img7_slice2
    hex 000f02192e031102192c031302192a03150217280100
img7_slice3
    hex 0017021726011702092601150209280113020a2a0200
img7_slice4
    hex 0011020a2c020f020a2e020d020a30020b020a320200
img7_slice5
    hex 0009020a340207020a360205020a380203020a3a0200
img7_slice6
    hex 0001020a3c02020a3e027f00
image8_ptrs
    dw img8_descr
    dw img8_palette
    dw img8_slice0
    dw img8_slice1
    dw img8_slice2
    dw img8_slice3
    dw img8_slice4
    dw img8_slice5
    dw img8_slice6
img8_descr
    db "             gay     men"
img8_palette
    hex 0f1222300f03120f0f1b2b300f0b1b0f
img8_slice0
    hex 01bf402800
img8_slice1
    hex 01bf402800
img8_slice2
    hex 02bf400300
img8_slice3
    hex 02c0033f00
img8_slice4
    hex 018002406f3f00
img8_slice5
    hex 017f406f3f00
img8_slice6
    hex 0080010f10ff20aa1f1050100500
image9_ptrs
    dw img9_descr
    dw img9_palette
    dw img9_slice0
    dw img9_slice1
    dw img9_slice2
    dw img9_slice3
    dw img9_slice4
    dw img9_slice5
    dw img9_slice6
img9_descr
    db "         gender-   fluid"
img9_palette
    hex 0f1425300f020f0f0f0f0f0f0f0f0f0f
img9_slice0
    hex 02ff00
img9_slice1
    hex 023fc00300
img9_slice2
    hex 01800340b33f00
img9_slice3
    hex 01bf401e00
img9_slice4
    hex 00ff00
img9_slice5
    hex 003fc00100
img9_slice6
    hex 0080015f1055100500
image10_ptrs
    dw img10_descr
    dw img10_palette
    dw img10_slice0
    dw img10_slice1
    dw img10_slice2
    dw img10_slice3
    dw img10_slice4
    dw img10_slice5
    dw img10_slice6
img10_descr
    db "         gender-   queer"
img10_palette
    hex 0f1319300f0f0f0f0f0f0f0f0f0f0f0f
img10_slice0
    hex 01ff00
img10_slice1
    hex 01ff00
img10_slice2
    hex 034029bf00
img10_slice3
    hex 03ff00
img10_slice4
    hex 02400340b47f00
img10_slice5
    hex 02ff00
img10_slice6
    hex 0080027f00
image11_ptrs
    dw img11_descr
    dw img11_palette
    dw img11_slice0
    dw img11_slice1
    dw img11_slice2
    dw img11_slice3
    dw img11_slice4
    dw img11_slice5
    dw img11_slice6
img11_descr
    db "          inter-     sex"
img11_palette
    hex 0f04280f0f0f0f0f0f0f0f0f0f0f0f0f
img11_slice0
    hex 02ff00
img11_slice1
    hex 02ff00
img11_slice2
    hex 02190272026704010265027031026202010224042802260201024e2d02630201
    hex 02320702360201024f2b025d022d0b022f023b1500
img11_slice3
    hex 02150201023d0b025e02012b0201023d0b025e02012b0257023a0b025c02382b
    hex 02600201024e0702620201023f1500
img11_slice4
    hex 0118020236010248046f026101023232020237022703022502339a0200
img11_slice5
    hex 02ff00
img11_slice6
    hex 0080027f00
image12_ptrs
    dw img12_descr
    dw img12_palette
    dw img12_slice0
    dw img12_slice1
    dw img12_slice2
    dw img12_slice3
    dw img12_slice4
    dw img12_slice5
    dw img12_slice6
img12_descr
    db "                 leather"
img12_palette
    hex 0f0115300f0f0f0f0f0f0f0f0f0f0f0f
img12_slice0
    hex 004b020a0402020c35020a0802020c290a010c022a0100
img12_slice1
    hex 02060102320d2a01042202c70f2a220400112e00112a0000
img12_slice2
    hex 01040402c410022a0405024e0e0269402900
img12_slice3
    hex 01800340b33f00
img12_slice4
    hex 004001401e7f00
img12_slice5
    hex 00400880013f00
img12_slice6
    hex 00ff00
image13_ptrs
    dw img13_descr
    dw img13_palette
    dw img13_slice0
    dw img13_slice1
    dw img13_slice2
    dw img13_slice3
    dw img13_slice4
    dw img13_slice5
    dw img13_slice6
img13_descr
    db "         lesbian5stripes"
img13_palette
    hex 0f2427300f14240f0f17270f0f0f0f0f
img13_slice0
    hex 01ff00
img13_slice1
    hex 013fc00200
img13_slice2
    hex 027f4076400300
img13_slice3
    hex 03bf40b300
img13_slice4
    hex 01ff00
img13_slice5
    hex 014002bf00
img13_slice6
    hex 0080010f10aa100a2f1055100500
image14_ptrs
    dw img14_descr
    dw img14_palette
    dw img14_slice0
    dw img14_slice1
    dw img14_slice2
    dw img14_slice3
    dw img14_slice4
    dw img14_slice5
    dw img14_slice6
img14_descr
    db "         lesbian7stripes"
img14_palette
    hex 0f1424300f04140f0f0717270f27300f
img14_slice0
    hex 01bf402800
img14_slice1
    hex 02bf407600
img14_slice2
    hex 0180033f400200
img14_slice3
    hex 02c0033f00
img14_slice4
    hex 018002406f3f00
img14_slice5
    hex 017f406f3f00
img14_slice6
    hex 0080010f20aa10fa1f1050100500
image15_ptrs
    dw img15_descr
    dw img15_palette
    dw img15_slice0
    dw img15_slice1
    dw img15_slice2
    dw img15_slice3
    dw img15_slice4
    dw img15_slice5
    dw img15_slice6
img15_descr
    db "            non-  binary"
img15_palette
    hex 0f1328300f0f0f0f0f0f0f0f0f0f0f0f
img15_slice0
    hex 02ff00
img15_slice1
    hex 027f4076400300
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
image16_ptrs
    dw img16_descr
    dw img16_palette
    dw img16_slice0
    dw img16_slice1
    dw img16_slice2
    dw img16_slice3
    dw img16_slice4
    dw img16_slice5
    dw img16_slice6
img16_descr
    db "            pan-  sexual"
img16_palette
    hex 0f1521280f0f0f0f0f0f0f0f0f0f0f0f
img16_slice0
    hex 01ff00
img16_slice1
    hex 01ff00
img16_slice2
    hex 034029bf00
img16_slice3
    hex 03ff00
img16_slice4
    hex 02400340b47f00
img16_slice5
    hex 02ff00
img16_slice6
    hex 0080027f00
image17_ptrs
    dw img17_descr
    dw img17_palette
    dw img17_slice0
    dw img17_slice1
    dw img17_slice2
    dw img17_slice3
    dw img17_slice4
    dw img17_slice5
    dw img17_slice6
img17_descr
    db "           poly-   amory"
img17_palette
    hex 0f0215280f0f0f0f0f0f0f0f0f0f0f0f
img17_slice0
    hex 01ff00
img17_slice1
    hex 01ff00
img17_slice2
    hex 02402899027d02b502b702b502b7029c1900
img17_slice3
    hex 021b027f01027f3902880102883902a20102a35d00
img17_slice4
    hex 004002406d7f00
img17_slice5
    hex 00ff00
img17_slice6
    hex 00ff00
image18_ptrs
    dw img18_descr
    dw img18_palette
    dw img18_slice0
    dw img18_slice1
    dw img18_slice2
    dw img18_slice3
    dw img18_slice4
    dw img18_slice5
    dw img18_slice6
img18_descr
    db "           poly-  sexual"
img18_palette
    hex 0f14212b0f0f0f0f0f0f0f0f0f0f0f0f
img18_slice0
    hex 01ff00
img18_slice1
    hex 01ff00
img18_slice2
    hex 034029bf00
img18_slice3
    hex 03ff00
img18_slice4
    hex 02400340b47f00
img18_slice5
    hex 02ff00
img18_slice6
    hex 0080027f00
image19_ptrs
    dw img19_descr
    dw img19_palette
    dw img19_slice0
    dw img19_slice1
    dw img19_slice2
    dw img19_slice3
    dw img19_slice4
    dw img19_slice5
    dw img19_slice6
img19_descr
    db "         rainbow6stripes"
img19_palette
    hex 0f1627280f0412190f19280f0f0f0f0f
img19_slice0
    hex 01ff00
img19_slice1
    hex 024030bf00
img19_slice2
    hex 034076bf00
img19_slice3
    hex 0140023f800300
img19_slice4
    hex 02400340b47f00
img19_slice5
    hex 01400240747f00
img19_slice6
    hex 0080013f105a2055100500
image20_ptrs
    dw img20_descr
    dw img20_palette
    dw img20_slice0
    dw img20_slice1
    dw img20_slice2
    dw img20_slice3
    dw img20_slice4
    dw img20_slice5
    dw img20_slice6
img20_descr
    db "         rainbow7stripes"
img20_palette
    hex 0f19282c0f03042c0f1627280f0f0f0f
img20_slice0
    hex 01bf402800
img20_slice1
    hex 02bf407600
img20_slice2
    hex 01c0023f00
img20_slice3
    hex 01bf400300
img20_slice4
    hex 01800340b33f00
img20_slice5
    hex 017f4028400200
img20_slice6
    hex 0080020f20aa1f10501055100500
image21_ptrs
    dw img21_descr
    dw img21_palette
    dw img21_slice0
    dw img21_slice1
    dw img21_slice2
    dw img21_slice3
    dw img21_slice4
    dw img21_slice5
    dw img21_slice6
img21_descr
    db "         rainbow8stripes"
img21_palette
    hex 0f19282c0f1627280f03042c0f16250f
img21_slice0
    hex 02bf406a00
img21_slice1
    hex 017f4028400200
img21_slice2
    hex 023f40757f00
img21_slice3
    hex 014002bf00
img21_slice4
    hex 0340317f40b300
img21_slice5
    hex 017f4023400200
img21_slice6
    hex 0080020f10ff105510050f10a010aa100a00
image22_ptrs
    dw img22_descr
    dw img22_palette
    dw img22_slice0
    dw img22_slice1
    dw img22_slice2
    dw img22_slice3
    dw img22_slice4
    dw img22_slice5
    dw img22_slice6
img22_descr
    db "         rainbowprogress"
img22_palette
    hex 0f1927280f2125300f0412190f081621
img22_slice0
    hex 01028d01021a0200021836020203028d01021a020002183402025801028d0102
    hex 1a02000218340202580203028d01021a02000218300200
img22_slice1
    hex 02028e0102580201028d0201021a020002182d0203028e0102580203028d0201
    hex 021a020002182b0403028e0102580201028d0201021a02000218290603028e01
    hex 02580203028d0201021a020002182700
img22_slice2
    hex 0307028e020202580201028d0201021a020002c3267609028e0202025801028d
    hex 0201021a020002192f028e020202580201028d0201021a020002192f028e0202
    hex 025801028d0201021a020002191f00
img22_slice3
    hex 011003028e0202025801028d01021a020002192e0302b0020202690102af0102
    hex 1d020002091d0e0302b002020269020302af01021d020002091f0c0302b00202
    hex 02690102af01021d020002092100
img22_slice4
    hex 010a0302b002020269020302af01021d0200020b2c0302b0020202690102af01
    hex 021d020002c026b4060302b002020269020302af01021d0200020a2802040302
    hex b0020202690102af01021d0200020a2a0200
img22_slice5
    hex 01020302b002020269020302af01021d0200020a2c0202b0020202690102af01
    hex 021d0200020a30020269020302af01021d020002092f02690102af01021d0200
    hex 02093100
img22_slice6
    hex 00020302af0201021d010209340102af0201021d01020936010f02df0eff0255
    hex 02df023009045502df023007045502d5023f07025502d502bf0aaa02d502bf0c
    hex aa020f0e0a00
image23_ptrs
    dw img23_descr
    dw img23_palette
    dw img23_slice0
    dw img23_slice1
    dw img23_slice2
    dw img23_slice3
    dw img23_slice4
    dw img23_slice5
    dw img23_slice6
img23_descr
    db " rainbowprogressintersex"
img23_palette
    hex 0f0419280f0821250f1216270f252830
img23_slice0
    hex 02028e0102580201021a02000218310203028e0102580201021a020002182f02
    hex 8d0201028e0102580201021a020002182d0203028d0203028e0102580201021a
    hex 020002182b00
img23_slice1
    hex 03028901028d0201028e020202580201021a02000219290202028901028d0102
    hex 8e020202580201021a020002192b028901028d0201028e020202580201021a02
    hex 000219290202028901028d01028e020202580201021a020002192300
img23_slice2
    hex 0307028901028d0201028e020202580201021a02000219290202028901028d01
    hex 028e020202580201021a020002192102b902ad02ac02b102bb028901028d0201
    hex 028e020202580201021a020002191d02b2029002470102970240020202890102
    hex 8d01028e020202580201021a020002191b00
img23_slice3
    hex 0302a70245050294025101028901028d0201028e020202580201021a02000219
    hex 1902a0024905029f024a01027c0102af020102b0020202690201021d0200020a
    hex 1a0202aa024202bd0102ba02920202027c0102af0102b0020202690201021d02
    hex 00020a1c02010296023c02ac028c0246027c0102af020102b002020269020102
    hex 1d0200020a1e0200
img23_slice4
    hex 03070202027c0102af0102b0020202690201021d0200020a200207027c0102af
    hex 020102b0020202690201021d0200020a2202030202027c0102af0102b0020202
    hex 690201021d02000209240103027c0102af020102b0020202690201021d020002
    hex 09260100
img23_slice5
    hex 010202027c020302af020302b00202026901021d0200020927027c020302af01
    hex 02b00202026901021d0200020929020302af020302b00202026901021d020002
    hex 092b02af0102b00202026901021d020002092d00
img23_slice6
    hex 00020302b0020202690201021d010209300102b0020202690201021d01020932
    hex 010f027502590caa02cf027502590aaa0102cf027502510902c0027f02550201
    hex 0502c0027f025502a108a0027f025502090a0a020502010b00
image24_ptrs
    dw img24_descr
    dw img24_palette
    dw img24_slice0
    dw img24_slice1
    dw img24_slice2
    dw img24_slice3
    dw img24_slice4
    dw img24_slice5
    dw img24_slice6
img24_descr
    db "          trans-  gender"
img24_palette
    hex 0f2125300f0f0f0f0f0f0f0f0f0f0f0f
img24_slice0
    hex 01ff00
img24_slice1
    hex 013fc00200
img24_slice2
    hex 027f4076400300
img24_slice3
    hex 03bf40b400
img24_slice4
    hex 02ff00
img24_slice5
    hex 014002bf00
img24_slice6
    hex 0080017f00
