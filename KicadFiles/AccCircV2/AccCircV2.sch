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
L Reference_Voltage:LM385Z-ADJ U2
U 1 1 5FE0026A
P 1700 3950
F 0 "U2" V 1746 3862 50  0000 R CNN
F 1 "LM385Z-ADJ" V 1655 3862 50  0000 R CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 1700 3750 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm185-adj.pdf" H 1700 3950 50  0001 C CIN
	1    1700 3950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R5
U 1 1 5FE01A4B
P 1700 3650
F 0 "R5" H 1770 3696 50  0000 L CNN
F 1 "180k" H 1770 3605 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1630 3650 50  0001 C CNN
F 3 "~" H 1700 3650 50  0001 C CNN
	1    1700 3650
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR0101
U 1 1 5FE03491
P 1700 3500
F 0 "#PWR0101" H 1700 3350 50  0001 C CNN
F 1 "VDD" H 1715 3673 50  0000 C CNN
F 2 "" H 1700 3500 50  0001 C CNN
F 3 "" H 1700 3500 50  0001 C CNN
	1    1700 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5FE03C56
P 1700 4100
F 0 "#PWR0102" H 1700 3850 50  0001 C CNN
F 1 "GND" H 1705 3927 50  0000 C CNN
F 2 "" H 1700 4100 50  0001 C CNN
F 3 "" H 1700 4100 50  0001 C CNN
	1    1700 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 3950 1500 4100
Wire Wire Line
	1500 4100 1700 4100
Connection ~ 1700 4100
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 5FE04A0A
P 3000 3650
F 0 "J1" H 3108 3931 50  0000 C CNN
F 1 "AccelConnector" H 3108 3840 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 3000 3650 50  0001 C CNN
F 3 "~" H 3000 3650 50  0001 C CNN
	1    3000 3650
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR0103
U 1 1 5FE0611B
P 3450 3350
F 0 "#PWR0103" H 3450 3200 50  0001 C CNN
F 1 "VDD" H 3465 3523 50  0000 C CNN
F 2 "" H 3450 3350 50  0001 C CNN
F 3 "" H 3450 3350 50  0001 C CNN
	1    3450 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 3550 3450 3550
Wire Wire Line
	3450 3550 3450 3350
$Comp
L power:GND #PWR0104
U 1 1 5FE069CA
P 3450 3950
F 0 "#PWR0104" H 3450 3700 50  0001 C CNN
F 1 "GND" H 3455 3777 50  0000 C CNN
F 2 "" H 3450 3950 50  0001 C CNN
F 3 "" H 3450 3950 50  0001 C CNN
	1    3450 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 3950 3450 3750
Wire Wire Line
	3450 3750 3200 3750
$Comp
L Amplifier_Operational:MCP602 U1
U 1 1 5FE073DB
P 5000 3650
F 0 "U1" H 5000 3283 50  0000 C CNN
F 1 "MCP602" H 5000 3374 50  0000 C CNN
F 2 "MCP602-I_P:DIP787W46P254L927H533Q8" H 5000 3650 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21314g.pdf" H 5000 3650 50  0001 C CNN
	1    5000 3650
	1    0    0    1   
$EndComp
$Comp
L Device:R R1
U 1 1 5FE0BCF6
P 4400 3550
F 0 "R1" V 4193 3550 50  0000 C CNN
F 1 "R" V 4284 3550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4330 3550 50  0001 C CNN
F 3 "~" H 4400 3550 50  0001 C CNN
	1    4400 3550
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5FE0C3A0
P 5000 3150
F 0 "R2" V 4793 3150 50  0000 C CNN
F 1 "R" V 4884 3150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4930 3150 50  0001 C CNN
F 3 "~" H 5000 3150 50  0001 C CNN
	1    5000 3150
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5FE0CD72
P 4400 3850
F 0 "R3" V 4193 3850 50  0000 C CNN
F 1 "R" V 4284 3850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4330 3850 50  0001 C CNN
F 3 "~" H 4400 3850 50  0001 C CNN
	1    4400 3850
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5FE0D692
P 4700 4100
F 0 "R4" H 4770 4146 50  0000 L CNN
F 1 "R" H 4770 4055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4630 4100 50  0001 C CNN
F 3 "~" H 4700 4100 50  0001 C CNN
	1    4700 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5FE0E04C
P 4700 4250
F 0 "#PWR0105" H 4700 4000 50  0001 C CNN
F 1 "GND" H 4705 4077 50  0000 C CNN
F 2 "" H 4700 4250 50  0001 C CNN
F 3 "" H 4700 4250 50  0001 C CNN
	1    4700 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 3950 4700 3850
Wire Wire Line
	4550 3850 4700 3850
Connection ~ 4700 3850
Wire Wire Line
	4700 3850 4700 3750
Wire Wire Line
	4550 3550 4700 3550
Wire Wire Line
	4700 3550 4700 3150
Wire Wire Line
	4700 3150 4850 3150
Connection ~ 4700 3550
Wire Wire Line
	5150 3150 5400 3150
Wire Wire Line
	5400 3150 5400 3650
Wire Wire Line
	5400 3650 5300 3650
Wire Wire Line
	4250 3550 4100 3550
Wire Wire Line
	4100 3550 4100 3650
Wire Wire Line
	4100 3650 3200 3650
$Comp
L Connector:Conn_01x10_Male J2
U 1 1 5FE10662
P 5900 3250
F 0 "J2" H 5872 3132 50  0000 R CNN
F 1 "ADCInput" H 5872 3223 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 5900 3250 50  0001 C CNN
F 3 "~" H 5900 3250 50  0001 C CNN
	1    5900 3250
	-1   0    0    1   
$EndComp
$Comp
L Amplifier_Operational:MCP602 U1
U 3 1 5FE124AA
P 5700 5550
F 0 "U1" H 5658 5596 50  0000 L CNN
F 1 "MCP602" H 5658 5505 50  0000 L CNN
F 2 "MCP602-I_P:DIP787W46P254L927H533Q8" H 5700 5550 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21314g.pdf" H 5700 5550 50  0001 C CNN
	3    5700 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5FE14D50
P 5100 5550
F 0 "C2" H 5215 5596 50  0000 L CNN
F 1 "1nF" H 5215 5505 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 5138 5400 50  0001 C CNN
F 3 "~" H 5100 5550 50  0001 C CNN
	1    5100 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C1
U 1 1 5FE16518
P 4750 5550
F 0 "C1" H 4865 5596 50  0000 L CNN
F 1 "10uF" H 4865 5505 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4750 5550 50  0001 C CNN
F 3 "~" H 4750 5550 50  0001 C CNN
	1    4750 5550
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR0106
U 1 1 5FE193A3
P 5600 5150
F 0 "#PWR0106" H 5600 5000 50  0001 C CNN
F 1 "VDD" H 5615 5323 50  0000 C CNN
F 2 "" H 5600 5150 50  0001 C CNN
F 3 "" H 5600 5150 50  0001 C CNN
	1    5600 5150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5FE19E93
P 5600 5950
F 0 "#PWR0107" H 5600 5700 50  0001 C CNN
F 1 "GND" H 5605 5777 50  0000 C CNN
F 2 "" H 5600 5950 50  0001 C CNN
F 3 "" H 5600 5950 50  0001 C CNN
	1    5600 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 5900 5600 5850
Wire Wire Line
	4750 5700 4750 5900
Wire Wire Line
	4750 5900 5100 5900
Wire Wire Line
	5600 5900 5600 5950
Connection ~ 5600 5900
Wire Wire Line
	5100 5700 5100 5900
Connection ~ 5100 5900
Wire Wire Line
	5100 5900 5600 5900
Wire Wire Line
	5600 5250 5600 5200
Wire Wire Line
	5100 5400 5100 5200
Wire Wire Line
	5100 5200 5600 5200
Connection ~ 5600 5200
Wire Wire Line
	5600 5200 5600 5150
Wire Wire Line
	4750 5400 4750 5200
Wire Wire Line
	4750 5200 5100 5200
Connection ~ 5100 5200
Wire Notes Line
	4550 6250 6050 6250
Wire Notes Line
	6050 6250 6050 4900
Wire Notes Line
	6050 4900 4550 4900
Wire Notes Line
	4550 4900 4550 6250
Text Notes 4600 5000 0    50   ~ 0
Power Supply\n
Text GLabel 1900 3800 2    50   Input ~ 0
VolRef1V2
Wire Wire Line
	1700 3800 1900 3800
Connection ~ 1700 3800
Text GLabel 4000 3750 0    50   Input ~ 0
VolRef1V2
Wire Wire Line
	4000 3750 4100 3750
Wire Wire Line
	4100 3750 4100 3850
Wire Wire Line
	4100 3850 4250 3850
Wire Notes Line
	1400 3150 2400 3150
Wire Notes Line
	2400 3150 2400 4350
Wire Notes Line
	2400 4350 1400 4350
Wire Notes Line
	1400 4350 1400 3150
Text Notes 1450 3250 0    50   ~ 0
VoltageReference1V2\n
Wire Notes Line
	2700 4450 6450 4450
Wire Notes Line
	6450 4450 6450 2500
Wire Notes Line
	2700 2500 2700 4450
Wire Notes Line
	2700 2500 6450 2500
Text Notes 2750 2600 0    50   ~ 0
Accelerometer Amplication Circuit
$Comp
L Connector:Conn_01x10_Male J3
U 1 1 5FE286F0
P 3850 5550
F 0 "J3" H 3822 5432 50  0000 R CNN
F 1 "IO" H 3822 5523 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 3850 5550 50  0001 C CNN
F 3 "~" H 3850 5550 50  0001 C CNN
	1    3850 5550
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5FE2AA0B
P 3500 6050
F 0 "#PWR0108" H 3500 5800 50  0001 C CNN
F 1 "GND" H 3505 5877 50  0000 C CNN
F 2 "" H 3500 6050 50  0001 C CNN
F 3 "" H 3500 6050 50  0001 C CNN
	1    3500 6050
	1    0    0    -1  
$EndComp
Text GLabel 3250 5650 0    50   Input ~ 0
PIN3.2
Wire Wire Line
	3250 5650 3650 5650
Wire Wire Line
	3650 5950 3500 5950
Wire Wire Line
	3500 5950 3500 6050
Wire Notes Line
	2800 6300 4000 6300
Wire Notes Line
	4000 6300 4000 4850
Wire Notes Line
	4000 4850 2800 4850
Wire Notes Line
	2800 4850 2800 6300
Text Notes 2850 4950 0    50   ~ 0
Connector2\n
$Comp
L power:VDD #PWR0109
U 1 1 5FE2EA5D
P 1650 4950
F 0 "#PWR0109" H 1650 4800 50  0001 C CNN
F 1 "VDD" H 1665 5123 50  0000 C CNN
F 2 "" H 1650 4950 50  0001 C CNN
F 3 "" H 1650 4950 50  0001 C CNN
	1    1650 4950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5FE2F484
P 1650 5500
F 0 "#PWR0110" H 1650 5250 50  0001 C CNN
F 1 "GND" H 1655 5327 50  0000 C CNN
F 2 "" H 1650 5500 50  0001 C CNN
F 3 "" H 1650 5500 50  0001 C CNN
	1    1650 5500
	1    0    0    -1  
$EndComp
Text GLabel 1550 5300 0    50   Input ~ 0
PIN3.2
Wire Wire Line
	1650 5100 1650 4950
Wire Wire Line
	1650 5500 1650 5200
Wire Notes Line
	1200 4600 2450 4600
Wire Notes Line
	2450 4600 2450 5750
Wire Notes Line
	2450 5750 1200 5750
Wire Notes Line
	1200 5750 1200 4600
Text Notes 1250 4700 0    50   ~ 0
External Supply\n
Wire Wire Line
	5400 3150 5400 2750
Wire Wire Line
	5400 2750 5700 2750
Connection ~ 5400 3150
Wire Wire Line
	1650 5200 1800 5200
Wire Wire Line
	1800 5300 1550 5300
Wire Wire Line
	1800 5100 1650 5100
$Comp
L Connector:Conn_01x03_Male J4
U 1 1 5FE2D965
P 2000 5200
F 0 "J4" H 1972 5132 50  0000 R CNN
F 1 "ExtSupply" H 1972 5223 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 2000 5200 50  0001 C CNN
F 3 "~" H 2000 5200 50  0001 C CNN
	1    2000 5200
	-1   0    0    -1  
$EndComp
$EndSCHEMATC
