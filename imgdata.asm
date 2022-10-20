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
    hex 0299025402530415020e0259025523026b0265026a2d00
img0_slice1
    hex 020b025e0201023d3b02013d02010279027f040302a3027a04750279027f0403
    hex 02a3027a04750279027f19020124030b00
img0_slice2
    hex 030e02020103027602890229024f02a00102770289022a02430b1a0202010302
    hex 780286022d024a02a001028202850233024b0b1a020201231a020201230c0200
img0_slice3
    hex 030e0202010b022a02430284010290024f0292028a071a0202010b0234024c02
    hex 8302bb022b024202800285071a020201231a020201230c0200
img0_slice4
    hex 030e0202010f02a70281029a029902a50240029d02a8031a0202010f02aa027d
    hex 0294023802980297029c028e031a020201231a02020102be02b704b302b502bd
    hex 0302be02b704b302b502bd0302be02b70c0200
img0_slice5
    hex 020d02013d02013d02013d020107025801025a01025502520253021002521500
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
    hex 01bf402800
img1_slice2
    hex 02c0033f00
img1_slice3
    hex 02bf400300
img1_slice4
    hex 01800340b23f00
img1_slice5
    hex 008001401d3f00
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
    hex 027f4075400300
img2_slice3
    hex 03bf40b200
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
    hex 03bf40b300
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
    hex 0183021f021e021a021101021d02202d042702c4020002c502060227020502c1
    hex 2e2700
img4_slice1
    hex 0203026c0272026702000263030270026d2d020502130c000214310251080002
    hex 0d2b047502c702120275060002c02e7500
img4_slice2
    hex 030302a40207010400020f3702ad0200020f310801021b020c34013f00
img4_slice3
    hex 02c0033f00
img4_slice4
    hex 018002406e3f00
img4_slice5
    hex 008001401d3f00
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
    hex 01bf402700
img5_slice1
    hex 02bf407500
img5_slice2
    hex 02c0033f00
img5_slice3
    hex 02bf400300
img5_slice4
    hex 01800340b23f00
img5_slice5
    hex 017f406e3f00
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
    hex 02800340b33f00
img6_slice3
    hex 02bf406e00
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
    hex 0302183d020002183b0400021839060002183700
img7_slice1
    hex 00070218360309021834030b021832030d0218300300
img7_slice2
    hex 000f02182e031102182c031302182a03150216280100
img7_slice3
    hex 0017021626011702092601150209280113020a2a0200
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
    hex 01bf402700
img8_slice1
    hex 01bf402700
img8_slice2
    hex 02bf400300
img8_slice3
    hex 02c0033f00
img8_slice4
    hex 018002406e3f00
img8_slice5
    hex 017f406e3f00
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
    hex 01800340b23f00
img9_slice3
    hex 01bf401d00
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
    hex 034028bf00
img10_slice3
    hex 03ff00
img10_slice4
    hex 02400340b37f00
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
    hex 02190271026604010264026f31026102010223042702250201024d2d02620201
    hex 02310702350201024e2b025c022c0b022e023a1500
img11_slice3
    hex 02150201023c0b025d02012b0201023c0b025d02012b025602390b025b02372b
    hex 025f0201024d0702610201023e1500
img11_slice4
    hex 0118020235010247046e026001023132020236022603022402329a0200
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
    hex 004b020a0402020b35020a0802020b290a010c022a0100
img12_slice1
    hex 02060102310d2a01042102c60f2a210400112e00112a0000
img12_slice2
    hex 01040402c310022a0405024d0e0269402800
img12_slice3
    hex 01800340b23f00
img12_slice4
    hex 004001401d7f00
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
    hex 027f4075400300
img13_slice3
    hex 03bf40b200
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
    hex 01bf402700
img14_slice1
    hex 02bf407500
img14_slice2
    hex 0180033f400200
img14_slice3
    hex 02c0033f00
img14_slice4
    hex 018002406e3f00
img14_slice5
    hex 017f406e3f00
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
    hex 027f4075400300
img15_slice2
    hex 03ff00
img15_slice3
    hex 014003bf00
img15_slice4
    hex 01bf401d00
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
    hex 034028bf00
img16_slice3
    hex 03ff00
img16_slice4
    hex 02400340b37f00
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
    hex 02402799027c02b402b602b402b6029b1900
img17_slice3
    hex 021b027e01027e3902870102873902a10102a25d00
img17_slice4
    hex 004002406c7f00
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
    hex 034028bf00
img18_slice3
    hex 03ff00
img18_slice4
    hex 02400340b37f00
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
    hex 02402fbf00
img19_slice2
    hex 034075bf00
img19_slice3
    hex 0140023f800300
img19_slice4
    hex 02400340b37f00
img19_slice5
    hex 01400240737f00
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
    hex 01bf402700
img20_slice1
    hex 02bf407500
img20_slice2
    hex 01c0023f00
img20_slice3
    hex 01bf400300
img20_slice4
    hex 01800340b23f00
img20_slice5
    hex 017f4027400200
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
    hex 02bf406900
img21_slice1
    hex 017f4027400200
img21_slice2
    hex 023f40747f00
img21_slice3
    hex 014002bf00
img21_slice4
    hex 0340307f40b200
img21_slice5
    hex 017f4022400200
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
    hex 0f1627280f2125300f0408210f121928
img22_slice0
    hex 01028d0202025102000216350203028d020202510200021633025701028d0202
    hex 02510200021631020202570203028d02020251020002162f00
img22_slice1
    hex 02028d0102570201028d010251020002172d0203028d0102570203028d010251
    hex 020002172b0403028d0102570201028d01025102000217290603028d01025702
    hex 03028d010251020002172700
img22_slice2
    hex 020803028d0102570201028d010251020002c226750a03028d0102570203028d
    hex 010251020002183003028d0102570201028d010251020002183003028d010257
    hex 0203028d01025102000218200300
img22_slice3
    hex 021003028d0102570201028d010251020002182e0302af010268020102af0102
    hex 670200020a1d0e0302af010268020302af0102670200020a1f0c0302af010268
    hex 020102af0102670200020a2100
img22_slice4
    hex 020a0302af010268020302af0102670200020a23080302af010268020102af01
    hex 0267020002bf266e060302af010268020302af010267020002092801040302af
    hex 010268020102af010267020002092a0100
img22_slice5
    hex 02020302af010268020302af010267020002092c0102af010268020102af0102
    hex 67020002092e01010268020302af0102670200020930010268020102af010267
    hex 02000209320100
img22_slice6
    hex 00020302af02020267010209340102af0202026701020936010f029a02200b02
    hex 55029a0220090455029a0220070455029502ea08ff0255029502ea0aff029502
    hex aa0caf100a00
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
    hex 0f1216270f0419280f0821250f252830
img23_slice0
    hex 02028d0102570201021902000217310203028d01025702010219020002172f02
    hex 8c0201028d01025702010219020002172d0203028c0203028d01025702010219
    hex 020002172b00
img23_slice1
    hex 03028801028c0201028d020202570201021902000218290202028801028c0102
    hex 8d0202025702010219020002182b028801028c0201028d020202570201021902
    hex 000218290202028801028c01028d0202025702010219020002182300
img23_slice2
    hex 0307028801028c0201028d020202570201021902000218290202028801028c01
    hex 028d0202025702010219020002182102b802ac02ab02b002ba028801028c0201
    hex 028d0202025702010219020002181d02b1028f0246010296023f020202880102
    hex 8c01028d0202025702010219020002181b00
img23_slice3
    hex 0302a60244050293025001028801028c0201028d020202570201021902000218
    hex 19029f024805029e024901027b0102ae020102af020202680201021c0200020a
    hex 1a0202a9024102bc0102b902910202027b0102ae0102af020202680201021c02
    hex 00020a1c02010295023b02ab028b0245027b0102ae020102af02020268020102
    hex 1c0200020a1e0200
img23_slice4
    hex 03070202027b0102ae0102af020202680201021c0200020a200207027b0102ae
    hex 020102af020202680201021c0200020a2202030202027b0102ae0102af020202
    hex 680201021c02000209240103027b0102ae020102af020202680201021c020002
    hex 09260100
img23_slice5
    hex 010202027b020302ae020302af0202026801021c0200020927027b020302ae01
    hex 02af0202026801021c0200020929020302ae020302af0202026801021c020002
    hex 092b02ae0102af0202026801021c020002092d00
img23_slice6
    hex 00020302af020202680201021c010209300102af020202680201021c01020932
    hex 010f02ba02a20b02df02ba02a209025502df02ba02a60a5502d502bf02aa0256
    hex 065502d502bf02aa0206080502bf02aa02520a50020a02060c0500
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
    hex 027f4075400300
img24_slice3
    hex 03bf40b300
img24_slice4
    hex 02ff00
img24_slice5
    hex 014002bf00
img24_slice6
    hex 0080017f00
