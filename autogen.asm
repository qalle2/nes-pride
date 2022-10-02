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
                hex 0f1925300f1215250f13210f0f25280f
                hex 0f0029300f1a290f0f0f0f0f0f0f0f0f
                hex 0f0014300f0f0f0f0f0f0f0f0f0f0f0f
                hex 0f1213150f0f0f0f0f0f0f0f0f0f0f0f
                hex 0f1222300f01120f0f1c303a0f0b1c0f
                hex 0f1319300f0f0f0f0f0f0f0f0f0f0f0f
                hex 0f13280f0f0f0f0f0f0f0f0f0f0f0f0f
                hex 0f2527300f14250f0f16270f0f0f0f0f
                hex 0f1328300f0f0f0f0f0f0f0f0f0f0f0f
                hex 0f1521280f0f0f0f0f0f0f0f0f0f0f0f
                hex 0f14212b0f0f0f0f0f0f0f0f0f0f0f0f
                hex 0f1627280f1213190f19280f0f0f0f0f
                hex 0f1927280f2125300f1213190f081621
                hex 0f1319280f0821250f1216270f252830
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
                dl img1_slice0
                dl img1_slice1
                dl img1_slice2
                dl img1_slice3
                dl img1_slice4
                dl img1_slice5
                dl img1_slice6
                dl img2_slice0
                dl img2_slice1
                dl img2_slice2
                dl img2_slice3
                dl img2_slice4
                dl img2_slice5
                dl img2_slice6
                dl img3_slice0
                dl img3_slice1
                dl img3_slice2
                dl img3_slice3
                dl img3_slice4
                dl img3_slice5
                dl img3_slice6
                dl img4_slice0
                dl img4_slice1
                dl img4_slice2
                dl img4_slice3
                dl img4_slice4
                dl img4_slice5
                dl img4_slice6
                dl img5_slice0
                dl img5_slice1
                dl img5_slice2
                dl img5_slice3
                dl img5_slice4
                dl img5_slice5
                dl img5_slice6
                dl img6_slice0
                dl img6_slice1
                dl img6_slice2
                dl img6_slice3
                dl img6_slice4
                dl img6_slice5
                dl img6_slice6
                dl img7_slice0
                dl img7_slice1
                dl img7_slice2
                dl img7_slice3
                dl img7_slice4
                dl img7_slice5
                dl img7_slice6
                dl img8_slice0
                dl img8_slice1
                dl img8_slice2
                dl img8_slice3
                dl img8_slice4
                dl img8_slice5
                dl img8_slice6
                dl img9_slice0
                dl img9_slice1
                dl img9_slice2
                dl img9_slice3
                dl img9_slice4
                dl img9_slice5
                dl img9_slice6
                dl img10_slice0
                dl img10_slice1
                dl img10_slice2
                dl img10_slice3
                dl img10_slice4
                dl img10_slice5
                dl img10_slice6
                dl img11_slice0
                dl img11_slice1
                dl img11_slice2
                dl img11_slice3
                dl img11_slice4
                dl img11_slice5
                dl img11_slice6
                dl img12_slice0
                dl img12_slice1
                dl img12_slice2
                dl img12_slice3
                dl img12_slice4
                dl img12_slice5
                dl img12_slice6
                dl img13_slice0
                dl img13_slice1
                dl img13_slice2
                dl img13_slice3
                dl img13_slice4
                dl img13_slice5
                dl img13_slice6
                dl img14_slice0
                dl img14_slice1
                dl img14_slice2
                dl img14_slice3
                dl img14_slice4
                dl img14_slice5
                dl img14_slice6
nt_at_addrs_hi  ; high bytes
                dh img0_slice0
                dh img0_slice1
                dh img0_slice2
                dh img0_slice3
                dh img0_slice4
                dh img0_slice5
                dh img0_slice6
                dh img1_slice0
                dh img1_slice1
                dh img1_slice2
                dh img1_slice3
                dh img1_slice4
                dh img1_slice5
                dh img1_slice6
                dh img2_slice0
                dh img2_slice1
                dh img2_slice2
                dh img2_slice3
                dh img2_slice4
                dh img2_slice5
                dh img2_slice6
                dh img3_slice0
                dh img3_slice1
                dh img3_slice2
                dh img3_slice3
                dh img3_slice4
                dh img3_slice5
                dh img3_slice6
                dh img4_slice0
                dh img4_slice1
                dh img4_slice2
                dh img4_slice3
                dh img4_slice4
                dh img4_slice5
                dh img4_slice6
                dh img5_slice0
                dh img5_slice1
                dh img5_slice2
                dh img5_slice3
                dh img5_slice4
                dh img5_slice5
                dh img5_slice6
                dh img6_slice0
                dh img6_slice1
                dh img6_slice2
                dh img6_slice3
                dh img6_slice4
                dh img6_slice5
                dh img6_slice6
                dh img7_slice0
                dh img7_slice1
                dh img7_slice2
                dh img7_slice3
                dh img7_slice4
                dh img7_slice5
                dh img7_slice6
                dh img8_slice0
                dh img8_slice1
                dh img8_slice2
                dh img8_slice3
                dh img8_slice4
                dh img8_slice5
                dh img8_slice6
                dh img9_slice0
                dh img9_slice1
                dh img9_slice2
                dh img9_slice3
                dh img9_slice4
                dh img9_slice5
                dh img9_slice6
                dh img10_slice0
                dh img10_slice1
                dh img10_slice2
                dh img10_slice3
                dh img10_slice4
                dh img10_slice5
                dh img10_slice6
                dh img11_slice0
                dh img11_slice1
                dh img11_slice2
                dh img11_slice3
                dh img11_slice4
                dh img11_slice5
                dh img11_slice6
                dh img12_slice0
                dh img12_slice1
                dh img12_slice2
                dh img12_slice3
                dh img12_slice4
                dh img12_slice5
                dh img12_slice6
                dh img13_slice0
                dh img13_slice1
                dh img13_slice2
                dh img13_slice3
                dh img13_slice4
                dh img13_slice5
                dh img13_slice6
                dh img14_slice0
                dh img14_slice1
                dh img14_slice2
                dh img14_slice3
                dh img14_slice4
                dh img14_slice5
                dh img14_slice6

                ; RLE compressed name & attribute table data
                ; (each slice decompresses into exactly $80 bytes)
img0_slice0
                hex 028b0264020102600702450244040a02
                hex 08025302462306012d00
img0_slice1
                hex 020b024a0201022b3b02013d02012403
                hex 19020102031f02030b00
img0_slice2
                hex 030e0202010102020401070402030a02
                hex 011a0202010102020201025c01027201
                hex 02800202022d0102700a02011a020201
                hex 0102020201024c010273010280020202
                hex 380102760a02011a0202010102020401
                hex 070402030a02010c0200
img0_slice3
                hex 030e020201010a02022001024c020102
                hex 7b01024e0802011a020201010a02023c
                hex 01024d020102750102370802011a0202
                hex 010112020704010202011a020201010e
                hex 02024f0202023a01027c010250020102
                hex 02010c0200
img0_slice4
                hex 020d020102030d025a01023b02030274
                hex 02030251020101020319020102031108
                hex 03040101020319020102031f02031902
                hex 0124030b00
img0_slice5
                hex 020d02013d02013d02013d0201070252
                hex 01025401024602430244020902431500
img0_slice6
                hex aa0e0202013e0202013002100013080a
                hex 028a0502cc0255024402000288050200
                hex 0204024702d002880504000204020d02
                hex 8811100a00
img1_slice0
                hex 01ff00
img1_slice1
                hex 013f4027800200
img1_slice2
                hex 027f406f400300
img1_slice3
                hex 03bf409400
img1_slice4
                hex 01ff00
img1_slice5
                hex 004010bf00
img1_slice6
                hex 008f105510054f00
img2_slice0
                hex 00ff00
img2_slice1
                hex 007f4004400100
img2_slice2
                hex 01ff00
img2_slice3
                hex 013fc00300
img2_slice4
                hex 03bf409100
img2_slice5
                hex 02ff00
img2_slice6
                hex 0080027f00
img3_slice0
                hex 03ff00
img3_slice1
                hex 03ff00
img3_slice2
                hex 028003408f3f00
img3_slice3
                hex 02bf406b00
img3_slice4
                hex 01ff00
img3_slice5
                hex 01ff00
img3_slice6
                hex 0080017f00
img4_slice0
                hex 01bf401a00
img4_slice1
                hex 01bf401e00
img4_slice2
                hex 03bf408800
img4_slice3
                hex 02800340993f00
img4_slice4
                hex 018002406b3f00
img4_slice5
                hex 017f40663f00
img4_slice6
                hex 0080010f10ff20aa1f1050100500
img5_slice0
                hex 01ff00
img5_slice1
                hex 01ff00
img5_slice2
                hex 03401bbf00
img5_slice3
                hex 03ff00
img5_slice4
                hex 024003408f7f00
img5_slice5
                hex 02ff00
img5_slice6
                hex 0080027f00
img6_slice0
                hex 02ff00
img6_slice1
                hex 02ff00
img6_slice2
                hex 0219026a026202470228025e02693102
                hex 6302010216021c021d02180201025f2d
                hex 026502010224070226020102612b0256
                hex 021f0b0221022f1500
img6_slice3
                hex 0215024802300b025702292b02140231
                hex 0b025802132b0249022e0b0255022a2b
                hex 02590201024007025d020102321500
img6_slice4
                hex 021702250201023902670268025b0201
                hex 022331024b0219021202110217022c99
                hex 00
img6_slice5
                hex 02ff00
img6_slice6
                hex 0080027f00
img7_slice0
                hex 01ff00
img7_slice1
                hex 013f4027800200
img7_slice2
                hex 027f406f400300
img7_slice3
                hex 03bf409400
img7_slice4
                hex 01ff00
img7_slice5
                hex 01406cbf00
img7_slice6
                hex 0080010f10aa100a2f1055100500
img8_slice0
                hex 02ff00
img8_slice1
                hex 027f406e400300
img8_slice2
                hex 03ff00
img8_slice3
                hex 014003bf00
img8_slice4
                hex 01bf400f00
img8_slice5
                hex 00ff00
img8_slice6
                hex 00ff00
img9_slice0
                hex 01ff00
img9_slice1
                hex 01ff00
img9_slice2
                hex 03401bbf00
img9_slice3
                hex 03ff00
img9_slice4
                hex 024003408f7f00
img9_slice5
                hex 02ff00
img9_slice6
                hex 0080027f00
img10_slice0
                hex 01ff00
img10_slice1
                hex 01ff00
img10_slice2
                hex 03401bbf00
img10_slice3
                hex 03ff00
img10_slice4
                hex 024003408f7f00
img10_slice5
                hex 02ff00
img10_slice6
                hex 0080027f00
img11_slice0
                hex 01ff00
img11_slice1
                hex 024022bf00
img11_slice2
                hex 03406dbf00
img11_slice3
                hex 0140023f800300
img11_slice4
                hex 014003408e7f00
img11_slice5
                hex 013f4015800200
img11_slice6
                hex 0080023f105a2055100500
img12_slice0
                hex 01027801020d0200020b360202030278
                hex 01020d0200020b3402024a0102780102
                hex 0d0200020b3402024a0203027801020d
                hex 0200020b300200
img12_slice1
                hex 02027901024a020102780201020d0200
                hex 020b2d0203027901024a020302780201
                hex 020d0200020b2b0403027901024a0201
                hex 02780201020d0200020b290603027901
                hex 024a020302780201020d0200020b2700
img12_slice2
                hex 030702790202024a020102780201020d
                hex 0200029b266e0902790202024a010278
                hex 0201020d0200020c2f02790202024a02
                hex 0102780201020d0200020c2f02790202
                hex 024a0102780201020d0200020c1f00
img12_slice3
                hex 01100302790202024a01027801020d02
                hex 00020c2e03028b0202026401028a0102
                hex 0e020002051d0e03028b020202640203
                hex 028a01020e020002051f0c03028b0202
                hex 026401028a01020e020002052100
img12_slice4
                hex 010a03028b020202640203028a01020e
                hex 020002072c03028b0202026401028a01
                hex 020e0200029a26900603028b02020264
                hex 0203028a01020e02000205270403028b
                hex 0202026401028a01020e020002052900
img12_slice5
                hex 010203028b020202640203028a01020e
                hex 020002052b028b0202026401028a0102
                hex 0e020002052d020202640203028a0102
                hex 0e020002063002026401028a01020e02
                hex 000206320200
img12_slice6
                hex 000203028a0201020e0102063402028a
                hex 0201020e01020636020f02df0eff0255
                hex 02df023009045502df023007045502d5
                hex 023f07025502d502bf0aaa02d502bf0c
                hex aa020f0e0a00
img13_slice0
                hex 02027901024a0201020d0200020b3102
                hex 03027901024a0201020d0200020b2f02
                hex 780201027901024a0201020d0200020b
                hex 2d020302780203027901024a0201020d
                hex 0200020b2b00
img13_slice1
                hex 030277010278020102790202024a0201
                hex 020d0200020c29020202770102780102
                hex 790202024a0201020d0200020c2b0277
                hex 010278020102790202024a0201020d02
                hex 00020c29020202770102780102790202
                hex 024a0201020d0200020c2300
img13_slice2
                hex 03070277010278020102790202024a02
                hex 01020d0200020c290202027701027801
                hex 02790202024a0201020d0200020c2102
                hex 9202890287028d029502770102780201
                hex 02790202024a0201020d0200020c1d02
                hex 93027a023f0102830233020202770102
                hex 780102790202024a0201020d0200020c
                hex 1b00
img13_slice3
                hex 030284023e0502820241010277010278
                hex 020102790202024a0201020d0200020c
                hex 1902810242050285023d01027101028a
                hex 0201028b020202640201020e02000206
                hex 1a02028602350298010297027e020202
                hex 7101028a01028b020202640201020e02
                hex 0002061c0201027f0234028c027d0236
                hex 027101028a0201028b02020264020102
                hex 0e020002061e0200
img13_slice4
                hex 03070202027101028a01028b02020264
                hex 0201020e02000206200207027101028a
                hex 0201028b020202640201020e02000206
                hex 2202030202027101028a01028b020202
                hex 640201020e0200020524010302710102
                hex 8a0201028b020202640201020e020002
                hex 05260100
img13_slice5
                hex 01020202710203028a0203028b020202
                hex 6401020e020002052702710203028a01
                hex 028b0202026401020e02000205290203
                hex 028a0203028b0202026401020e020002
                hex 052b028a01028b0202026401020e0200
                hex 02052d00
img13_slice6
                hex 000203028b020202640201020e010205
                hex 3001028b020202640201020e01020532
                hex 010f027502590caa02cf027502590aaa
                hex 0102cf027502510902c0027f02550201
                hex 0502c0027f025502a108a0027f025502
                hex 090a0a020502010b00
img14_slice0
                hex 01ff00
img14_slice1
                hex 013f4027800200
img14_slice2
                hex 027f406f400300
img14_slice3
                hex 03bf409600
img14_slice4
                hex 02ff00
img14_slice5
                hex 01406cbf00
img14_slice6
                hex 0080017f00
