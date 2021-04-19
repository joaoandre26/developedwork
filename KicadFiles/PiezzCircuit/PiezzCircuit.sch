EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Reference_Voltage:LM385BZ-1.2 U2
U 1 1 5FCB78E3
P 1550 1950
F 0 "U2" V 1596 1862 50  0000 R CNN
F 1 "LM385BZ-1.2" V 1505 1862 50  0000 R CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 1550 1750 50  0001 C CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/LM285-D.PDF" H 1550 1950 50  0001 C CIN
	1    1550 1950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R3
U 1 1 5FCB8D3A
P 1550 1550
F 0 "R3" H 1620 1596 50  0000 L CNN
F 1 "180k" H 1620 1505 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 1480 1550 50  0001 C CNN
F 3 "~" H 1550 1550 50  0001 C CNN
	1    1550 1550
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR0101
U 1 1 5FCB91EC
P 1550 1350
F 0 "#PWR0101" H 1550 1200 50  0001 C CNN
F 1 "VDD" H 1565 1523 50  0000 C CNN
F 2 "" H 1550 1350 50  0001 C CNN
F 3 "" H 1550 1350 50  0001 C CNN
	1    1550 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5FCB975E
P 1550 2150
F 0 "#PWR0102" H 1550 1900 50  0001 C CNN
F 1 "GND" H 1555 1977 50  0000 C CNN
F 2 "" H 1550 2150 50  0001 C CNN
F 3 "" H 1550 2150 50  0001 C CNN
	1    1550 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1750 1550 1700
Wire Wire Line
	1550 1800 1550 1750
Connection ~ 1550 1750
Wire Wire Line
	1550 1400 1550 1350
Wire Wire Line
	1550 2100 1550 2150
Wire Notes Line
	1400 2400 2650 2400
Wire Notes Line
	2650 2400 2650 950 
Wire Notes Line
	2650 950  1400 950 
Wire Notes Line
	1400 950  1400 2400
Text Notes 1450 1050 0    50   ~ 0
VoltageRef1.2V\n
$Comp
L Amplifier_Operational:MCP602 U1
U 2 1 5FCBB035
P 2150 3350
F 0 "U1" H 2150 3717 50  0000 C CNN
F 1 "MCP6022" H 2150 3626 50  0000 C CNN
F 2 "MCP602-I_P:DIP787W46P254L927H533Q8" H 2150 3350 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/20001685e.pdf" H 2150 3350 50  0001 C CNN
	2    2150 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5FCBF2E5
P 1600 3100
F 0 "R4" H 1670 3146 50  0000 L CNN
F 1 "R" H 1670 3055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1530 3100 50  0001 C CNN
F 3 "~" H 1600 3100 50  0001 C CNN
	1    1600 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5FCBF944
P 1600 3400
F 0 "R5" H 1670 3446 50  0000 L CNN
F 1 "R" H 1670 3355 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1530 3400 50  0001 C CNN
F 3 "~" H 1600 3400 50  0001 C CNN
	1    1600 3400
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR0103
U 1 1 5FCC030B
P 1600 2900
F 0 "#PWR0103" H 1600 2750 50  0001 C CNN
F 1 "VDD" H 1615 3073 50  0000 C CNN
F 2 "" H 1600 2900 50  0001 C CNN
F 3 "" H 1600 2900 50  0001 C CNN
	1    1600 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5FCC0601
P 1600 3600
F 0 "#PWR0104" H 1600 3350 50  0001 C CNN
F 1 "GND" H 1605 3427 50  0000 C CNN
F 2 "" H 1600 3600 50  0001 C CNN
F 3 "" H 1600 3600 50  0001 C CNN
	1    1600 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 3450 1750 3450
Wire Wire Line
	1750 3450 1750 3600
Wire Wire Line
	1750 3600 2550 3600
Wire Wire Line
	2550 3600 2550 3350
Wire Wire Line
	2550 3350 2450 3350
Wire Wire Line
	1850 3250 1600 3250
Connection ~ 1600 3250
Wire Wire Line
	1600 2950 1600 2900
Wire Wire Line
	1600 3550 1600 3600
Wire Notes Line
	1400 2550 3200 2550
Wire Notes Line
	3200 2550 3200 3900
Wire Notes Line
	3200 3900 1400 3900
Wire Notes Line
	1400 3900 1400 2550
Text Notes 1450 2650 0    50   ~ 0
VoltageDivider1.2V\n
$Comp
L Device:C C1
U 1 1 5FCC647E
P 6100 1700
F 0 "C1" V 5848 1700 50  0000 C CNN
F 1 "1nF" V 5939 1700 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 6138 1550 50  0001 C CNN
F 3 "~" H 6100 1700 50  0001 C CNN
	1    6100 1700
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 5FCC6B81
P 6100 1350
F 0 "R1" V 5893 1350 50  0000 C CNN
F 1 "330k" V 5984 1350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6030 1350 50  0001 C CNN
F 3 "~" H 6100 1350 50  0001 C CNN
	1    6100 1350
	0    1    1    0   
$EndComp
Wire Wire Line
	5800 2300 5700 2300
Wire Wire Line
	5200 2900 5200 2550
Wire Wire Line
	5200 2550 5300 2550
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 5FCCD660
P 4700 2150
F 0 "J1" H 4808 2331 50  0000 C CNN
F 1 "PiezoElectricConn" H 4808 2240 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4700 2150 50  0001 C CNN
F 3 "~" H 4700 2150 50  0001 C CNN
	1    4700 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 2100 5350 2150
Wire Wire Line
	5350 2150 4900 2150
Wire Wire Line
	4900 2250 5350 2250
Wire Wire Line
	5350 2250 5350 2300
Wire Wire Line
	5350 2300 5700 2300
Connection ~ 5700 2300
Connection ~ 5200 2550
Wire Notes Line
	4450 950  7250 950 
Wire Notes Line
	7250 950  7250 3050
Wire Notes Line
	7250 3050 4450 3050
Wire Notes Line
	4450 3050 4450 950 
Wire Wire Line
	5350 2100 5700 2100
Wire Wire Line
	6400 2200 6500 2200
Wire Wire Line
	5700 2100 5700 1700
Connection ~ 5700 2100
Wire Wire Line
	5700 2100 5800 2100
Wire Wire Line
	5700 1700 5950 1700
Wire Wire Line
	5950 1350 5700 1350
Wire Wire Line
	5700 1350 5700 1700
Connection ~ 5700 1700
Wire Wire Line
	6500 1350 6250 1350
Wire Wire Line
	6500 1700 6250 1700
Wire Wire Line
	6500 1350 6500 1700
Wire Wire Line
	6500 1700 6500 2200
Connection ~ 6500 1700
Wire Wire Line
	6600 2200 6500 2200
Connection ~ 6500 2200
Text Notes 4500 1050 0    50   ~ 0
PiezoElectric Amplifier Circuit\n
$Comp
L Amplifier_Operational:MCP602 U1
U 3 1 5FCDEB5C
P 5350 4050
F 0 "U1" H 5308 4096 50  0000 L CNN
F 1 "MCP6022" H 5308 4005 50  0000 L CNN
F 2 "MCP602-I_P:DIP787W46P254L927H533Q8" H 5350 4050 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/20001685e.pdf" H 5350 4050 50  0001 C CNN
	3    5350 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5FCE1A56
P 4950 4050
F 0 "C3" H 5065 4096 50  0000 L CNN
F 1 "10uF" H 5065 4005 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 4988 3900 50  0001 C CNN
F 3 "~" H 4950 4050 50  0001 C CNN
	1    4950 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C4
U 1 1 5FCE243D
P 4600 4050
F 0 "C4" H 4718 4096 50  0000 L CNN
F 1 "1nF" H 4718 4005 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 4638 3900 50  0001 C CNN
F 3 "~" H 4600 4050 50  0001 C CNN
	1    4600 4050
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR0105
U 1 1 5FCE2EC4
P 4600 3700
F 0 "#PWR0105" H 4600 3550 50  0001 C CNN
F 1 "VDD" H 4615 3873 50  0000 C CNN
F 2 "" H 4600 3700 50  0001 C CNN
F 3 "" H 4600 3700 50  0001 C CNN
	1    4600 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5FCE3A3B
P 4600 4400
F 0 "#PWR0106" H 4600 4150 50  0001 C CNN
F 1 "GND" H 4605 4227 50  0000 C CNN
F 2 "" H 4600 4400 50  0001 C CNN
F 3 "" H 4600 4400 50  0001 C CNN
	1    4600 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 4350 4950 4350
Wire Wire Line
	4600 4350 4600 4400
Wire Wire Line
	4600 4200 4600 4350
Connection ~ 4600 4350
Wire Wire Line
	4950 4200 4950 4350
Connection ~ 4950 4350
Wire Wire Line
	4950 4350 4600 4350
Wire Wire Line
	5250 3750 4950 3750
Wire Wire Line
	4600 3750 4600 3900
Wire Wire Line
	4600 3700 4600 3750
Connection ~ 4600 3750
Wire Wire Line
	4950 3900 4950 3750
Connection ~ 4950 3750
Wire Wire Line
	4950 3750 4600 3750
Wire Notes Line
	4450 3350 5700 3350
Wire Notes Line
	5700 3350 5700 4650
Wire Notes Line
	5700 4650 4450 4650
Wire Notes Line
	4450 4650 4450 3350
Text Notes 4500 3450 0    50   ~ 0
OpAmp Supply
$Comp
L Amplifier_Operational:MCP6022 U1
U 1 1 5FC77F07
P 6100 2200
F 0 "U1" H 6100 2567 50  0000 C CNN
F 1 "MCP6022" H 6100 2476 50  0000 C CNN
F 2 "MCP602-I_P:DIP787W46P254L927H533Q8" H 6100 2200 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/20001685e.pdf" H 6100 2200 50  0001 C CNN
	1    6100 2200
	1    0    0    1   
$EndComp
Wire Wire Line
	5300 2900 5200 2900
$Comp
L Device:C C2
U 1 1 5FC8DD01
P 5450 2900
F 0 "C2" V 5198 2900 50  0000 C CNN
F 1 "1nF" V 5289 2900 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 5488 2750 50  0001 C CNN
F 3 "~" H 5450 2900 50  0001 C CNN
	1    5450 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	5600 2900 5700 2900
Wire Wire Line
	5700 2300 5700 2550
$Comp
L Device:R R2
U 1 1 5FC91719
P 5450 2550
F 0 "R2" V 5243 2550 50  0000 C CNN
F 1 "330k" V 5334 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5380 2550 50  0001 C CNN
F 3 "~" H 5450 2550 50  0001 C CNN
	1    5450 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	5600 2550 5700 2550
Connection ~ 5700 2550
Wire Wire Line
	5700 2550 5700 2900
$Comp
L Connector:Conn_01x10_Male J3
U 1 1 5FCAD5B5
P 6800 1800
F 0 "J3" H 6772 1682 50  0000 R CNN
F 1 "ADCInput" H 6772 1773 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 6800 1800 50  0001 C CNN
F 3 "~" H 6800 1800 50  0001 C CNN
	1    6800 1800
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x10_Male J6
U 1 1 5FCB5002
P 7150 4000
F 0 "J6" H 7122 3882 50  0000 R CNN
F 1 "Support" H 7122 3973 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 7150 4000 50  0001 C CNN
F 3 "~" H 7150 4000 50  0001 C CNN
	1    7150 4000
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5FCB88DD
P 6650 3600
F 0 "#PWR0107" H 6650 3350 50  0001 C CNN
F 1 "GND" H 6655 3427 50  0000 C CNN
F 2 "" H 6650 3600 50  0001 C CNN
F 3 "" H 6650 3600 50  0001 C CNN
	1    6650 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 3500 6650 3500
Wire Wire Line
	6650 3500 6650 3600
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 5FCD25DF
P 3600 2700
F 0 "J2" H 3708 2981 50  0000 C CNN
F 1 "Conn_01x03_Male" H 3708 2890 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3600 2700 50  0001 C CNN
F 3 "~" H 3600 2700 50  0001 C CNN
	1    3600 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 3350 3900 3350
Wire Wire Line
	3900 3350 3900 2800
Wire Wire Line
	3900 2800 3800 2800
Connection ~ 2550 3350
Wire Wire Line
	3800 2700 4700 2700
Wire Wire Line
	4700 2700 4700 2550
Wire Wire Line
	4700 2550 5200 2550
Wire Wire Line
	4100 1750 4100 2600
Wire Wire Line
	4100 2600 3800 2600
Wire Wire Line
	1550 1750 4100 1750
Wire Wire Line
	5250 3500 5250 3750
Connection ~ 5250 3750
$Comp
L Connector:Conn_01x03_Male J7
U 1 1 5FC9ED44
P 6150 4100
F 0 "J7" V 6304 3912 50  0000 R CNN
F 1 "ExtSupply" V 6213 3912 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 6150 4100 50  0001 C CNN
F 3 "~" H 6150 4100 50  0001 C CNN
	1    6150 4100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5250 3500 6050 3500
Wire Wire Line
	6150 3900 6150 3500
Wire Wire Line
	6150 3500 6650 3500
Connection ~ 6650 3500
Wire Wire Line
	6050 3500 6050 3600
Wire Wire Line
	6050 3600 6250 3600
Wire Wire Line
	6250 3600 6250 3900
Wire Wire Line
	6950 3800 6350 3800
Wire Wire Line
	6350 3800 6350 4200
Wire Wire Line
	6350 4200 5900 4200
Wire Wire Line
	5900 4200 5900 3800
Wire Wire Line
	5900 3800 6050 3800
Wire Wire Line
	6050 3800 6050 3900
Wire Notes Line
	18150 1700 18150 4100
Wire Notes Line
	14350 1700 18150 1700
Wire Notes Line
	14350 4100 18150 4100
Wire Notes Line
	14350 1700 14350 4100
Wire Wire Line
	15550 3500 15550 3550
Wire Wire Line
	17400 3150 17650 3150
Wire Wire Line
	15650 3350 16300 3350
Wire Wire Line
	16300 3250 16600 3250
Wire Wire Line
	16300 3350 16300 3250
Wire Wire Line
	16300 2950 16300 3050
Wire Wire Line
	15650 2950 16300 2950
$Comp
L SMD10T3R111:SMD10T3R111 Y1
U 1 1 605A72DC
P 15650 3150
F 0 "Y1" V 15604 3283 50  0000 L CNN
F 1 "PiezoElectric" V 15695 3283 50  0000 L CNN
F 2 "XDCR_SMD10T3R111" H 15650 3150 50  0001 L BNN
F 3 "" H 15650 3150 50  0001 L BNN
F 4 "N/A" H 15650 3150 50  0001 L BNN "PARTREV"
F 5 "3.0 mm" H 15650 3150 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 6 "STEMiNC" H 15650 3150 50  0001 L BNN "MANUFACTURER"
F 7 "Manufacturer Recommendations" H 15650 3150 50  0001 L BNN "STANDARD"
	1    15650 3150
	0    1    1    0   
$EndComp
Wire Wire Line
	15250 2150 14900 2150
Wire Wire Line
	15250 2300 15250 2150
Wire Wire Line
	14900 2100 14900 2150
Connection ~ 14900 2150
Wire Wire Line
	14900 2150 14900 2300
Connection ~ 15250 2150
Wire Wire Line
	15550 2150 15250 2150
Wire Wire Line
	15250 2750 14900 2750
Wire Wire Line
	15250 2600 15250 2750
Wire Wire Line
	14900 2600 14900 2750
Connection ~ 14900 2750
Wire Wire Line
	14900 2750 14900 2800
Connection ~ 15250 2750
Wire Wire Line
	15550 2750 15250 2750
$Comp
L power:GND #PWR0111
U 1 1 60594072
P 14900 2800
F 0 "#PWR0111" H 14900 2550 50  0001 C CNN
F 1 "GND" H 14905 2627 50  0000 C CNN
F 2 "" H 14900 2800 50  0001 C CNN
F 3 "" H 14900 2800 50  0001 C CNN
	1    14900 2800
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR0110
U 1 1 6059406C
P 14900 2100
F 0 "#PWR0110" H 14900 1950 50  0001 C CNN
F 1 "VDD" H 14915 2273 50  0000 C CNN
F 2 "" H 14900 2100 50  0001 C CNN
F 3 "" H 14900 2100 50  0001 C CNN
	1    14900 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C3
U 1 1 60594066
P 14900 2450
F 0 "C3" H 15018 2496 50  0000 L CNN
F 1 "1nF" H 15018 2405 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 14938 2300 50  0001 C CNN
F 3 "~" H 14900 2450 50  0001 C CNN
	1    14900 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 60594060
P 15250 2450
F 0 "C4" H 15365 2496 50  0000 L CNN
F 1 "10uF" H 15365 2405 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 15288 2300 50  0001 C CNN
F 3 "~" H 15250 2450 50  0001 C CNN
	1    15250 2450
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:MCP602 U1
U 3 1 6059405A
P 15650 2450
F 0 "U1" H 15608 2496 50  0000 L CNN
F 1 "MCP6022" H 15608 2405 50  0000 L CNN
F 2 "MCP602-I_P:DIP787W46P254L927H533Q8" H 15650 2450 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/20001685e.pdf" H 15650 2450 50  0001 C CNN
	3    15650 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	14600 3750 14600 3800
Wire Wire Line
	14600 3150 14600 3100
Wire Wire Line
	14850 3450 14600 3450
Wire Wire Line
	15550 3550 15450 3550
Connection ~ 15550 3550
Wire Wire Line
	15550 3800 15550 3550
Wire Wire Line
	14750 3800 15550 3800
Wire Wire Line
	14750 3650 14750 3800
Wire Wire Line
	14850 3650 14750 3650
$Comp
L power:GND #PWR0109
U 1 1 60580F4E
P 14600 3800
F 0 "#PWR0109" H 14600 3550 50  0001 C CNN
F 1 "GND" H 14605 3627 50  0000 C CNN
F 2 "" H 14600 3800 50  0001 C CNN
F 3 "" H 14600 3800 50  0001 C CNN
	1    14600 3800
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR0108
U 1 1 60580F48
P 14600 3100
F 0 "#PWR0108" H 14600 2950 50  0001 C CNN
F 1 "VDD" H 14615 3273 50  0000 C CNN
F 2 "" H 14600 3100 50  0001 C CNN
F 3 "" H 14600 3100 50  0001 C CNN
	1    14600 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 60580F42
P 14600 3600
F 0 "R4" H 14670 3646 50  0000 L CNN
F 1 "R" H 14670 3555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 14530 3600 50  0001 C CNN
F 3 "~" H 14600 3600 50  0001 C CNN
	1    14600 3600
	1    0    0    -1  
$EndComp
Connection ~ 14600 3450
$Comp
L Device:R R3
U 1 1 60580F3C
P 14600 3300
F 0 "R3" H 14670 3346 50  0000 L CNN
F 1 "R" H 14670 3255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 14530 3300 50  0001 C CNN
F 3 "~" H 14600 3300 50  0001 C CNN
	1    14600 3300
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:MCP602 U1
U 2 1 60580F36
P 15150 3550
F 0 "U1" H 15150 3917 50  0000 C CNN
F 1 "MCP6022" H 15150 3826 50  0000 C CNN
F 2 "MCP602-I_P:DIP787W46P254L927H533Q8" H 15150 3550 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/20001685e.pdf" H 15150 3550 50  0001 C CNN
	2    15150 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	16600 3500 16600 3850
Wire Wire Line
	16500 3500 16600 3500
$Comp
L Device:R R2
U 1 1 605586D7
P 16350 3500
F 0 "R2" V 16143 3500 50  0000 C CNN
F 1 "100M" V 16234 3500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 16280 3500 50  0001 C CNN
F 3 "~" H 16350 3500 50  0001 C CNN
	1    16350 3500
	0    1    1    0   
$EndComp
Connection ~ 16600 3500
Wire Wire Line
	16600 3250 16600 3500
Wire Wire Line
	16500 3850 16600 3850
$Comp
L Device:C C2
U 1 1 605586CF
P 16350 3850
F 0 "C2" V 16098 3850 50  0000 C CNN
F 1 "1n" V 16189 3850 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 16388 3700 50  0001 C CNN
F 3 "~" H 16350 3850 50  0001 C CNN
	1    16350 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	16200 3850 16100 3850
$Comp
L Amplifier_Operational:MCP6022 U1
U 1 1 605586C8
P 17000 3150
F 0 "U1" H 17000 3517 50  0000 C CNN
F 1 "MCP6022" H 17000 3426 50  0000 C CNN
F 2 "MCP602-I_P:DIP787W46P254L927H533Q8" H 17000 3150 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/20001685e.pdf" H 17000 3150 50  0001 C CNN
	1    17000 3150
	1    0    0    1   
$EndComp
Text Notes 14400 1800 0    50   ~ 0
PiezoElectric Amplifier Circuit\n
Wire Wire Line
	17400 2650 17400 3150
Wire Wire Line
	17400 2300 17400 2650
Connection ~ 17400 2650
Wire Wire Line
	17400 2650 17150 2650
Wire Wire Line
	17400 2300 17150 2300
Wire Wire Line
	16600 2300 16600 2650
Wire Wire Line
	16850 2300 16600 2300
Wire Wire Line
	16600 2650 16850 2650
Connection ~ 16600 2650
Wire Wire Line
	16300 3050 16600 3050
Wire Wire Line
	16600 3050 16700 3050
Connection ~ 16600 3050
Wire Wire Line
	16600 3050 16600 2650
Connection ~ 17400 3150
Wire Wire Line
	17300 3150 17400 3150
Wire Wire Line
	16100 3500 15550 3500
Wire Wire Line
	16100 3500 16200 3500
Connection ~ 16100 3500
Wire Wire Line
	16100 3850 16100 3500
Connection ~ 16600 3250
Wire Wire Line
	16700 3250 16600 3250
$Comp
L Device:R R1
U 1 1 6055869D
P 17000 2300
F 0 "R1" V 16793 2300 50  0000 C CNN
F 1 "100M" V 16884 2300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 16930 2300 50  0001 C CNN
F 3 "~" H 17000 2300 50  0001 C CNN
	1    17000 2300
	0    1    1    0   
$EndComp
$Comp
L Device:C C1
U 1 1 60558697
P 17000 2650
F 0 "C1" V 16748 2650 50  0000 C CNN
F 1 "1n" V 16839 2650 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 17038 2500 50  0001 C CNN
F 3 "~" H 17000 2650 50  0001 C CNN
	1    17000 2650
	0    1    1    0   
$EndComp
$EndSCHEMATC
