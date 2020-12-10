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
L Amplifier_Operational:MCP602 U1
U 1 1 5FC5FAF2
P 6800 3000
F 0 "U1" H 6800 2633 50  0000 C CNN
F 1 "MCP602" H 6800 2724 50  0000 C CNN
F 2 "MCP602-I_P:DIP787W46P254L927H533Q8" H 6800 3000 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21314g.pdf" H 6800 3275 50  0001 C CNN
	1    6800 3000
	1    0    0    1   
$EndComp
$Comp
L power:VDD #PWR0101
U 1 1 5FC683AE
P 5450 2450
F 0 "#PWR0101" H 5450 2300 50  0001 C CNN
F 1 "VDD" H 5465 2623 50  0000 C CNN
F 2 "" H 5450 2450 50  0001 C CNN
F 3 "" H 5450 2450 50  0001 C CNN
	1    5450 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5FC69992
P 5450 3550
F 0 "#PWR0102" H 5450 3300 50  0001 C CNN
F 1 "GND" H 5455 3377 50  0000 C CNN
F 2 "" H 5450 3550 50  0001 C CNN
F 3 "" H 5450 3550 50  0001 C CNN
	1    5450 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5FC6AB39
P 6800 2550
F 0 "R2" V 6593 2550 50  0000 C CNN
F 1 "330k" V 6684 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6730 2550 50  0001 C CNN
F 3 "~" H 6800 2550 50  0001 C CNN
	1    6800 2550
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 5FC6BCE1
P 6100 2850
F 0 "R1" V 5893 2850 50  0000 C CNN
F 1 "3k3" V 5984 2850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6030 2850 50  0001 C CNN
F 3 "~" H 6100 2850 50  0001 C CNN
	1    6100 2850
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5FC6CCFA
P 6250 3300
F 0 "R4" H 6320 3346 50  0000 L CNN
F 1 "330k" H 6320 3255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6180 3300 50  0001 C CNN
F 3 "~" H 6250 3300 50  0001 C CNN
	1    6250 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5FC6D0B7
P 6100 3150
F 0 "R3" V 6307 3150 50  0000 C CNN
F 1 "3k3" V 6216 3150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6030 3150 50  0001 C CNN
F 3 "~" H 6100 3150 50  0001 C CNN
	1    6100 3150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6250 3100 6250 3150
Connection ~ 6250 3150
Wire Wire Line
	6250 2850 6250 2900
Wire Wire Line
	6650 2550 6250 2550
Wire Wire Line
	6250 2550 6250 2850
Connection ~ 6250 2850
Wire Wire Line
	6950 2550 7200 2550
Wire Wire Line
	7200 2550 7200 3000
Wire Wire Line
	7200 3000 7100 3000
$Comp
L Device:C C1
U 1 1 5FC6F73D
P 6200 4700
F 0 "C1" H 6315 4746 50  0000 L CNN
F 1 "1nF" H 6315 4655 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D10.5mm_W5.0mm_P5.00mm" H 6238 4550 50  0001 C CNN
F 3 "~" H 6200 4700 50  0001 C CNN
	1    6200 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C2
U 1 1 5FC70726
P 5950 4700
F 0 "C2" H 6068 4746 50  0000 L CNN
F 1 "10uF" H 6068 4655 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D5.0mm_H11.0mm_P2.00mm" H 5988 4550 50  0001 C CNN
F 3 "~" H 5950 4700 50  0001 C CNN
	1    5950 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 4350 5950 4350
Connection ~ 6200 4350
Wire Wire Line
	5250 2850 5950 2850
Wire Wire Line
	6250 3450 6250 3500
$Comp
L Connector:Conn_01x03_Female J1
U 1 1 5FC751D9
P 5050 2850
F 0 "J1" H 4942 2525 50  0000 C CNN
F 1 "AccelConnector" H 4942 2616 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Horizontal" H 5050 2850 50  0001 C CNN
F 3 "~" H 5050 2850 50  0001 C CNN
	1    5050 2850
	-1   0    0    1   
$EndComp
Wire Wire Line
	7350 3000 7200 3000
Connection ~ 7200 3000
Wire Notes Line
	4850 2050 8000 2050
Wire Notes Line
	8000 2050 8000 3750
Wire Notes Line
	8000 3750 4850 3750
Wire Notes Line
	4850 3750 4850 2050
Text Notes 4900 2150 0    50   ~ 0
Accelerometer Amplification Circuit\n
$Comp
L Reference_Voltage:LM385BZ-1.2 U3
U 1 1 5FC788BA
P 2350 2750
F 0 "U3" V 2396 2662 50  0000 R CNN
F 1 "LM385BZ-1.2" V 2305 2662 50  0000 R CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2350 2550 50  0001 C CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/LM285-D.PDF" H 2350 2750 50  0001 C CIN
	1    2350 2750
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R5
U 1 1 5FC7928C
P 2350 2350
F 0 "R5" H 2420 2396 50  0000 L CNN
F 1 "180k" H 2420 2305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2280 2350 50  0001 C CNN
F 3 "~" H 2350 2350 50  0001 C CNN
	1    2350 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5FC7A2D8
P 2350 2950
F 0 "#PWR0103" H 2350 2700 50  0001 C CNN
F 1 "GND" H 2355 2777 50  0000 C CNN
F 2 "" H 2350 2950 50  0001 C CNN
F 3 "" H 2350 2950 50  0001 C CNN
	1    2350 2950
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR0104
U 1 1 5FC7AEA7
P 2350 2150
F 0 "#PWR0104" H 2350 2000 50  0001 C CNN
F 1 "VDD" H 2365 2323 50  0000 C CNN
F 2 "" H 2350 2150 50  0001 C CNN
F 3 "" H 2350 2150 50  0001 C CNN
	1    2350 2150
	1    0    0    -1  
$EndComp
Wire Notes Line
	3300 3200 2000 3200
Text Notes 2050 1900 0    50   ~ 0
VoltageRef1.2V\n
Wire Wire Line
	2350 2150 2350 2200
Wire Wire Line
	2350 2500 2350 2550
Connection ~ 2350 2550
Wire Wire Line
	2350 2550 2350 2600
Wire Wire Line
	2350 2950 2350 2900
Wire Notes Line
	3300 1800 3300 3200
Wire Notes Line
	2000 3200 2000 1800
Wire Notes Line
	2000 1800 3300 1800
$Comp
L Amplifier_Operational:MCP602 U1
U 2 1 5FC89DBD
P 3000 4200
F 0 "U1" H 3000 4567 50  0000 C CNN
F 1 "MCP602" H 3000 4476 50  0000 C CNN
F 2 "MCP602-I_P:DIP787W46P254L927H533Q8" H 3000 4200 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21314g.pdf" H 3000 4200 50  0001 C CNN
	2    3000 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5FC92AD2
P 2200 3950
F 0 "R6" H 2270 3996 50  0000 L CNN
F 1 "R" H 2270 3905 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2130 3950 50  0001 C CNN
F 3 "~" H 2200 3950 50  0001 C CNN
	1    2200 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5FC93968
P 2200 4250
F 0 "R7" H 2270 4296 50  0000 L CNN
F 1 "R" H 2270 4205 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2130 4250 50  0001 C CNN
F 3 "~" H 2200 4250 50  0001 C CNN
	1    2200 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 4100 2700 4100
Connection ~ 2200 4100
Wire Wire Line
	2700 4300 2600 4300
Wire Wire Line
	2600 4300 2600 4500
Wire Wire Line
	2600 4500 3400 4500
Wire Wire Line
	3400 4500 3400 4200
Wire Wire Line
	3400 4200 3300 4200
$Comp
L power:GND #PWR0105
U 1 1 5FC96287
P 2200 4450
F 0 "#PWR0105" H 2200 4200 50  0001 C CNN
F 1 "GND" H 2205 4277 50  0000 C CNN
F 2 "" H 2200 4450 50  0001 C CNN
F 3 "" H 2200 4450 50  0001 C CNN
	1    2200 4450
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR0106
U 1 1 5FC96905
P 2200 3750
F 0 "#PWR0106" H 2200 3600 50  0001 C CNN
F 1 "VDD" H 2215 3923 50  0000 C CNN
F 2 "" H 2200 3750 50  0001 C CNN
F 3 "" H 2200 3750 50  0001 C CNN
	1    2200 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 3750 2200 3800
Wire Wire Line
	2200 4400 2200 4450
Wire Notes Line
	2000 3400 4100 3400
Wire Notes Line
	4100 3400 4100 4700
Wire Notes Line
	4100 4700 2000 4700
Wire Notes Line
	2000 4700 2000 3400
Text Notes 2050 3500 0    50   ~ 0
VoltageDivider1.2V\n
Wire Wire Line
	5450 2750 5450 2450
Wire Wire Line
	5250 2750 5450 2750
Wire Wire Line
	5250 2950 5450 2950
Wire Wire Line
	5450 2950 5450 3500
Wire Wire Line
	5450 3500 6250 3500
Wire Wire Line
	5450 3550 5450 3500
Connection ~ 5450 3500
Wire Wire Line
	6250 3100 6500 3100
Wire Wire Line
	6250 2900 6500 2900
$Comp
L Amplifier_Operational:MCP602 U1
U 3 1 5FCA7559
P 6750 4650
F 0 "U1" H 6708 4696 50  0000 L CNN
F 1 "MCP602" H 6708 4605 50  0000 L CNN
F 2 "MCP602-I_P:DIP787W46P254L927H533Q8" H 6750 4650 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21314g.pdf" H 6750 4650 50  0001 C CNN
	3    6750 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 4350 6650 4350
Wire Wire Line
	6200 4350 6200 4550
Wire Wire Line
	5950 4350 5950 4550
Wire Wire Line
	6650 4950 6200 4950
Wire Wire Line
	6200 4950 6200 4850
Wire Wire Line
	6200 4950 5950 4950
Wire Wire Line
	5950 4950 5950 4850
Connection ~ 6200 4950
$Comp
L power:GND #PWR0107
U 1 1 5FCB0E0A
P 5950 5000
F 0 "#PWR0107" H 5950 4750 50  0001 C CNN
F 1 "GND" H 5955 4827 50  0000 C CNN
F 2 "" H 5950 5000 50  0001 C CNN
F 3 "" H 5950 5000 50  0001 C CNN
	1    5950 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 5000 5950 4950
Connection ~ 5950 4950
$Comp
L power:VDD #PWR0108
U 1 1 5FCB2BAB
P 5950 4300
F 0 "#PWR0108" H 5950 4150 50  0001 C CNN
F 1 "VDD" H 5965 4473 50  0000 C CNN
F 2 "" H 5950 4300 50  0001 C CNN
F 3 "" H 5950 4300 50  0001 C CNN
	1    5950 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 4300 5950 4350
Connection ~ 5950 4350
Wire Notes Line
	7050 5250 7050 3950
Wire Notes Line
	7050 3950 5700 3950
Wire Notes Line
	5700 3950 5700 5250
Wire Notes Line
	5700 5250 7050 5250
Text Notes 5750 4050 0    50   ~ 0
OpAmpSupply
$Comp
L Connector:Conn_01x03_Male J3
U 1 1 5FD13E02
P 4250 3600
F 0 "J3" H 4358 3881 50  0000 C CNN
F 1 "VoltageRefSel" H 4358 3790 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 4250 3600 50  0001 C CNN
F 3 "~" H 4250 3600 50  0001 C CNN
	1    4250 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 4200 4650 4200
Wire Wire Line
	4650 4200 4650 3700
Wire Wire Line
	4650 3700 4450 3700
Connection ~ 3400 4200
Wire Wire Line
	4750 3150 4750 3600
Wire Wire Line
	4750 3600 4450 3600
Wire Wire Line
	4750 3150 5950 3150
Wire Wire Line
	4550 2550 4550 3500
Wire Wire Line
	4550 3500 4450 3500
Wire Wire Line
	2350 2550 4550 2550
$Comp
L Connector:Conn_01x10_Male J2
U 1 1 5FD1837F
P 7550 2600
F 0 "J2" H 7522 2482 50  0000 R CNN
F 1 "ADCInput" H 7522 2573 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 7550 2600 50  0001 C CNN
F 3 "~" H 7550 2600 50  0001 C CNN
	1    7550 2600
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x10_Male J5
U 1 1 5FD1BDE7
P 8350 4500
F 0 "J5" H 8322 4382 50  0000 R CNN
F 1 "Supp" H 8322 4473 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 8350 4500 50  0001 C CNN
F 3 "~" H 8350 4500 50  0001 C CNN
	1    8350 4500
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5FD1D9F2
P 8050 5000
F 0 "#PWR0109" H 8050 4750 50  0001 C CNN
F 1 "GND" H 8055 4827 50  0000 C CNN
F 2 "" H 8050 5000 50  0001 C CNN
F 3 "" H 8050 5000 50  0001 C CNN
	1    8050 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 4900 8050 4900
Wire Wire Line
	8050 4900 8050 5000
Connection ~ 8050 4900
$Comp
L Connector:Conn_01x03_Male J4
U 1 1 5FCB6A4A
P 7500 4150
F 0 "J4" V 7562 4294 50  0000 L CNN
F 1 "ExtSupply" V 7653 4294 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Horizontal" H 7500 4150 50  0001 C CNN
F 3 "~" H 7500 4150 50  0001 C CNN
	1    7500 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	6650 4350 7400 4350
Connection ~ 6650 4350
Wire Wire Line
	7600 4350 7950 4350
Wire Wire Line
	7950 4350 7950 4600
Wire Wire Line
	7950 4600 8150 4600
Wire Wire Line
	7500 4900 7500 4350
Wire Wire Line
	7500 4900 8050 4900
$EndSCHEMATC
