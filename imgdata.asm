; Image data excluding pattern tables.
; This file was generated automatically by convert.py.

; number of images
image_count equ 26

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
 dw image25_ptrs

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
 hex 0280004b0287028002860702620261041b020e026d02651700
img0_slice1
 hex 020b0274020102503b02013d0201029a02a2040302bf029b0496029a02a20403
 hex 02bf029b0496029a02a219020124030b00
img0_slice2
 hex 030e02020103029702ac0234025f02bc01029802ac023502540b1a0202010302
 hex 9902a90239025702bc0102a502a8024202580b1a020201231a020201230c0200
img0_slice3
 hex 030e0202010b0235025402a70102b1025f02b202ad071a0202010b0243025902
 hex a602d50236025302a302a8071a020201231a020201230c0200
img0_slice4
 hex 030e0202010f02c202a402b702b602c1025202ba02c3031a0202010f02c402a0
 hex 02b3024b02b502b402b902b0031a020201231a02020102d802d204ce02d002d7
 hex 0302d802d204ce02d002d70302d802d20c0200
img0_slice5
 hex 020d02013d02010b026c0102110210020e0266026e0263021902651d02010b02
 hex 6f010218020e021a02602502010b0261010210026102180212026302171300
img0_slice6
 hex 020d02010302650260026102100260010212020e026502640210026e02110260
 hex 026e0263021802651502012f1000105004550215025502150a55020001020a02
 hex 0002440655040002080102440655025002100252021202541255100500
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
 hex 2a3fc00300
img1_slice3
 hex cb3f8002409400
img1_slice4
 hex 03bf40c700
img1_slice5
 hex 017f4027400000
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
 hex 017f402b400200
img2_slice2
 hex 02bf409500
img2_slice3
 hex 03ff00
img2_slice4
 hex cc3fc00100
img2_slice5
 hex 013f4022800000
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
 db "                  autism"
img4_palette
 hex 0f1429370f2127370f252c370f0f0f0f
img4_slice0
 hex 007f800300
img4_slice1
 hex 03ff00
img4_slice2
 hex 038d02c50401080202ab0302c50801040202ab1902c506010a0202ab02c50a01
 hex 060202ab0b00
img4_slice3
 hex 030b0401023f05029e040202780601023f05029e040217040109029e02780601
 hex 023f0904021704010902c50601023d02ab090402170401025e0502c50601023d
 hex 040202ab0502c604020b00
img4_slice4
 hex 030b02481001023f029e1002029d1902480c01023f03029e0c02029d8d00
img4_slice5
 hex 03ff00
img4_slice6
 hex 0080033102800260045002900220030208020204550208020205020404050201
 hex 2300
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
 db "                    bear"
img5_palette
 hex 0f0717270f2730370f00300f0f0f0f0f
img5_slice0
 hex 007f800100
img5_slice1
 hex 02040102260225022002130201022402282e01043702de020002e00206023702
 hex 0502dd2e3703028b029102830200027c03028f028c2d020502140c0002152900
img5_slice2
 hex 03089302e2080002dc2c930302bb0216010600020f3102c00207010400020f37
 hex 02c80200020f3100
img5_slice3
 hex 3c0702df02db33800340d600
img5_slice4
 hex 02bf407d00
img5_slice5
 hex 017f4027400000
img5_slice6
 hex 00bf105510a510aa0f00
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
 db "                bigender"
img6_palette
 hex 0f2130330f1424330f11210f0f0f0f0f
img6_slice0
 hex 007f800100
img6_slice1
 hex 013f4037800200
img6_slice2
 hex 933fc00300
img6_slice3
 hex cb3f8002409400
img6_slice4
 hex 03bf40c700
img6_slice5
 hex 017f40923f00
img6_slice6
 hex 0080010f1050105510051f10a0100a00
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
 db "                bisexual"
img7_palette
 hex 0f1213150f0f0f0f0f0f0f0f0f0f0f0f
img7_slice0
 hex 007f800300
img7_slice1
 hex 03ff00
img7_slice2
 hex 03bf40d400
img7_slice3
 hex 02ff00
img7_slice4
 hex 883fc00100
img7_slice5
 hex 01ff00
img7_slice6
 hex 017f800000
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
 db "           demi-  sexual"
img8_palette
 hex 0f0410300f0f0f0f0f0f0f0f0f0f0f0f
img8_slice0
 hex 007f021e3e0301021e3c0300
img8_slice1
 hex 0003021e3a0305021e380307021e360309021e340300
img8_slice2
 hex 000b021e32030d021e30030f021e2e0311021e2c0300
img8_slice3
 hex 0013021c2a0115021c280115020a280113020a2a0100
img8_slice4
 hex 0011020b2c020f020b2e020d020b30020b020b320200
img8_slice5
 hex 0009020b340207020b360205020b380203020b3a0200
img8_slice6
 hex 0001020b3c02020b3e027f00
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
 db "             gay     men"
img9_palette
 hex 0f1222300f03120f0f1b2b300f0b1b0f
img9_slice0
 hex 007f800100
img9_slice1
 hex 013f40377f00
img9_slice2
 hex 293fc00200
img9_slice3
 hex 9c3f800340d600
img9_slice4
 hex 02bf407d00
img9_slice5
 hex 017f40923f00
img9_slice6
 hex 0080010f10f010af10aa100a0f1050100500
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
 db "         gender-   fluid"
img10_palette
 hex 0f1425300f020f0f0f0f0f0f0f0f0f0f
img10_slice0
 hex 007f800200
img10_slice1
 hex 027f4094400300
img10_slice2
 hex 03bf40d300
img10_slice3
 hex 01ff00
img10_slice4
 hex 233fc00000
img10_slice5
 hex 003f4009800100
img10_slice6
 hex 017f60001055100500
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
 db "         gender-   queer"
img11_palette
 hex 0f1319300f0f0f0f0f0f0f0f0f0f0f0f
img11_slice0
 hex 007f800100
img11_slice1
 hex 01ff00
img11_slice2
 hex 017f800300
img11_slice3
 hex 03ff00
img11_slice4
 hex 037f800200
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
 db "                intersex"
img12_palette
 hex 0f04280f0f0f0f0f0f0f0f0f0f0f0f0f
img12_slice0
 hex 007f800200
img12_slice1
 hex 02ff00
img12_slice2
 hex 0259029002820401027f028e3102780201022d0433022f0201025a2d027b0201
 hex 023d0702440201025d1500
img12_slice3
 hex 0215027102380b023a024d2b0201024f0b027302012b0201024f0b027302012b
 hex 0267024c0b027002491500
img12_slice4
 hex 021502750201025a070278020102512d024402010256048d02770201023d3102
 hex 4702300401022e02415900
img12_slice5
 hex 02ff00
img12_slice6
 hex 027f800000
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
 db "                 leather"
img13_palette
 hex 0f0115300f0f0f0f0f0f0f0f0f0f0f0f
img13_slice0
 hex 00cb020b0402020d2b00
img13_slice1
 hex 020a0402d90702da2a040a010b3001023d0d2a01042302e10f2a2300
img13_slice2
 hex 020400112e00112a000401025a0f3001025a0d2a0100
img13_slice3
 hex 323f800340cc00
img13_slice4
 hex 017f800000
img13_slice5
 hex 043f8001402300
img13_slice6
 hex 00ff00
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
 db "         lesbian5stripes"
img14_palette
 hex 0f2427300f14240f0f17270f0f0f0f0f
img14_slice0
 hex 007f800100
img14_slice1
 hex 017f402b400200
img14_slice2
 hex 02bf409500
img14_slice3
 hex 03ff00
img14_slice4
 hex cc3fc00100
img14_slice5
 hex 023f4085800100
img14_slice6
 hex 0080010f10a010aa2f1055100500
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
 db "         lesbian7stripes"
img15_palette
 hex 0f1424300f04140f0f0717270f27300f
img15_slice0
 hex 007f800100
img15_slice1
 hex 013f4037800200
img15_slice2
 hex 933fc00300
img15_slice3
 hex 3b3f4002400340d600
img15_slice4
 hex 02bf407d00
img15_slice5
 hex 017f40923f00
img15_slice6
 hex 0080010f10a020aa100f0f1050100500
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
 db "            non-  binary"
img16_palette
 hex 0f1328300f0f0f0f0f0f0f0f0f0f0f0f
img16_slice0
 hex 007f800200
img16_slice1
 hex 02ff00
img16_slice2
 hex 03ff00
img16_slice3
 hex 037f800100
img16_slice4
 hex 01ff00
img16_slice5
 hex 00ff00
img16_slice6
 hex 00ff00
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
 db "            pan-  sexual"
img17_palette
 hex 0f1521280f0f0f0f0f0f0f0f0f0f0f0f
img17_slice0
 hex 007f800100
img17_slice1
 hex 01ff00
img17_slice2
 hex 017f800300
img17_slice3
 hex 03ff00
img17_slice4
 hex 037f800200
img17_slice5
 hex 02ff00
img17_slice6
 hex 027f800000
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
 db "           poly-   amory"
img18_palette
 hex 0f0215280f0f0f0f0f0f0f0f0f0f0f0f
img18_slice0
 hex 007f800100
img18_slice1
 hex 01ff00
img18_slice2
 hex 017f800200
img18_slice3
 hex 0219029f02cf02d102cf02d102b83502a10102a13902aa0102aa3902bd0102be
 hex 1d00
img18_slice4
 hex 027f800000
img18_slice5
 hex 00ff00
img18_slice6
 hex 00ff00
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
 db "           poly-  sexual"
img19_palette
 hex 0f14212b0f0f0f0f0f0f0f0f0f0f0f0f
img19_slice0
 hex 007f800100
img19_slice1
 hex 01ff00
img19_slice2
 hex 017f800300
img19_slice3
 hex 03ff00
img19_slice4
 hex 037f800200
img19_slice5
 hex 02ff00
img19_slice6
 hex 027f800000
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
 db "         rainbow6stripes"
img20_palette
 hex 0f1216190f0427280f0f0f0f0f0f0f0f
img20_slice0
 hex 007f800200
img20_slice1
 hex 02ff00
img20_slice2
 hex 027f800300
img20_slice3
 hex 03ff00
img20_slice4
 hex 037f800100
img20_slice5
 hex 01ff00
img20_slice6
 hex 0080011f1050105510050f1050100500
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
 db "         rainbow7stripes"
img21_palette
 hex 0f19282c0f03042c0f1627280f0f0f0f
img21_slice0
 hex 007f800100
img21_slice1
 hex 013f4037800200
img21_slice2
 hex 933f4003800200
img21_slice3
 hex 853f8001402c00
img21_slice4
 hex 03bf40c700
img21_slice5
 hex 017f4031400200
img21_slice6
 hex 0080020f10a010aa100a0f10501055100500
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
 db "         rainbow8stripes"
img22_palette
 hex 0f192c0f0f27280f0f03040f0f16250f
img22_slice0
 hex 007f800200
img22_slice1
 hex 023fc00100
img22_slice2
 hex 01bf400200
img22_slice3
 hex 027f800100
img22_slice4
 hex 013fc00200
img22_slice5
 hex 01bf400200
img22_slice6
 hex 0080020f10f010ff105510050f10aa100a00
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
 db "         rainbowprogress"
img23_palette
 hex 0f2125280f2527300f0412190f081621
img23_slice0
 hex 007f02ae0201021f01021d3602020302ae0201021f01021d340200
img23_slice1
 hex 0102680102ae01021f0200021d34020268020302ae01021f0200021d300202ae
 hex 0102680102ae01021f0200021d2e02020302ae02020268020302ae01021f0200
 hex 021d2c0200
img23_slice2
 hex ae040301020102680201010201021f0200021d2a020603010202026802030102
 hex 01021f0200021d2802080301020102680201010201021f0200021e3003010202
 hex 02680203010201021f0200021e240300
img23_slice3
 hex 010c0302ae0102680102ae01021f0200021e300302ae02020268020302ae0102
 hex 1f0200021e2e0302c902020284020302c90102210200020c2c0302c901028401
 hex 02c90102210200020c220300
img23_slice4
 hex c90a030102020284020301020102210200020c2c030102010284020101020102
 hex 210200020c2c030102020284020301020102210200020b280204030102010284
 hex 020101020102210200020b2a0200
img23_slice5
 hex 01020302c902020284020302c90102210200020b2c0202c90102840102c90102
 hex 210200020b30020284020302c90102210200020a2f02840102c9010221020002
 hex 0a3100
img23_slice6
 hex 01020302c90102210200020a3302c90102210200020a35100010f0021c02ff0c
 hex 5f0255021c02f70a05045502cc02b308a0025502c102bf0aaa02c102bf0caa02
 hex 0f0e0a00
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
 db " rainbowprogressintersex"
img24_palette
 hex 0f0428300f2125300f1219270f081621
img24_slice0
 hex 02800002af010268020102ae0201021f0200021d2d020302af010268020302ae
 hex 0201021f0200021d2b00
img24_slice1
 hex 0302ab0102af02020268020102ae0201021f0200021d2c0202ab0102af020202
 hex 680102ae0201021f0200021d2c0202ab0102af02020268020102ae0201021f02
 hex 00021e25060202ab0102af020202680102ae0201021f0200021e2300
img24_slice2
 hex 020702ab020302af010268020102ae0201021f0200021e22030902ab020302af
 hex 010268020302ae0201021f0200021e20030b02ab020302af010268020102ae02
 hex 01021f0200021d21028a0281027e02890102ab020302af010268020302ae0201
 hex 021f0200021d1b00
img24_slice3
 hex 020102790240030246025b0102ab020302af010268020102ae0201021f020002
 hex 1d1b026b07024a0302ab020302af010268020302ae0201021f0200021d19026a
 hex 07026903029d020302ca010284020302c9020102210200020b190272025c0302
 hex 7a024e01029d020302ca010284020102c9020102210200020b1900
img24_slice4
 hex 0203024502550276023e01029d020302ca010284020302c9020102210200020b
 hex 27029d020302ca010284020102c9020102210200020b27029d020302ca010284
 hex 020302c9020102210200020a200107029d020302ca010284020102c902010221
 hex 0200020a220100
img24_slice5
 hex 010602029d020302ca02020284020302c90102210200020a230402029d020302
 hex ca020202840102c90102210200020a250202029d020302ca02020284020302c9
 hex 0102210200020a27029d020302ca020202840102c90102210200020a2900
img24_slice6
 hex 00020302ca02020284020302c90201022101020a2c0102ca02020284020102c9
 hex 0201022101020a2e010f02500ef00204025d02ff0aaf010204025d02fb080a03
 hex 024402dd02b306a001024002d502bf08aa024002d5023f0a0a0205020f0b00
image25_ptrs
 dw img25_descr
 dw img25_palette
 dw img25_slice0
 dw img25_slice1
 dw img25_slice2
 dw img25_slice3
 dw img25_slice4
 dw img25_slice5
 dw img25_slice6
img25_descr
 db "          trans-  gender"
img25_palette
 hex 0f2125300f0f0f0f0f0f0f0f0f0f0f0f
img25_slice0
 hex 007f800100
img25_slice1
 hex 017f402b400200
img25_slice2
 hex 02bf409500
img25_slice3
 hex 03ff00
img25_slice4
 hex cd3fc00200
img25_slice5
 hex 023f4085800100
img25_slice6
 hex 017f800000
