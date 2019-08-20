EESchema Schematic File Version 4
LIBS:FinalDesign-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Irradiance Final Design"
Date "2019-07-23"
Rev ""
Comp "Fluke"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 "Alex Polyanskiy"
$EndDescr
$Comp
L Device:C C1
U 1 1 5D1A6FA9
P 1600 2050
F 0 "C1" H 1715 2096 50  0000 L CNN
F 1 "10uF" H 1715 2005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1638 1900 50  0001 C CNN
F 3 "~" H 1600 2050 50  0001 C CNN
	1    1600 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5D1A8983
P 3350 1900
F 0 "C2" H 3465 1946 50  0000 L CNN
F 1 "47uF" H 3465 1855 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.42x2.65mm_HandSolder" H 3388 1750 50  0001 C CNN
F 3 "~" H 3350 1900 50  0001 C CNN
	1    3350 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5D1A994A
P 1100 6850
F 0 "C4" H 1215 6896 50  0000 L CNN
F 1 ".1uF" H 1215 6805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1138 6700 50  0001 C CNN
F 3 "~" H 1100 6850 50  0001 C CNN
	1    1100 6850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5D1AAC70
P 850 5100
F 0 "R1" H 920 5146 50  0000 L CNN
F 1 "10k" H 920 5055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 780 5100 50  0001 C CNN
F 3 "~" H 850 5100 50  0001 C CNN
	1    850  5100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5D1AB7B0
P 3900 7000
F 0 "R4" H 3830 6954 50  0000 R CNN
F 1 "1k" H 3830 7045 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3830 7000 50  0001 C CNN
F 3 "~" H 3900 7000 50  0001 C CNN
	1    3900 7000
	-1   0    0    1   
$EndComp
$Comp
L Device:L L1
U 1 1 5D1AC109
P 1900 1700
F 0 "L1" V 2090 1700 50  0000 C CNN
F 1 "100uH" V 1999 1700 50  0000 C CNN
F 2 "Prototypedesign1:Inductor100uH" H 1900 1700 50  0001 C CNN
F 3 "~" H 1900 1700 50  0001 C CNN
	1    1900 1700
	0    -1   -1   0   
$EndComp
$Comp
L Diode:MBR0520LT D1
U 1 1 5D1ACEEE
P 2650 1700
F 0 "D1" H 2650 1484 50  0000 C CNN
F 1 "MBR0520LT" H 2650 1575 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" H 2650 1525 50  0001 C CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/MBR0520LT1-D.PDF" H 2650 1700 50  0001 C CNN
	1    2650 1700
	-1   0    0    1   
$EndComp
$Comp
L Prototypedesign1extra:XC6372 U2
U 1 1 5D1B3338
P 2550 2450
F 0 "U2" H 2828 2621 50  0000 L CNN
F 1 "XC6372" H 2828 2530 50  0000 L CNN
F 2 "Prototypedesign1:XC6372" H 2150 2850 50  0001 C CNN
F 3 "" H 2150 2850 50  0001 C CNN
	1    2550 2450
	1    0    0    -1  
$EndComp
$Comp
L Prototypedesign1extra:TMP36 U4
U 1 1 5D1B4959
P 1950 6650
F 0 "U4" H 1950 7115 50  0000 C CNN
F 1 "TMP36" H 1950 7024 50  0000 C CNN
F 2 "Prototypedesign1:SOT-23-5_HandSoldering-TMP36" H 1625 6925 50  0001 C CNN
F 3 "" H 1625 6925 50  0001 C CNN
	1    1950 6650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5D1BD7CB
P 1050 2450
F 0 "#PWR01" H 1050 2200 50  0001 C CNN
F 1 "GND" H 1055 2277 50  0000 C CNN
F 2 "" H 1050 2450 50  0001 C CNN
F 3 "" H 1050 2450 50  0001 C CNN
	1    1050 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5D1C0FA9
P 1100 7050
F 0 "#PWR08" H 1100 6800 50  0001 C CNN
F 1 "GND" H 1105 6877 50  0000 C CNN
F 2 "" H 1100 7050 50  0001 C CNN
F 3 "" H 1100 7050 50  0001 C CNN
	1    1100 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5D1C140E
P 2450 6500
F 0 "#PWR010" H 2450 6250 50  0001 C CNN
F 1 "GND" H 2455 6327 50  0000 C CNN
F 2 "" H 2450 6500 50  0001 C CNN
F 3 "" H 2450 6500 50  0001 C CNN
	1    2450 6500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5D1C3368
P 850 5350
F 0 "#PWR03" H 850 5100 50  0001 C CNN
F 1 "GND" H 855 5177 50  0000 C CNN
F 2 "" H 850 5350 50  0001 C CNN
F 3 "" H 850 5350 50  0001 C CNN
	1    850  5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5D1C9A7A
P 3350 2150
F 0 "#PWR04" H 3350 1900 50  0001 C CNN
F 1 "GND" H 3355 1977 50  0000 C CNN
F 2 "" H 3350 2150 50  0001 C CNN
F 3 "" H 3350 2150 50  0001 C CNN
	1    3350 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5D1F3146
P 4300 5100
F 0 "#PWR09" H 4300 4850 50  0001 C CNN
F 1 "GND" H 4305 4927 50  0000 C CNN
F 2 "" H 4300 5100 50  0001 C CNN
F 3 "" H 4300 5100 50  0001 C CNN
	1    4300 5100
	1    0    0    -1  
$EndComp
Text GLabel 1100 6600 0    50   Input ~ 0
3.3V
Text GLabel 2000 3800 2    50   Input ~ 0
3.3V
Text GLabel 3650 3650 0    50   Input ~ 0
3.3V
Text GLabel 2800 2650 2    50   Input ~ 0
CE
Text GLabel 2000 5100 2    50   Input ~ 0
Thermistor_Voltage
$Comp
L Prototypedesign1extra:Battery BT1
U 1 1 5D1EA4D2
P 1050 2050
F 0 "BT1" V 1004 2178 50  0000 L CNN
F 1 "Battery" V 1095 2178 50  0000 L CNN
F 2 "Prototypedesign1:Prototypebatteryholder" H 900 2200 50  0001 C CNN
F 3 "" H 900 2200 50  0001 C CNN
	1    1050 2050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5D1C18B9
P 3900 7200
F 0 "#PWR013" H 3900 6950 50  0001 C CNN
F 1 "GND" H 3905 7027 50  0000 C CNN
F 2 "" H 3900 7200 50  0001 C CNN
F 3 "" H 3900 7200 50  0001 C CNN
	1    3900 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5D1ABC7F
P 4150 7000
F 0 "R5" H 4080 6954 50  0000 R CNN
F 1 "1k" H 4080 7045 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4080 7000 50  0001 C CNN
F 3 "~" H 4150 7000 50  0001 C CNN
	1    4150 7000
	-1   0    0    1   
$EndComp
Wire Wire Line
	2400 6750 2500 6750
Wire Wire Line
	2500 6750 2500 7000
$Comp
L Amplifier_Current:NCS211 U3
U 1 1 5D1B0D71
P 4300 4550
F 0 "U3" H 4350 5131 50  0000 C CNN
F 1 "NCS211" H 4437 5040 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 4300 4550 50  0001 C CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/NCS210-D.PDF" H 4300 4550 50  0001 C CNN
	1    4300 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 4550 4850 4550
Wire Wire Line
	4850 4550 4850 4900
Wire Wire Line
	4850 4900 4300 4900
Wire Wire Line
	4300 4900 4300 5100
Wire Wire Line
	4300 4850 4300 4900
Connection ~ 4300 4900
Text Notes 700  1150 0    197  ~ 0
Step-Up Voltage Regulator
Wire Wire Line
	3850 6800 3900 6800
Text GLabel 2950 6650 0    50   Input ~ 0
3.3V
Text GLabel 4150 6150 2    50   Input ~ 0
Temperature_Voltage
$Comp
L Prototypedesign1extra:MCP6L01 U5
U 1 1 5D1B6631
P 3450 6650
F 0 "U5" H 3450 7065 50  0000 C CNN
F 1 "MCP6L01" H 3450 6974 50  0000 C CNN
F 2 "Prototypedesign1:SOT-23-5_HandSoldering-MCP6L01" H 3200 6950 50  0001 C CNN
F 3 "" H 3200 6950 50  0001 C CNN
	1    3450 6650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5D1AB1DC
P 4150 6600
F 0 "R3" V 3943 6600 50  0000 C CNN
F 1 "1k" V 4034 6600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4080 6600 50  0001 C CNN
F 3 "~" H 4150 6600 50  0001 C CNN
	1    4150 6600
	-1   0    0    1   
$EndComp
Text Notes 1250 5900 0    197  ~ 0
Temperature Sensor
Wire Wire Line
	2050 1700 2400 1700
Wire Wire Line
	1950 1950 2300 1950
Wire Wire Line
	2300 1950 2300 2000
Wire Wire Line
	2650 2000 2650 1950
Wire Wire Line
	2650 1950 2400 1950
Wire Wire Line
	2400 1950 2400 1700
Connection ~ 2400 1700
Wire Wire Line
	2400 1700 2500 1700
Wire Wire Line
	2650 2650 2800 2650
Text GLabel 3550 1700 2    50   Input ~ 0
5.5V
Text Notes 1500 3350 0    197  ~ 0
Irradiance Sensor
Wire Wire Line
	850  5250 850  5350
Wire Wire Line
	3400 4650 3900 4650
Wire Wire Line
	3400 4450 3900 4450
$Comp
L Device:C C3
U 1 1 5D1A8E20
P 3650 3950
F 0 "C3" H 3765 3996 50  0000 L CNN
F 1 ".1uF" H 3765 3905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3688 3800 50  0001 C CNN
F 3 "~" H 3650 3950 50  0001 C CNN
	1    3650 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5D1C2013
P 3650 4200
F 0 "#PWR06" H 3650 3950 50  0001 C CNN
F 1 "GND" H 3655 4027 50  0000 C CNN
F 2 "" H 3650 4200 50  0001 C CNN
F 3 "" H 3650 4200 50  0001 C CNN
	1    3650 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5D1AA19E
P 3050 4500
F 0 "R2" H 3120 4546 50  0000 L CNN
F 1 ".08" H 3120 4455 50  0000 L CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 2980 4500 50  0001 C CNN
F 3 "~" H 3050 4500 50  0001 C CNN
	1    3050 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 4350 4900 4350
Wire Wire Line
	3400 4000 3400 4450
Wire Wire Line
	3050 4350 3050 4000
Wire Wire Line
	3050 4000 3400 4000
Wire Wire Line
	3400 4900 3400 4650
Wire Wire Line
	3050 4650 3050 4900
Wire Wire Line
	3050 4900 3400 4900
Wire Wire Line
	3650 3650 3650 3800
Wire Wire Line
	3650 4100 3650 4200
$Comp
L power:GND #PWR011
U 1 1 5D1C1B46
P 3950 6550
F 0 "#PWR011" H 3950 6300 50  0001 C CNN
F 1 "GND" H 3955 6377 50  0000 C CNN
F 2 "" H 3950 6550 50  0001 C CNN
F 3 "" H 3950 6550 50  0001 C CNN
	1    3950 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 6500 3950 6500
Wire Wire Line
	3950 6500 3950 6550
Wire Wire Line
	4150 6750 4150 6800
Wire Wire Line
	3900 6800 3900 6850
Connection ~ 3900 6800
Wire Wire Line
	3900 6800 4150 6800
Wire Wire Line
	4150 6800 4150 6850
Connection ~ 4150 6800
Wire Wire Line
	4150 6450 4150 6150
Wire Wire Line
	4150 6150 3000 6150
Wire Wire Line
	3000 6150 3000 6500
Wire Wire Line
	3000 6500 3050 6500
Wire Wire Line
	3900 7150 3900 7200
Wire Wire Line
	3900 7150 4150 7150
Connection ~ 3900 7150
Wire Wire Line
	2950 6650 3050 6650
Wire Wire Line
	2400 6450 2450 6450
Wire Wire Line
	2450 6450 2450 6500
Wire Wire Line
	2500 7000 1450 7000
Wire Wire Line
	1450 7000 1450 6600
Connection ~ 1450 6600
Wire Wire Line
	1450 6600 1500 6600
Wire Wire Line
	1100 6600 1450 6600
Wire Wire Line
	1100 6600 1100 6700
Wire Wire Line
	1100 7000 1100 7050
Wire Wire Line
	1500 6450 1450 6450
Wire Wire Line
	1450 6450 1450 6100
Wire Wire Line
	1450 6100 2600 6100
Wire Wire Line
	2600 6100 2600 6800
Wire Wire Line
	2600 6800 3050 6800
Wire Wire Line
	2800 1700 3200 1700
Wire Wire Line
	2450 2650 2450 2800
Wire Wire Line
	2450 2800 3200 2800
Wire Wire Line
	3200 2800 3200 1700
Connection ~ 3200 1700
Wire Wire Line
	3200 1700 3350 1700
Wire Wire Line
	3350 1700 3350 1750
Connection ~ 3350 1700
Wire Wire Line
	3350 1700 3550 1700
Wire Wire Line
	3350 2050 3350 2150
Wire Wire Line
	1600 1700 1600 1900
Wire Wire Line
	1600 1700 1750 1700
Wire Wire Line
	1050 2350 1050 2400
Wire Wire Line
	1050 2350 1600 2350
Wire Wire Line
	1950 2350 1950 1950
Connection ~ 1050 2350
Wire Wire Line
	1600 2200 1600 2350
Connection ~ 1600 2350
Wire Wire Line
	1600 2350 1950 2350
Wire Wire Line
	4300 4150 4250 4150
Wire Wire Line
	4250 4150 4250 3650
Wire Wire Line
	4250 3650 3650 3650
$Comp
L Prototypedesign1extra:ButtonSwitch S2
U 1 1 5D399E3C
P 10250 4900
F 0 "S2" H 10250 5225 50  0000 C CNN
F 1 "ButtonSwitch" H 10250 5134 50  0000 C CNN
F 2 "Prototypedesign1:ButtonSwitch" H 10150 5100 50  0001 C CNN
F 3 "" H 10150 5100 50  0001 C CNN
	1    10250 4900
	1    0    0    -1  
$EndComp
$Comp
L Prototypedesign1extra:ButtonSwitch S3
U 1 1 5D39AB6C
P 10250 5550
F 0 "S3" H 10250 5875 50  0000 C CNN
F 1 "ButtonSwitch" H 10250 5784 50  0000 C CNN
F 2 "Prototypedesign1:ButtonSwitch" H 10150 5750 50  0001 C CNN
F 3 "" H 10150 5750 50  0001 C CNN
	1    10250 5550
	1    0    0    -1  
$EndComp
$Comp
L Prototypedesign1extra:LCD U9
U 1 1 5D39C1DF
P 9000 4050
F 0 "U9" V 8385 3779 50  0000 C CNN
F 1 "LCD" V 8476 3779 50  0000 C CNN
F 2 "Prototypedesign1:LCD" H 8600 4300 50  0001 C CNN
F 3 "" H 8600 4300 50  0001 C CNN
	1    9000 4050
	0    1    1    0   
$EndComp
$Comp
L Prototypedesign1extra:SlideSwitch S1
U 1 1 5D39D2E0
P 1050 1400
F 0 "S1" H 1378 1396 50  0000 L CNN
F 1 "SlideSwitch" H 1378 1305 50  0000 L CNN
F 2 "Prototypedesign1:SlideSwitch" H 800 1550 50  0001 C CNN
F 3 "" H 800 1550 50  0001 C CNN
	1    1050 1400
	1    0    0    -1  
$EndComp
$Comp
L Prototypedesign1extra:Thermocouple U10
U 1 1 5D39DDFE
P 10350 3950
F 0 "U10" V 9875 3779 50  0000 C CNN
F 1 "Thermocouple" V 9966 3779 50  0000 C CNN
F 2 "Prototypedesign1:Thermocouple" H 10100 4150 50  0001 C CNN
F 3 "" H 10100 4150 50  0001 C CNN
	1    10350 3950
	0    1    1    0   
$EndComp
Wire Wire Line
	900  1600 900  1750
Wire Wire Line
	900  1750 1050 1750
Wire Wire Line
	1050 1600 1050 1700
Wire Wire Line
	1050 1700 1600 1700
Connection ~ 1600 1700
Text GLabel 10100 3900 0    50   Input ~ 0
MISO
Text GLabel 10100 4200 0    50   Input ~ 0
3.3V
Text GLabel 8700 3700 0    50   Input ~ 0
3.3V
Text GLabel 8700 3800 0    50   Input ~ 0
GND
Text GLabel 8700 3900 0    50   Input ~ 0
SCE
Text GLabel 8700 4000 0    50   Input ~ 0
RST
Text GLabel 8700 4100 0    50   Input ~ 0
DC
Text GLabel 8700 4200 0    50   Input ~ 0
DN
Text GLabel 8700 4300 0    50   Input ~ 0
SCLK
Text GLabel 6900 3650 0    50   Input ~ 0
SDA
Text GLabel 6900 3950 0    50   Input ~ 0
SCL
Text GLabel 7550 2700 0    50   Input ~ 0
3.3V
Text GLabel 10050 2600 2    50   Input ~ 0
GND
Text GLabel 9550 2700 0    50   Input ~ 0
5.5V
Text GLabel 8050 2400 2    50   Input ~ 0
GND
Text GLabel 10100 4100 0    50   Input ~ 0
GND
Text GLabel 1000 2400 0    50   Input ~ 0
GND
Wire Wire Line
	1000 2400 1050 2400
Connection ~ 1050 2400
Wire Wire Line
	1050 2400 1050 2450
$Comp
L Device:R R9
U 1 1 5D3BB7D5
P 10800 4800
F 0 "R9" H 10870 4846 50  0000 L CNN
F 1 "10k" H 10870 4755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10730 4800 50  0001 C CNN
F 3 "~" H 10800 4800 50  0001 C CNN
	1    10800 4800
	-1   0    0    1   
$EndComp
$Comp
L Device:R R10
U 1 1 5D3BBF13
P 10800 5450
F 0 "R10" H 10870 5496 50  0000 L CNN
F 1 "10k" H 10870 5405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10730 5450 50  0001 C CNN
F 3 "~" H 10800 5450 50  0001 C CNN
	1    10800 5450
	-1   0    0    1   
$EndComp
$Comp
L Device:R R8
U 1 1 5D3BC0C8
P 10750 6150
F 0 "R8" H 10820 6196 50  0000 L CNN
F 1 "10k" H 10820 6105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10680 6150 50  0001 C CNN
F 3 "~" H 10750 6150 50  0001 C CNN
	1    10750 6150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5D3C5660
P 9900 4850
F 0 "#PWR0101" H 9900 4600 50  0001 C CNN
F 1 "GND" H 9905 4677 50  0000 C CNN
F 2 "" H 9900 4850 50  0001 C CNN
F 3 "" H 9900 4850 50  0001 C CNN
	1    9900 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5D3C5C1C
P 9900 5500
F 0 "#PWR0102" H 9900 5250 50  0001 C CNN
F 1 "GND" H 9905 5327 50  0000 C CNN
F 2 "" H 9900 5500 50  0001 C CNN
F 3 "" H 9900 5500 50  0001 C CNN
	1    9900 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5D3C63BD
P 9900 6200
F 0 "#PWR0103" H 9900 5950 50  0001 C CNN
F 1 "GND" H 9905 6027 50  0000 C CNN
F 2 "" H 9900 6200 50  0001 C CNN
F 3 "" H 9900 6200 50  0001 C CNN
	1    9900 6200
	1    0    0    -1  
$EndComp
Text GLabel 10800 4550 2    50   Input ~ 0
3.3V
Text GLabel 10750 5900 2    50   Input ~ 0
3.3V
Wire Wire Line
	10800 4950 10800 5000
Wire Wire Line
	10800 5000 10500 5000
Wire Wire Line
	10800 4550 10800 4650
Text GLabel 10800 5200 2    50   Input ~ 0
3.3V
Wire Wire Line
	10800 5200 10800 5300
Wire Wire Line
	10800 5600 10800 5650
Wire Wire Line
	10800 5650 10500 5650
Wire Wire Line
	9900 5500 9900 5450
Wire Wire Line
	9900 5450 10000 5450
$Comp
L Prototypedesign1extra:ButtonSwitch S4
U 1 1 5D39B199
P 10250 6250
F 0 "S4" H 10250 6575 50  0000 C CNN
F 1 "ButtonSwitch" H 10250 6484 50  0000 C CNN
F 2 "Prototypedesign1:ButtonSwitch" H 10150 6450 50  0001 C CNN
F 3 "" H 10150 6450 50  0001 C CNN
	1    10250 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 6200 9900 6150
Wire Wire Line
	9900 6150 10000 6150
Wire Wire Line
	10500 6350 10750 6350
Wire Wire Line
	10750 6350 10750 6300
Wire Wire Line
	10750 6000 10750 5900
Wire Wire Line
	9900 4850 9900 4800
Wire Wire Line
	9900 4800 10000 4800
Text GLabel 8050 1600 2    50   Input ~ 0
SDA
Text GLabel 7550 1700 0    50   Input ~ 0
SCL
Text GLabel 8050 1800 2    50   Input ~ 0
DC
Text GLabel 7550 1900 0    50   Input ~ 0
RST
Text GLabel 8050 2000 2    50   Input ~ 0
D4
Text GLabel 10800 5000 2    50   Input ~ 0
D4
Text GLabel 7550 2100 0    50   Input ~ 0
D5
Text GLabel 10800 5650 2    50   Input ~ 0
D5
Text GLabel 8050 2200 2    50   Input ~ 0
D6
Text GLabel 10750 6350 2    50   Input ~ 0
D6
Text GLabel 10050 1600 2    50   Input ~ 0
Thermistor_Voltage
Text GLabel 9550 1700 0    50   Input ~ 0
Temperature_Voltage
Text GLabel 10050 1800 2    50   Input ~ 0
SCE
Text GLabel 9550 1900 0    50   Input ~ 0
SCLK
Text GLabel 10100 4000 0    50   Input ~ 0
SCLK
Text GLabel 4900 4350 2    50   Input ~ 0
Solar_Voltage
Text GLabel 10050 2200 2    50   Input ~ 0
Solar_Voltage
Text GLabel 10050 2400 2    50   Input ~ 0
RX
Text GLabel 9550 2500 0    50   Input ~ 0
TX
Text GLabel 9550 2100 0    50   Input ~ 0
DN
Text Notes 8700 4950 0    79   ~ 0
Main Menu Button
Text Notes 8950 5550 0    79   ~ 0
Temp Button
Text Notes 9050 6200 0    79   ~ 0
Max Button
Text GLabel 10100 3700 0    50   Input ~ 0
SS
Text GLabel 9550 2300 0    47   Input ~ 0
SS
$Comp
L Prototypedesign1extra:MC U8
U 1 1 5D39C854
P 8800 2150
F 0 "U8" V 7785 2125 50  0000 C CNN
F 1 "MC" V 7876 2125 50  0000 C CNN
F 2 "Prototypedesign1:MC" H 8100 3350 50  0001 C CNN
F 3 "" H 8100 3350 50  0001 C CNN
	1    8800 2150
	0    1    1    0   
$EndComp
Text GLabel 7550 2300 0    47   Input ~ 0
MISO
$Comp
L Prototypedesign1extra:Bluetooth U6
U 1 1 5D42BA0D
P 7700 5550
F 0 "U6" V 7656 5728 47  0000 L CNN
F 1 "Bluetooth" V 7743 5728 47  0000 L CNN
F 2 "Prototypedesign1:Bluetooth" H 7500 5750 47  0001 C CNN
F 3 "" H 7500 5750 47  0001 C CNN
	1    7700 5550
	0    1    1    0   
$EndComp
Text GLabel 7450 5400 0    47   Input ~ 0
RX
Text GLabel 7450 5700 0    47   Input ~ 0
TX
Text GLabel 7450 5500 0    47   Input ~ 0
3.3V
Text GLabel 7450 5600 0    47   Input ~ 0
GND
Text Notes 7150 5200 0    79   ~ 0
Bluetooth Module
Text Notes 9500 3350 0    79   ~ 0
Thermocouple Module
Text Notes 8700 3350 0    79   ~ 0
LCD
Text Notes 7700 1000 0    197  ~ 0
Microcontroller
Text Notes 6900 3350 0    79   ~ 0
Inclinometer Module
Wire Wire Line
	7400 3800 7600 3800
Wire Wire Line
	7400 3950 7400 3800
Wire Wire Line
	7300 3950 7400 3950
Wire Wire Line
	6900 3950 7000 3950
Wire Wire Line
	7350 3700 7600 3700
Wire Wire Line
	7350 3650 7350 3700
Wire Wire Line
	7300 3650 7350 3650
Wire Wire Line
	6900 3650 7000 3650
$Comp
L Device:R R7
U 1 1 5D40FA6F
P 7150 3950
F 0 "R7" V 6943 3950 50  0000 C CNN
F 1 "4.99k" V 7034 3950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7080 3950 50  0001 C CNN
F 3 "~" H 7150 3950 50  0001 C CNN
	1    7150 3950
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5D40816C
P 7150 3650
F 0 "R6" V 6943 3650 50  0000 C CNN
F 1 "4.99k" V 7034 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7080 3650 50  0001 C CNN
F 3 "~" H 7150 3650 50  0001 C CNN
	1    7150 3650
	0    1    1    0   
$EndComp
Text GLabel 7600 4100 0    50   Input ~ 0
GND
Text GLabel 7600 4000 0    50   Input ~ 0
I1
Text GLabel 7600 3900 0    50   Input ~ 0
I2
Text GLabel 7600 3600 0    50   Input ~ 0
3.3V
$Comp
L Prototypedesign1extra:Inclinometer U7
U 1 1 5D39B78C
P 7850 3850
F 0 "U7" V 7375 3679 50  0000 C CNN
F 1 "Inclinometer" V 7466 3679 50  0000 C CNN
F 2 "Prototypedesign1:Inclinometer" H 7600 4050 50  0001 C CNN
F 3 "" H 7600 4050 50  0001 C CNN
	1    7850 3850
	0    1    1    0   
$EndComp
$Comp
L Prototypedesign1extra:SolarCellModule U1
U 1 1 5D3FF001
P 1850 4450
F 0 "U1" H 2128 4496 50  0000 L CNN
F 1 "SolarCellModule" H 2128 4405 50  0000 L CNN
F 2 "Prototypedesign1:Solar Cell Module" H 1600 5050 50  0001 C CNN
F 3 "" H 1600 5050 50  0001 C CNN
	1    1850 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 3800 1700 3650
Wire Wire Line
	1700 3650 2800 3650
Wire Wire Line
	2800 3650 2800 4000
Wire Wire Line
	2800 4000 3050 4000
Connection ~ 3050 4000
Wire Wire Line
	1700 5100 1700 5350
Wire Wire Line
	1700 5350 2950 5350
Wire Wire Line
	2950 5350 2950 4900
Wire Wire Line
	2950 4900 3050 4900
Connection ~ 3050 4900
Wire Wire Line
	850  4950 1500 4950
Wire Wire Line
	1500 4950 1500 5250
Wire Wire Line
	1500 5250 2000 5250
Wire Wire Line
	2000 5250 2000 5100
$EndSCHEMATC
