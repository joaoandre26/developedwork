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
L Transistor_FET:IRF6785 Q1
U 1 1 605F7D09
P 4800 3600
F 0 "Q1" H 5005 3646 50  0000 L CNN
F 1 "TN0702" H 5005 3555 50  0000 L CNN
F 2 "Package_DirectFET:DirectFET_MZ" H 4800 3600 50  0001 C CIN
F 3 "https://www.infineon.com/dgdl/irf6785mpbf.pdf?fileId=5546d462533600a4015355ed8cc31aa2" H 4800 3600 50  0001 L CNN
	1    4800 3600
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4001 D1
U 1 1 605F806B
P 5000 3150
F 0 "D1" V 4954 3230 50  0000 L CNN
F 1 "1N4001" V 5045 3230 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 5000 2975 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 5000 3150 50  0001 C CNN
	1    5000 3150
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 605FB1E5
P 4900 2900
F 0 "#PWR?" H 4900 2750 50  0001 C CNN
F 1 "VCC" H 4915 3073 50  0000 C CNN
F 2 "" H 4900 2900 50  0001 C CNN
F 3 "" H 4900 2900 50  0001 C CNN
	1    4900 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 605FB8FF
P 4900 3950
F 0 "#PWR?" H 4900 3700 50  0001 C CNN
F 1 "GND" H 4905 3777 50  0000 C CNN
F 2 "" H 4900 3950 50  0001 C CNN
F 3 "" H 4900 3950 50  0001 C CNN
	1    4900 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 3950 4900 3800
Wire Wire Line
	4900 3400 4900 3300
Wire Wire Line
	4900 3300 5000 3300
Wire Wire Line
	4800 3300 4900 3300
Connection ~ 4900 3300
Wire Wire Line
	4800 3000 4900 3000
Wire Wire Line
	4900 2900 4900 3000
Connection ~ 4900 3000
Wire Wire Line
	4900 3000 5000 3000
Text GLabel 4300 3600 0    50   Input ~ 0
MSP430DigitalOutput
$Comp
L Device:R_US R1
U 1 1 605FD510
P 4450 3750
F 0 "R1" V 4245 3750 50  0000 C CNN
F 1 "10K" V 4336 3750 50  0000 C CNN
F 2 "" V 4490 3740 50  0001 C CNN
F 3 "~" H 4450 3750 50  0001 C CNN
	1    4450 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3600 4300 3600
Wire Wire Line
	4600 3600 4450 3600
Wire Notes Line
	5450 4250 5450 2600
Wire Notes Line
	5450 2600 3100 2600
Wire Notes Line
	3100 2600 3100 4250
Wire Notes Line
	3100 4250 5450 4250
Text Notes 3150 2700 0    50   ~ 0
Solenoid Driver Circuit
$Comp
L Device:L L1
U 1 1 605FA2EC
P 4800 3150
F 0 "L1" H 4756 3196 50  0000 R CNN
F 1 "SOL01002" H 4756 3105 50  0000 R CNN
F 2 "" H 4800 3150 50  0001 C CNN
F 3 "~" H 4800 3150 50  0001 C CNN
	1    4800 3150
	1    0    0    -1  
$EndComp
Connection ~ 4450 3600
$Comp
L power:GND #PWR?
U 1 1 606354A7
P 4450 3950
F 0 "#PWR?" H 4450 3700 50  0001 C CNN
F 1 "GND" H 4455 3777 50  0000 C CNN
F 2 "" H 4450 3950 50  0001 C CNN
F 3 "" H 4450 3950 50  0001 C CNN
	1    4450 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3900 4450 3950
$EndSCHEMATC
