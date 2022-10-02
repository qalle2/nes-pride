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
                hex 02
                hex 57025402530411020a025f025599
                hex 00
img0_slice1
                hex 02
                hex 0902780201027439060139025b020102
                hex 3b3b020131
                hex 00
img0_slice2
                hex 03
                hex 0c020201013c020201011e011e020201
                hex 05029c0202023e0102660202028b0102
                hex 320502011e0202010502930202024601
                hex 02660202028f01024e0502011202
                hex 00
img0_slice3
                hex 02
                hex 0b02010a03070c0302011d02010a0302
                hex 3101029301029102030295060302011d
                hex 02010a03024b01029401024c0203028e
                hex 060302011d02010a03070c03020111
                hex 00
img0_slice4
                hex 02
                hex 0b02010e030296020302470102920203
                hex 02970102011d02010e03029b02030248
                hex 01024d020302980102011d020102031e
                hex 011d020102032f
                hex 00
img0_slice5
                hex 02
                hex 0b02013d02013d02013d020131
                hex 00
img0_slice6
                hex 02
                hex 0b02013d02013d020107025e01026001
                hex 025502520253020c025223020131
                hex 00
img0_slice7
                hex 00
                hex 7f24aa044f020f02cf08aa0102550102
                hex cc08aa04f002f102fd24aa0f
                hex 00
img1_slice0
                hex 01
                hex ff
                hex 00
img1_slice1
                hex 01
                hex 3f40258002
                hex 00
img1_slice2
                hex 02
                hex bf4089
                hex 00
img1_slice3
                hex 03
                hex ff
                hex 00
img1_slice4
                hex 01
                hex 40a3bf
                hex 00
img1_slice5
                hex 00
                hex 8001401a3f
                hex 00
img1_slice6
                hex 00
                hex ff
                hex 00
img1_slice7
                hex 00
                hex 7f105510055f
                hex 00
img2_slice0
                hex 00
                hex ff
                hex 00
img2_slice1
                hex 00
                hex bf4001
                hex 00
img2_slice2
                hex 01
                hex ff
                hex 00
img2_slice3
                hex 01
                hex 7f8003
                hex 00
img2_slice4
                hex 03
                hex ff
                hex 00
img2_slice5
                hex 02
                hex 4003bf
                hex 00
img2_slice6
                hex 02
                hex ff
                hex 00
img2_slice7
                hex 00
                hex ff
                hex 00
img3_slice0
                hex 03
                hex ff
                hex 00
img3_slice1
                hex 03
                hex ff
                hex 00
img3_slice2
                hex 03
                hex bf40a0
                hex 00
img3_slice3
                hex 02
                hex ff
                hex 00
img3_slice4
                hex 01
                hex 4083bf
                hex 00
img3_slice5
                hex 01
                hex ff
                hex 00
img3_slice6
                hex 01
                hex ff
                hex 00
img3_slice7
                hex 00
                hex ff
                hex 00
img4_slice0
                hex 01
                hex ff
                hex 00
img4_slice1
                hex 03
                hex ff
                hex 00
img4_slice2
                hex 03
                hex ff
                hex 00
img4_slice3
                hex 02
                hex ff
                hex 00
img4_slice4
                hex 01
                hex ff
                hex 00
img4_slice5
                hex 02
                hex ff
                hex 00
img4_slice6
                hex 01
                hex ff
                hex 00
img4_slice7
                hex 00
                hex 9f30550f10aa0f
                hex 00
img5_slice0
                hex 01
                hex ff
                hex 00
img5_slice1
                hex 01
                hex ff
                hex 00
img5_slice2
                hex 01
                hex 3f40298003
                hex 00
img5_slice3
                hex 03
                hex ff
                hex 00
img5_slice4
                hex 02
                hex 800340a23f
                hex 00
img5_slice5
                hex 02
                hex ff
                hex 00
img5_slice6
                hex 02
                hex ff
                hex 00
img5_slice7
                hex 00
                hex ff
                hex 00
img6_slice0
                hex 02
                hex ff
                hex 00
img6_slice1
                hex 02
                hex ff
                hex 00
img6_slice2
                hex 02
                hex 59028102760256023602720280310277
                hex 02010220022602270223020102732d02
                hex 79020102300702350201027515
                hex 00
img6_slice3
                hex 02
                hex 150264022a0b022c02412b025702420b
                hex 026502372b021f02440b0268021e2b02
                hex 5a02400b0263023a15
                hex 00
img6_slice4
                hex 02
                hex 15026a0201025007026f020102452d02
                hex 3302010249027e027f026c0201022e31
                hex 025c0224021d021c0221023c59
                hex 00
img6_slice5
                hex 02
                hex ff
                hex 00
img6_slice6
                hex 02
                hex ff
                hex 00
img6_slice7
                hex 00
                hex ff
                hex 00
img7_slice0
                hex 01
                hex ff
                hex 00
img7_slice1
                hex 01
                hex 3f40258002
                hex 00
img7_slice2
                hex 02
                hex bf4089
                hex 00
img7_slice3
                hex 03
                hex ff
                hex 00
img7_slice4
                hex 01
                hex 40a3bf
                hex 00
img7_slice5
                hex 01
                hex 7f407d3f
                hex 00
img7_slice6
                hex 01
                hex ff
                hex 00
img7_slice7
                hex 00
                hex 7f10aa100a2f105010550f
                hex 00
img8_slice0
                hex 02
                hex ff
                hex 00
img8_slice1
                hex 02
                hex bf4003
                hex 00
img8_slice2
                hex 03
                hex ff
                hex 00
img8_slice3
                hex 01
                hex 80037f
                hex 00
img8_slice4
                hex 01
                hex ff
                hex 00
img8_slice5
                hex 00
                hex 4001bf
                hex 00
img8_slice6
                hex 00
                hex ff
                hex 00
img8_slice7
                hex 00
                hex ff
                hex 00
img9_slice0
                hex 01
                hex ff
                hex 00
img9_slice1
                hex 01
                hex ff
                hex 00
img9_slice2
                hex 01
                hex 3f40298003
                hex 00
img9_slice3
                hex 03
                hex ff
                hex 00
img9_slice4
                hex 02
                hex 800340a23f
                hex 00
img9_slice5
                hex 02
                hex ff
                hex 00
img9_slice6
                hex 02
                hex ff
                hex 00
img9_slice7
                hex 00
                hex ff
                hex 00
img10_slice0
                hex 01
                hex ff
                hex 00
img10_slice1
                hex 01
                hex ff
                hex 00
img10_slice2
                hex 01
                hex 3f40298003
                hex 00
img10_slice3
                hex 03
                hex ff
                hex 00
img10_slice4
                hex 02
                hex 800340a23f
                hex 00
img10_slice5
                hex 02
                hex ff
                hex 00
img10_slice6
                hex 02
                hex ff
                hex 00
img10_slice7
                hex 00
                hex ff
                hex 00
img11_slice0
                hex 01
                hex ff
                hex 00
img11_slice1
                hex 02
                hex 4025bf
                hex 00
img11_slice2
                hex 02
                hex 3f40868003
                hex 00
img11_slice3
                hex 03
                hex ff
                hex 00
img11_slice4
                hex 01
                hex 800340a13f
                hex 00
img11_slice5
                hex 01
                hex bf4028
                hex 00
img11_slice6
                hex 02
                hex ff
                hex 00
img11_slice7
                hex 00
                hex af105030550f
                hex 00
img12_slice0
                hex 01
                hex 025b0302180204040002122f0202025b
                hex 03021802040400021231025b03021802
                hex 04040002122b0222010202025b030218
                hex 02040400021229
                hex 00
img12_slice1
                hex 01
                hex 026b022203025b0302180204040002a7
                hex 28250202026b0222010202025b030218
                hex 0204040002132a02026b022203025b03
                hex 02180204040002132402028a0402026b
                hex 0222010202025b030218020404000213
                hex 2202
                hex 00
img12_slice2
                hex 01
                hex 0203028a0402026b022203025b030218
                hex 02040400021320020403028a0402026b
                hex 0222010202025b0302180204040002a8
                hex 1e860603028a0402026b022203025b03
                hex 02180204040002142403028a0402026b
                hex 0222010202025b030218020404000214
                hex 1a03
                hex 00
img12_slice3
                hex 01
                hex 0a03028a0402026b022203025b030218
                hex 0204040002142403028a0402026b0222
                hex 010202025b0302180204040002142203
                hex 029d040202820262010202027803021b
                hex 0216040002082003029d040202820262
                hex 03027803021b0216040002081803
                hex 00
img12_slice4
                hex 01
                hex 0803029d040202820262010202027803
                hex 021b0216040002082003029d04020282
                hex 026203027803021b0216040002082003
                hex 029d040202820262010202027803021b
                hex 0216040002a61ea10203029d04020282
                hex 026203027803021b0216040002061f
                hex 00
img12_slice5
                hex 01
                hex 029d040202820262010202027803021b
                hex 02160400020621040202820262030278
                hex 03021b02160400020623020202820262
                hex 010202027803021b0216040002062502
                hex 82026203027803021b0216040002a528
                hex 28
                hex 00
img12_slice6
                hex 01
                hex 0262010202027803021b021604000207
                hex 2a0203027803021b0216040002072e02
                hex 027803021b0216040002072e02027803
                hex 021b0216040002073002
                hex 00
img12_slice7
                hex 00
                hex 7f02df02f30b025502df02f309045502
                hex df02f307065502ff02b306a0045502fd
                hex 02bf08aa025502fd02bf0aaa02fd02bf
                hex 0caa0f
                hex 00
img13_slice0
                hex 02
                hex 0302900203028801022c0201022c0201
                hex 02050200027a29028c0203029a010269
                hex 02010269020102170200020d2b029002
                hex 03028801022c01022c02010205020002
                hex 7a29028c0203029a0102690102690201
                hex 02170200020d23
                hex 00
img13_slice1
                hex 02
                hex 0702900203028801022c0201022c0201
                hex 02050200027a29028c0203029a010269
                hex 02010269020102170200020d2b029002
                hex 03028801022c01022c02010205020002
                hex 9f200309028c0203029a010269010269
                hex 020102170200020e2003
                hex 00
img13_slice2
                hex 02
                hex 0b02900203028801022c0201022c0201
                hex 02050200029f1e030b028c0203029a01
                hex 026902010269020102170200020e1e03
                hex 0d02900203028801022c01022c020102
                hex 050200027a1d0285027c0261023f027b
                hex 0284028c0203029a0102690102690201
                hex 02170200020d1b
                hex 00
img13_slice3
                hex 02
                hex 01026d022f025102710234024a010290
                hex 0203028801022c0201022c0201020502
                hex 00027a1b02580251030271023801028c
                hex 0203029a010269020102690201021702
                hex 00020d1b023902840302850259010287
                hex 0203029e010270020102700201021902
                hex 00020b1a0301025d024f02840285026e
                hex 023d01028d0203029901026302010263
                hex 02010215020002101a03
                hex 00
img13_slice4
                hex 02
                hex 010271022d02430267022b0251028702
                hex 03029e01027001027002010219020002
                hex 0b1c030d028d02030299010263010263
                hex 02010215020002101c030b0287020302
                hex 9e010270020102700201021902000209
                hex 1e010b028d0203029901026302010263
                hex 020102150200020f1e01
                hex 00
img13_slice5
                hex 01
                hex 0a0202870203029e0202027002020270
                hex 010219020002091f0a02028d02030299
                hex 02020263020202630102150200020f1f
                hex 080202870203029e0202027001027001
                hex 021902000209210802028d0203029902
                hex 0202630102630102150200020f21
                hex 00
img13_slice6
                hex 01
                hex 060202870203029e0202027002020270
                hex 01021902000209230602028d02030299
                hex 02020263020202630102150200020f23
                hex 040202870203029e0202027001027001
                hex 021902000209250402028d0203029902
                hex 0202630102630102150200020f25
                hex 00
img13_slice7
                hex 00
                hex 81025502aa0aff010244029902ae08af
                hex 03025502aa080a030244029902e206f0
                hex 03025502aa08ff0102440299022e080f
                hex 01025502aa19
                hex 00
img14_slice0
                hex 01
                hex ff
                hex 00
img14_slice1
                hex 01
                hex 3f40258002
                hex 00
img14_slice2
                hex 02
                hex bf4089
                hex 00
img14_slice3
                hex 03
                hex ff
                hex 00
img14_slice4
                hex 02
                hex 40a4bf
                hex 00
img14_slice5
                hex 01
                hex 8002407d3f
                hex 00
img14_slice6
                hex 01
                hex ff
                hex 00
img14_slice7
                hex 00
                hex ff
                hex 00
