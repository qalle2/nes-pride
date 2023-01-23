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
; - compressed NT & AT data in 7 slices
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
 hex 0280004b027a0273027907025902580415020e0261025a1700
img0_slice1
 hex 020b0267020102483b02013d0201028d0294040302b1028e0489028d02940403
 hex 02b1028e0489028d029419020124030b00
img0_slice2
 hex 030e02020103028a029e022e025602ae01028b029e022f024c0b1a0202010302
 hex 8c029b0233024f02ae010297029a023b02500b1a020201231a020201230c0200
img0_slice3
 hex 030e0202010b022f024c02990102a3025602a4029f071a0202010b023c025102
 hex 9802c50230024b0295029a071a020201231a020201230c0200
img0_slice4
 hex 030e0202010f02b4029602a902a802b3024a02ac02b5031a0202010f02b60292
 hex 02a5024302a702a602ab02a2031a020201231a02020102c802c204be02c002c7
 hex 0302c802c204be02c002c70302c802c20c0200
img0_slice5
 hex 020d02013d02013d020107026001026201025a02570258021002572302012f00
img0_slice6
 hex 550e0202013e0202013002100010500302150102150902000202020a02000244
 hex 050400020802020244050250021002520212025411100500
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
 db "                 agender"
img1_palette
 hex 0f0029300f0f0f0f0f0f0f0f0f0f0f0f
img1_slice0
 hex 00ff00
img1_slice1
 hex 003f4008800100
img1_slice2
 hex 243fc00300
img1_slice3
 hex bb3f8002408700
img1_slice4
 hex 03bf40b700
img1_slice5
 hex 017f4021400000
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
 hex 007f800100
img2_slice1
 hex 017f4025400200
img2_slice2
 hex 02bf408800
img2_slice3
 hex 03ff00
img2_slice4
 hex bc3fc00100
img2_slice5
 hex 013f401c800000
img2_slice6
 hex 008f105010554f00
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
 db "                 asexual"
img3_palette
 hex 0f0014300f0f0f0f0f0f0f0f0f0f0f0f
img3_slice0
 hex 00ff00
img3_slice1
 hex 00ff00
img3_slice2
 hex 01ff00
img3_slice3
 hex 017f800300
img3_slice4
 hex 03ff00
img3_slice5
 hex 02ff00
img3_slice6
 hex 027f800000
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
 hex 007f800100
img4_slice1
 hex 0204010220021f021a02110201021e02222e01043102ce020002d00206023102
 hex 0502cd2e3103027e028402760200026f030282027f2d020502120c0002132900
img4_slice2
 hex 03088602d2080002cc2c860302ad0214010600020f3102b20207010400020f37
 hex 02b80200020f3100
img4_slice3
 hex 360702cf02cb33800340c600
img4_slice4
 hex 02bf407000
img4_slice5
 hex 017f4021400000
img4_slice6
 hex 00bf105510a510aa0f00
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
 db "                bigender"
img5_palette
 hex 0f2130330f1424330f11210f0f0f0f0f
img5_slice0
 hex 007f800100
img5_slice1
 hex 013f4031800200
img5_slice2
 hex 863fc00300
img5_slice3
 hex bb3f8002408700
img5_slice4
 hex 03bf40b700
img5_slice5
 hex 017f40853f00
img5_slice6
 hex 0080010f1050105510051f10a0100a00
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
 db "                bisexual"
img6_palette
 hex 0f1213150f0f0f0f0f0f0f0f0f0f0f0f
img6_slice0
 hex 007f800300
img6_slice1
 hex 03ff00
img6_slice2
 hex 03bf40c400
img6_slice3
 hex 02ff00
img6_slice4
 hex 7b3fc00100
img6_slice5
 hex 01ff00
img6_slice6
 hex 017f800000
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
 hex 007f02183e030102183c0300
img7_slice1
 hex 000302183a0305021838030702183603090218340300
img7_slice2
 hex 000b021832030d021830030f02182e031102182c0300
img7_slice3
 hex 001302162a01150216280115020a280113020a2a0100
img7_slice4
 hex 0011020b2c020f020b2e020d020b30020b020b320200
img7_slice5
 hex 0009020b340207020b360205020b380203020b3a0200
img7_slice6
 hex 0001020b3c02020b3e027f00
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
 hex 007f800100
img8_slice1
 hex 013f40317f00
img8_slice2
 hex 233fc00200
img8_slice3
 hex 8f3f800340c600
img8_slice4
 hex 02bf407000
img8_slice5
 hex 017f40853f00
img8_slice6
 hex 0080010f10f010af10aa100a0f1050100500
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
 hex 007f800200
img9_slice1
 hex 027f4087400300
img9_slice2
 hex 03bf40c300
img9_slice3
 hex 01ff00
img9_slice4
 hex 1d3fc00000
img9_slice5
 hex 003f4009800100
img9_slice6
 hex 017f60001055100500
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
 hex 007f800100
img10_slice1
 hex 01ff00
img10_slice2
 hex 017f800300
img10_slice3
 hex 03ff00
img10_slice4
 hex 037f800200
img10_slice5
 hex 02ff00
img10_slice6
 hex 027f800000
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
 db "                intersex"
img11_palette
 hex 0f04280f0f0f0f0f0f0f0f0f0f0f0f0f
img11_slice0
 hex 007f800200
img11_slice1
 hex 02ff00
img11_slice2
 hex 02590283027504010272028131026b02010227042d0229020102522d026e0201
 hex 023707023d020102551500
img11_slice3
 hex 0215026402320b023402452b020102470b026602012b020102470b026602012b
 hex 025b02440b026302411500
img11_slice4
 hex 021502680201025207026b020102492d023d0201024e0480026a020102373102
 hex 40022a04010228023a5900
img11_slice5
 hex 02ff00
img11_slice6
 hex 027f800000
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
 hex 00cb020b0402020d2b00
img12_slice1
 hex 020a0402c90702ca2a040a010b300102370d2a01041d02d10f2a1d00
img12_slice2
 hex 020400112e00112a00040102520f300102520d2a0100
img12_slice3
 hex 2c3f800340bc00
img12_slice4
 hex 017f800000
img12_slice5
 hex 043f8001401d00
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
 hex 007f800100
img13_slice1
 hex 017f4025400200
img13_slice2
 hex 02bf408800
img13_slice3
 hex 03ff00
img13_slice4
 hex bc3fc00100
img13_slice5
 hex 023f4078800100
img13_slice6
 hex 0080010f10a010aa2f1055100500
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
 hex 007f800100
img14_slice1
 hex 013f4031800200
img14_slice2
 hex 863fc00300
img14_slice3
 hex 353f4002400340c600
img14_slice4
 hex 02bf407000
img14_slice5
 hex 017f40853f00
img14_slice6
 hex 0080010f10a020aa100f0f1050100500
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
 hex 007f800200
img15_slice1
 hex 02ff00
img15_slice2
 hex 03ff00
img15_slice3
 hex 037f800100
img15_slice4
 hex 01ff00
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
 hex 007f800100
img16_slice1
 hex 01ff00
img16_slice2
 hex 017f800300
img16_slice3
 hex 03ff00
img16_slice4
 hex 037f800200
img16_slice5
 hex 02ff00
img16_slice6
 hex 027f800000
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
 hex 007f800100
img17_slice1
 hex 01ff00
img17_slice2
 hex 017f800200
img17_slice3
 hex 0219029102bf02c102bf02c102aa35029301029339029c01029c3902af0102b0
 hex 1d00
img17_slice4
 hex 027f800000
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
 hex 007f800100
img18_slice1
 hex 01ff00
img18_slice2
 hex 017f800300
img18_slice3
 hex 03ff00
img18_slice4
 hex 037f800200
img18_slice5
 hex 02ff00
img18_slice6
 hex 027f800000
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
 hex 0f1216190f0427280f0f0f0f0f0f0f0f
img19_slice0
 hex 007f800200
img19_slice1
 hex 02ff00
img19_slice2
 hex 027f800300
img19_slice3
 hex 03ff00
img19_slice4
 hex 037f800100
img19_slice5
 hex 01ff00
img19_slice6
 hex 0080011f1050105510050f1050100500
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
 hex 007f800100
img20_slice1
 hex 013f4031800200
img20_slice2
 hex 863f4003800200
img20_slice3
 hex 783f8001402600
img20_slice4
 hex 03bf40b700
img20_slice5
 hex 017f402b400200
img20_slice6
 hex 0080020f10a010aa100a0f10501055100500
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
 hex 0f192c0f0f27280f0f03040f0f16250f
img21_slice0
 hex 007f800200
img21_slice1
 hex 023fc00100
img21_slice2
 hex 01bf400200
img21_slice3
 hex 027f800100
img21_slice4
 hex 013fc00200
img21_slice5
 hex 01bf400200
img21_slice6
 hex 0080020f10f010ff105510050f10aa100a00
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
 hex 0f2125280f2527300f0412190f081621
img22_slice0
 hex 007f02a0020102190102173602020302a002010219010217340200
img22_slice1
 hex 01025c0102a0010219020002173402025c020302a001021902000217300202a0
 hex 01025c0102a0010219020002172e02020302a00202025c020302a00102190200
 hex 02172c0200
img22_slice2
 hex a00403010201025c02010102010219020002172a020603010202025c02030102
 hex 0102190200021728020803010201025c02010102010219020002183003010202
 hex 025c0203010201021902000218240300
img22_slice3
 hex 010c0302a001025c0102a001021902000218300302a00202025c020302a00102
 hex 19020002182e0302b902020277020302b901021b0200020c2c0302b901027701
 hex 02b901021b0200020c220300
img22_slice4
 hex b90a0301020202770203010201021b0200020c2c030102010277020101020102
 hex 1b0200020c2c0301020202770203010201021b0200020b280204030102010277
 hex 0201010201021b0200020b2a0200
img22_slice5
 hex 01020302b902020277020302b901021b0200020b2c0202b90102770102b90102
 hex 1b0200020b30020277020302b901021b0200020a2f02770102b901021b020002
 hex 0a3100
img22_slice6
 hex 01020302b901021b0200020a3302b901021b0200020a35100010f0021c02ff0c
 hex 5f0255021c02f70a05045502cc02b308a0025502c102bf0aaa02c102bf0caa02
 hex 0f0e0a00
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
 hex 0f0428300f2125300f1219270f081621
img23_slice0
 hex 02800002a101025c020102a002010219020002172d020302a101025c020302a0
 hex 02010219020002172b00
img23_slice1
 hex 03029d0102a10202025c020102a002010219020002172c02029d0102a1020202
 hex 5c0102a002010219020002172c02029d0102a10202025c020102a00201021902
 hex 000218250602029d0102a10202025c0102a002010219020002182300
img23_slice2
 hex 0207029d020302a101025c020102a00201021902000218220309029d020302a1
 hex 01025c020302a0020102190200021820030b029d020302a101025c020102a002
 hex 0102190200021721027d02740271027c01029d020302a101025c020302a00201
 hex 0219020002171b00
img23_slice3
 hex 0201026c023903023f025301029d020302a101025c020102a002010219020002
 hex 171b025f07024203029d020302a101025c020302a0020102190200021719025e
 hex 07025d030290020302ba010277020302b90201021b0200020b19026502540302
 hex 6d0246010290020302ba010277020102b90201021b0200020b1900
img23_slice4
 hex 0203023e024d02690238010290020302ba010277020302b90201021b0200020b
 hex 270290020302ba010277020102b90201021b0200020b270290020302ba010277
 hex 020302b90201021b0200020a2001070290020302ba010277020102b90201021b
 hex 0200020a220100
img23_slice5
 hex 0106020290020302ba02020277020302b901021b0200020a2304020290020302
 hex ba020202770102b901021b0200020a2502020290020302ba02020277020302b9
 hex 01021b0200020a270290020302ba020202770102b901021b0200020a2900
img23_slice6
 hex 00020302ba02020277020302b90201021b01020a2c0102ba02020277020102b9
 hex 0201021b01020a2e010f02500ef00204025d02ff0aaf010204025d02fb080a03
 hex 024402dd02b306a001024002d502bf08aa024002d5023f0a0a0205020f0b00
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
 hex 007f800100
img24_slice1
 hex 017f4025400200
img24_slice2
 hex 02bf408800
img24_slice3
 hex 03ff00
img24_slice4
 hex bd3fc00200
img24_slice5
 hex 023f4078800100
img24_slice6
 hex 017f800000
