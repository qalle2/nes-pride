; This file was generated automatically by convert.py.

image_count     equ 15  ; number of images

img_name_data   ; descriptions (exactly 8 bytes/image)
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

bg_pal_data     ; background palette data (16 bytes/image)
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
                hex 2c02015401530211010a015f01554d0200
img0_slice1
                hex 05020178010101741d0203011d02015b0101013b1e020101190200
img0_slice2
                hex 0602010101031e02010101030f010f0201010303019c0102013e010301660102
                hex 018b01030132030301010f0201010303019301020146010301660102018f0103
                hex 014e03030101090200
img0_slice3
                hex 0602010105030402060301010f02010105030131010201930102019101030195
                hex 030301010f0201010503014b010201940102014c0103018e030301010f020101
                hex 0503040206030101090200
img0_slice4
                hex 0602010107030196010301470102019201030197010201010f0201010703019b
                hex 010301480102014d01030198010201010f02010101030f010f02010101031802
                hex 00
img0_slice5
                hex 060201011f0201011f0201011f020101190200
img0_slice6
                hex 060201011f0201011f0201010402015e010201600102015501520153010c0152
                hex 12020101190200
img0_slice7
                hex 400012aa024f010f01cf04aa01000155010001cc04aa02f001f101fd12aa0800
                hex 00
img1_slice0
                hex 800100
img1_slice1
                hex 20012025400200
img1_slice2
                hex 6002208900
img1_slice3
                hex 800300
img1_slice4
                hex 20a3600100
img1_slice5
                hex 4001201a200000
img1_slice6
                hex 800000
img1_slice7
                hex 400008550805300000
img2_slice0
                hex 800000
img2_slice1
                hex 6000200100
img2_slice2
                hex 800100
img2_slice3
                hex 4001400300
img2_slice4
                hex 800300
img2_slice5
                hex 2003600200
img2_slice6
                hex 800200
img2_slice7
                hex 800000
img3_slice0
                hex 800300
img3_slice1
                hex 800300
img3_slice2
                hex 600320a000
img3_slice3
                hex 800200
img3_slice4
                hex 2083600100
img3_slice5
                hex 800100
img3_slice6
                hex 800100
img3_slice7
                hex 800000
img4_slice0
                hex 800100
img4_slice1
                hex 800300
img4_slice2
                hex 800300
img4_slice3
                hex 800200
img4_slice4
                hex 800100
img4_slice5
                hex 800200
img4_slice6
                hex 800100
img4_slice7
                hex 50001855080008aa080000
img5_slice0
                hex 800100
img5_slice1
                hex 800100
img5_slice2
                hex 20012029400300
img5_slice3
                hex 800300
img5_slice4
                hex 400320a2200200
img5_slice5
                hex 800200
img5_slice6
                hex 800200
img5_slice7
                hex 800000
img6_slice0
                hex 800200
img6_slice1
                hex 800200
img6_slice2
                hex 2d02018101760156013601720180190201770101012001260127012301010173
                hex 170201790101013004020135010101750b0200
img6_slice3
                hex 0b020164012a0602012c01411602015701420602016501371602011f01440602
                hex 0168011e1602015a014006020163013a0b0200
img6_slice4
                hex 0b02016a010101500402016f010101451702013301010149017e017f016c0101
                hex 012e1902015c0124011d011c0121013c2d0200
img6_slice5
                hex 800200
img6_slice6
                hex 800200
img6_slice7
                hex 800000
img7_slice0
                hex 800100
img7_slice1
                hex 20012025400200
img7_slice2
                hex 6002208900
img7_slice3
                hex 800300
img7_slice4
                hex 20a3600100
img7_slice5
                hex 4001207d200100
img7_slice6
                hex 800100
img7_slice7
                hex 400008aa080a180008500855080000
img8_slice0
                hex 800200
img8_slice1
                hex 6002200300
img8_slice2
                hex 800300
img8_slice3
                hex 4003400100
img8_slice4
                hex 800100
img8_slice5
                hex 2001600000
img8_slice6
                hex 800000
img8_slice7
                hex 800000
img9_slice0
                hex 800100
img9_slice1
                hex 800100
img9_slice2
                hex 20012029400300
img9_slice3
                hex 800300
img9_slice4
                hex 400320a2200200
img9_slice5
                hex 800200
img9_slice6
                hex 800200
img9_slice7
                hex 800000
img10_slice0
                hex 800100
img10_slice1
                hex 800100
img10_slice2
                hex 20012029400300
img10_slice3
                hex 800300
img10_slice4
                hex 400320a2200200
img10_slice5
                hex 800200
img10_slice6
                hex 800200
img10_slice7
                hex 800000
img11_slice0
                hex 800100
img11_slice1
                hex 2025600200
img11_slice2
                hex 20022086400300
img11_slice3
                hex 800300
img11_slice4
                hex 400320a1200100
img11_slice5
                hex 6001202800
img11_slice6
                hex 800200
img11_slice7
                hex 580008501855080000
img12_slice0
                hex 015b0201011801040200011218010102015b020101180104020001121901015b
                hex 020101180104020001121601012201010102015b020101180104020001121501
                hex 00
img12_slice1
                hex 016b01220201015b020101180104020001a714250102016b012201010102015b
                hex 020101180104020001131502016b01220201015b020101180104020001131202
                hex 018a0202016b012201010102015b02010118010402000113110200
img12_slice2
                hex 0103018a0202016b01220201015b0201011801040200011310020203018a0202
                hex 016b012201010102015b020101180104020001a80f860303018a0202016b0122
                hex 0201015b020101180104020001141203018a0202016b012201010102015b0201
                hex 01180104020001140d0300
img12_slice3
                hex 0503018a0202016b01220201015b020101180104020001141203018a0202016b
                hex 012201010102015b020101180104020001141103019d02020182016201010102
                hex 01780201011b0116020001081003019d020201820162020101780201011b0116
                hex 020001080c0300
img12_slice4
                hex 0403019d0202018201620101010201780201011b0116020001081003019d0202
                hex 01820162020101780201011b0116020001081003019d02020182016201010102
                hex 01780201011b0116020001a60fa10103019d020201820162020101780201011b
                hex 011602000106100100
img12_slice5
                hex 019d0202018201620101010201780201011b0116020001061101020201820162
                hex 020101780201011b01160200010612010102018201620101010201780201011b
                hex 011602000106130101820162020101780201011b0116020001a5142800
img12_slice6
                hex 01620101010201780201011b0116020001071502020101780201011b01160200
                hex 0107170201780201011b011602000107170201780201011b0116020001071802
                hex 00
img12_slice7
                hex 400001df01f30600015501df01f30500025501df01f30400035501ff01b303a0
                hex 025501fd01bf04aa015501fd01bf05aa01fd01bf06aa080000
img13_slice0
                hex 02020190010301880102012c0101012c010101050100017a1502018c0103019a
                hex 0102016901010169010101170100010d16020190010301880102012c0102012c
                hex 010101050100017a1502018c0103019a0102016901020169010101170100010d
                hex 120200
img13_slice1
                hex 04020190010301880102012c0101012c010101050100017a1502018c0103019a
                hex 0102016901010169010101170100010d16020190010301880102012c0102012c
                hex 010101050100019f10030502018c0103019a0102016901020169010101170100
                hex 010e100300
img13_slice2
                hex 06020190010301880102012c0101012c010101050100019f0f030602018c0103
                hex 019a0102016901010169010101170100010e0f0307020190010301880102012c
                hex 0102012c010101050100017a0f020185017c0161013f017b0184018c0103019a
                hex 0102016901020169010101170100010d0e0200
img13_slice3
                hex 0102016d012f015101710134014a01020190010301880102012c0101012c0101
                hex 01050100017a0e02015801510202017101380102018c0103019a010201690101
                hex 0169010101170100010d0e0201390184020201850159010201870103019e0102
                hex 017001010170010101190100010b0d030102015d014f01840185016e013d0102
                hex 018d01030199010201630101016301010115010001100d0300
img13_slice4
                hex 01020171012d01430167012b015101870103019e010201700102017001010119
                hex 0100010b0e030702018d01030199010201630102016301010115010001100e03
                hex 060201870103019e010201700101017001010119010001090f010602018d0103
                hex 01990102016301010163010101150100010f0f0100
img13_slice5
                hex 050201870103019e0102017001020170010101190100010910010502018d0103
                hex 01990102016301020163010101150100010f1001040201870103019e01020170
                hex 01010170010101190100010911010402018d0103019901020163010101630101
                hex 01150100010f110100
img13_slice6
                hex 030201870103019e0102017001020170010101190100010912010302018d0103
                hex 01990102016301020163010101150100010f1201020201870103019e01020170
                hex 01010170010101190100010913010202018d0103019901020163010101630101
                hex 01150100010f130100
img13_slice7
                hex 4100015501aa05ff01000144019901ae04af0200015501aa040a020001440199
                hex 01e203f00200015501aa04ff010001440199012e040f0100015501aa0d0000
img14_slice0
                hex 800100
img14_slice1
                hex 20012025400200
img14_slice2
                hex 6002208900
img14_slice3
                hex 800300
img14_slice4
                hex 20a4600200
img14_slice5
                hex 4002207d200100
img14_slice6
                hex 800100
img14_slice7
                hex 800000
