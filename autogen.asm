; This file was generated automatically by convert.py.

image_count     equ 13  ; number of images

img_name_data   ; descriptions (exactly 8 bytes/image)
                db "aaatitle"
                db "    asex"
                db "   bisex"
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

bg_pal_data     ; background palette data (16 bytes/image)
                hex 0f151925 0f122528 0f132130 0f25300f
                hex 0f001430 0f0f0f0f 0f0f0f0f 0f0f0f0f
                hex 0f121315 0f0f0f0f 0f0f0f0f 0f0f0f0f
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

nt_at_offsets   ; addresses in RLE compressed name & attribute table data
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

                ; RLE compressed name & attribute table data
                ; (each slice decompresses into exactly $80 bytes)
img0_slice0
                hex 2c02016201610217010d017301634d0200
img0_slice1
                hex 05020194010101911d0203011d020166010101411e020101190200
img0_slice2
                hex 0602010101031e02010101030f010f020101030301dd010201470103017b0102
                hex 01c10103013f030301010f020101030301d10102014e0103017b010201c80103
                hex 015c03030101090200
img0_slice3
                hex 0602010105030402060301010f0201010503013e010201d1010201cc010301d3
                hex 030301010f02010105030158010201d20102015a010301c7030301010f020101
                hex 0503040206030101090200
img0_slice4
                hex 06020101070301d401030153010201cd010301d5010201010f020101070301dc
                hex 010301540102015b010301d6010201010f02010101030f010f02010101031802
                hex 00
img0_slice5
                hex 060201011f0201011f0201011f020101190200
img0_slice6
                hex 060201011f0201011f02010104020172010201740102016301600161010f0160
                hex 12020101190200
img0_slice7
                hex 400012aa024f010f01cf04aa01000155010001cc04aa02f001f101fd12aa0800
                hex 00
img1_slice0
                hex 800000
img1_slice1
                hex 6000200100
img1_slice2
                hex 800100
img1_slice3
                hex 4001400300
img1_slice4
                hex 800300
img1_slice5
                hex 2003600200
img1_slice6
                hex 800200
img1_slice7
                hex 800000
img2_slice0
                hex 800300
img2_slice1
                hex 800300
img2_slice2
                hex 600320e400
img2_slice3
                hex 800200
img2_slice4
                hex 20ac600100
img2_slice5
                hex 800100
img2_slice6
                hex 800100
img2_slice7
                hex 800000
img3_slice0
                hex 800100
img3_slice1
                hex 800100
img3_slice2
                hex 20012038400300
img3_slice3
                hex 800300
img3_slice4
                hex 400320ea200200
img3_slice5
                hex 800200
img3_slice6
                hex 800200
img3_slice7
                hex 800000
img4_slice0
                hex 800200
img4_slice1
                hex 6e0201b502b001b20e0200
img4_slice2
                hex 0c0201a80192017502010148018f01a61702019e0176010101290230012b0101
                hex 0149019c150201a501680127013c040201400128014201a31402018301010146
                hex 06020170010101500a0200
img4_slice3
                hex 0a0201690133015f0602018e013501431302019a010101440802016d01010198
                hex 1202018d0101014a080201790101015e13020135014301ae060201af01690133
                hex 0a0200
img4_slice4
                hex 0a02016f0101015606020188010101451402018a01320101019001b1020201b4
                hex 01930101013101591502017f012f01010148029701750101012d014d17020187
                hex 013a012c0201012a013901520c0200
img4_slice5
                hex 800200
img4_slice6
                hex 800200
img4_slice7
                hex 800000
img5_slice0
                hex 800100
img5_slice1
                hex 20012030400200
img5_slice2
                hex 600220bb00
img5_slice3
                hex 800300
img5_slice4
                hex 20ed600100
img5_slice5
                hex 4001209b200100
img5_slice6
                hex 800100
img5_slice7
                hex 400008aa080a180008500855080000
img6_slice0
                hex 800200
img6_slice1
                hex 6002200300
img6_slice2
                hex 800300
img6_slice3
                hex 4003400100
img6_slice4
                hex 800100
img6_slice5
                hex 2001600000
img6_slice6
                hex 800000
img6_slice7
                hex 800000
img7_slice0
                hex 800100
img7_slice1
                hex 800100
img7_slice2
                hex 20012038400300
img7_slice3
                hex 800300
img7_slice4
                hex 400320ea200200
img7_slice5
                hex 800200
img7_slice6
                hex 800200
img7_slice7
                hex 800000
img8_slice0
                hex 800100
img8_slice1
                hex 800100
img8_slice2
                hex 20012038400300
img8_slice3
                hex 800300
img8_slice4
                hex 400320ea200200
img8_slice5
                hex 800200
img8_slice6
                hex 800200
img8_slice7
                hex 800000
img9_slice0
                hex 800100
img9_slice1
                hex 2030600200
img9_slice2
                hex 200220b9400300
img9_slice3
                hex 800300
img9_slice4
                hex 400320e9200100
img9_slice5
                hex 6001203700
img9_slice6
                hex 800200
img9_slice7
                hex 580008501855080000
img10_slice0
                hex 0166020101220107020001181801010201660201012201070200011819010166
                hex 020101220107020001181601012e010101020166020101220107020001181501
                hex 00
img10_slice1
                hex 017f012e02010166020101220107020001f114300102017f012e010101020166
                hex 020101220107020001191502017f012e02010166020101220107020001191202
                hex 01bd0202017f012e01010102016602010122010702000119110200
img10_slice2
                hex 010301bd0202017f012e02010166020101220107020001191002020301bd0202
                hex 017f012e010101020166020101220107020001f20fb9030301bd0202017f012e
                hex 020101660201012201070200011b120301bd0202017f012e0101010201660201
                hex 012201070200011b0d0300
img10_slice3
                hex 050301bd0202017f012e020101660201012201070200011b120301bd0202017f
                hex 012e0101010201660201012201070200011b110301df020201a4017701010102
                hex 01940201012501200200010c100301df020201a4017702010194020101250120
                hex 0200010c0c0300
img10_slice4
                hex 040301df020201a401770101010201940201012501200200010c100301df0202
                hex 01a40177020101940201012501200200010c100301df020201a4017701010102
                hex 0194020101250120020001f00fe9010301df020201a401770201019402010125
                hex 012002000109100100
img10_slice5
                hex 01df020201a40177010101020194020101250120020001091101020201a40177
                hex 02010194020101250120020001091201010201a4017701010102019402010125
                hex 012002000109130101a4017702010194020101250120020001ef143700
img10_slice6
                hex 01770101010201940201012501200200010a1502020101940201012501200200
                hex 010a170201940201012501200200010a170201940201012501200200010a1802
                hex 00
img10_slice7
                hex 400001df01f30600015501df01f30500025501df01f30400035501ff01b303a0
                hex 025501fd01bf04aa015501fd01bf05aa01fd01bf06aa080000
img11_slice0
                hex 01e6010301de01b80102018a01320101018a01320101012301060100010e01a0
                hex 100201c3020301d80202017a01010102017a0201011f02000114110201c90203
                hex 01cb02020165020101650201011d0200011a100201be01e6010301de01b80102
                hex 018a01320101018a01320101012301060100010e01a00e0200
img11_slice1
                hex 020201c3020301d80202017a01010102017a0201011f02000114110201c90203
                hex 01cb02020165020201650201011d0200011a100201be01e7010301de01b80102
                hex 018a01320101018a01320101012301060100011001e50c03040201c4020301d8
                hex 0202017a01010102017a0201011f020001150c0300
img11_slice2
                hex 050201ca020301cb02020165020101650201011d0200011c0b03050201bf01e7
                hex 010301de01b80102018a01320101018a01320101012301060100011001e50a03
                hex 020201b301a701ad01b201c4020301d80202017a01010102017a0201011f0200
                hex 01140b020199016701340136014f01a201ca020301cb02020165020201650201
                hex 011d0200011a090200
img11_slice3
                hex 019f0164015f02020186014b01bf01e7010301de01b80102018a01320101018a
                hex 01320101012301060100010e01a00802018501510402016e019801c4020301d8
                hex 0202017a01010102017a0201011f020001140802017e01570402017d015d01bc
                hex 020301e00202018b010101020196020101240200010b08030189014c01b20202
                hex 01a9016a01b701c6010301e801ce010201a50168010101ab017801010126011e
                hex 010001050116080300
img11_slice4
                hex 01020171015501a1019d017c014d01c2020301d9020201810202018402010121
                hex 02000112090302020180013b013d015f01bc020301e10202018c010101020196
                hex 020101240200010b0a03050201b701c6010301eb01cf010201aa016b010101ab
                hex 017801010126011e0100010401130a01050201c2020301da0202018202010184
                hex 02010121020001110b0100
img11_slice5
                hex 040201bc020301e20202019501010102019602010124020001080c01030201b6
                hex 01c6010301eb01cf010201aa016b010101ab017801010126011e010001040113
                hex 0c01030201c0020301da020201820202018402010121020001110d01020201ba
                hex 020301e20202019501010102019602010124020001080e0100
img11_slice6
                hex 010201b601c5010301ec01d0010201ab016c010101ab017801010126011e0100
                hex 010401130e01010201c0020301db020201840201018402010121020001110f01
                hex 01ba020301e3020201960101010201960201012402000108100101c5010301ec
                hex 01d7010201ab0178010101ab017801010126011e010001040113100100
img11_slice7
                hex 400001040155019a01ae04ff01000145015901aa04af02000155019901aa030a
                hex 02000144015501aa01e202f002000155019901aa03ff01000154019501aa010e
                hex 030f0140015501a9012a0c0000
img12_slice0
                hex 800100
img12_slice1
                hex 20012030400200
img12_slice2
                hex 600220bb00
img12_slice3
                hex 800300
img12_slice4
                hex 20ee600200
img12_slice5
                hex 4002209b200100
img12_slice6
                hex 800100
img12_slice7
                hex 800000
