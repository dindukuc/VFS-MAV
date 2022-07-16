EESchema Schematic File Version 4
LIBS:PowerManagement-cache
EELAYER 26 0
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
L power:Earth #PWR0101
U 1 1 5D8A8999
P 1200 2250
F 0 "#PWR0101" H 1200 2000 50  0001 C CNN
F 1 "Earth" H 1200 2100 50  0001 C CNN
F 2 "" H 1200 2250 50  0001 C CNN
F 3 "~" H 1200 2250 50  0001 C CNN
	1    1200 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 2150 1200 2150
Wire Wire Line
	1200 2150 1200 2250
Wire Wire Line
	1900 2050 1900 1900
$Comp
L power:+BATT #PWR0102
U 1 1 5D8A89EA
P 1900 1900
F 0 "#PWR0102" H 1900 1750 50  0001 C CNN
F 1 "+BATT" H 1915 2073 50  0000 C CNN
F 2 "" H 1900 1900 50  0001 C CNN
F 3 "" H 1900 1900 50  0001 C CNN
	1    1900 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 4200 1350 4050
$Comp
L power:+BATT #PWR0103
U 1 1 5D8A9347
P 1350 4050
F 0 "#PWR0103" H 1350 3900 50  0001 C CNN
F 1 "+BATT" H 1365 4223 50  0000 C CNN
F 2 "" H 1350 4050 50  0001 C CNN
F 3 "" H 1350 4050 50  0001 C CNN
	1    1350 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5D8A9438
P 1400 4400
F 0 "C1" H 1515 4446 50  0000 L CNN
F 1 "22uF" H 1515 4355 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.42x2.65mm_HandSolder" H 1438 4250 50  0001 C CNN
F 3 "~" H 1400 4400 50  0001 C CNN
	1    1400 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5D8A9482
P 1800 4400
F 0 "C2" H 1915 4446 50  0000 L CNN
F 1 "10uF" H 1915 4355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1838 4250 50  0001 C CNN
F 3 "~" H 1800 4400 50  0001 C CNN
	1    1800 4400
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0104
U 1 1 5D8A94F5
P 1400 4650
F 0 "#PWR0104" H 1400 4400 50  0001 C CNN
F 1 "Earth" H 1400 4500 50  0001 C CNN
F 2 "" H 1400 4650 50  0001 C CNN
F 3 "~" H 1400 4650 50  0001 C CNN
	1    1400 4650
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0105
U 1 1 5D8A9521
P 1800 4650
F 0 "#PWR0105" H 1800 4400 50  0001 C CNN
F 1 "Earth" H 1800 4500 50  0001 C CNN
F 2 "" H 1800 4650 50  0001 C CNN
F 3 "~" H 1800 4650 50  0001 C CNN
	1    1800 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 4200 1400 4250
Wire Wire Line
	1400 4550 1400 4650
Wire Wire Line
	1800 4200 1800 4250
Wire Wire Line
	1800 4550 1800 4650
$Comp
L Device:L L1
U 1 1 5D8A9F5A
P 4200 4200
F 0 "L1" V 4390 4200 50  0000 C CNN
F 1 "3.3uH" V 4299 4200 50  0000 C CNN
F 2 "DesignFootprintLib:L_Sumida_4.9x4.9mm_diag" H 4200 4200 50  0001 C CNN
F 3 "~" H 4200 4200 50  0001 C CNN
	1    4200 4200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5050 4200 5050 5100
$Comp
L Device:R_US R1
U 1 1 5D8AA340
P 5050 5250
F 0 "R1" H 5118 5296 50  0000 L CNN
F 1 "562k" H 5118 5205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5090 5240 50  0001 C CNN
F 3 "~" H 5050 5250 50  0001 C CNN
	1    5050 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R2
U 1 1 5D8AA382
P 5050 5700
F 0 "R2" H 5118 5746 50  0000 L CNN
F 1 "180k" H 5118 5655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5090 5690 50  0001 C CNN
F 3 "~" H 5050 5700 50  0001 C CNN
	1    5050 5700
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0106
U 1 1 5D8AA3CE
P 5050 5950
F 0 "#PWR0106" H 5050 5700 50  0001 C CNN
F 1 "Earth" H 5050 5800 50  0001 C CNN
F 2 "" H 5050 5950 50  0001 C CNN
F 3 "~" H 5050 5950 50  0001 C CNN
	1    5050 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 5850 5050 5950
$Comp
L Device:C C5
U 1 1 5D8AA9C1
P 4700 4900
F 0 "C5" H 4815 4946 50  0000 L CNN
F 1 "Cff" H 4815 4855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4738 4750 50  0001 C CNN
F 3 "~" H 4700 4900 50  0001 C CNN
	1    4700 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 5050 4700 5450
Wire Wire Line
	4700 4750 4700 4200
Text Notes 4750 4750 0    50   ~ 0
DNU
Wire Wire Line
	4700 5450 5050 5450
Wire Wire Line
	5050 5450 5050 5400
Wire Wire Line
	5050 5450 5050 5550
Connection ~ 5050 5450
Wire Wire Line
	4700 4200 5050 4200
Wire Wire Line
	5050 4200 5700 4200
Wire Wire Line
	7200 4200 7200 4000
Connection ~ 5050 4200
$Comp
L power:+3.3V #PWR0107
U 1 1 5D8AD330
P 7200 4000
F 0 "#PWR0107" H 7200 3850 50  0001 C CNN
F 1 "+3.3V" H 7215 4173 50  0000 C CNN
F 2 "" H 7200 4000 50  0001 C CNN
F 3 "" H 7200 4000 50  0001 C CNN
	1    7200 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5D8AD3C0
P 5700 4500
F 0 "C7" H 5815 4546 50  0000 L CNN
F 1 "1uF" H 5815 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5738 4350 50  0001 C CNN
F 3 "~" H 5700 4500 50  0001 C CNN
	1    5700 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 5D8AD408
P 6350 4500
F 0 "C8" H 6465 4546 50  0000 L CNN
F 1 "22uF" H 6465 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.42x2.65mm_HandSolder" H 6388 4350 50  0001 C CNN
F 3 "~" H 6350 4500 50  0001 C CNN
	1    6350 4500
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0108
U 1 1 5D8AD457
P 5700 4750
F 0 "#PWR0108" H 5700 4500 50  0001 C CNN
F 1 "Earth" H 5700 4600 50  0001 C CNN
F 2 "" H 5700 4750 50  0001 C CNN
F 3 "~" H 5700 4750 50  0001 C CNN
	1    5700 4750
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0109
U 1 1 5D8AD491
P 6350 4750
F 0 "#PWR0109" H 6350 4500 50  0001 C CNN
F 1 "Earth" H 6350 4600 50  0001 C CNN
F 2 "" H 6350 4750 50  0001 C CNN
F 3 "~" H 6350 4750 50  0001 C CNN
	1    6350 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 4350 5700 4200
Connection ~ 5700 4200
Wire Wire Line
	5700 4200 6350 4200
Wire Wire Line
	5700 4650 5700 4750
Wire Wire Line
	6350 4350 6350 4200
Connection ~ 6350 4200
Wire Wire Line
	6350 4650 6350 4750
Text GLabel 5600 3800 2    50   Output ~ 0
MCU_ENABLE
$Comp
L Device:R_US R3
U 1 1 5D8AF762
P 5050 3600
F 0 "R3" H 5118 3646 50  0000 L CNN
F 1 "10k" H 5118 3555 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5090 3590 50  0001 C CNN
F 3 "~" H 5050 3600 50  0001 C CNN
	1    5050 3600
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0110
U 1 1 5D8AF7B9
P 5050 3350
F 0 "#PWR0110" H 5050 3200 50  0001 C CNN
F 1 "+3.3V" H 5065 3523 50  0000 C CNN
F 2 "" H 5050 3350 50  0001 C CNN
F 3 "" H 5050 3350 50  0001 C CNN
	1    5050 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3350 5050 3450
Wire Wire Line
	5050 3750 5050 3800
Connection ~ 5050 3800
Wire Wire Line
	5050 3800 5600 3800
$Comp
L power:+3.3V #PWR0111
U 1 1 5D8B1C60
P 8250 3950
F 0 "#PWR0111" H 8250 3800 50  0001 C CNN
F 1 "+3.3V" H 8265 4123 50  0000 C CNN
F 2 "" H 8250 3950 50  0001 C CNN
F 3 "" H 8250 3950 50  0001 C CNN
	1    8250 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 5D8B1CB1
P 8250 4800
F 0 "D1" V 8288 4683 50  0000 R CNN
F 1 "LED" V 8197 4683 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8250 4800 50  0001 C CNN
F 3 "~" H 8250 4800 50  0001 C CNN
	1    8250 4800
	0    -1   -1   0   
$EndComp
$Comp
L power:Earth #PWR0112
U 1 1 5D8B1D55
P 8250 5200
F 0 "#PWR0112" H 8250 4950 50  0001 C CNN
F 1 "Earth" H 8250 5050 50  0001 C CNN
F 2 "" H 8250 5200 50  0001 C CNN
F 3 "~" H 8250 5200 50  0001 C CNN
	1    8250 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 3950 8250 4150
Wire Wire Line
	8250 4950 8250 5200
$Comp
L Device:R_US R4
U 1 1 5D8B3F53
P 8250 4300
F 0 "R4" H 8318 4346 50  0000 L CNN
F 1 "1.2k" H 8318 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 8290 4290 50  0001 C CNN
F 3 "~" H 8250 4300 50  0001 C CNN
	1    8250 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 4450 8250 4650
$Comp
L Device:D_Schottky D2
U 1 1 5D8BDAAC
P 1650 2050
F 0 "D2" H 1650 1834 50  0000 C CNN
F 1 "CDBC540-G" H 1650 1925 50  0000 C CNN
F 2 "Diode_SMD:D_SMC" H 1650 2050 50  0001 C CNN
F 3 "~" H 1650 2050 50  0001 C CNN
	1    1650 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	1800 2050 1900 2050
Text GLabel 9150 1400 0    50   Input ~ 0
MCU_ENABLE
$Comp
L PowerManagement_VFS:TPS62160 U1
U 1 1 5D8C5926
P 3400 3850
F 0 "U1" H 3425 3825 50  0000 C CNN
F 1 "TPS62160" H 3425 3734 50  0000 C CNN
F 2 "Package_SO:VSSOP-8_3.0x3.0mm_P0.65mm" H 3350 3100 50  0001 C CNN
F 3 "" H 3400 3850 50  0001 C CNN
	1    3400 3850
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0113
U 1 1 5D8CDF4B
P 2750 4650
F 0 "#PWR0113" H 2750 4400 50  0001 C CNN
F 1 "Earth" H 2750 4500 50  0001 C CNN
F 2 "" H 2750 4650 50  0001 C CNN
F 3 "~" H 2750 4650 50  0001 C CNN
	1    2750 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 4100 2750 4100
Wire Wire Line
	2750 4100 2750 4400
Wire Wire Line
	3050 4400 2750 4400
Connection ~ 2750 4400
Wire Wire Line
	2750 4400 2750 4650
Wire Wire Line
	3800 4200 4050 4200
Wire Wire Line
	4350 4200 4550 4200
Wire Wire Line
	4550 4200 4550 4300
Wire Wire Line
	4550 4300 3800 4300
Wire Wire Line
	4700 4200 4550 4200
Connection ~ 4700 4200
Connection ~ 4550 4200
Wire Wire Line
	4700 5450 4350 5450
Wire Wire Line
	4350 5450 4350 4400
Wire Wire Line
	4350 4400 3800 4400
Connection ~ 4700 5450
Wire Wire Line
	3950 3800 3950 4100
Wire Wire Line
	3950 4100 3800 4100
Wire Wire Line
	3950 3800 5050 3800
Text Notes 1700 3850 0    50   ~ 0
+3VDC - +17VDC Input range
Text Notes 2900 5050 0    50   ~ 0
UVLO set to 2.7V
Text Notes 2750 5300 0    50   ~ 0
SS of 50us w/ slope of 25mV/us
Text Notes 6100 3500 0    50   ~ 0
Maximum source current of 1A.\nExpected current load < 500mA
Text Notes 2250 3500 0    50   ~ 0
Operating frequency 2.25MHz -> small voltage ripple
Text Notes 7650 5450 0    50   ~ 0
Expected current draw = 1.2mA
$Comp
L power:Earth #PWR0114
U 1 1 5D97AEB1
P 10200 2200
F 0 "#PWR0114" H 10200 1950 50  0001 C CNN
F 1 "Earth" H 10200 2050 50  0001 C CNN
F 2 "" H 10200 2200 50  0001 C CNN
F 3 "~" H 10200 2200 50  0001 C CNN
	1    10200 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 1400 10200 1400
Wire Wire Line
	10200 1400 10200 1500
Wire Wire Line
	10000 2000 10200 2000
Connection ~ 10200 2000
Wire Wire Line
	10000 1900 10200 1900
Connection ~ 10200 1900
Wire Wire Line
	10200 1900 10200 2000
Wire Wire Line
	10000 1800 10200 1800
Connection ~ 10200 1800
Wire Wire Line
	10200 1800 10200 1900
Wire Wire Line
	10000 1700 10200 1700
Connection ~ 10200 1700
Wire Wire Line
	10200 1700 10200 1800
Wire Wire Line
	10000 1600 10200 1600
Connection ~ 10200 1600
Wire Wire Line
	10200 1600 10200 1700
Wire Wire Line
	10000 1500 10200 1500
Connection ~ 10200 1500
Wire Wire Line
	10200 1500 10200 1600
Wire Wire Line
	9150 1400 9500 1400
Wire Wire Line
	9500 1500 8500 1500
Wire Wire Line
	8500 1500 8500 1300
Wire Wire Line
	9500 1600 8500 1600
Wire Wire Line
	8500 1600 8500 1500
Connection ~ 8500 1500
Wire Wire Line
	9500 1700 8500 1700
Wire Wire Line
	8500 1700 8500 1600
Connection ~ 8500 1600
Wire Wire Line
	9500 1800 8500 1800
Wire Wire Line
	8500 1800 8500 1700
Connection ~ 8500 1700
$Comp
L power:+3.3V #PWR0115
U 1 1 5D988D44
P 8500 1300
F 0 "#PWR0115" H 8500 1150 50  0001 C CNN
F 1 "+3.3V" H 8515 1473 50  0000 C CNN
F 2 "" H 8500 1300 50  0001 C CNN
F 3 "" H 8500 1300 50  0001 C CNN
	1    8500 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 1900 8300 1900
Wire Wire Line
	9500 2000 8300 2000
Wire Wire Line
	8300 2000 8300 1900
$Comp
L Connector:TestPoint TP4
U 1 1 5D98BC3B
P 9600 5300
F 0 "TP4" H 9658 5420 50  0000 L CNN
F 1 "TestPoint" H 9658 5329 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 9800 5300 50  0001 C CNN
F 3 "~" H 9800 5300 50  0001 C CNN
	1    9600 5300
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0116
U 1 1 5D98BCF4
P 9600 5500
F 0 "#PWR0116" H 9600 5250 50  0001 C CNN
F 1 "Earth" H 9600 5350 50  0001 C CNN
F 2 "" H 9600 5500 50  0001 C CNN
F 3 "~" H 9600 5500 50  0001 C CNN
	1    9600 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 5300 9600 5500
$Comp
L Connector:TestPoint TP2
U 1 1 5D98D340
P 9600 4700
F 0 "TP2" H 9542 4727 50  0000 R CNN
F 1 "TestPoint" H 9542 4818 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 9800 4700 50  0001 C CNN
F 3 "~" H 9800 4700 50  0001 C CNN
	1    9600 4700
	-1   0    0    1   
$EndComp
Wire Wire Line
	9600 4700 9600 4500
$Comp
L power:+3.3V #PWR0117
U 1 1 5D9916E5
P 9600 4500
F 0 "#PWR0117" H 9600 4350 50  0001 C CNN
F 1 "+3.3V" H 9615 4673 50  0000 C CNN
F 2 "" H 9600 4500 50  0001 C CNN
F 3 "" H 9600 4500 50  0001 C CNN
	1    9600 4500
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 5D991752
P 10050 4700
F 0 "TP3" H 9992 4727 50  0000 R CNN
F 1 "TestPoint" H 9992 4818 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 10250 4700 50  0001 C CNN
F 3 "~" H 10250 4700 50  0001 C CNN
	1    10050 4700
	-1   0    0    1   
$EndComp
Wire Wire Line
	10050 4700 10050 4500
$Comp
L power:+5V #PWR0118
U 1 1 5D99734A
P 10050 4500
F 0 "#PWR0118" H 10050 4350 50  0001 C CNN
F 1 "+5V" H 10065 4673 50  0000 C CNN
F 2 "" H 10050 4500 50  0001 C CNN
F 3 "" H 10050 4500 50  0001 C CNN
	1    10050 4500
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 5D9973BD
P 9100 4700
F 0 "TP1" H 9042 4727 50  0000 R CNN
F 1 "TestPoint" H 9042 4818 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 9300 4700 50  0001 C CNN
F 3 "~" H 9300 4700 50  0001 C CNN
	1    9100 4700
	-1   0    0    1   
$EndComp
Wire Wire Line
	9100 4700 9100 4500
$Comp
L power:+BATT #PWR0119
U 1 1 5D99A38E
P 9100 4500
F 0 "#PWR0119" H 9100 4350 50  0001 C CNN
F 1 "+BATT" H 9115 4673 50  0000 C CNN
F 2 "" H 9100 4500 50  0001 C CNN
F 3 "" H 9100 4500 50  0001 C CNN
	1    9100 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 5D9B1DF5
P 7850 4800
F 0 "D3" V 7888 4683 50  0000 R CNN
F 1 "LED" V 7797 4683 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7850 4800 50  0001 C CNN
F 3 "~" H 7850 4800 50  0001 C CNN
	1    7850 4800
	0    -1   -1   0   
$EndComp
$Comp
L power:Earth #PWR0120
U 1 1 5D9B1DFC
P 7850 5200
F 0 "#PWR0120" H 7850 4950 50  0001 C CNN
F 1 "Earth" H 7850 5050 50  0001 C CNN
F 2 "" H 7850 5200 50  0001 C CNN
F 3 "~" H 7850 5200 50  0001 C CNN
	1    7850 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 3950 7850 4150
Wire Wire Line
	7850 4950 7850 5200
$Comp
L Device:R_US R11
U 1 1 5D9B1E04
P 7850 4300
F 0 "R11" H 7918 4346 50  0000 L CNN
F 1 "2.71k" H 7918 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7890 4290 50  0001 C CNN
F 3 "~" H 7850 4300 50  0001 C CNN
	1    7850 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 4450 7850 4650
$Comp
L power:+5V #PWR0121
U 1 1 5D9B5327
P 7850 3950
F 0 "#PWR0121" H 7850 3800 50  0001 C CNN
F 1 "+5V" H 7865 4123 50  0000 C CNN
F 2 "" H 7850 3950 50  0001 C CNN
F 3 "" H 7850 3950 50  0001 C CNN
	1    7850 3950
	1    0    0    -1  
$EndComp
$Comp
L PowerManagement_VFS:LMR10450 U2
U 1 1 5DA97B2E
P 4850 1800
F 0 "U2" H 4825 1865 50  0000 C CNN
F 1 "LMR14050" H 4825 1774 50  0000 C CNN
F 2 "Housings_SOIC:TI_SO-PowerPAD-8_ThermalVias" H 4750 1700 50  0001 C CNN
F 3 "" H 4850 1800 50  0001 C CNN
	1    4850 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C13
U 1 1 5DA99BBF
P 4800 1250
F 0 "C13" V 4548 1250 50  0000 C CNN
F 1 ".1uF" V 4639 1250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4838 1100 50  0001 C CNN
F 3 "~" H 4800 1250 50  0001 C CNN
	1    4800 1250
	0    1    1    0   
$EndComp
$Comp
L Device:C C10
U 1 1 5DA99CEC
P 2150 2350
F 0 "C10" H 2265 2396 50  0000 L CNN
F 1 "4.7uF" H 2265 2305 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.42x2.65mm_HandSolder" H 2188 2200 50  0001 C CNN
F 3 "~" H 2150 2350 50  0001 C CNN
	1    2150 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C12
U 1 1 5DA99E98
P 3050 2350
F 0 "C12" H 3165 2396 50  0000 L CNN
F 1 "1uF" H 3165 2305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3088 2200 50  0001 C CNN
F 3 "~" H 3050 2350 50  0001 C CNN
	1    3050 2350
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0122
U 1 1 5DA99EFB
P 2150 2650
F 0 "#PWR0122" H 2150 2400 50  0001 C CNN
F 1 "Earth" H 2150 2500 50  0001 C CNN
F 2 "" H 2150 2650 50  0001 C CNN
F 3 "~" H 2150 2650 50  0001 C CNN
	1    2150 2650
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0123
U 1 1 5DA99F4F
P 3050 2650
F 0 "#PWR0123" H 3050 2400 50  0001 C CNN
F 1 "Earth" H 3050 2500 50  0001 C CNN
F 2 "" H 3050 2650 50  0001 C CNN
F 3 "~" H 3050 2650 50  0001 C CNN
	1    3050 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 2650 2150 2500
Wire Wire Line
	3050 2500 3050 2650
Wire Wire Line
	4450 2100 3050 2100
Wire Wire Line
	2150 2100 2150 2200
Wire Wire Line
	3050 2100 3050 2200
Connection ~ 3050 2100
Wire Wire Line
	2150 2100 2150 1850
$Comp
L power:+BATT #PWR0124
U 1 1 5DAA34FB
P 2150 1850
F 0 "#PWR0124" H 2150 1700 50  0001 C CNN
F 1 "+BATT" H 2165 2023 50  0000 C CNN
F 2 "" H 2150 1850 50  0001 C CNN
F 3 "" H 2150 1850 50  0001 C CNN
	1    2150 1850
	1    0    0    -1  
$EndComp
Text GLabel 4000 2200 0    50   Input ~ 0
MCU_ENABLE
$Comp
L Device:C C14
U 1 1 5DAA5904
P 5850 2700
F 0 "C14" H 5965 2746 50  0000 L CNN
F 1 "22nF" H 5965 2655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5888 2550 50  0001 C CNN
F 3 "~" H 5850 2700 50  0001 C CNN
	1    5850 2700
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0125
U 1 1 5DAA5989
P 5850 3000
F 0 "#PWR0125" H 5850 2750 50  0001 C CNN
F 1 "Earth" H 5850 2850 50  0001 C CNN
F 2 "" H 5850 3000 50  0001 C CNN
F 3 "~" H 5850 3000 50  0001 C CNN
	1    5850 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 2850 5850 3000
Wire Wire Line
	4450 2000 4200 2000
Wire Wire Line
	4200 2000 4200 1250
Wire Wire Line
	4200 1250 4650 1250
Wire Wire Line
	4950 1250 5450 1250
Wire Wire Line
	5450 1250 5450 2000
Wire Wire Line
	5450 2000 5200 2000
$Comp
L Device:L L2
U 1 1 5DAAF489
P 5800 2000
F 0 "L2" V 5990 2000 50  0000 C CNN
F 1 "4.7uH" V 5899 2000 50  0000 C CNN
F 2 "Inductor_SMD:L_TDK_VLF10040" H 5800 2000 50  0001 C CNN
F 3 "~" H 5800 2000 50  0001 C CNN
	1    5800 2000
	0    -1   -1   0   
$EndComp
Connection ~ 5450 2000
$Comp
L power:Earth #PWR0126
U 1 1 5DAB21F3
P 5300 3000
F 0 "#PWR0126" H 5300 2750 50  0001 C CNN
F 1 "Earth" H 5300 2850 50  0001 C CNN
F 2 "" H 5300 3000 50  0001 C CNN
F 3 "~" H 5300 3000 50  0001 C CNN
	1    5300 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2100 5300 2100
Wire Wire Line
	5300 2100 5300 3000
$Comp
L Device:R_US R6
U 1 1 5DABD058
P 6500 2250
F 0 "R6" H 6432 2204 50  0000 R CNN
F 1 "68k" H 6432 2295 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6540 2240 50  0001 C CNN
F 3 "~" H 6500 2250 50  0001 C CNN
	1    6500 2250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_US R7
U 1 1 5DABD152
P 6500 2800
F 0 "R7" H 6568 2846 50  0000 L CNN
F 1 "12k" H 6568 2755 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6540 2790 50  0001 C CNN
F 3 "~" H 6500 2800 50  0001 C CNN
	1    6500 2800
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0127
U 1 1 5DABD1C6
P 6500 3100
F 0 "#PWR0127" H 6500 2850 50  0001 C CNN
F 1 "Earth" H 6500 2950 50  0001 C CNN
F 2 "" H 6500 3100 50  0001 C CNN
F 3 "~" H 6500 3100 50  0001 C CNN
	1    6500 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 2000 6150 2000
Wire Wire Line
	6500 2000 6500 2100
Wire Wire Line
	6500 2400 6500 2550
Wire Wire Line
	6500 2950 6500 3100
Wire Wire Line
	6000 2550 6000 2300
Connection ~ 6500 2550
Wire Wire Line
	6500 2550 6500 2650
$Comp
L Device:R_US R5
U 1 1 5DAC9295
P 4200 2600
F 0 "R5" H 4132 2554 50  0000 R CNN
F 1 "20k" H 4132 2645 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4240 2590 50  0001 C CNN
F 3 "~" H 4200 2600 50  0001 C CNN
	1    4200 2600
	-1   0    0    1   
$EndComp
$Comp
L power:Earth #PWR0128
U 1 1 5DAC9349
P 4200 2900
F 0 "#PWR0128" H 4200 2650 50  0001 C CNN
F 1 "Earth" H 4200 2750 50  0001 C CNN
F 2 "" H 4200 2900 50  0001 C CNN
F 3 "~" H 4200 2900 50  0001 C CNN
	1    4200 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2300 4200 2300
Wire Wire Line
	4200 2300 4200 2450
Wire Wire Line
	4200 2750 4200 2900
$Comp
L Device:C C16
U 1 1 5DAD02C7
P 7000 2300
F 0 "C16" H 7115 2346 50  0000 L CNN
F 1 "1uF" H 7115 2255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7038 2150 50  0001 C CNN
F 3 "~" H 7000 2300 50  0001 C CNN
	1    7000 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C17
U 1 1 5DAD0335
P 7400 2300
F 0 "C17" H 7515 2346 50  0000 L CNN
F 1 "22uF" H 7515 2255 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.42x2.65mm_HandSolder" H 7438 2150 50  0001 C CNN
F 3 "~" H 7400 2300 50  0001 C CNN
	1    7400 2300
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0129
U 1 1 5DAD039D
P 7000 2600
F 0 "#PWR0129" H 7000 2350 50  0001 C CNN
F 1 "Earth" H 7000 2450 50  0001 C CNN
F 2 "" H 7000 2600 50  0001 C CNN
F 3 "~" H 7000 2600 50  0001 C CNN
	1    7000 2600
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0130
U 1 1 5DAD03FF
P 7400 2600
F 0 "#PWR0130" H 7400 2350 50  0001 C CNN
F 1 "Earth" H 7400 2450 50  0001 C CNN
F 2 "" H 7400 2600 50  0001 C CNN
F 3 "~" H 7400 2600 50  0001 C CNN
	1    7400 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 2000 7000 2000
Wire Wire Line
	7400 2000 7400 2150
Connection ~ 6500 2000
Wire Wire Line
	7000 2000 7000 2150
Connection ~ 7000 2000
Wire Wire Line
	7000 2000 7400 2000
Wire Wire Line
	7400 2450 7400 2600
Wire Wire Line
	7000 2450 7000 2600
Wire Wire Line
	7800 2000 7800 1750
Connection ~ 7400 2000
$Comp
L power:+5V #PWR0131
U 1 1 5DAE2F00
P 7800 1750
F 0 "#PWR0131" H 7800 1600 50  0001 C CNN
F 1 "+5V" H 7815 1923 50  0000 C CNN
F 2 "" H 7800 1750 50  0001 C CNN
F 3 "" H 7800 1750 50  0001 C CNN
	1    7800 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C15
U 1 1 5DAE3D54
P 6150 2300
F 0 "C15" H 6265 2346 50  0000 L CNN
F 1 "330pF" H 6265 2255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6188 2150 50  0001 C CNN
F 3 "~" H 6150 2300 50  0001 C CNN
	1    6150 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 2300 5200 2300
Wire Wire Line
	6000 2550 6150 2550
Wire Wire Line
	6150 2150 6150 2000
Connection ~ 6150 2000
Wire Wire Line
	6150 2000 6500 2000
Wire Wire Line
	6150 2450 6150 2550
Connection ~ 6150 2550
Wire Wire Line
	6150 2550 6500 2550
Wire Wire Line
	5850 2200 5850 2550
Wire Wire Line
	5200 2200 5850 2200
$Comp
L Device:D_Schottky D4
U 1 1 5DB0D1EF
P 5500 2550
F 0 "D4" V 5454 2629 50  0000 L CNN
F 1 "CDBC540-G" V 5545 2629 50  0000 L CNN
F 2 "Diode_SMD:D_SMC" H 5500 2550 50  0001 C CNN
F 3 "~" H 5500 2550 50  0001 C CNN
	1    5500 2550
	0    1    1    0   
$EndComp
$Comp
L power:Earth #PWR0132
U 1 1 5DB0D29B
P 5500 3000
F 0 "#PWR0132" H 5500 2750 50  0001 C CNN
F 1 "Earth" H 5500 2850 50  0001 C CNN
F 2 "" H 5500 3000 50  0001 C CNN
F 3 "~" H 5500 3000 50  0001 C CNN
	1    5500 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 3000 5500 2700
Wire Wire Line
	5500 2400 5500 2000
Wire Wire Line
	5450 2000 5500 2000
Connection ~ 5500 2000
Wire Wire Line
	5500 2000 5650 2000
Text Notes 5600 1700 0    50   ~ 0
VLF10040T-4R7N5R4
Text Notes 4050 3950 0    50   ~ 0
CDRH4D28CLDNP-3R3PC
$Comp
L DesignCompLib:SPDT_MHSS1104 S1
U 1 1 5DAA318B
P 1850 5750
F 0 "S1" H 1825 6297 60  0000 C CNN
F 1 "SPDT_MHSS1104" H 1825 6191 60  0000 C CNN
F 2 "DesignFootprintLib:SPDT_MHSS1104" H 1900 5750 60  0001 C CNN
F 3 "" H 1900 5750 60  0001 C CNN
	1    1850 5750
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0133
U 1 1 5DAA32D5
P 1100 5900
F 0 "#PWR0133" H 1100 5650 50  0001 C CNN
F 1 "Earth" H 1100 5750 50  0001 C CNN
F 2 "" H 1100 5900 50  0001 C CNN
F 3 "~" H 1100 5900 50  0001 C CNN
	1    1100 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 5550 1100 5550
Wire Wire Line
	1100 5550 1100 5900
NoConn ~ 2250 5550
NoConn ~ 2250 5650
NoConn ~ 2250 5750
NoConn ~ 1400 5650
Wire Wire Line
	2200 5550 2250 5550
Wire Wire Line
	2250 5650 2200 5650
Wire Wire Line
	2250 5750 2200 5750
Wire Wire Line
	1450 5650 1400 5650
$Comp
L Device:R_US R9
U 1 1 5DACD247
P 2500 5800
F 0 "R9" H 2432 5754 50  0000 R CNN
F 1 "80k" H 2432 5845 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 2540 5790 50  0001 C CNN
F 3 "~" H 2500 5800 50  0001 C CNN
	1    2500 5800
	-1   0    0    1   
$EndComp
$Comp
L Device:R_US R8
U 1 1 5DACD365
P 2500 5150
F 0 "R8" H 2568 5196 50  0000 L CNN
F 1 "180k" H 2568 5105 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 2540 5140 50  0001 C CNN
F 3 "~" H 2500 5150 50  0001 C CNN
	1    2500 5150
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0134
U 1 1 5DACD3DB
P 2500 6050
F 0 "#PWR0134" H 2500 5800 50  0001 C CNN
F 1 "Earth" H 2500 5900 50  0001 C CNN
F 2 "" H 2500 6050 50  0001 C CNN
F 3 "~" H 2500 6050 50  0001 C CNN
	1    2500 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 5950 2500 6050
Wire Wire Line
	2500 5650 2500 5450
Wire Wire Line
	2200 5450 2500 5450
Connection ~ 2500 5450
Wire Wire Line
	2500 5450 2500 5400
Wire Wire Line
	2500 5000 2500 4200
Connection ~ 2500 4200
Wire Wire Line
	2500 4200 3050 4200
Wire Wire Line
	3050 4300 2900 4300
Wire Wire Line
	2900 4300 2900 5400
Wire Wire Line
	2900 5400 2500 5400
Connection ~ 2500 5400
Wire Wire Line
	2500 5400 2500 5300
Text Notes 6450 1300 0    50   ~ 0
Maximum output current of 5A
$Comp
L power:+BATT #PWR0135
U 1 1 5DAF0556
P 8300 1550
F 0 "#PWR0135" H 8300 1400 50  0001 C CNN
F 1 "+BATT" H 8315 1723 50  0000 C CNN
F 2 "" H 8300 1550 50  0001 C CNN
F 3 "" H 8300 1550 50  0001 C CNN
	1    8300 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 1550 8300 1900
Connection ~ 8300 1900
Text Notes 2700 1600 0    50   ~ 0
Operating frequency 1.1MHz
$Comp
L DesignCompLib:CONN_02X05 J3
U 1 1 5DB00D65
P 9700 2950
F 0 "J3" H 9700 3365 50  0000 C CNN
F 1 "CONN_02X05" H 9700 3274 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 9700 1750 50  0001 C CNN
F 3 "" H 9700 1750 50  0001 C CNN
	1    9700 2950
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0136
U 1 1 5DB12F9F
P 10150 3300
F 0 "#PWR0136" H 10150 3050 50  0001 C CNN
F 1 "Earth" H 10150 3150 50  0001 C CNN
F 2 "" H 10150 3300 50  0001 C CNN
F 3 "~" H 10150 3300 50  0001 C CNN
	1    10150 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 3150 10150 3150
Wire Wire Line
	10150 3150 10150 3300
Wire Wire Line
	9950 2750 10150 2750
Wire Wire Line
	10150 2750 10150 2850
Connection ~ 10150 3150
Wire Wire Line
	9950 2850 10150 2850
Connection ~ 10150 2850
Wire Wire Line
	10150 2850 10150 2950
Wire Wire Line
	9950 2950 10150 2950
Connection ~ 10150 2950
Wire Wire Line
	10150 2950 10150 3050
Wire Wire Line
	9950 3050 10150 3050
Connection ~ 10150 3050
Wire Wire Line
	10150 3050 10150 3150
$Comp
L power:+5V #PWR0137
U 1 1 5DB31CB6
P 9250 2550
F 0 "#PWR0137" H 9250 2400 50  0001 C CNN
F 1 "+5V" H 9265 2723 50  0000 C CNN
F 2 "" H 9250 2550 50  0001 C CNN
F 3 "" H 9250 2550 50  0001 C CNN
	1    9250 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 2550 9250 2750
Wire Wire Line
	9250 3150 9450 3150
Wire Wire Line
	9450 2750 9250 2750
Connection ~ 9250 2750
Wire Wire Line
	9250 2750 9250 2850
Wire Wire Line
	9450 2850 9250 2850
Connection ~ 9250 2850
Wire Wire Line
	9250 2850 9250 2950
Wire Wire Line
	9450 2950 9250 2950
Connection ~ 9250 2950
Wire Wire Line
	9250 2950 9250 3050
Wire Wire Line
	9450 3050 9250 3050
Connection ~ 9250 3050
Wire Wire Line
	9250 3050 9250 3150
Text Notes 7400 7500 0    50   ~ 0
Power Distribution Board
Text Notes 8150 7650 0    50   ~ 0
10/31/2019
Text Notes 10600 7650 0    50   ~ 0
A
Text Notes 7300 7250 0    50   ~ 0
1 1
$Comp
L Device:C C18
U 1 1 5DC51FDF
P 7800 2300
F 0 "C18" H 7915 2346 50  0000 L CNN
F 1 "22uF" H 7915 2255 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.42x2.65mm_HandSolder" H 7838 2150 50  0001 C CNN
F 3 "~" H 7800 2300 50  0001 C CNN
	1    7800 2300
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0147
U 1 1 5DC51FE6
P 7800 2600
F 0 "#PWR0147" H 7800 2350 50  0001 C CNN
F 1 "Earth" H 7800 2450 50  0001 C CNN
F 2 "" H 7800 2600 50  0001 C CNN
F 3 "~" H 7800 2600 50  0001 C CNN
	1    7800 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 2000 7800 2150
Wire Wire Line
	7800 2450 7800 2600
Wire Wire Line
	7400 2000 7800 2000
Connection ~ 7800 2000
$Comp
L Device:C C9
U 1 1 5DC6ED5F
P 6900 4500
F 0 "C9" H 7015 4546 50  0000 L CNN
F 1 "22uF" H 7015 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.42x2.65mm_HandSolder" H 6938 4350 50  0001 C CNN
F 3 "~" H 6900 4500 50  0001 C CNN
	1    6900 4500
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0148
U 1 1 5DC6ED66
P 6900 4750
F 0 "#PWR0148" H 6900 4500 50  0001 C CNN
F 1 "Earth" H 6900 4600 50  0001 C CNN
F 2 "" H 6900 4750 50  0001 C CNN
F 3 "~" H 6900 4750 50  0001 C CNN
	1    6900 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 4350 6900 4200
Wire Wire Line
	6900 4650 6900 4750
$Comp
L Device:C C3
U 1 1 5DC78D90
P 2200 4400
F 0 "C3" H 2315 4446 50  0000 L CNN
F 1 "10uF" H 2315 4355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2238 4250 50  0001 C CNN
F 3 "~" H 2200 4400 50  0001 C CNN
	1    2200 4400
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0149
U 1 1 5DC78D97
P 2200 4650
F 0 "#PWR0149" H 2200 4400 50  0001 C CNN
F 1 "Earth" H 2200 4500 50  0001 C CNN
F 2 "" H 2200 4650 50  0001 C CNN
F 3 "~" H 2200 4650 50  0001 C CNN
	1    2200 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 4550 2200 4650
Connection ~ 1400 4200
Wire Wire Line
	1400 4200 1350 4200
Wire Wire Line
	1400 4200 1800 4200
Connection ~ 1800 4200
Wire Wire Line
	1800 4200 2200 4200
Wire Wire Line
	2200 4250 2200 4200
Connection ~ 2200 4200
Wire Wire Line
	2200 4200 2500 4200
Connection ~ 2150 2100
Wire Wire Line
	2150 2100 2600 2100
$Comp
L Device:C C11
U 1 1 5DCD5A4B
P 2600 2350
F 0 "C11" H 2715 2396 50  0000 L CNN
F 1 "4.7uF" H 2715 2305 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.42x2.65mm_HandSolder" H 2638 2200 50  0001 C CNN
F 3 "~" H 2600 2350 50  0001 C CNN
	1    2600 2350
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0150
U 1 1 5DCD5A52
P 2600 2650
F 0 "#PWR0150" H 2600 2400 50  0001 C CNN
F 1 "Earth" H 2600 2500 50  0001 C CNN
F 2 "" H 2600 2650 50  0001 C CNN
F 3 "~" H 2600 2650 50  0001 C CNN
	1    2600 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 2650 2600 2500
Connection ~ 6900 4200
Wire Wire Line
	6900 4200 7200 4200
Wire Wire Line
	6350 4200 6900 4200
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 5DC0082D
P 850 2150
F 0 "J1" H 770 1825 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 770 1916 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2_1x02_P5.00mm_Horizontal" H 850 2150 50  0001 C CNN
F 3 "~" H 850 2150 50  0001 C CNN
	1    850  2150
	-1   0    0    1   
$EndComp
Wire Wire Line
	1050 2050 1500 2050
Wire Wire Line
	2600 2200 2600 2100
Connection ~ 2600 2100
Wire Wire Line
	2600 2100 3050 2100
Wire Wire Line
	10200 2000 10200 2200
$Comp
L Connector_Generic:Conn_02x07_Odd_Even J2
U 1 1 5DC66DEA
P 9700 1700
F 0 "J2" H 9750 2217 50  0000 C CNN
F 1 "Conn_02x07_Odd_Even" H 9750 2126 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x07_P2.54mm_Vertical" H 9700 1700 50  0001 C CNN
F 3 "~" H 9700 1700 50  0001 C CNN
	1    9700 1700
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP1
U 1 1 5DC62FA1
P 4250 2200
F 0 "JP1" H 4250 2405 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 4250 2314 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 4250 2200 50  0001 C CNN
F 3 "~" H 4250 2200 50  0001 C CNN
	1    4250 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2200 4400 2200
Wire Wire Line
	4100 2200 4000 2200
$EndSCHEMATC
