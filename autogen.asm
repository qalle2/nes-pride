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
                hex 2c02015301520211010a015e01544d0200
img0_slice1
                hex 05020177010101731d0203011d02015a0101013a1e020101190200
img0_slice2
                hex 0602010101031e02010101030f010f0201010303019b0102013d010301650102
                hex 018a01030131030301010f0201010303019201020145010301650102018e0103
                hex 014d03030101090200
img0_slice3
                hex 0602010105030402060301010f02010105030130010201920102019001030194
                hex 030301010f0201010503014a010201930102014b0103018d030301010f020101
                hex 0503040206030101090200
img0_slice4
                hex 0602010107030195010301460102019101030196010201010f0201010703019a
                hex 010301470102014c01030197010201010f02010101030f010f02010101031802
                hex 00
img0_slice5
                hex 060201011f0201011f0201011f020101190200
img0_slice6
                hex 060201011f0201011f0201010402015d0102015f0102015401510152010c0151
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
                hex 6003209f00
img2_slice3
                hex 800200
img2_slice4
                hex 2082600100
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
                hex 20012028400300
img3_slice3
                hex 800300
img3_slice4
                hex 400320a1200200
img3_slice5
                hex 800200
img3_slice6
                hex 800200
img3_slice7
                hex 800000
img4_slice0
                hex 800200
img4_slice1
                hex 800200
img4_slice2
                hex 2d0201800175015501350171017f190201760101011f01250126012201010172
                hex 170201780101012f04020134010101740b0200
img4_slice3
                hex 0b02016301290602012b01401602015601410602016401361602011e01430602
                hex 0167011d16020159013f0602016201390b0200
img4_slice4
                hex 0b0201690101014f0402016e010101441702013201010148017d017e016b0101
                hex 012d1902015b0123011c011b0120013b2d0200
img4_slice5
                hex 800200
img4_slice6
                hex 800200
img4_slice7
                hex 800000
img5_slice0
                hex 800100
img5_slice1
                hex 20012024400200
img5_slice2
                hex 6002208800
img5_slice3
                hex 800300
img5_slice4
                hex 20a2600100
img5_slice5
                hex 4001207c200100
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
                hex 20012028400300
img7_slice3
                hex 800300
img7_slice4
                hex 400320a1200200
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
                hex 20012028400300
img8_slice3
                hex 800300
img8_slice4
                hex 400320a1200200
img8_slice5
                hex 800200
img8_slice6
                hex 800200
img8_slice7
                hex 800000
img9_slice0
                hex 800100
img9_slice1
                hex 2024600200
img9_slice2
                hex 20022085400300
img9_slice3
                hex 800300
img9_slice4
                hex 400320a0200100
img9_slice5
                hex 6001202700
img9_slice6
                hex 800200
img9_slice7
                hex 580008501855080000
img10_slice0
                hex 015a0201011801040200011218010102015a020101180104020001121901015a
                hex 020101180104020001121601012101010102015a020101180104020001121501
                hex 00
img10_slice1
                hex 016a01210201015a020101180104020001a614240102016a012101010102015a
                hex 020101180104020001131502016a01210201015a020101180104020001131202
                hex 01890202016a012101010102015a02010118010402000113110200
img10_slice2
                hex 010301890202016a01210201015a020101180104020001131002020301890202
                hex 016a012101010102015a020101180104020001a70f85030301890202016a0121
                hex 0201015a02010118010402000114120301890202016a012101010102015a0201
                hex 01180104020001140d0300
img10_slice3
                hex 050301890202016a01210201015a02010118010402000114120301890202016a
                hex 012101010102015a020101180104020001141103019c02020181016101010102
                hex 01770201011a0116020001081003019c020201810161020101770201011a0116
                hex 020001080c0300
img10_slice4
                hex 0403019c0202018101610101010201770201011a0116020001081003019c0202
                hex 01810161020101770201011a0116020001081003019c02020181016101010102
                hex 01770201011a0116020001a50fa00103019c020201810161020101770201011a
                hex 011602000106100100
img10_slice5
                hex 019c0202018101610101010201770201011a0116020001061101020201810161
                hex 020101770201011a01160200010612010102018101610101010201770201011a
                hex 011602000106130101810161020101770201011a0116020001a4142700
img10_slice6
                hex 01610101010201770201011a0116020001071502020101770201011a01160200
                hex 0107170201770201011a011602000107170201770201011a0116020001071802
                hex 00
img10_slice7
                hex 400001df01f30600015501df01f30500025501df01f30400035501ff01b303a0
                hex 025501fd01bf04aa015501fd01bf05aa01fd01bf06aa080000
img11_slice0
                hex 0202018f010301870102012b0101012b01010105010001791502018b01030199
                hex 0102016801010168010101170100010d1602018f010301870102012b0102012b
                hex 01010105010001791502018b010301990102016801020168010101170100010d
                hex 120200
img11_slice1
                hex 0402018f010301870102012b0101012b01010105010001791502018b01030199
                hex 0102016801010168010101170100010d1602018f010301870102012b0102012b
                hex 010101050100019e10030502018b010301990102016801020168010101170100
                hex 010e100300
img11_slice2
                hex 0602018f010301870102012b0101012b010101050100019e0f030602018b0103
                hex 01990102016801010168010101170100010e0f030702018f010301870102012b
                hex 0102012b01010105010001790f020184017b0160013e017a0183018b01030199
                hex 0102016801020168010101170100010d0e0200
img11_slice3
                hex 0102016c012e01500170013301490102018f010301870102012b0101012b0101
                hex 0105010001790e02015701500202017001370102018b01030199010201680101
                hex 0168010101170100010d0e0201380183020201840158010201860103019d0102
                hex 016f0101016f010101190100010b0d030102015c014e01830184016d013c0102
                hex 018c01030198010201620101016201010115010001100d0300
img11_slice4
                hex 01020170012c01420166012a015001860103019d0102016f0102016f01010119
                hex 0100010b0e030702018c01030198010201620102016201010115010001100e03
                hex 060201860103019d0102016f0101016f01010119010001090f010602018c0103
                hex 01980102016201010162010101150100010f0f0100
img11_slice5
                hex 050201860103019d0102016f0102016f010101190100010910010502018c0103
                hex 01980102016201020162010101150100010f1001040201860103019d0102016f
                hex 0101016f010101190100010911010402018c0103019801020162010101620101
                hex 01150100010f110100
img11_slice6
                hex 030201860103019d0102016f0102016f010101190100010912010302018c0103
                hex 01980102016201020162010101150100010f1201020201860103019d0102016f
                hex 0101016f010101190100010913010202018c0103019801020162010101620101
                hex 01150100010f130100
img11_slice7
                hex 4100015501aa05ff01000144019901ae04af0200015501aa040a020001440199
                hex 01e203f00200015501aa04ff010001440199012e040f0100015501aa0d0000
img12_slice0
                hex 800100
img12_slice1
                hex 20012024400200
img12_slice2
                hex 6002208800
img12_slice3
                hex 800300
img12_slice4
                hex 20a3600200
img12_slice5
                hex 4002207c200100
img12_slice6
                hex 800100
img12_slice7
                hex 800000
