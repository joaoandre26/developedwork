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
$EndSCHEMATC
