create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list system_i/zynq_ultra_ps_e_0/U0/pl_clk0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 5 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {adc_inst/adc_spi/bcnt[0]} {adc_inst/adc_spi/bcnt[1]} {adc_inst/adc_spi/bcnt[2]} {adc_inst/adc_spi/bcnt[3]} {adc_inst/adc_spi/bcnt[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 2 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {adc_inst/adc_spi/csb[0]} {adc_inst/adc_spi/csb[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 16 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {adc_inst/adc_spi/spi_wdata[0]} {adc_inst/adc_spi/spi_wdata[1]} {adc_inst/adc_spi/spi_wdata[2]} {adc_inst/adc_spi/spi_wdata[3]} {adc_inst/adc_spi/spi_wdata[4]} {adc_inst/adc_spi/spi_wdata[5]} {adc_inst/adc_spi/spi_wdata[6]} {adc_inst/adc_spi/spi_wdata[7]} {adc_inst/adc_spi/spi_wdata[8]} {adc_inst/adc_spi/spi_wdata[9]} {adc_inst/adc_spi/spi_wdata[10]} {adc_inst/adc_spi/spi_wdata[11]} {adc_inst/adc_spi/spi_wdata[12]} {adc_inst/adc_spi/spi_wdata[13]} {adc_inst/adc_spi/spi_wdata[14]} {adc_inst/adc_spi/spi_wdata[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 2 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {adc_inst/adc_spi/sdo[0]} {adc_inst/adc_spi/sdo[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 2 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {adc_inst/adc_spi/state[0]} {adc_inst/adc_spi/state[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 16 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {adc_inst/adc_spi/spi_rdata[0]} {adc_inst/adc_spi/spi_rdata[1]} {adc_inst/adc_spi/spi_rdata[2]} {adc_inst/adc_spi/spi_rdata[3]} {adc_inst/adc_spi/spi_rdata[4]} {adc_inst/adc_spi/spi_rdata[5]} {adc_inst/adc_spi/spi_rdata[6]} {adc_inst/adc_spi/spi_rdata[7]} {adc_inst/adc_spi/spi_rdata[8]} {adc_inst/adc_spi/spi_rdata[9]} {adc_inst/adc_spi/spi_rdata[10]} {adc_inst/adc_spi/spi_rdata[11]} {adc_inst/adc_spi/spi_rdata[12]} {adc_inst/adc_spi/spi_rdata[13]} {adc_inst/adc_spi/spi_rdata[14]} {adc_inst/adc_spi/spi_rdata[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 9 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {adc_inst/reg_o[idly_wval][0]} {adc_inst/reg_o[idly_wval][1]} {adc_inst/reg_o[idly_wval][2]} {adc_inst/reg_o[idly_wval][3]} {adc_inst/reg_o[idly_wval][4]} {adc_inst/reg_o[idly_wval][5]} {adc_inst/reg_o[idly_wval][6]} {adc_inst/reg_o[idly_wval][7]} {adc_inst/reg_o[idly_wval][8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 32 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {adc_inst/reg_o[spi_wdata][0]} {adc_inst/reg_o[spi_wdata][1]} {adc_inst/reg_o[spi_wdata][2]} {adc_inst/reg_o[spi_wdata][3]} {adc_inst/reg_o[spi_wdata][4]} {adc_inst/reg_o[spi_wdata][5]} {adc_inst/reg_o[spi_wdata][6]} {adc_inst/reg_o[spi_wdata][7]} {adc_inst/reg_o[spi_wdata][8]} {adc_inst/reg_o[spi_wdata][9]} {adc_inst/reg_o[spi_wdata][10]} {adc_inst/reg_o[spi_wdata][11]} {adc_inst/reg_o[spi_wdata][12]} {adc_inst/reg_o[spi_wdata][13]} {adc_inst/reg_o[spi_wdata][14]} {adc_inst/reg_o[spi_wdata][15]} {adc_inst/reg_o[spi_wdata][16]} {adc_inst/reg_o[spi_wdata][17]} {adc_inst/reg_o[spi_wdata][18]} {adc_inst/reg_o[spi_wdata][19]} {adc_inst/reg_o[spi_wdata][20]} {adc_inst/reg_o[spi_wdata][21]} {adc_inst/reg_o[spi_wdata][22]} {adc_inst/reg_o[spi_wdata][23]} {adc_inst/reg_o[spi_wdata][24]} {adc_inst/reg_o[spi_wdata][25]} {adc_inst/reg_o[spi_wdata][26]} {adc_inst/reg_o[spi_wdata][27]} {adc_inst/reg_o[spi_wdata][28]} {adc_inst/reg_o[spi_wdata][29]} {adc_inst/reg_o[spi_wdata][30]} {adc_inst/reg_o[spi_wdata][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 32 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {adc_inst/adc_spi/adc_spi_rdata[0]} {adc_inst/adc_spi/adc_spi_rdata[1]} {adc_inst/adc_spi/adc_spi_rdata[2]} {adc_inst/adc_spi/adc_spi_rdata[3]} {adc_inst/adc_spi/adc_spi_rdata[4]} {adc_inst/adc_spi/adc_spi_rdata[5]} {adc_inst/adc_spi/adc_spi_rdata[6]} {adc_inst/adc_spi/adc_spi_rdata[7]} {adc_inst/adc_spi/adc_spi_rdata[8]} {adc_inst/adc_spi/adc_spi_rdata[9]} {adc_inst/adc_spi/adc_spi_rdata[10]} {adc_inst/adc_spi/adc_spi_rdata[11]} {adc_inst/adc_spi/adc_spi_rdata[12]} {adc_inst/adc_spi/adc_spi_rdata[13]} {adc_inst/adc_spi/adc_spi_rdata[14]} {adc_inst/adc_spi/adc_spi_rdata[15]} {adc_inst/adc_spi/adc_spi_rdata[16]} {adc_inst/adc_spi/adc_spi_rdata[17]} {adc_inst/adc_spi/adc_spi_rdata[18]} {adc_inst/adc_spi/adc_spi_rdata[19]} {adc_inst/adc_spi/adc_spi_rdata[20]} {adc_inst/adc_spi/adc_spi_rdata[21]} {adc_inst/adc_spi/adc_spi_rdata[22]} {adc_inst/adc_spi/adc_spi_rdata[23]} {adc_inst/adc_spi/adc_spi_rdata[24]} {adc_inst/adc_spi/adc_spi_rdata[25]} {adc_inst/adc_spi/adc_spi_rdata[26]} {adc_inst/adc_spi/adc_spi_rdata[27]} {adc_inst/adc_spi/adc_spi_rdata[28]} {adc_inst/adc_spi/adc_spi_rdata[29]} {adc_inst/adc_spi/adc_spi_rdata[30]} {adc_inst/adc_spi/adc_spi_rdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 32 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {adc_inst/adc_spi/adc_spi_wdata[0]} {adc_inst/adc_spi/adc_spi_wdata[1]} {adc_inst/adc_spi/adc_spi_wdata[2]} {adc_inst/adc_spi/adc_spi_wdata[3]} {adc_inst/adc_spi/adc_spi_wdata[4]} {adc_inst/adc_spi/adc_spi_wdata[5]} {adc_inst/adc_spi/adc_spi_wdata[6]} {adc_inst/adc_spi/adc_spi_wdata[7]} {adc_inst/adc_spi/adc_spi_wdata[8]} {adc_inst/adc_spi/adc_spi_wdata[9]} {adc_inst/adc_spi/adc_spi_wdata[10]} {adc_inst/adc_spi/adc_spi_wdata[11]} {adc_inst/adc_spi/adc_spi_wdata[12]} {adc_inst/adc_spi/adc_spi_wdata[13]} {adc_inst/adc_spi/adc_spi_wdata[14]} {adc_inst/adc_spi/adc_spi_wdata[15]} {adc_inst/adc_spi/adc_spi_wdata[16]} {adc_inst/adc_spi/adc_spi_wdata[17]} {adc_inst/adc_spi/adc_spi_wdata[18]} {adc_inst/adc_spi/adc_spi_wdata[19]} {adc_inst/adc_spi/adc_spi_wdata[20]} {adc_inst/adc_spi/adc_spi_wdata[21]} {adc_inst/adc_spi/adc_spi_wdata[22]} {adc_inst/adc_spi/adc_spi_wdata[23]} {adc_inst/adc_spi/adc_spi_wdata[24]} {adc_inst/adc_spi/adc_spi_wdata[25]} {adc_inst/adc_spi/adc_spi_wdata[26]} {adc_inst/adc_spi/adc_spi_wdata[27]} {adc_inst/adc_spi/adc_spi_wdata[28]} {adc_inst/adc_spi/adc_spi_wdata[29]} {adc_inst/adc_spi/adc_spi_wdata[30]} {adc_inst/adc_spi/adc_spi_wdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 2 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {adc_inst/adc_spi/sclk[0]} {adc_inst/adc_spi/sclk[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 2 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {adc_inst/adc_spi/sdi[0]} {adc_inst/adc_spi/sdi[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 2 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {adc_inst/reg_o[fco_dlystr][0]} {adc_inst/reg_o[fco_dlystr][1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 16 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {adc_inst/reg_o[idly_wstr][0]} {adc_inst/reg_o[idly_wstr][1]} {adc_inst/reg_o[idly_wstr][2]} {adc_inst/reg_o[idly_wstr][3]} {adc_inst/reg_o[idly_wstr][4]} {adc_inst/reg_o[idly_wstr][5]} {adc_inst/reg_o[idly_wstr][6]} {adc_inst/reg_o[idly_wstr][7]} {adc_inst/reg_o[idly_wstr][8]} {adc_inst/reg_o[idly_wstr][9]} {adc_inst/reg_o[idly_wstr][10]} {adc_inst/reg_o[idly_wstr][11]} {adc_inst/reg_o[idly_wstr][12]} {adc_inst/reg_o[idly_wstr][13]} {adc_inst/reg_o[idly_wstr][14]} {adc_inst/reg_o[idly_wstr][15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list adc_inst/adc0_fco_mmcm_locked]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list adc_inst/adc0_fco_mmcm_psdone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list adc_inst/adc1_fco_mmcm_locked]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list adc_inst/adc1_fco_mmcm_psdone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {adc_inst/reg_o[spi_we]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets dbg_OBUF[0]]
