; Image data excluding pattern tables. Generated by convert.py.

image_count equ 36

pts_to_use
	db %00000001, %00000000, %00000000, %00000000, %00000000

image_ptrs
	dw img0_ptrs, img1_ptrs, img2_ptrs, img3_ptrs, img4_ptrs
	dw img5_ptrs, img6_ptrs, img7_ptrs, img8_ptrs, img9_ptrs
	dw img10_ptrs, img11_ptrs, img12_ptrs, img13_ptrs, img14_ptrs
	dw img15_ptrs, img16_ptrs, img17_ptrs, img18_ptrs, img19_ptrs
	dw img20_ptrs, img21_ptrs, img22_ptrs, img23_ptrs, img24_ptrs
	dw img25_ptrs, img26_ptrs, img27_ptrs, img28_ptrs, img29_ptrs
	dw img30_ptrs, img31_ptrs, img32_ptrs, img33_ptrs, img34_ptrs
	dw img35_ptrs

img0_ptrs
	dw img0_nt_at0, img0_nt_at1, img0_nt_at2, img0_nt_at3
	dw img0_nt_at4, img0_nt_at5, img0_pal, img0_txt
img1_ptrs
	dw img1_nt_at0, img1_nt_at1, img1_nt_at2, img1_nt_at3
	dw img1_nt_at4, img1_nt_at5, img1_pal, img1_txt
img2_ptrs
	dw img2_nt_at0, img2_nt_at1, img2_nt_at2, img2_nt_at3
	dw img2_nt_at4, img2_nt_at5, img2_pal, img2_txt
img3_ptrs
	dw img3_nt_at0, img3_nt_at1, img3_nt_at2, img3_nt_at3
	dw img3_nt_at4, img3_nt_at5, img3_pal, img3_txt
img4_ptrs
	dw img4_nt_at0, img4_nt_at1, img4_nt_at2, img4_nt_at3
	dw img4_nt_at4, img4_nt_at5, img4_pal, img4_txt
img5_ptrs
	dw img5_nt_at0, img5_nt_at1, img5_nt_at2, img5_nt_at3
	dw img5_nt_at4, img5_nt_at5, img5_pal, img5_txt
img6_ptrs
	dw img6_nt_at0, img6_nt_at1, img6_nt_at2, img6_nt_at3
	dw img6_nt_at4, img6_nt_at5, img6_pal, img6_txt
img7_ptrs
	dw img7_nt_at0, img7_nt_at1, img7_nt_at2, img7_nt_at3
	dw img7_nt_at4, img7_nt_at5, img7_pal, img7_txt
img8_ptrs
	dw img8_nt_at0, img8_nt_at1, img8_nt_at2, img8_nt_at3
	dw img8_nt_at4, img8_nt_at5, img8_pal, img8_txt
img9_ptrs
	dw img9_nt_at0, img9_nt_at1, img9_nt_at2, img9_nt_at3
	dw img9_nt_at4, img9_nt_at5, img9_pal, img9_txt
img10_ptrs
	dw img10_nt_at0, img10_nt_at1, img10_nt_at2, img10_nt_at3
	dw img10_nt_at4, img10_nt_at5, img10_pal, img10_txt
img11_ptrs
	dw img11_nt_at0, img11_nt_at1, img11_nt_at2, img11_nt_at3
	dw img11_nt_at4, img11_nt_at5, img11_pal, img11_txt
img12_ptrs
	dw img12_nt_at0, img12_nt_at1, img12_nt_at2, img12_nt_at3
	dw img12_nt_at4, img12_nt_at5, img12_pal, img12_txt
img13_ptrs
	dw img13_nt_at0, img13_nt_at1, img13_nt_at2, img13_nt_at3
	dw img13_nt_at4, img13_nt_at5, img13_pal, img13_txt
img14_ptrs
	dw img14_nt_at0, img14_nt_at1, img14_nt_at2, img14_nt_at3
	dw img14_nt_at4, img14_nt_at5, img14_pal, img14_txt
img15_ptrs
	dw img15_nt_at0, img15_nt_at1, img15_nt_at2, img15_nt_at3
	dw img15_nt_at4, img15_nt_at5, img15_pal, img15_txt
img16_ptrs
	dw img16_nt_at0, img16_nt_at1, img16_nt_at2, img16_nt_at3
	dw img16_nt_at4, img16_nt_at5, img16_pal, img16_txt
img17_ptrs
	dw img17_nt_at0, img17_nt_at1, img17_nt_at2, img17_nt_at3
	dw img17_nt_at4, img17_nt_at5, img17_pal, img17_txt
img18_ptrs
	dw img18_nt_at0, img18_nt_at1, img18_nt_at2, img18_nt_at3
	dw img18_nt_at4, img18_nt_at5, img18_pal, img18_txt
img19_ptrs
	dw img19_nt_at0, img19_nt_at1, img19_nt_at2, img19_nt_at3
	dw img19_nt_at4, img19_nt_at5, img19_pal, img19_txt
img20_ptrs
	dw img20_nt_at0, img20_nt_at1, img20_nt_at2, img20_nt_at3
	dw img20_nt_at4, img20_nt_at5, img20_pal, img20_txt
img21_ptrs
	dw img21_nt_at0, img21_nt_at1, img21_nt_at2, img21_nt_at3
	dw img21_nt_at4, img21_nt_at5, img21_pal, img21_txt
img22_ptrs
	dw img22_nt_at0, img22_nt_at1, img22_nt_at2, img22_nt_at3
	dw img22_nt_at4, img22_nt_at5, img22_pal, img22_txt
img23_ptrs
	dw img23_nt_at0, img23_nt_at1, img23_nt_at2, img23_nt_at3
	dw img23_nt_at4, img23_nt_at5, img23_pal, img23_txt
img24_ptrs
	dw img24_nt_at0, img24_nt_at1, img24_nt_at2, img24_nt_at3
	dw img24_nt_at4, img24_nt_at5, img24_pal, img24_txt
img25_ptrs
	dw img25_nt_at0, img25_nt_at1, img25_nt_at2, img25_nt_at3
	dw img25_nt_at4, img25_nt_at5, img25_pal, img25_txt
img26_ptrs
	dw img26_nt_at0, img26_nt_at1, img26_nt_at2, img26_nt_at3
	dw img26_nt_at4, img26_nt_at5, img26_pal, img26_txt
img27_ptrs
	dw img27_nt_at0, img27_nt_at1, img27_nt_at2, img27_nt_at3
	dw img27_nt_at4, img27_nt_at5, img27_pal, img27_txt
img28_ptrs
	dw img28_nt_at0, img28_nt_at1, img28_nt_at2, img28_nt_at3
	dw img28_nt_at4, img28_nt_at5, img28_pal, img28_txt
img29_ptrs
	dw img29_nt_at0, img29_nt_at1, img29_nt_at2, img29_nt_at3
	dw img29_nt_at4, img29_nt_at5, img29_pal, img29_txt
img30_ptrs
	dw img30_nt_at0, img30_nt_at1, img30_nt_at2, img30_nt_at3
	dw img30_nt_at4, img30_nt_at5, img30_pal, img30_txt
img31_ptrs
	dw img31_nt_at0, img31_nt_at1, img31_nt_at2, img31_nt_at3
	dw img31_nt_at4, img31_nt_at5, img31_pal, img31_txt
img32_ptrs
	dw img32_nt_at0, img32_nt_at1, img32_nt_at2, img32_nt_at3
	dw img32_nt_at4, img32_nt_at5, img32_pal, img32_txt
img33_ptrs
	dw img33_nt_at0, img33_nt_at1, img33_nt_at2, img33_nt_at3
	dw img33_nt_at4, img33_nt_at5, img33_pal, img33_txt
img34_ptrs
	dw img34_nt_at0, img34_nt_at1, img34_nt_at2, img34_nt_at3
	dw img34_nt_at4, img34_nt_at5, img34_pal, img34_txt
img35_ptrs
	dw img35_nt_at0, img35_nt_at1, img35_nt_at2, img35_nt_at3
	dw img35_nt_at4, img35_nt_at5, img35_pal, img35_txt

img0_nt_at0
	hex 01 a5 016c 016e 016d 83 012a 012b 0110 012c 011c 0126 92
	hex 0170 0103 0177 83 011e 98 0103 9e 0103 0142 014a 0202 00
img0_nt_at1
	hex 02 015d 0143 0241 0142 014a 81 015d 0143 0241 0142 014a 0d01
	hex 0103 91 0d01 0103 81 0148 015f 0149 0160 016f 0174 0166 0153
	hex 0165 0155 85 0d01 0103 81 0148 0162 0148 0161 016f 0174 0159
	hex 0156 0163 0154 85 0d01 0103 8f 00
img0_nt_at2
	hex 02 81 0d01 0103 91 0d01 0103 85 017a 0176 0157 0101 014f
	hex 0153 0150 0152 83 0d01 0103 85 0179 0175 0158 0140 0164 0157
	hex 015b 0156 83 0d01 0103 91 0a01 00
img0_nt_at3
	hex 02 0301 0103 91 0d01 0103 87 0146 015a 0171 0172 0147 015c
	hex 014b 0145 81 0d01 0103 87 0144 015e 0173 0178 014d 014e 014c
	hex 0151 81 0d01 0103 91 0d01 0103 016b 0169 0267 0168 016a 81
	hex 00
img0_nt_at4
	hex 01 016b 0169 0267 0168 016a 0202 016b 0169 8c 0103 9e 0103
	hex 85 011a 80 0127 0129 0128 0122 0108 0125 0123 0124 8e 0103
	hex 85 0121 80 0113 0131 0130 0120 92 0103 85 0138 80 0137
	hex 0135 0133 012d 0136 0134 85 00
img0_nt_at5
	hex 01 8a 0103 81 013b 0132 013d 013c 0116 80 0114 010e 0105
	hex 010c 010d 0104 0139 012e 012f 013e 013f 013a 8a 0103 81 011f
	hex 011d 0115 0119 011b 80 010f 0112 011f 0117 0119 0111 0118 0106
	hex 0109 010a 010b 0107 83 1a00 0108 010d 0107 0600 010c 0106 0103
	hex 0600 010f 0109 1200 00
img0_pal
	hex 0f213013 0f30150f 0f30270f 0f301912
img0_txt
	db 13
	hex ee e3 ee e6 df 00 00 ed dd ec df df e8

img1_nt_at0
	hex 00 df 2006 0c01 00
img1_nt_at1
	hex 01 b3 2074 3803 00
img1_nt_at2
	hex 03 a7 209b 4002 048d 00
img1_nt_at3
	hex 8d 9b 6003 1083 00
img1_nt_at4
	hex 83 8f 4001 2018 1c00 00
img1_nt_at5
	hex 00 ff 83 00
img1_pal
	hex 0f002930 0f0f0f0f 0f0f0f0f 0f0f0f0f
img1_txt
	db 7
	hex db e1 df e8 de df ec

img2_nt_at0
	hex 02 89 0153 0a01 017c 0a03 89 0153 0a01 017c 0a03 89 0153
	hex 0a01 017c 0a03 89 0153 0a01 017c 0a03 89 0153 0101 00
img2_nt_at1
	hex 01 88 017c 0a03 0a02 0153 89 017c 0a03 0a02 0153 89 017c
	hex 0a03 0a02 0153 89 017c 0a03 0a02 0153 89 017c 0203 00
img2_nt_at2
	hex 03 87 0a02 0153 0a01 017c 89 0a02 0153 0a01 017c 89 0a02
	hex 0153 0a01 017c 89 0a02 0153 0a01 017c 89 0402 00
img2_nt_at3
	hex 02 85 0153 0a01 017c 0a03 89 0153 0a01 017c 0a03 89 0153
	hex 0a01 017c 0a03 89 0153 0a01 017c 0a03 89 0153 0501 00
img2_nt_at4
	hex 01 84 017c 0a03 0a02 0153 89 017c 0a03 0a02 0153 89 017c
	hex 0a03 0a02 0153 89 017c 0a03 0a02 0153 89 017c 0603 00
img2_nt_at5
	hex 03 83 0a02 0153 0a01 017c 89 0a02 0153 0a01 017c 89 4000
	hex 00
img2_pal
	hex 0f13152c 0f0f0f0f 0f0f0f0f 0f0f0f0f
img2_txt
	db 14
	hex db e8 de ec e9 d0 00 00 00 00 e1 f3 e8 df

img3_nt_at0
	hex 01 ff 0c29 00
img3_nt_at1
	hex 29 93 7802 00
img3_nt_at2
	hex 02 87 208e 6403 00
img3_nt_at3
	hex 03 9b 2088 5001 00
img3_nt_at4
	hex 01 af 2011 3c00 00
img3_nt_at5
	hex 00 cb 0850 0855 a7 00
img3_pal
	hex 0f002930 0f1a290f 0f0f0f0f 0f0f0f0f
img3_txt
	db 10
	hex db d0 ec e9 e7 db e8 ee e3 dd

img4_nt_at0
	hex 01 ff 0c29 00
img4_nt_at1
	hex 29 93 7802 00
img4_nt_at2
	hex 02 87 208e 6403 00
img4_nt_at3
	hex 03 9b 209c 5002 00
img4_nt_at4
	hex 02 af 2067 3c01 00
img4_nt_at5
	hex 00 4401 87 0850 1055 9f 00
img4_pal
	hex 0f0c2130 0f172830 0f0f0f0f 0f0f0f0f
img4_txt
	db 18
	hex db d0 ec e9 e7 db e8 ee e3 dd 00 db ed df f2 ef db e6

img5_nt_at0
	hex 00 ff 8b 00
img5_nt_at1
	hex 00 b3 5801 00
img5_nt_at2
	hex 01 e7 2403 00
img5_nt_at3
	hex 03 ff 8b 00
img5_nt_at4
	hex 03 8f 7c02 00
img5_nt_at5
	hex 02 c3 4000 00
img5_pal
	hex 0f001430 0f0f0f0f 0f0f0f0f 0f0f0f0f
img5_txt
	db 7
	hex db ed df f2 ef db e6

img6_nt_at0
	hex 01 ff 8b 00
img6_nt_at1
	hex 01 ba 0177 017b 0103 0102 014e 012c 85 012b 013a 0102 0103
	hex 0180 0178 8c 017a 0303 0302 014a 83 0138 0302 0303 017f 8a
	hex 017a 0403 0402 014a 81 0138 0402 0203 00
img6_nt_at2
	hex 01 0203 017f 88 0179 0303 0186 81 0161 0302 014a 0138 0302
	hex 0165 81 0184 0303 017e 87 017d 0203 0186 83 0161 0202 0158
	hex 0302 0165 83 0184 0203 0182 87 0303 85 0161 0158 80 0202
	hex 0165 85 0303 87 0302 85 0138 0202 80 0130 014a 85 0303
	hex 87 00
img6_nt_at3
	hex 02 0168 81 014a 0401 0138 82 0130 81 014a 0401 017a 0203
	hex 0187 0801 013c 82 014a 0201 0138 82 0165 0161 82 014a 0201
	hex 017a 0303 0181 0901 0161 87 0165 0201 0161 83 0403 0186 0b01
	hex 0161 85 0165 0401 0161 82 0303 0186 0d01 0160 0170 81 0172
	hex 0164 0301 00
img6_nt_at4
	hex 01 82 0160 0170 0102 0103 018a 0185 ff 82 00
img6_nt_at5
	hex 00 4401 99 0188 01a2 0154 0155 0151 83 015e 01b5 80 01a5
	hex 82 0144 0115 018a 01aa 012a 90 00
img6_pal
	hex 0f371425 0f37212c 0f372729 0f21270f
img6_txt
	db 6
	hex db ef ee e3 ed e7

img7_nt_at0
	hex 01 c1 0117 0114 010e 0109 80 0113 0119 96 022e 01a6 0100
	hex 01a7 011c 012e 011b 01a4 172e 81 0113 0119 0110 0100 010f 81
	hex 0116 0115 80 00
img7_nt_at1
	hex 02 1601 0105 010a 0600 010b 1501 0428 01a5 0400 01a3 1628 81
	hex 0122 0120 80 0300 011f 98 0123 011c 80 0200 011f 8f 00
img7_nt_at2
	hex 02 8b 0124 0100 011f 98 048f 01aa 01a9 1a8f 4003 04a0 00
img7_nt_at3
	hex a0 9b 6002 105e 00
img7_nt_at4
	hex 5e 8f 4001 2018 1c00 00
img7_nt_at5
	hex 00 cb 08a0 080a 87 0850 1055 87 00
img7_pal
	hex 0f172737 0f003037 0f07170f 0f0f0f0f
img7_txt
	db 4
	hex dc df db ec

img8_nt_at0
	hex 01 df 202e 0c02 00
img8_nt_at1
	hex 02 b3 208c 3803 00
img8_nt_at2
	hex 03 a7 2067 4001 0429 00
img8_nt_at3
	hex 29 9b 6003 1099 00
img8_nt_at4
	hex 99 8f 4002 206e 1c01 00
img8_nt_at5
	hex 00 4401 87 0850 0855 0805 08aa 97 00
img8_pal
	hex 0f112133 0f142433 0f30330f 0f0f0f0f
img8_txt
	db 8
	hex dc e3 e1 df e8 de df ec

img9_nt_at0
	hex 03 ff 8b 00
img9_nt_at1
	hex 03 ff 8b 00
img9_nt_at2
	hex 03 87 209f 6402 00
img9_nt_at3
	hex 02 9b 206a 5001 00
img9_nt_at4
	hex 01 ff 8b 00
img9_nt_at5
	hex 01 c3 4000 00
img9_pal
	hex 0f121315 0f0f0f0f 0f0f0f0f 0f0f0f0f
img9_txt
	db 8
	hex dc e3 ed df f2 ef db e6

img10_nt_at0
	hex 01 df 202e 0c02 00
img10_nt_at1
	hex 02 b3 082a 1076 088e 87 1803 87 1003 00
img10_nt_at2
	hex 03 87 0802 97 6402 00
img10_nt_at3
	hex 02 a3 1803 87 1803 87 1803 086a 0888 00
img10_nt_at4
	hex 88 87 089c 4002 206e 1c01 00
img10_nt_at5
	hex 00 4401 97 0455 02aa 81 08aa 0455 02aa 91 00
img10_pal
	hex 0f001031 0f103538 0f10303b 0f0f0f0f
img10_txt
	db 13
	hex de df e7 e3 d0 00 00 00 e0 e6 ef e3 de

img11_nt_at0
	hex 01 df 202e 0c02 00
img11_nt_at1
	hex 02 b3 2028 b7 00
img11_nt_at2
	hex 02 a7 208f 2003 9f 0473 00
img11_nt_at3
	hex 73 9b 6003 1099 00
img11_nt_at4
	hex 99 8f 4002 206e 1c01 00
img11_nt_at5
	hex 00 4401 97 0855 08a5 97 00
img11_pal
	hex 0f001031 0f103638 0f31380f 0f0f0f0f
img11_txt
	db 13
	hex de df e7 e3 d0 00 00 00 00 e0 e6 ef f2

img12_nt_at0
	hex 01 df 202e 0c02 00
img12_nt_at1
	hex 02 b3 208c 3803 00
img12_nt_at2
	hex 03 a7 2067 4001 0429 00
img12_nt_at3
	hex 29 9b 6003 1099 00
img12_nt_at4
	hex 99 8f 4002 206e 1c01 00
img12_nt_at5
	hex 00 4401 9f 0855 97 00
img12_pal
	hex 0f001038 0f30380f 0f0f0f0f 0f0f0f0f
img12_txt
	db 13
	hex de df e7 e3 d0 00 00 e1 df e8 de df ec

img13_nt_at0
	hex 01 df 202e 0c02 00
img13_nt_at1
	hex 02 b3 208c 3803 00
img13_nt_at2
	hex 03 a7 2067 4001 0429 00
img13_nt_at3
	hex 29 9b 6003 1099 00
img13_nt_at4
	hex 99 8f 4002 206e 1c01 00
img13_nt_at5
	hex 00 4401 9f 0855 97 00
img13_pal
	hex 0f001035 0f30350f 0f0f0f0f 0f0f0f0f
img13_txt
	db 8
	hex de df e7 e3 e1 e3 ec e6

img14_nt_at0
	hex 01 df 202e 0c02 00
img14_nt_at1
	hex 02 b3 208c 3803 00
img14_nt_at2
	hex 03 a7 2067 4001 0429 00
img14_nt_at3
	hex 29 9b 6003 1099 00
img14_nt_at4
	hex 99 8f 4002 206e 1c01 00
img14_nt_at5
	hex 00 4401 9f 0855 97 00
img14_pal
	hex 0f001031 0f30310f 0f0f0f0f 0f0f0f0f
img14_txt
	db 7
	hex de df e7 e3 e1 ef f3

img15_nt_at0
	hex 27 80 1f03 0100 80 1e03 0200 80 1d03 0300 80 1c03 0400
	hex 80 0703 00
img15_nt_at1
	hex 03 93 0500 0127 99 0600 0127 98 0700 0127 97 0800 0127
	hex 8e 00
img15_nt_at2
	hex 00 0803 88 0127 1603 89 010c 1501 8a 010c 1401 8a 0108
	hex 1401 83 00
img15_nt_at3
	hex 00 85 0108 1501 88 011d 1602 87 011d 1702 86 011d 1802
	hex 85 011d 0902 00
img15_nt_at4
	hex 02 8f 0500 011d 99 0400 011d 9a 0300 011d 9b 0200 011d
	hex 98 00
img15_nt_at5
	hex 02 83 0100 011d 9d 011d 9e 4000 00
img15_pal
	hex 0f041030 0f0f0f0f 0f0f0f0f 0f0f0f0f
img15_txt
	db 13
	hex de df e7 e3 d0 00 00 ed df f2 ef db e6

img16_nt_at0
	hex 01 df 202e 0c02 00
img16_nt_at1
	hex 02 b3 208c 3803 00
img16_nt_at2
	hex 03 a7 208f bf 048b 00
img16_nt_at3
	hex 8b 9b 6003 1099 00
img16_nt_at4
	hex 99 8f 4002 206e 1c01 00
img16_nt_at5
	hex 00 4401 87 0850 1055 08aa 97 00
img16_pal
	hex 0f031222 0f0b1b2b 0f222b30 0f0f0f0f
img16_txt
	db 11
	hex e1 db f3 00 00 00 00 00 e7 df e8

img17_nt_at0
	hex 02 ff 0c8d 00
img17_nt_at1
	hex 8d 93 7803 00
img17_nt_at2
	hex 03 87 2089 6401 00
img17_nt_at3
	hex 01 9b 2012 5000 00
img17_nt_at4
	hex 00 af 2007 3c01 00
img17_nt_at5
	hex 01 c3 3000 0855 0805 00
img17_pal
	hex 0f142530 0f020f0f 0f0f0f0f 0f0f0f0f
img17_txt
	db 15
	hex e1 df e8 de df ec d0 00 00 00 e0 e6 ef e3 de

img18_nt_at0
	hex 01 ff 8b 00
img18_nt_at1
	hex 01 f3 1803 00
img18_nt_at2
	hex 03 ff 8b 00
img18_nt_at3
	hex 03 db 3002 00
img18_nt_at4
	hex 02 ff 8b 00
img18_nt_at5
	hex 02 c3 4000 00
img18_pal
	hex 0f131930 0f0f0f0f 0f0f0f0f 0f0f0f0f
img18_txt
	db 15
	hex e1 df e8 de df ec d0 00 00 00 eb ef df df ec

img19_nt_at0
	hex 01 ff 8b 00
img19_nt_at1
	hex 01 e0 012b 0133 0202 0136 012c 98 0138 0102 0172 026d 0170
	hex 0102 014a 83 00
img19_nt_at2
	hex 01 92 0137 0102 0165 83 0161 0102 0149 95 013f 0169 85
	hex 0168 0154 95 0102 0151 85 013d 0102 95 0102 0151 85 013d
	hex 0102 8e 00
img19_nt_at3
	hex 01 86 0147 0155 85 0140 015c 95 013c 0102 014a 83 0138
	hex 0102 0150 96 0161 0102 014e 022d 013a 0102 0165 98 0160 016f
	hex 0202 0171 0164 9c 00
img19_nt_at4
	hex 01 ff 8b 00
img19_nt_at5
	hex 01 c3 4000 00
img19_pal
	hex 0f28040f 0f0f0f0f 0f0f0f0f 0f0f0f0f
img19_txt
	db 14
	hex e3 e8 ee df ec d0 00 00 00 00 00 ed df f2

img20_nt_at0
	hex 02 2600 011d 81 011e 1600 0504 01a1 83 01a2 1504 0501 85
	hex 1801 0130 86 0101 00
img20_nt_at1
	hex 02 1401 0212 01a8 87 1512 0200 88 1700 88 1500 0201 0143
	hex 87 0d01 00
img20_nt_at2
	hex 01 8a 0143 0702 94 2076 4003 0488 00
img20_nt_at3
	hex 88 9b 4001 3000 00
img20_nt_at4
	hex 00 8f 2004 4001 1c12 00
img20_nt_at5
	hex 12 83 7f00 0100 00
img20_pal
	hex 0f011530 0f0f0f0f 0f0f0f0f 0f0f0f0f
img20_txt
	db 7
	hex e6 df db ee e2 df ec

img21_nt_at0
	hex 01 ff 0c29 00
img21_nt_at1
	hex 29 93 7802 00
img21_nt_at2
	hex 02 87 208e 6403 00
img21_nt_at3
	hex 03 9b 209c 5002 00
img21_nt_at4
	hex 02 af 2067 3c01 00
img21_nt_at5
	hex 00 4401 87 0850 1055 9f 00
img21_pal
	hex 0f142430 0f172730 0f0f0f0f 0f0f0f0f
img21_txt
	db 15
	hex e6 df ed dc e3 db e8 d6 ed ee ec e3 ea df ed

img22_nt_at0
	hex 01 df 202e 0c02 00
img22_nt_at1
	hex 02 b3 208c 3803 00
img22_nt_at2
	hex 03 a7 208f bf 048b 00
img22_nt_at3
	hex 8b 9b 6003 1099 00
img22_nt_at4
	hex 99 8f 4002 206e 1c01 00
img22_nt_at5
	hex 00 4401 87 0850 1055 08aa 97 00
img22_pal
	hex 0f041424 0f071727 0f242730 0f0f0f0f
img22_txt
	db 15
	hex e6 df ed dc e3 db e8 d8 ed ee ec e3 ea df ed

img23_nt_at0
	hex 02 ff 8b 00
img23_nt_at1
	hex 02 b3 5803 00
img23_nt_at2
	hex 03 e7 2401 00
img23_nt_at3
	hex 01 ff 8b 00
img23_nt_at4
	hex 01 8f 7c00 00
img23_nt_at5
	hex 00 ff 83 00
img23_pal
	hex 0f132830 0f0f0f0f 0f0f0f0f 0f0f0f0f
img23_txt
	db 12
	hex e8 e9 e8 d0 00 00 dc e3 e8 db ec f3

img24_nt_at0
	hex 02 ff 0c73 00
img24_nt_at1
	hex 73 93 7801 00
img24_nt_at2
	hex 01 87 2018 6400 00
img24_nt_at3
	hex 00 9b 2006 5001 00
img24_nt_at4
	hex 01 af 202f 3c02 00
img24_nt_at5
	hex 00 4402 87 0850 1055 9f 00
img24_pal
	hex 0f22320f 0f25350f 0f0f0f0f 0f0f0f0f
img24_txt
	db 13
	hex e9 e7 e8 e3 d0 00 00 ed df f2 ef db e6

img25_nt_at0
	hex 01 ff 8b 00
img25_nt_at1
	hex 01 f3 1803 00
img25_nt_at2
	hex 03 ff 8b 00
img25_nt_at3
	hex 03 db 3002 00
img25_nt_at4
	hex 02 ff 8b 00
img25_nt_at5
	hex 02 c3 4000 00
img25_pal
	hex 0f152128 0f0f0f0f 0f0f0f0f 0f0f0f0f
img25_txt
	db 12
	hex ea db e8 d0 00 00 ed df f2 ef db e6

img26_nt_at0
	hex 01 ff 8b 00
img26_nt_at1
	hex 01 f3 1802 00
img26_nt_at2
	hex 02 b4 0191 019d 019e 019d 019e 0196 9a 0192 80 0192 9c
	hex 0193 80 0193 92 00
img26_nt_at3
	hex 02 89 0197 80 0198 ce 3000 00
img26_nt_at4
	hex 00 ff 8b 00
img26_nt_at5
	hex 00 ff 83 00
img26_pal
	hex 0f021528 0f0f0f0f 0f0f0f0f 0f0f0f0f
img26_txt
	db 13
	hex ea e9 e6 f3 d0 00 00 00 db e7 e9 ec f3

img27_nt_at0
	hex 01 ff 8b 00
img27_nt_at1
	hex 01 f3 1803 00
img27_nt_at2
	hex 03 ff 8b 00
img27_nt_at3
	hex 03 db 3002 00
img27_nt_at4
	hex 02 ff 8b 00
img27_nt_at5
	hex 02 c3 4000 00
img27_pal
	hex 0f14212b 0f0f0f0f 0f0f0f0f 0f0f0f0f
img27_txt
	db 13
	hex ea e9 e6 f3 d0 00 00 ed df f2 ef db e6

img28_nt_at0
	hex 00 bf 201a 2c02 00
img28_nt_at1
	hex 02 93 206a 4001 97 00
img28_nt_at2
	hex 02 a7 208e 4003 0488 00
img28_nt_at3
	hex 88 9b 7001 00
img28_nt_at4
	hex 01 8f 202a 4002 1c25 00
img28_nt_at5
	hex 00 0425 d7 08a0 08aa 085a 0855 87 00
img28_pal
	hex 0f21310f 0f26350f 0f282930 0f0f0f0f
img28_txt
	db 5
	hex eb ef df df ec

img29_nt_at0
	hex 03 ff 0c02 00
img29_nt_at1
	hex 02 f3 1803 00
img29_nt_at2
	hex 03 e7 2401 00
img29_nt_at3
	hex 01 db 3002 00
img29_nt_at4
	hex 02 cf 3c01 00
img29_nt_at5
	hex 00 4401 8f 0850 1055 0805 8f 00
img29_pal
	hex 0f041216 0f192728 0f0f0f0f 0f0f0f0f
img29_txt
	db 15
	hex ec db e3 e8 dc e9 f1 d7 ed ee ec e3 ea df ed

img30_nt_at0
	hex 01 df 202e 0c02 00
img30_nt_at1
	hex 02 b3 208c 3803 00
img30_nt_at2
	hex 03 a7 2067 4001 0475 00
img30_nt_at3
	hex 75 9b 6003 1083 00
img30_nt_at4
	hex 83 8f 4001 202a 1c02 00
img30_nt_at5
	hex 00 4402 87 0850 1055 08aa 97 00
img30_pal
	hex 0f03042c 0f162728 0f19282c 0f0f0f0f
img30_txt
	db 15
	hex ec db e3 e8 dc e9 f1 d8 ed ee ec e3 ea df ed

img31_nt_at0
	hex 02 df 2c01 00
img31_nt_at1
	hex 01 ff 8b 00
img31_nt_at2
	hex 01 87 6002 a3 00
img31_nt_at3
	hex 01 bb 5002 00
img31_nt_at4
	hex 02 8f 6001 9b 00
img31_nt_at5
	hex 00 4402 87 0850 0855 08ff 08af 08aa 8f 00
img31_pal
	hex 0f03040f 0f16250f 0f192c0f 0f27280f
img31_txt
	db 15
	hex ec db e3 e8 dc e9 f1 d9 ed ee ec e3 ea df ed

img32_nt_at0
	hex 02 014a 0101 010d 0100 0121 9b 014a 0101 010d 0100 0121 99
	hex 0195 80 014a 0101 010d 0100 0121 98 0103 0195 80 014a 0101
	hex 010d 0100 0121 97 0195 80 0195 80 014a 0101 010d 0100 010c
	hex 0301 00
img32_nt_at1
	hex 01 93 0103 0195 0103 0195 0102 014a 80 010d 0100 010c 95
	hex 0203 0195 0102 0195 0102 014a 80 010d 0100 010c 94 0303 0195
	hex 0103 0195 0102 014a 80 010d 0100 010c 93 0403 0195 0102 0195
	hex 0102 014a 80 010d 0100 0121 0b02 00
img32_nt_at2
	hex 02 87 0503 0195 0103 0195 80 014a 0101 010d 0100 0121 91
	hex 0603 0195 80 0195 80 014a 0101 010d 0100 0121 90 0703 0195
	hex 0103 0195 80 014a 0101 010d 0100 0121 8f 0703 019a 0103 019a
	hex 80 0165 0101 0110 0100 0126 1403 00
img32_nt_at3
	hex 9a 0203 80 0102 80 0102 0165 0101 0110 0100 0126 1603 80
	hex 0103 80 0102 0165 0101 0110 0100 0126 1603 80 0102 80 0102
	hex 0165 0101 0110 0100 0126 1603 80 0103 80 0102 0165 0101 0110
	hex 0100 0108 1401 0203 80 0102 80 0102 0165 0101 0110 0100 0108
	hex 0501 00
img32_nt_at4
	hex 01 8f 0103 019a 0103 019a 0102 0165 80 0110 0100 0108 95
	hex 019a 0102 019a 0102 0165 80 0110 0100 0108 96 0103 019a 0102
	hex 0165 80 0110 0100 0108 97 019a 0102 0165 80 0110 0100 0108
	hex 94 00
img32_nt_at5
	hex 01 83 0102 0165 80 0110 0100 0108 99 0165 80 0110 0100
	hex 0108 9a 0900 07a0 0110 0108 06fa 0155 0110 010c 05ff 0255 0100
	hex 018c 04af 0155 80 0180 05aa 80 0140 065a 0100 0705 00
img32_pal
	hex 0f082125 0f042530 0f121619 0f27280f
img32_txt
	db 15
	hex ec db e3 e8 dc e9 f1 ea ec e9 e1 ec df ed ed

img33_nt_at0
	hex 95 80 0102 80 0102 014a 0101 010d 0100 010c 1701 0103 80
	hex 0103 80 0102 014a 0101 010d 0100 010c 1601 0194 0103 80 0102
	hex 80 0102 014a 0101 010d 0100 010c 1501 0102 0194 0103 80 0103
	hex 80 0102 014a 0101 010d 0100 010c 1401 0202 0194 0103 80 0102
	hex 80 0102 014a 0101 010d 0100 00
img33_nt_at1
	hex 02 0127 1303 82 0194 0103 0195 0103 0195 80 014a 0101 010d
	hex 0100 0127 1203 83 0194 0103 0195 80 0195 80 014a 0101 010d
	hex 0100 0127 1103 84 0194 0103 0195 0103 0195 80 014a 0101 010d
	hex 0100 0127 1003 85 0194 0103 0195 80 0195 80 014a 0101 010d
	hex 0100 0121 86 00
img33_nt_at2
	hex 02 89 016c 0163 015f 016b 80 0194 0103 0195 0103 0195 80
	hex 014a 0101 010d 0100 0121 8e 0159 0132 81 0135 0144 80 0194
	hex 0103 0195 80 0195 80 014a 0101 010d 0100 0121 8d 014d 83
	hex 0139 81 0194 0103 0195 0103 0195 80 014a 0101 010d 0100 0121
	hex 8c 014c 83 014b 81 0190 0103 019a 0103 019a 80 0165 0101
	hex 0110 0100 011d 8c 014f 0145 80 00
img33_nt_at3
	hex 02 80 015a 013b 80 0190 0103 019a 80 019a 80 0165 0101
	hex 0110 0100 011d 8e 0134 0141 0156 0131 80 0190 0103 019a 0103
	hex 019a 80 0165 0101 0110 0100 011d 93 0190 0103 019a 80 019a
	hex 80 0165 0101 0110 0100 011d 93 0190 0103 019a 0103 019a 80
	hex 0165 0101 0110 0100 0108 1001 83 0190 0103 019a 80 019a 80
	hex 0165 0101 0110 0100 0108 0101 00
img33_nt_at4
	hex 01 8f 0302 0190 0103 019a 0103 019a 0102 0165 80 0110 0100
	hex 0108 91 0202 0190 0103 019a 0102 019a 0102 0165 80 0110 0100
	hex 0108 92 0102 0190 0103 019a 0103 019a 0102 0165 80 0110 0100
	hex 0108 93 0190 0103 019a 0102 019a 0102 0165 80 0110 0100 0108
	hex 90 00
img33_nt_at5
	hex 00 0401 0103 019a 0103 019a 0102 0165 0101 0110 80 0108 1601
	hex 019a 0102 019a 0102 0165 0101 0110 80 0108 1701 87 0160 0150
	hex 06f0 0108 0165 015d 05ff 80 0108 0165 015d 040f 81 0188 0155
	hex 01d1 03f0 80 0180 0156 0195 04af 0180 0156 0115 050a 0106 0105
	hex 85 00
img33_pal
	hex 0f042830 0f082125 0f122530 0f161927
img33_txt
	db 23
	hex ec db e3 e8 dc e9 f1 ea ec e9 e1 ec df ed ed e3 e8 ee df ec ed df
	hex f2

img34_nt_at0
	hex 01 ff 8b 00
img34_nt_at1
	hex 01 ff 8b 00
img34_nt_at2
	hex 01 96 013e 0152 9d 0202 9b 0102 0152 0162 0166 013e 0102
	hex 99 0142 016d 01ac 01ab 016d 0157 90 00
img34_nt_at3
	hex 01 89 0138 015d 0148 014a 9b 0102 015b 0146 0102 dd 00
img34_nt_at4
	hex 01 ff 8b 00
img34_nt_at5
	hex 00 4401 97 0850 0855 0805 8f 00
img34_pal
	hex 0f250f0f 0f301327 0f0f0f0f 0f0f0f0f
img34_txt
	db 7
	hex ed db ea ea e2 e3 dd

img35_nt_at0
	hex 01 ff 0c29 00
img35_nt_at1
	hex 29 93 7802 00
img35_nt_at2
	hex 02 87 208e 6403 00
img35_nt_at3
	hex 03 9b 209c 5002 00
img35_nt_at4
	hex 02 af 2067 3c01 00
img35_nt_at5
	hex 01 c3 4000 00
img35_pal
	hex 0f212530 0f0f0f0f 0f0f0f0f 0f0f0f0f
img35_txt
	db 14
	hex ee ec db e8 ed d0 00 00 e1 df e8 de df ec

