; Image data excluding pattern tables.
; This file was generated automatically by convert.py.

; number of images
image_count equ 26

; pointers to the following array
image_ptrs
  dw image0_ptrs, image1_ptrs, image2_ptrs, image3_ptrs
  dw image4_ptrs, image5_ptrs, image6_ptrs, image7_ptrs
  dw image8_ptrs, image9_ptrs, image10_ptrs, image11_ptrs
  dw image12_ptrs, image13_ptrs, image14_ptrs, image15_ptrs
  dw image16_ptrs, image17_ptrs, image18_ptrs, image19_ptrs
  dw image20_ptrs, image21_ptrs, image22_ptrs, image23_ptrs
  dw image24_ptrs, image25_ptrs

; pointers to the following arrays
image0_ptrs
  dw img0_descr, img0_palette, img0_slice0, img0_slice1
  dw img0_slice2, img0_slice3, img0_slice4, img0_slice5
  dw img0_slice6
image1_ptrs
  dw img1_descr, img1_palette, img1_slice0, img1_slice1
  dw img1_slice2, img1_slice3, img1_slice4, img1_slice5
  dw img1_slice6
image2_ptrs
  dw img2_descr, img2_palette, img2_slice0, img2_slice1
  dw img2_slice2, img2_slice3, img2_slice4, img2_slice5
  dw img2_slice6
image3_ptrs
  dw img3_descr, img3_palette, img3_slice0, img3_slice1
  dw img3_slice2, img3_slice3, img3_slice4, img3_slice5
  dw img3_slice6
image4_ptrs
  dw img4_descr, img4_palette, img4_slice0, img4_slice1
  dw img4_slice2, img4_slice3, img4_slice4, img4_slice5
  dw img4_slice6
image5_ptrs
  dw img5_descr, img5_palette, img5_slice0, img5_slice1
  dw img5_slice2, img5_slice3, img5_slice4, img5_slice5
  dw img5_slice6
image6_ptrs
  dw img6_descr, img6_palette, img6_slice0, img6_slice1
  dw img6_slice2, img6_slice3, img6_slice4, img6_slice5
  dw img6_slice6
image7_ptrs
  dw img7_descr, img7_palette, img7_slice0, img7_slice1
  dw img7_slice2, img7_slice3, img7_slice4, img7_slice5
  dw img7_slice6
image8_ptrs
  dw img8_descr, img8_palette, img8_slice0, img8_slice1
  dw img8_slice2, img8_slice3, img8_slice4, img8_slice5
  dw img8_slice6
image9_ptrs
  dw img9_descr, img9_palette, img9_slice0, img9_slice1
  dw img9_slice2, img9_slice3, img9_slice4, img9_slice5
  dw img9_slice6
image10_ptrs
  dw img10_descr, img10_palette, img10_slice0, img10_slice1
  dw img10_slice2, img10_slice3, img10_slice4, img10_slice5
  dw img10_slice6
image11_ptrs
  dw img11_descr, img11_palette, img11_slice0, img11_slice1
  dw img11_slice2, img11_slice3, img11_slice4, img11_slice5
  dw img11_slice6
image12_ptrs
  dw img12_descr, img12_palette, img12_slice0, img12_slice1
  dw img12_slice2, img12_slice3, img12_slice4, img12_slice5
  dw img12_slice6
image13_ptrs
  dw img13_descr, img13_palette, img13_slice0, img13_slice1
  dw img13_slice2, img13_slice3, img13_slice4, img13_slice5
  dw img13_slice6
image14_ptrs
  dw img14_descr, img14_palette, img14_slice0, img14_slice1
  dw img14_slice2, img14_slice3, img14_slice4, img14_slice5
  dw img14_slice6
image15_ptrs
  dw img15_descr, img15_palette, img15_slice0, img15_slice1
  dw img15_slice2, img15_slice3, img15_slice4, img15_slice5
  dw img15_slice6
image16_ptrs
  dw img16_descr, img16_palette, img16_slice0, img16_slice1
  dw img16_slice2, img16_slice3, img16_slice4, img16_slice5
  dw img16_slice6
image17_ptrs
  dw img17_descr, img17_palette, img17_slice0, img17_slice1
  dw img17_slice2, img17_slice3, img17_slice4, img17_slice5
  dw img17_slice6
image18_ptrs
  dw img18_descr, img18_palette, img18_slice0, img18_slice1
  dw img18_slice2, img18_slice3, img18_slice4, img18_slice5
  dw img18_slice6
image19_ptrs
  dw img19_descr, img19_palette, img19_slice0, img19_slice1
  dw img19_slice2, img19_slice3, img19_slice4, img19_slice5
  dw img19_slice6
image20_ptrs
  dw img20_descr, img20_palette, img20_slice0, img20_slice1
  dw img20_slice2, img20_slice3, img20_slice4, img20_slice5
  dw img20_slice6
image21_ptrs
  dw img21_descr, img21_palette, img21_slice0, img21_slice1
  dw img21_slice2, img21_slice3, img21_slice4, img21_slice5
  dw img21_slice6
image22_ptrs
  dw img22_descr, img22_palette, img22_slice0, img22_slice1
  dw img22_slice2, img22_slice3, img22_slice4, img22_slice5
  dw img22_slice6
image23_ptrs
  dw img23_descr, img23_palette, img23_slice0, img23_slice1
  dw img23_slice2, img23_slice3, img23_slice4, img23_slice5
  dw img23_slice6
image24_ptrs
  dw img24_descr, img24_palette, img24_slice0, img24_slice1
  dw img24_slice2, img24_slice3, img24_slice4, img24_slice5
  dw img24_slice6
image25_ptrs
  dw img25_descr, img25_palette, img25_slice0, img25_slice1
  dw img25_slice2, img25_slice3, img25_slice4, img25_slice5
  dw img25_slice6

; for each image: description (24 bytes), background palette data
; (16 bytes), compressed NT & AT data in 7 slices

img0_descr
  db "           title  screen"
img0_palette
  hex 0f122730 0f132130 0f151930 0f0f0f0f
img0_slice0
  hex 02
  hex 80004b0287028002860702620261041b
  hex 020e026d026517
  hex 00
img0_slice1
  hex 02
  hex 0b0274020102503b02013d0201029a02
  hex a2040302bf029b0496029a02a2040302
  hex bf029b0496029a02a219020124030b
  hex 00
img0_slice2
  hex 03
  hex 0e02020103029702ac0234025f02bc01
  hex 029802ac023502540b1a020201030299
  hex 02a90239025702bc0102a502a8024202
  hex 580b1a020201231a020201230c02
  hex 00
img0_slice3
  hex 03
  hex 0e0202010b0235025402a70102b1025f
  hex 02b202ad071a0202010b0243025902a6
  hex 02d50236025302a302a8071a02020123
  hex 1a020201230c02
  hex 00
img0_slice4
  hex 03
  hex 0e0202010f02c202a402b702b602c102
  hex 5202ba02c3031a0202010f02c402a002
  hex b3024b02b502b402b902b0031a020201
  hex 231a02020102d802d204ce02d002d703
  hex 02d802d204ce02d002d70302d802d20c
  hex 02
  hex 00
img0_slice5
  hex 02
  hex 0d02013d02010b026c0102110210020e
  hex 0266026e0263021902651d02010b026f
  hex 010218020e021a02602502010b026101
  hex 02100261021802120263021713
  hex 00
img0_slice6
  hex 02
  hex 0d020103026502600261021002600102
  hex 12020e026502640210026e0211026002
  hex 6e0263021802651502012f1000105004
  hex 550215025502150a55020001020a0200
  hex 02440655040002080102440655025002
  hex 1002520212025412551005
  hex 00

img1_descr
  db "                 agender"
img1_palette
  hex 0f002930 0f0f0f0f 0f0f0f0f 0f0f0f0f
img1_slice0
  hex 00
  hex ff
  hex 00
img1_slice1
  hex 00
  hex 3f40088001
  hex 00
img1_slice2
  hex 2a
  hex 3fc003
  hex 00
img1_slice3
  hex cb
  hex 3f80024094
  hex 00
img1_slice4
  hex 03
  hex bf40c7
  hex 00
img1_slice5
  hex 01
  hex 7f40274000
  hex 00
img1_slice6
  hex 00
  hex ff
  hex 00

img2_descr
  db "              a-romantic"
img2_palette
  hex 0f002930 0f1a290f 0f0f0f0f 0f0f0f0f
img2_slice0
  hex 00
  hex 7f8001
  hex 00
img2_slice1
  hex 01
  hex 7f402b4002
  hex 00
img2_slice2
  hex 02
  hex bf4095
  hex 00
img2_slice3
  hex 03
  hex ff
  hex 00
img2_slice4
  hex cc
  hex 3fc001
  hex 00
img2_slice5
  hex 01
  hex 3f40228000
  hex 00
img2_slice6
  hex 00
  hex 8f105010554f
  hex 00

img3_descr
  db "                 asexual"
img3_palette
  hex 0f001430 0f0f0f0f 0f0f0f0f 0f0f0f0f
img3_slice0
  hex 00
  hex ff
  hex 00
img3_slice1
  hex 00
  hex ff
  hex 00
img3_slice2
  hex 01
  hex ff
  hex 00
img3_slice3
  hex 01
  hex 7f8003
  hex 00
img3_slice4
  hex 03
  hex ff
  hex 00
img3_slice5
  hex 02
  hex ff
  hex 00
img3_slice6
  hex 02
  hex 7f8000
  hex 00

img4_descr
  db "                  autism"
img4_palette
  hex 0f142937 0f212737 0f252c37 0f0f0f0f
img4_slice0
  hex 00
  hex 7f8003
  hex 00
img4_slice1
  hex 03
  hex ff
  hex 00
img4_slice2
  hex 03
  hex 8d02c50401080202ab0302c508010402
  hex 02ab1902c506010a0202ab02c50a0106
  hex 0202ab0b
  hex 00
img4_slice3
  hex 03
  hex 0b0401023f05029e040202780601023f
  hex 05029e040217040109029e0278060102
  hex 3f0904021704010902c50601023d02ab
  hex 090402170401025e0502c50601023d04
  hex 0202ab0502c604020b
  hex 00
img4_slice4
  hex 03
  hex 0b02481001023f029e1002029d190248
  hex 0c01023f03029e0c02029d8d
  hex 00
img4_slice5
  hex 03
  hex ff
  hex 00
img4_slice6
  hex 00
  hex 80033102800260045002900220030208
  hex 02020455020802020502040405020123
  hex 00

img5_descr
  db "                    bear"
img5_palette
  hex 0f071727 0f273037 0f00300f 0f0f0f0f
img5_slice0
  hex 00
  hex 7f8001
  hex 00
img5_slice1
  hex 02
  hex 04010226022502200213020102240228
  hex 2e01043702de020002e0020602370205
  hex 02dd2e3703028b029102830200027c03
  hex 028f028c2d020502140c00021529
  hex 00
img5_slice2
  hex 03
  hex 089302e2080002dc2c930302bb021601
  hex 0600020f3102c00207010400020f3702
  hex c80200020f31
  hex 00
img5_slice3
  hex 3c
  hex 0702df02db33800340d6
  hex 00
img5_slice4
  hex 02
  hex bf407d
  hex 00
img5_slice5
  hex 01
  hex 7f40274000
  hex 00
img5_slice6
  hex 00
  hex bf105510a510aa0f
  hex 00

img6_descr
  db "                bigender"
img6_palette
  hex 0f213033 0f142433 0f11210f 0f0f0f0f
img6_slice0
  hex 00
  hex 7f8001
  hex 00
img6_slice1
  hex 01
  hex 3f40378002
  hex 00
img6_slice2
  hex 93
  hex 3fc003
  hex 00
img6_slice3
  hex cb
  hex 3f80024094
  hex 00
img6_slice4
  hex 03
  hex bf40c7
  hex 00
img6_slice5
  hex 01
  hex 7f40923f
  hex 00
img6_slice6
  hex 00
  hex 80010f1050105510051f10a0100a
  hex 00

img7_descr
  db "                bisexual"
img7_palette
  hex 0f121315 0f0f0f0f 0f0f0f0f 0f0f0f0f
img7_slice0
  hex 00
  hex 7f8003
  hex 00
img7_slice1
  hex 03
  hex ff
  hex 00
img7_slice2
  hex 03
  hex bf40d4
  hex 00
img7_slice3
  hex 02
  hex ff
  hex 00
img7_slice4
  hex 88
  hex 3fc001
  hex 00
img7_slice5
  hex 01
  hex ff
  hex 00
img7_slice6
  hex 01
  hex 7f8000
  hex 00

img8_descr
  db "           demi-  sexual"
img8_palette
  hex 0f041030 0f0f0f0f 0f0f0f0f 0f0f0f0f
img8_slice0
  hex 00
  hex 7f021e3e0301021e3c03
  hex 00
img8_slice1
  hex 00
  hex 03021e3a0305021e380307021e360309
  hex 021e3403
  hex 00
img8_slice2
  hex 00
  hex 0b021e32030d021e30030f021e2e0311
  hex 021e2c03
  hex 00
img8_slice3
  hex 00
  hex 13021c2a0115021c280115020a280113
  hex 020a2a01
  hex 00
img8_slice4
  hex 00
  hex 11020b2c020f020b2e020d020b30020b
  hex 020b3202
  hex 00
img8_slice5
  hex 00
  hex 09020b340207020b360205020b380203
  hex 020b3a02
  hex 00
img8_slice6
  hex 00
  hex 01020b3c02020b3e027f
  hex 00

img9_descr
  db "             gay     men"
img9_palette
  hex 0f122230 0f03120f 0f1b2b30 0f0b1b0f
img9_slice0
  hex 00
  hex 7f8001
  hex 00
img9_slice1
  hex 01
  hex 3f40377f
  hex 00
img9_slice2
  hex 29
  hex 3fc002
  hex 00
img9_slice3
  hex 9c
  hex 3f800340d6
  hex 00
img9_slice4
  hex 02
  hex bf407d
  hex 00
img9_slice5
  hex 01
  hex 7f40923f
  hex 00
img9_slice6
  hex 00
  hex 80010f10f010af10aa100a0f10501005
  hex 00

img10_descr
  db "         gender-   fluid"
img10_palette
  hex 0f142530 0f020f0f 0f0f0f0f 0f0f0f0f
img10_slice0
  hex 00
  hex 7f8002
  hex 00
img10_slice1
  hex 02
  hex 7f40944003
  hex 00
img10_slice2
  hex 03
  hex bf40d3
  hex 00
img10_slice3
  hex 01
  hex ff
  hex 00
img10_slice4
  hex 23
  hex 3fc000
  hex 00
img10_slice5
  hex 00
  hex 3f40098001
  hex 00
img10_slice6
  hex 01
  hex 7f600010551005
  hex 00

img11_descr
  db "         gender-   queer"
img11_palette
  hex 0f131930 0f0f0f0f 0f0f0f0f 0f0f0f0f
img11_slice0
  hex 00
  hex 7f8001
  hex 00
img11_slice1
  hex 01
  hex ff
  hex 00
img11_slice2
  hex 01
  hex 7f8003
  hex 00
img11_slice3
  hex 03
  hex ff
  hex 00
img11_slice4
  hex 03
  hex 7f8002
  hex 00
img11_slice5
  hex 02
  hex ff
  hex 00
img11_slice6
  hex 02
  hex 7f8000
  hex 00

img12_descr
  db "                intersex"
img12_palette
  hex 0f04280f 0f0f0f0f 0f0f0f0f 0f0f0f0f
img12_slice0
  hex 00
  hex 7f8002
  hex 00
img12_slice1
  hex 02
  hex ff
  hex 00
img12_slice2
  hex 02
  hex 59029002820401027f028e3102780201
  hex 022d0433022f0201025a2d027b020102
  hex 3d0702440201025d15
  hex 00
img12_slice3
  hex 02
  hex 15027102380b023a024d2b0201024f0b
  hex 027302012b0201024f0b027302012b02
  hex 67024c0b0270024915
  hex 00
img12_slice4
  hex 02
  hex 1502750201025a070278020102512d02
  hex 4402010256048d02770201023d310247
  hex 02300401022e024159
  hex 00
img12_slice5
  hex 02
  hex ff
  hex 00
img12_slice6
  hex 02
  hex 7f8000
  hex 00

img13_descr
  db "                 leather"
img13_palette
  hex 0f011530 0f0f0f0f 0f0f0f0f 0f0f0f0f
img13_slice0
  hex 00
  hex cb020b0402020d2b
  hex 00
img13_slice1
  hex 02
  hex 0a0402d90702da2a040a010b3001023d
  hex 0d2a01042302e10f2a23
  hex 00
img13_slice2
  hex 02
  hex 0400112e00112a000401025a0f300102
  hex 5a0d2a01
  hex 00
img13_slice3
  hex 32
  hex 3f800340cc
  hex 00
img13_slice4
  hex 01
  hex 7f8000
  hex 00
img13_slice5
  hex 04
  hex 3f80014023
  hex 00
img13_slice6
  hex 00
  hex ff
  hex 00

img14_descr
  db "         lesbian5stripes"
img14_palette
  hex 0f242730 0f14240f 0f17270f 0f0f0f0f
img14_slice0
  hex 00
  hex 7f8001
  hex 00
img14_slice1
  hex 01
  hex 7f402b4002
  hex 00
img14_slice2
  hex 02
  hex bf4095
  hex 00
img14_slice3
  hex 03
  hex ff
  hex 00
img14_slice4
  hex cc
  hex 3fc001
  hex 00
img14_slice5
  hex 02
  hex 3f40858001
  hex 00
img14_slice6
  hex 00
  hex 80010f10a010aa2f10551005
  hex 00

img15_descr
  db "         lesbian7stripes"
img15_palette
  hex 0f142430 0f04140f 0f071727 0f27300f
img15_slice0
  hex 00
  hex 7f8001
  hex 00
img15_slice1
  hex 01
  hex 3f40378002
  hex 00
img15_slice2
  hex 93
  hex 3fc003
  hex 00
img15_slice3
  hex 3b
  hex 3f4002400340d6
  hex 00
img15_slice4
  hex 02
  hex bf407d
  hex 00
img15_slice5
  hex 01
  hex 7f40923f
  hex 00
img15_slice6
  hex 00
  hex 80010f10a020aa100f0f10501005
  hex 00

img16_descr
  db "            non-  binary"
img16_palette
  hex 0f132830 0f0f0f0f 0f0f0f0f 0f0f0f0f
img16_slice0
  hex 00
  hex 7f8002
  hex 00
img16_slice1
  hex 02
  hex ff
  hex 00
img16_slice2
  hex 03
  hex ff
  hex 00
img16_slice3
  hex 03
  hex 7f8001
  hex 00
img16_slice4
  hex 01
  hex ff
  hex 00
img16_slice5
  hex 00
  hex ff
  hex 00
img16_slice6
  hex 00
  hex ff
  hex 00

img17_descr
  db "            pan-  sexual"
img17_palette
  hex 0f152128 0f0f0f0f 0f0f0f0f 0f0f0f0f
img17_slice0
  hex 00
  hex 7f8001
  hex 00
img17_slice1
  hex 01
  hex ff
  hex 00
img17_slice2
  hex 01
  hex 7f8003
  hex 00
img17_slice3
  hex 03
  hex ff
  hex 00
img17_slice4
  hex 03
  hex 7f8002
  hex 00
img17_slice5
  hex 02
  hex ff
  hex 00
img17_slice6
  hex 02
  hex 7f8000
  hex 00

img18_descr
  db "           poly-   amory"
img18_palette
  hex 0f021528 0f0f0f0f 0f0f0f0f 0f0f0f0f
img18_slice0
  hex 00
  hex 7f8001
  hex 00
img18_slice1
  hex 01
  hex ff
  hex 00
img18_slice2
  hex 01
  hex 7f8002
  hex 00
img18_slice3
  hex 02
  hex 19029f02cf02d102cf02d102b83502a1
  hex 0102a13902aa0102aa3902bd0102be1d
  hex 00
img18_slice4
  hex 02
  hex 7f8000
  hex 00
img18_slice5
  hex 00
  hex ff
  hex 00
img18_slice6
  hex 00
  hex ff
  hex 00

img19_descr
  db "           poly-  sexual"
img19_palette
  hex 0f14212b 0f0f0f0f 0f0f0f0f 0f0f0f0f
img19_slice0
  hex 00
  hex 7f8001
  hex 00
img19_slice1
  hex 01
  hex ff
  hex 00
img19_slice2
  hex 01
  hex 7f8003
  hex 00
img19_slice3
  hex 03
  hex ff
  hex 00
img19_slice4
  hex 03
  hex 7f8002
  hex 00
img19_slice5
  hex 02
  hex ff
  hex 00
img19_slice6
  hex 02
  hex 7f8000
  hex 00

img20_descr
  db "         rainbow6stripes"
img20_palette
  hex 0f121619 0f042728 0f0f0f0f 0f0f0f0f
img20_slice0
  hex 00
  hex 7f8002
  hex 00
img20_slice1
  hex 02
  hex ff
  hex 00
img20_slice2
  hex 02
  hex 7f8003
  hex 00
img20_slice3
  hex 03
  hex ff
  hex 00
img20_slice4
  hex 03
  hex 7f8001
  hex 00
img20_slice5
  hex 01
  hex ff
  hex 00
img20_slice6
  hex 00
  hex 80011f1050105510050f10501005
  hex 00

img21_descr
  db "         rainbow7stripes"
img21_palette
  hex 0f19282c 0f03042c 0f162728 0f0f0f0f
img21_slice0
  hex 00
  hex 7f8001
  hex 00
img21_slice1
  hex 01
  hex 3f40378002
  hex 00
img21_slice2
  hex 93
  hex 3f40038002
  hex 00
img21_slice3
  hex 85
  hex 3f8001402c
  hex 00
img21_slice4
  hex 03
  hex bf40c7
  hex 00
img21_slice5
  hex 01
  hex 7f40314002
  hex 00
img21_slice6
  hex 00
  hex 80020f10a010aa100a0f105010551005
  hex 00

img22_descr
  db "         rainbow8stripes"
img22_palette
  hex 0f192c0f 0f27280f 0f03040f 0f16250f
img22_slice0
  hex 00
  hex 7f8002
  hex 00
img22_slice1
  hex 02
  hex 3fc001
  hex 00
img22_slice2
  hex 01
  hex bf4002
  hex 00
img22_slice3
  hex 02
  hex 7f8001
  hex 00
img22_slice4
  hex 01
  hex 3fc002
  hex 00
img22_slice5
  hex 01
  hex bf4002
  hex 00
img22_slice6
  hex 00
  hex 80020f10f010ff105510050f10aa100a
  hex 00

img23_descr
  db "         rainbowprogress"
img23_palette
  hex 0f212528 0f252730 0f041219 0f081621
img23_slice0
  hex 00
  hex 7f02ae0201021f01021d3602020302ae
  hex 0201021f01021d3402
  hex 00
img23_slice1
  hex 01
  hex 02680102ae01021f0200021d34020268
  hex 020302ae01021f0200021d300202ae01
  hex 02680102ae01021f0200021d2e020203
  hex 02ae02020268020302ae01021f020002
  hex 1d2c02
  hex 00
img23_slice2
  hex ae
  hex 040301020102680201010201021f0200
  hex 021d2a02060301020202680203010201
  hex 021f0200021d28020803010201026802
  hex 01010201021f0200021e300301020202
  hex 680203010201021f0200021e2403
  hex 00
img23_slice3
  hex 01
  hex 0c0302ae0102680102ae01021f020002
  hex 1e300302ae02020268020302ae01021f
  hex 0200021e2e0302c902020284020302c9
  hex 0102210200020c2c0302c90102840102
  hex c90102210200020c2203
  hex 00
img23_slice4
  hex c9
  hex 0a030102020284020301020102210200
  hex 020c2c03010201028402010102010221
  hex 0200020c2c0301020202840203010201
  hex 02210200020b28020403010201028402
  hex 0101020102210200020b2a02
  hex 00
img23_slice5
  hex 01
  hex 020302c902020284020302c901022102
  hex 00020b2c0202c90102840102c9010221
  hex 0200020b30020284020302c901022102
  hex 00020a2f02840102c90102210200020a
  hex 31
  hex 00
img23_slice6
  hex 01
  hex 020302c90102210200020a3302c90102
  hex 210200020a35100010f0021c02ff0c5f
  hex 0255021c02f70a05045502cc02b308a0
  hex 025502c102bf0aaa02c102bf0caa020f
  hex 0e0a
  hex 00

img24_descr
  db " rainbowprogressintersex"
img24_palette
  hex 0f042830 0f212530 0f121927 0f081621
img24_slice0
  hex 02
  hex 800002af010268020102ae0201021f02
  hex 00021d2d020302af010268020302ae02
  hex 01021f0200021d2b
  hex 00
img24_slice1
  hex 03
  hex 02ab0102af02020268020102ae020102
  hex 1f0200021d2c0202ab0102af02020268
  hex 0102ae0201021f0200021d2c0202ab01
  hex 02af02020268020102ae0201021f0200
  hex 021e25060202ab0102af020202680102
  hex ae0201021f0200021e23
  hex 00
img24_slice2
  hex 02
  hex 0702ab020302af010268020102ae0201
  hex 021f0200021e22030902ab020302af01
  hex 0268020302ae0201021f0200021e2003
  hex 0b02ab020302af010268020102ae0201
  hex 021f0200021d21028a0281027e028901
  hex 02ab020302af010268020302ae020102
  hex 1f0200021d1b
  hex 00
img24_slice3
  hex 02
  hex 0102790240030246025b0102ab020302
  hex af010268020102ae0201021f0200021d
  hex 1b026b07024a0302ab020302af010268
  hex 020302ae0201021f0200021d19026a07
  hex 026903029d020302ca010284020302c9
  hex 020102210200020b190272025c03027a
  hex 024e01029d020302ca010284020102c9
  hex 020102210200020b19
  hex 00
img24_slice4
  hex 02
  hex 03024502550276023e01029d020302ca
  hex 010284020302c9020102210200020b27
  hex 029d020302ca010284020102c9020102
  hex 210200020b27029d020302ca01028402
  hex 0302c9020102210200020a200107029d
  hex 020302ca010284020102c90201022102
  hex 00020a2201
  hex 00
img24_slice5
  hex 01
  hex 0602029d020302ca02020284020302c9
  hex 0102210200020a230402029d020302ca
  hex 020202840102c90102210200020a2502
  hex 02029d020302ca02020284020302c901
  hex 02210200020a27029d020302ca020202
  hex 840102c90102210200020a29
  hex 00
img24_slice6
  hex 00
  hex 020302ca02020284020302c902010221
  hex 01020a2c0102ca02020284020102c902
  hex 01022101020a2e010f02500ef0020402
  hex 5d02ff0aaf010204025d02fb080a0302
  hex 4402dd02b306a001024002d502bf08aa
  hex 024002d5023f0a0a0205020f0b
  hex 00

img25_descr
  db "          trans-  gender"
img25_palette
  hex 0f212530 0f0f0f0f 0f0f0f0f 0f0f0f0f
img25_slice0
  hex 00
  hex 7f8001
  hex 00
img25_slice1
  hex 01
  hex 7f402b4002
  hex 00
img25_slice2
  hex 02
  hex bf4095
  hex 00
img25_slice3
  hex 03
  hex ff
  hex 00
img25_slice4
  hex cd
  hex 3fc002
  hex 00
img25_slice5
  hex 02
  hex 3f40858001
  hex 00
img25_slice6
  hex 01
  hex 7f8000
  hex 00

