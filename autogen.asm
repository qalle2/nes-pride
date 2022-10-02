; Image data excluding pattern tables.
; This file was generated automatically by convert.py.

image_count     equ 15  ; number of images

image_names     ; descriptions (8 bytes/image)
                db "aaatitle"
                db "aromanti"
                db "    asex"
                db "   bisex"
                db "  gaymen"
                db "gndrquer"
                db "intersex"
                db " lesbian"
                db "nonbinar"
                db "  pansex"
                db " polysex"
                db "rainbow1"
                db "rainbow2"
                db "rainbow3"
                db "trnsgndr"

bg_palettes     ; background palette data (16 bytes/image)
                hex 0f1519250f1225280f1321300f25300f
                hex 0f0029300f1a290f0f0f0f0f0f0f0f0f
                hex 0f0014300f0f0f0f0f0f0f0f0f0f0f0f
                hex 0f1213150f0f0f0f0f0f0f0f0f0f0f0f
                hex 0f0b121c0f22303a0f010f0f0f0f0f0f
                hex 0f1319300f0f0f0f0f0f0f0f0f0f0f0f
                hex 0f13280f0f0f0f0f0f0f0f0f0f0f0f0f
                hex 0f2527300f14250f0f16270f0f0f0f0f
                hex 0f1328300f0f0f0f0f0f0f0f0f0f0f0f
                hex 0f1521280f0f0f0f0f0f0f0f0f0f0f0f
                hex 0f14212b0f0f0f0f0f0f0f0f0f0f0f0f
                hex 0f1627280f1213190f0f0f0f0f0f0f0f
                hex 0f1627280f2125300f1213190f08210f
                hex 0f1328300f2125300f0821270f121619
                hex 0f2125300f0f0f0f0f0f0f0f0f0f0f0f

                ; addresses in RLE compressed name & attribute table data
nt_at_addrs_lo  ; low bytes
                dl img0_slice0
                dl img0_slice1
                dl img0_slice2
                dl img0_slice3
                dl img0_slice4
                dl img0_slice5
                dl img0_slice6
                dl img0_slice7
                dl img1_slice0
                dl img1_slice1
                dl img1_slice2
                dl img1_slice3
                dl img1_slice4
                dl img1_slice5
                dl img1_slice6
                dl img1_slice7
                dl img2_slice0
                dl img2_slice1
                dl img2_slice2
                dl img2_slice3
                dl img2_slice4
                dl img2_slice5
                dl img2_slice6
                dl img2_slice7
                dl img3_slice0
                dl img3_slice1
                dl img3_slice2
                dl img3_slice3
                dl img3_slice4
                dl img3_slice5
                dl img3_slice6
                dl img3_slice7
                dl img4_slice0
                dl img4_slice1
                dl img4_slice2
                dl img4_slice3
                dl img4_slice4
                dl img4_slice5
                dl img4_slice6
                dl img4_slice7
                dl img5_slice0
                dl img5_slice1
                dl img5_slice2
                dl img5_slice3
                dl img5_slice4
                dl img5_slice5
                dl img5_slice6
                dl img5_slice7
                dl img6_slice0
                dl img6_slice1
                dl img6_slice2
                dl img6_slice3
                dl img6_slice4
                dl img6_slice5
                dl img6_slice6
                dl img6_slice7
                dl img7_slice0
                dl img7_slice1
                dl img7_slice2
                dl img7_slice3
                dl img7_slice4
                dl img7_slice5
                dl img7_slice6
                dl img7_slice7
                dl img8_slice0
                dl img8_slice1
                dl img8_slice2
                dl img8_slice3
                dl img8_slice4
                dl img8_slice5
                dl img8_slice6
                dl img8_slice7
                dl img9_slice0
                dl img9_slice1
                dl img9_slice2
                dl img9_slice3
                dl img9_slice4
                dl img9_slice5
                dl img9_slice6
                dl img9_slice7
                dl img10_slice0
                dl img10_slice1
                dl img10_slice2
                dl img10_slice3
                dl img10_slice4
                dl img10_slice5
                dl img10_slice6
                dl img10_slice7
                dl img11_slice0
                dl img11_slice1
                dl img11_slice2
                dl img11_slice3
                dl img11_slice4
                dl img11_slice5
                dl img11_slice6
                dl img11_slice7
                dl img12_slice0
                dl img12_slice1
                dl img12_slice2
                dl img12_slice3
                dl img12_slice4
                dl img12_slice5
                dl img12_slice6
                dl img12_slice7
                dl img13_slice0
                dl img13_slice1
                dl img13_slice2
                dl img13_slice3
                dl img13_slice4
                dl img13_slice5
                dl img13_slice6
                dl img13_slice7
                dl img14_slice0
                dl img14_slice1
                dl img14_slice2
                dl img14_slice3
                dl img14_slice4
                dl img14_slice5
                dl img14_slice6
                dl img14_slice7
nt_at_addrs_hi  ; high bytes
                dh img0_slice0
                dh img0_slice1
                dh img0_slice2
                dh img0_slice3
                dh img0_slice4
                dh img0_slice5
                dh img0_slice6
                dh img0_slice7
                dh img1_slice0
                dh img1_slice1
                dh img1_slice2
                dh img1_slice3
                dh img1_slice4
                dh img1_slice5
                dh img1_slice6
                dh img1_slice7
                dh img2_slice0
                dh img2_slice1
                dh img2_slice2
                dh img2_slice3
                dh img2_slice4
                dh img2_slice5
                dh img2_slice6
                dh img2_slice7
                dh img3_slice0
                dh img3_slice1
                dh img3_slice2
                dh img3_slice3
                dh img3_slice4
                dh img3_slice5
                dh img3_slice6
                dh img3_slice7
                dh img4_slice0
                dh img4_slice1
                dh img4_slice2
                dh img4_slice3
                dh img4_slice4
                dh img4_slice5
                dh img4_slice6
                dh img4_slice7
                dh img5_slice0
                dh img5_slice1
                dh img5_slice2
                dh img5_slice3
                dh img5_slice4
                dh img5_slice5
                dh img5_slice6
                dh img5_slice7
                dh img6_slice0
                dh img6_slice1
                dh img6_slice2
                dh img6_slice3
                dh img6_slice4
                dh img6_slice5
                dh img6_slice6
                dh img6_slice7
                dh img7_slice0
                dh img7_slice1
                dh img7_slice2
                dh img7_slice3
                dh img7_slice4
                dh img7_slice5
                dh img7_slice6
                dh img7_slice7
                dh img8_slice0
                dh img8_slice1
                dh img8_slice2
                dh img8_slice3
                dh img8_slice4
                dh img8_slice5
                dh img8_slice6
                dh img8_slice7
                dh img9_slice0
                dh img9_slice1
                dh img9_slice2
                dh img9_slice3
                dh img9_slice4
                dh img9_slice5
                dh img9_slice6
                dh img9_slice7
                dh img10_slice0
                dh img10_slice1
                dh img10_slice2
                dh img10_slice3
                dh img10_slice4
                dh img10_slice5
                dh img10_slice6
                dh img10_slice7
                dh img11_slice0
                dh img11_slice1
                dh img11_slice2
                dh img11_slice3
                dh img11_slice4
                dh img11_slice5
                dh img11_slice6
                dh img11_slice7
                dh img12_slice0
                dh img12_slice1
                dh img12_slice2
                dh img12_slice3
                dh img12_slice4
                dh img12_slice5
                dh img12_slice6
                dh img12_slice7
                dh img13_slice0
                dh img13_slice1
                dh img13_slice2
                dh img13_slice3
                dh img13_slice4
                dh img13_slice5
                dh img13_slice6
                dh img13_slice7
                dh img14_slice0
                dh img14_slice1
                dh img14_slice2
                dh img14_slice3
                dh img14_slice4
                dh img14_slice5
                dh img14_slice6
                dh img14_slice7

                ; RLE compressed name & attribute table data
                ; (each slice decompresses into exactly $80 bytes)
img0_slice0
                hex 0257025402530411020a025f02559900
img0_slice1
                hex 020902780201027439060139025b0201
                hex 023b3b02013100
img0_slice2
                hex 030c020201013c020201011e011e0202
                hex 0105029c0202023e0102660202028b01
                hex 02320502011e02020105029302020246
                hex 0102660202028f01024e050201120200
img0_slice3
                hex 020b02010a03070c0302011d02010a03
                hex 02310102930102910203029506030201
                hex 1d02010a03024b01029401024c020302
                hex 8e060302011d02010a03070c03020111
                hex 00
img0_slice4
                hex 020b02010e0302960203024701029202
                hex 0302970102011d02010e03029b020302
                hex 4801024d020302980102011d02010203
                hex 1e011d020102032f00
img0_slice5
                hex 020b02013d02013d02013d02013100
img0_slice6
                hex 020b02013d02013d020107025e010260
                hex 01025502520253020c02522302013100
img0_slice7
                hex 007f24aa044f020f02cf08aa01025501
                hex 02cc08aa04f002f102fd24aa0f00
img1_slice0
                hex 01ff00
img1_slice1
                hex 013f4025800200
img1_slice2
                hex 02bf408900
img1_slice3
                hex 03ff00
img1_slice4
                hex 0140a3bf00
img1_slice5
                hex 008001401a3f00
img1_slice6
                hex 00ff00
img1_slice7
                hex 007f105510055f00
img2_slice0
                hex 00ff00
img2_slice1
                hex 00bf400100
img2_slice2
                hex 01ff00
img2_slice3
                hex 017f800300
img2_slice4
                hex 03ff00
img2_slice5
                hex 024003bf00
img2_slice6
                hex 02ff00
img2_slice7
                hex 00ff00
img3_slice0
                hex 03ff00
img3_slice1
                hex 03ff00
img3_slice2
                hex 03bf40a000
img3_slice3
                hex 02ff00
img3_slice4
                hex 014083bf00
img3_slice5
                hex 01ff00
img3_slice6
                hex 01ff00
img3_slice7
                hex 00ff00
img4_slice0
                hex 01ff00
img4_slice1
                hex 03ff00
img4_slice2
                hex 03ff00
img4_slice3
                hex 02ff00
img4_slice4
                hex 01ff00
img4_slice5
                hex 02ff00
img4_slice6
                hex 01ff00
img4_slice7
                hex 009f30550f10aa0f00
img5_slice0
                hex 01ff00
img5_slice1
                hex 01ff00
img5_slice2
                hex 013f4029800300
img5_slice3
                hex 03ff00
img5_slice4
                hex 02800340a23f00
img5_slice5
                hex 02ff00
img5_slice6
                hex 02ff00
img5_slice7
                hex 00ff00
img6_slice0
                hex 02ff00
img6_slice1
                hex 02ff00
img6_slice2
                hex 02590281027602560236027202803102
                hex 7702010220022602270223020102732d
                hex 027902010230070235020102751500
img6_slice3
                hex 02150264022a0b022c02412b02570242
                hex 0b026502372b021f02440b0268021e2b
                hex 025a02400b0263023a1500
img6_slice4
                hex 0215026a0201025007026f020102452d
                hex 023302010249027e027f026c0201022e
                hex 31025c0224021d021c0221023c5900
img6_slice5
                hex 02ff00
img6_slice6
                hex 02ff00
img6_slice7
                hex 00ff00
img7_slice0
                hex 01ff00
img7_slice1
                hex 013f4025800200
img7_slice2
                hex 02bf408900
img7_slice3
                hex 03ff00
img7_slice4
                hex 0140a3bf00
img7_slice5
                hex 017f407d3f00
img7_slice6
                hex 01ff00
img7_slice7
                hex 007f10aa100a2f105010550f00
img8_slice0
                hex 02ff00
img8_slice1
                hex 02bf400300
img8_slice2
                hex 03ff00
img8_slice3
                hex 0180037f00
img8_slice4
                hex 01ff00
img8_slice5
                hex 004001bf00
img8_slice6
                hex 00ff00
img8_slice7
                hex 00ff00
img9_slice0
                hex 01ff00
img9_slice1
                hex 01ff00
img9_slice2
                hex 013f4029800300
img9_slice3
                hex 03ff00
img9_slice4
                hex 02800340a23f00
img9_slice5
                hex 02ff00
img9_slice6
                hex 02ff00
img9_slice7
                hex 00ff00
img10_slice0
                hex 01ff00
img10_slice1
                hex 01ff00
img10_slice2
                hex 013f4029800300
img10_slice3
                hex 03ff00
img10_slice4
                hex 02800340a23f00
img10_slice5
                hex 02ff00
img10_slice6
                hex 02ff00
img10_slice7
                hex 00ff00
img11_slice0
                hex 01ff00
img11_slice1
                hex 024025bf00
img11_slice2
                hex 023f4086800300
img11_slice3
                hex 03ff00
img11_slice4
                hex 01800340a13f00
img11_slice5
                hex 01bf402800
img11_slice6
                hex 02ff00
img11_slice7
                hex 00af105030550f00
img12_slice0
                hex 01025b0302180204040002122f020202
                hex 5b03021802040400021231025b030218
                hex 0204040002122b0222010202025b0302
                hex 180204040002122900
img12_slice1
                hex 01026b022203025b0302180204040002
                hex a728250202026b0222010202025b0302
                hex 180204040002132a02026b022203025b
                hex 0302180204040002132402028a040202
                hex 6b0222010202025b0302180204040002
                hex 13220200
img12_slice2
                hex 010203028a0402026b022203025b0302
                hex 1802040400021320020403028a040202
                hex 6b0222010202025b0302180204040002
                hex a81e860603028a0402026b022203025b
                hex 0302180204040002142403028a040202
                hex 6b0222010202025b0302180204040002
                hex 141a0300
img12_slice3
                hex 010a03028a0402026b022203025b0302
                hex 180204040002142403028a0402026b02
                hex 22010202025b03021802040400021422
                hex 03029d04020282026201020202780302
                hex 1b0216040002082003029d0402028202
                hex 6203027803021b021604000208180300
img12_slice4
                hex 010803029d0402028202620102020278
                hex 03021b0216040002082003029d040202
                hex 82026203027803021b02160400020820
                hex 03029d04020282026201020202780302
                hex 1b0216040002a61ea10203029d040202
                hex 82026203027803021b0216040002061f
                hex 00
img12_slice5
                hex 01029d04020282026201020202780302
                hex 1b021604000206210402028202620302
                hex 7803021b021604000206230202028202
                hex 62010202027803021b02160400020625
                hex 0282026203027803021b0216040002a5
                hex 282800
img12_slice6
                hex 010262010202027803021b0216040002
                hex 072a0203027803021b0216040002072e
                hex 02027803021b0216040002072e020278
                hex 03021b021604000207300200
img12_slice7
                hex 007f02df02f30b025502df02f3090455
                hex 02df02f307065502ff02b306a0045502
                hex fd02bf08aa025502fd02bf0aaa02fd02
                hex bf0caa0f00
img13_slice0
                hex 020302900203028801022c0201022c02
                hex 0102050200027a29028c0203029a0102
                hex 6902010269020102170200020d2b0290
                hex 0203028801022c01022c020102050200
                hex 027a29028c0203029a01026901026902
                hex 0102170200020d2300
img13_slice1
                hex 020702900203028801022c0201022c02
                hex 0102050200027a29028c0203029a0102
                hex 6902010269020102170200020d2b0290
                hex 0203028801022c01022c020102050200
                hex 029f200309028c0203029a0102690102
                hex 69020102170200020e200300
img13_slice2
                hex 020b02900203028801022c0201022c02
                hex 0102050200029f1e030b028c0203029a
                hex 01026902010269020102170200020e1e
                hex 030d02900203028801022c01022c0201
                hex 02050200027a1d0285027c0261023f02
                hex 7b0284028c0203029a01026901026902
                hex 0102170200020d1b00
img13_slice3
                hex 0201026d022f025102710234024a0102
                hex 900203028801022c0201022c02010205
                hex 0200027a1b0258025103027102380102
                hex 8c0203029a0102690201026902010217
                hex 0200020d1b0239028403028502590102
                hex 870203029e0102700201027002010219
                hex 0200020b1a0301025d024f0284028502
                hex 6e023d01028d02030299010263020102
                hex 6302010215020002101a0300
img13_slice4
                hex 02010271022d02430267022b02510287
                hex 0203029e010270010270020102190200
                hex 020b1c030d028d020302990102630102
                hex 6302010215020002101c030b02870203
                hex 029e0102700201027002010219020002
                hex 091e010b028d02030299010263020102
                hex 63020102150200020f1e0100
img13_slice5
                hex 010a0202870203029e02020270020202
                hex 70010219020002091f0a02028d020302
                hex 9902020263020202630102150200020f
                hex 1f080202870203029e02020270010270
                hex 01021902000209210802028d02030299
                hex 020202630102630102150200020f2100
img13_slice6
                hex 01060202870203029e02020270020202
                hex 7001021902000209230602028d020302
                hex 9902020263020202630102150200020f
                hex 23040202870203029e02020270010270
                hex 01021902000209250402028d02030299
                hex 020202630102630102150200020f2500
img13_slice7
                hex 0081025502aa0aff010244029902ae08
                hex af03025502aa080a030244029902e206
                hex f003025502aa08ff0102440299022e08
                hex 0f01025502aa1900
img14_slice0
                hex 01ff00
img14_slice1
                hex 013f4025800200
img14_slice2
                hex 02bf408900
img14_slice3
                hex 03ff00
img14_slice4
                hex 0240a4bf00
img14_slice5
                hex 018002407d3f00
img14_slice6
                hex 01ff00
img14_slice7
                hex 00ff00
