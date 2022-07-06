#zamena za ne koriscene ulaze i izaze iz koda, ako nema dovoljno pinova za led
##Arduino Digital I/O 
#set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { light_M1[0] }]; #IO_L5P_T0_34 Sch=ar[0]
#set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33 } [get_ports { light_M1[1] }]; #IO_L2N_T0_34 Sch=ar[1]
#set_property -dict { PACKAGE_PIN U13   IOSTANDARD LVCMOS33 } [get_ports { light_M1[2] }]; #IO_L3P_T0_DQS_PUDC_B_34 Sch=ar[2]
#set_property -dict { PACKAGE_PIN V13   IOSTANDARD LVCMOS33 } [get_ports { light_M2[0] }]; #IO_L3N_T0_DQS_34 Sch=ar[3]
#set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { light_M2[1]}]; #IO_L10P_T1_34 Sch=ar[4]
#set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33 } [get_ports { light_M2[2] }]; #IO_L5N_T0_34 Sch=ar[5]
#set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS33 } [get_ports { light_MT[0] }]; #IO_L19P_T3_34 Sch=ar[6]
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { light_MT[1] }]; #IO_L9N_T1_DQS_34 Sch=ar[7]
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { light_MT[2] }]; #IO_L21P_T3_DQS_34 Sch=ar[8]
#set_property -dict { PACKAGE_PIN V18   IOSTANDARD LVCMOS33 } [get_ports { light_S[0] }]; #IO_L21N_T3_DQS_34 Sch=ar[9]
set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports { light_S[1] }]; #IO_L9P_T1_DQS_34 Sch=ar[10]
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { light_S[2] }]; #IO_L19N_T3_VREF_34 Sch=ar[11]

#GLAVNI PINOVI ZA PLOCU
set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { clk }];

##led
set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVCMOS33} [get_ports {light_M1[0]}]
set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports {light_M2[0]}]
set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports { light_MT[0] }];
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports { light_S[0] }];

#semafor za glavne smerove
set_property -dict {PACKAGE_PIN N15 IOSTANDARD LVCMOS33} [get_ports {light_M1[1]}]
set_property -dict {PACKAGE_PIN L14 IOSTANDARD LVCMOS33} [get_ports {light_M1[2]}]
set_property -dict {PACKAGE_PIN G17 IOSTANDARD LVCMOS33} [get_ports {light_M2[1]}]
set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33} [get_ports {light_M2[2]}]

# koriscenje plave boje
#set_property -dict {PACKAGE_PIN L15 IOSTANDARD LVCMOS33} [get_ports {light_M1[1]}]
#set_property -dict {PACKAGE_PIN G14 IOSTANDARD LVCMOS33} [get_ports {light_M1[2]}]
#set_property -dict {PACKAGE_PIN G14 IOSTANDARD LVCMOS33} [get_ports {light_M2[1]}]
#set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33} [get_ports {light_M2[2]}]
#set_property -dict {PACKAGE_PIN L15 IOSTANDARD LVCMOS33} [get_ports {light_MT[1]}]
#set_property -dict {PACKAGE_PIN G14 IOSTANDARD LVCMOS33} [get_ports {light_MT[2]}]
#set_property -dict {PACKAGE_PIN G14 IOSTANDARD LVCMOS33} [get_ports {light_S[1]}]
#set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33} [get_ports {light_S[2]}]


# semafor za druge smerove
#set_property -dict {PACKAGE_PIN N15 IOSTANDARD LVCMOS33} [get_ports {light_MT[1]}]
#set_property -dict {PACKAGE_PIN L14 IOSTANDARD LVCMOS33} [get_ports {light_MT[2]}]
#set_property -dict {PACKAGE_PIN G17 IOSTANDARD LVCMOS33} [get_ports {light_S[1]}]
#set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33} [get_ports {light_S[2]}]



##push button
#set_property -dict {PACKAGE_PIN D19 IOSTANDARD LVCMOS33} [get_ports { btn }];
set_property -dict {PACKAGE_PIN D20 IOSTANDARD LVCMOS33} [get_ports rst]
#set_property -dict {PACKAGE_PIN L20 IOSTANDARD LVCMOS33} [get_ports { rst }];
#set_property -dict {PACKAGE_PIN L19 IOSTANDARD LVCMOS33} [get_ports { button3 }];
#set_property -dict {PACKAGE_PIN M20 IOSTANDARD LVCMOS33} [get_ports { rst }];
#set_property -dict {PACKAGE_PIN M19 IOSTANDARD LVCMOS33} [get_ports { ps }];

#dodavanje vrednosti clk pomocu Constraints Wizard-a
create_clock -period 8.130 -name clk -waveform {0.000 4.065} [get_ports clk]
set_input_delay -clock [get_clocks clk] -min -add_delay 4.000 [get_ports rst]
set_input_delay -clock [get_clocks clk] -max -add_delay 6.000 [get_ports rst]
set_output_delay -clock [get_clocks clk] -min -add_delay 1.000 [get_ports {light_M1[*]}]
set_output_delay -clock [get_clocks clk] -max -add_delay 4.000 [get_ports {light_M1[*]}]
set_output_delay -clock [get_clocks clk] -min -add_delay -0.200 [get_ports {light_M2[*]}]
set_output_delay -clock [get_clocks clk] -max -add_delay 6.200 [get_ports {light_M2[*]}]
set_output_delay -clock [get_clocks clk] -min -add_delay -1.000 [get_ports {light_MT[*]}]
set_output_delay -clock [get_clocks clk] -max -add_delay 10.000 [get_ports {light_MT[*]}]
set_output_delay -clock [get_clocks clk] -min -add_delay 2.000 [get_ports {light_S[*]}]
set_output_delay -clock [get_clocks clk] -max -add_delay 8.000 [get_ports {light_S[*]}]
