; This file was generated automatically by convert.py.

image_count     equ 15  ; number of images

image_names     ; descriptions (exactly 8 bytes/image)
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
                hex 0f151925 0f122528 0f132130 0f25300f
                hex 0f002930 0f1a290f 0f0f0f0f 0f0f0f0f
                hex 0f001430 0f0f0f0f 0f0f0f0f 0f0f0f0f
                hex 0f121315 0f0f0f0f 0f0f0f0f 0f0f0f0f
                hex 0f0b121c 0f22303a 0f010f0f 0f0f0f0f
                hex 0f131930 0f0f0f0f 0f0f0f0f 0f0f0f0f
                hex 0f13280f 0f0f0f0f 0f0f0f0f 0f0f0f0f
                hex 0f252730 0f14250f 0f16270f 0f0f0f0f
                hex 0f132830 0f0f0f0f 0f0f0f0f 0f0f0f0f
                hex 0f152128 0f0f0f0f 0f0f0f0f 0f0f0f0f
                hex 0f14212b 0f0f0f0f 0f0f0f0f 0f0f0f0f
                hex 0f162728 0f121319 0f0f0f0f 0f0f0f0f
                hex 0f162728 0f212530 0f121319 0f08210f
                hex 0f132830 0f212530 0f082127 0f121619
                hex 0f212530 0f0f0f0f 0f0f0f0f 0f0f0f0f

nt_at_addrses   ; addresses in RLE compressed name & attribute table data
                dw img0_slice0
                dw img0_slice1
                dw img0_slice2
                dw img0_slice3
                dw img0_slice4
                dw img0_slice5
                dw img0_slice6
                dw img0_slice7
                dw img1_slice0
                dw img1_slice1
                dw img1_slice2
                dw img1_slice3
                dw img1_slice4
                dw img1_slice5
                dw img1_slice6
                dw img1_slice7
                dw img2_slice0
                dw img2_slice1
                dw img2_slice2
                dw img2_slice3
                dw img2_slice4
                dw img2_slice5
                dw img2_slice6
                dw img2_slice7
                dw img3_slice0
                dw img3_slice1
                dw img3_slice2
                dw img3_slice3
                dw img3_slice4
                dw img3_slice5
                dw img3_slice6
                dw img3_slice7
                dw img4_slice0
                dw img4_slice1
                dw img4_slice2
                dw img4_slice3
                dw img4_slice4
                dw img4_slice5
                dw img4_slice6
                dw img4_slice7
                dw img5_slice0
                dw img5_slice1
                dw img5_slice2
                dw img5_slice3
                dw img5_slice4
                dw img5_slice5
                dw img5_slice6
                dw img5_slice7
                dw img6_slice0
                dw img6_slice1
                dw img6_slice2
                dw img6_slice3
                dw img6_slice4
                dw img6_slice5
                dw img6_slice6
                dw img6_slice7
                dw img7_slice0
                dw img7_slice1
                dw img7_slice2
                dw img7_slice3
                dw img7_slice4
                dw img7_slice5
                dw img7_slice6
                dw img7_slice7
                dw img8_slice0
                dw img8_slice1
                dw img8_slice2
                dw img8_slice3
                dw img8_slice4
                dw img8_slice5
                dw img8_slice6
                dw img8_slice7
                dw img9_slice0
                dw img9_slice1
                dw img9_slice2
                dw img9_slice3
                dw img9_slice4
                dw img9_slice5
                dw img9_slice6
                dw img9_slice7
                dw img10_slice0
                dw img10_slice1
                dw img10_slice2
                dw img10_slice3
                dw img10_slice4
                dw img10_slice5
                dw img10_slice6
                dw img10_slice7
                dw img11_slice0
                dw img11_slice1
                dw img11_slice2
                dw img11_slice3
                dw img11_slice4
                dw img11_slice5
                dw img11_slice6
                dw img11_slice7
                dw img12_slice0
                dw img12_slice1
                dw img12_slice2
                dw img12_slice3
                dw img12_slice4
                dw img12_slice5
                dw img12_slice6
                dw img12_slice7
                dw img13_slice0
                dw img13_slice1
                dw img13_slice2
                dw img13_slice3
                dw img13_slice4
                dw img13_slice5
                dw img13_slice6
                dw img13_slice7
                dw img14_slice0
                dw img14_slice1
                dw img14_slice2
                dw img14_slice3
                dw img14_slice4
                dw img14_slice5
                dw img14_slice6
                dw img14_slice7

                ; RLE compressed name & attribute table data
                ; (each slice decompresses into exactly $80 bytes)
img0_slice0
                hex 0257025402530411020a025f02559900
img0_slice1
                hex 020902780201027439060139025b0201023b3b02013100
img0_slice2
                hex 030c020201013c020201011e011e02020105029c0202023e0102660202028b01
                hex 02320502011e020201050293020202460102660202028f01024e050201120200
img0_slice3
                hex 020b02010a03070c0302011d02010a0302310102930102910203029506030201
                hex 1d02010a03024b01029401024c0203028e060302011d02010a03070c03020111
                hex 00
img0_slice4
                hex 020b02010e03029602030247010292020302970102011d02010e03029b020302
                hex 4801024d020302980102011d020102031e011d020102032f00
img0_slice5
                hex 020b02013d02013d02013d02013100
img0_slice6
                hex 020b02013d02013d020107025e01026001025502520253020c02522302013100
img0_slice7
                hex 007f24aa044f020f02cf08aa0102550102cc08aa04f002f102fd24aa0f00
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
                hex 025902810276025602360272028031027702010220022602270223020102732d
                hex 027902010230070235020102751500
img6_slice3
                hex 02150264022a0b022c02412b025702420b026502372b021f02440b0268021e2b
                hex 025a02400b0263023a1500
img6_slice4
                hex 0215026a0201025007026f020102452d023302010249027e027f026c0201022e
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
                hex 01025b0302180204040002122f0202025b03021802040400021231025b030218
                hex 0204040002122b0222010202025b0302180204040002122900
img12_slice1
                hex 01026b022203025b0302180204040002a728250202026b0222010202025b0302
                hex 180204040002132a02026b022203025b0302180204040002132402028a040202
                hex 6b0222010202025b030218020404000213220200
img12_slice2
                hex 010203028a0402026b022203025b03021802040400021320020403028a040202
                hex 6b0222010202025b0302180204040002a81e860603028a0402026b022203025b
                hex 0302180204040002142403028a0402026b0222010202025b0302180204040002
                hex 141a0300
img12_slice3
                hex 010a03028a0402026b022203025b0302180204040002142403028a0402026b02
                hex 22010202025b0302180204040002142203029d04020282026201020202780302
                hex 1b0216040002082003029d04020282026203027803021b021604000208180300
img12_slice4
                hex 010803029d040202820262010202027803021b0216040002082003029d040202
                hex 82026203027803021b0216040002082003029d04020282026201020202780302
                hex 1b0216040002a61ea10203029d04020282026203027803021b0216040002061f
                hex 00
img12_slice5
                hex 01029d040202820262010202027803021b021604000206210402028202620302
                hex 7803021b02160400020623020202820262010202027803021b02160400020625
                hex 0282026203027803021b0216040002a5282800
img12_slice6
                hex 010262010202027803021b0216040002072a0203027803021b0216040002072e
                hex 02027803021b0216040002072e02027803021b021604000207300200
img12_slice7
                hex 007f02df02f30b025502df02f309045502df02f307065502ff02b306a0045502
                hex fd02bf08aa025502fd02bf0aaa02fd02bf0caa0f00
img13_slice0
                hex 020302900203028801022c0201022c020102050200027a29028c0203029a0102
                hex 6902010269020102170200020d2b02900203028801022c01022c020102050200
                hex 027a29028c0203029a010269010269020102170200020d2300
img13_slice1
                hex 020702900203028801022c0201022c020102050200027a29028c0203029a0102
                hex 6902010269020102170200020d2b02900203028801022c01022c020102050200
                hex 029f200309028c0203029a010269010269020102170200020e200300
img13_slice2
                hex 020b02900203028801022c0201022c020102050200029f1e030b028c0203029a
                hex 01026902010269020102170200020e1e030d02900203028801022c01022c0201
                hex 02050200027a1d0285027c0261023f027b0284028c0203029a01026901026902
                hex 0102170200020d1b00
img13_slice3
                hex 0201026d022f025102710234024a0102900203028801022c0201022c02010205
                hex 0200027a1b02580251030271023801028c0203029a0102690201026902010217
                hex 0200020d1b0239028403028502590102870203029e0102700201027002010219
                hex 0200020b1a0301025d024f02840285026e023d01028d02030299010263020102
                hex 6302010215020002101a0300
img13_slice4
                hex 02010271022d02430267022b025102870203029e010270010270020102190200
                hex 020b1c030d028d0203029901026301026302010215020002101c030b02870203
                hex 029e0102700201027002010219020002091e010b028d02030299010263020102
                hex 63020102150200020f1e0100
img13_slice5
                hex 010a0202870203029e0202027002020270010219020002091f0a02028d020302
                hex 9902020263020202630102150200020f1f080202870203029e02020270010270
                hex 01021902000209210802028d02030299020202630102630102150200020f2100
img13_slice6
                hex 01060202870203029e020202700202027001021902000209230602028d020302
                hex 9902020263020202630102150200020f23040202870203029e02020270010270
                hex 01021902000209250402028d02030299020202630102630102150200020f2500
img13_slice7
                hex 0081025502aa0aff010244029902ae08af03025502aa080a030244029902e206
                hex f003025502aa08ff0102440299022e080f01025502aa1900
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
