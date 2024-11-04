create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list system_i/zynq_ultra_ps_e_0/U0/pl_clk0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {adctoddr/reg_o[tbt_len][0]} {adctoddr/reg_o[tbt_len][1]} {adctoddr/reg_o[tbt_len][2]} {adctoddr/reg_o[tbt_len][3]} {adctoddr/reg_o[tbt_len][4]} {adctoddr/reg_o[tbt_len][5]} {adctoddr/reg_o[tbt_len][6]} {adctoddr/reg_o[tbt_len][7]} {adctoddr/reg_o[tbt_len][8]} {adctoddr/reg_o[tbt_len][9]} {adctoddr/reg_o[tbt_len][10]} {adctoddr/reg_o[tbt_len][11]} {adctoddr/reg_o[tbt_len][12]} {adctoddr/reg_o[tbt_len][13]} {adctoddr/reg_o[tbt_len][14]} {adctoddr/reg_o[tbt_len][15]} {adctoddr/reg_o[tbt_len][16]} {adctoddr/reg_o[tbt_len][17]} {adctoddr/reg_o[tbt_len][18]} {adctoddr/reg_o[tbt_len][19]} {adctoddr/reg_o[tbt_len][20]} {adctoddr/reg_o[tbt_len][21]} {adctoddr/reg_o[tbt_len][22]} {adctoddr/reg_o[tbt_len][23]} {adctoddr/reg_o[tbt_len][24]} {adctoddr/reg_o[tbt_len][25]} {adctoddr/reg_o[tbt_len][26]} {adctoddr/reg_o[tbt_len][27]} {adctoddr/reg_o[tbt_len][28]} {adctoddr/reg_o[tbt_len][29]} {adctoddr/reg_o[tbt_len][30]} {adctoddr/reg_o[tbt_len][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {adctoddr/burst_len[0]} {adctoddr/burst_len[1]} {adctoddr/burst_len[2]} {adctoddr/burst_len[3]} {adctoddr/burst_len[4]} {adctoddr/burst_len[5]} {adctoddr/burst_len[6]} {adctoddr/burst_len[7]} {adctoddr/burst_len[8]} {adctoddr/burst_len[9]} {adctoddr/burst_len[10]} {adctoddr/burst_len[11]} {adctoddr/burst_len[12]} {adctoddr/burst_len[13]} {adctoddr/burst_len[14]} {adctoddr/burst_len[15]} {adctoddr/burst_len[16]} {adctoddr/burst_len[17]} {adctoddr/burst_len[18]} {adctoddr/burst_len[19]} {adctoddr/burst_len[20]} {adctoddr/burst_len[21]} {adctoddr/burst_len[22]} {adctoddr/burst_len[23]} {adctoddr/burst_len[24]} {adctoddr/burst_len[25]} {adctoddr/burst_len[26]} {adctoddr/burst_len[27]} {adctoddr/burst_len[28]} {adctoddr/burst_len[29]} {adctoddr/burst_len[30]} {adctoddr/burst_len[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 32 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {adctoddr/reg_o[fa_len][0]} {adctoddr/reg_o[fa_len][1]} {adctoddr/reg_o[fa_len][2]} {adctoddr/reg_o[fa_len][3]} {adctoddr/reg_o[fa_len][4]} {adctoddr/reg_o[fa_len][5]} {adctoddr/reg_o[fa_len][6]} {adctoddr/reg_o[fa_len][7]} {adctoddr/reg_o[fa_len][8]} {adctoddr/reg_o[fa_len][9]} {adctoddr/reg_o[fa_len][10]} {adctoddr/reg_o[fa_len][11]} {adctoddr/reg_o[fa_len][12]} {adctoddr/reg_o[fa_len][13]} {adctoddr/reg_o[fa_len][14]} {adctoddr/reg_o[fa_len][15]} {adctoddr/reg_o[fa_len][16]} {adctoddr/reg_o[fa_len][17]} {adctoddr/reg_o[fa_len][18]} {adctoddr/reg_o[fa_len][19]} {adctoddr/reg_o[fa_len][20]} {adctoddr/reg_o[fa_len][21]} {adctoddr/reg_o[fa_len][22]} {adctoddr/reg_o[fa_len][23]} {adctoddr/reg_o[fa_len][24]} {adctoddr/reg_o[fa_len][25]} {adctoddr/reg_o[fa_len][26]} {adctoddr/reg_o[fa_len][27]} {adctoddr/reg_o[fa_len][28]} {adctoddr/reg_o[fa_len][29]} {adctoddr/reg_o[fa_len][30]} {adctoddr/reg_o[fa_len][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 32 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {trig/reg_o[adc_len][0]} {trig/reg_o[adc_len][1]} {trig/reg_o[adc_len][2]} {trig/reg_o[adc_len][3]} {trig/reg_o[adc_len][4]} {trig/reg_o[adc_len][5]} {trig/reg_o[adc_len][6]} {trig/reg_o[adc_len][7]} {trig/reg_o[adc_len][8]} {trig/reg_o[adc_len][9]} {trig/reg_o[adc_len][10]} {trig/reg_o[adc_len][11]} {trig/reg_o[adc_len][12]} {trig/reg_o[adc_len][13]} {trig/reg_o[adc_len][14]} {trig/reg_o[adc_len][15]} {trig/reg_o[adc_len][16]} {trig/reg_o[adc_len][17]} {trig/reg_o[adc_len][18]} {trig/reg_o[adc_len][19]} {trig/reg_o[adc_len][20]} {trig/reg_o[adc_len][21]} {trig/reg_o[adc_len][22]} {trig/reg_o[adc_len][23]} {trig/reg_o[adc_len][24]} {trig/reg_o[adc_len][25]} {trig/reg_o[adc_len][26]} {trig/reg_o[adc_len][27]} {trig/reg_o[adc_len][28]} {trig/reg_o[adc_len][29]} {trig/reg_o[adc_len][30]} {trig/reg_o[adc_len][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 32 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {trig/reg_o[fa_len][0]} {trig/reg_o[fa_len][1]} {trig/reg_o[fa_len][2]} {trig/reg_o[fa_len][3]} {trig/reg_o[fa_len][4]} {trig/reg_o[fa_len][5]} {trig/reg_o[fa_len][6]} {trig/reg_o[fa_len][7]} {trig/reg_o[fa_len][8]} {trig/reg_o[fa_len][9]} {trig/reg_o[fa_len][10]} {trig/reg_o[fa_len][11]} {trig/reg_o[fa_len][12]} {trig/reg_o[fa_len][13]} {trig/reg_o[fa_len][14]} {trig/reg_o[fa_len][15]} {trig/reg_o[fa_len][16]} {trig/reg_o[fa_len][17]} {trig/reg_o[fa_len][18]} {trig/reg_o[fa_len][19]} {trig/reg_o[fa_len][20]} {trig/reg_o[fa_len][21]} {trig/reg_o[fa_len][22]} {trig/reg_o[fa_len][23]} {trig/reg_o[fa_len][24]} {trig/reg_o[fa_len][25]} {trig/reg_o[fa_len][26]} {trig/reg_o[fa_len][27]} {trig/reg_o[fa_len][28]} {trig/reg_o[fa_len][29]} {trig/reg_o[fa_len][30]} {trig/reg_o[fa_len][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 32 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {trig/reg_o[tbt_len][0]} {trig/reg_o[tbt_len][1]} {trig/reg_o[tbt_len][2]} {trig/reg_o[tbt_len][3]} {trig/reg_o[tbt_len][4]} {trig/reg_o[tbt_len][5]} {trig/reg_o[tbt_len][6]} {trig/reg_o[tbt_len][7]} {trig/reg_o[tbt_len][8]} {trig/reg_o[tbt_len][9]} {trig/reg_o[tbt_len][10]} {trig/reg_o[tbt_len][11]} {trig/reg_o[tbt_len][12]} {trig/reg_o[tbt_len][13]} {trig/reg_o[tbt_len][14]} {trig/reg_o[tbt_len][15]} {trig/reg_o[tbt_len][16]} {trig/reg_o[tbt_len][17]} {trig/reg_o[tbt_len][18]} {trig/reg_o[tbt_len][19]} {trig/reg_o[tbt_len][20]} {trig/reg_o[tbt_len][21]} {trig/reg_o[tbt_len][22]} {trig/reg_o[tbt_len][23]} {trig/reg_o[tbt_len][24]} {trig/reg_o[tbt_len][25]} {trig/reg_o[tbt_len][26]} {trig/reg_o[tbt_len][27]} {trig/reg_o[tbt_len][28]} {trig/reg_o[tbt_len][29]} {trig/reg_o[tbt_len][30]} {trig/reg_o[tbt_len][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list dsa_clk_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list dsa_latch_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list dsa_sdata_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {adctoddr/reg_o[adc_enb]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {trig/reg_o[adc_enb]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {adctoddr/reg_o[fa_enb]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {trig/reg_o[fa_enb]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {adctoddr/reg_o[fifo_rst]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {trig/reg_o[fifo_rst]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {trig/reg_o[soft_trig]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {adctoddr/reg_o[soft_trig]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {trig/reg_o[tbt_enb]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {adctoddr/reg_o[tbt_enb]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {trig/reg_o[trigsrc]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {adctoddr/reg_o[trigsrc]}]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list adc_inst/adc1_fco_pll/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 64 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {adctoddr/s_axis_testdata[0]} {adctoddr/s_axis_testdata[1]} {adctoddr/s_axis_testdata[2]} {adctoddr/s_axis_testdata[3]} {adctoddr/s_axis_testdata[4]} {adctoddr/s_axis_testdata[5]} {adctoddr/s_axis_testdata[6]} {adctoddr/s_axis_testdata[7]} {adctoddr/s_axis_testdata[8]} {adctoddr/s_axis_testdata[9]} {adctoddr/s_axis_testdata[10]} {adctoddr/s_axis_testdata[11]} {adctoddr/s_axis_testdata[12]} {adctoddr/s_axis_testdata[13]} {adctoddr/s_axis_testdata[14]} {adctoddr/s_axis_testdata[15]} {adctoddr/s_axis_testdata[16]} {adctoddr/s_axis_testdata[17]} {adctoddr/s_axis_testdata[18]} {adctoddr/s_axis_testdata[19]} {adctoddr/s_axis_testdata[20]} {adctoddr/s_axis_testdata[21]} {adctoddr/s_axis_testdata[22]} {adctoddr/s_axis_testdata[23]} {adctoddr/s_axis_testdata[24]} {adctoddr/s_axis_testdata[25]} {adctoddr/s_axis_testdata[26]} {adctoddr/s_axis_testdata[27]} {adctoddr/s_axis_testdata[28]} {adctoddr/s_axis_testdata[29]} {adctoddr/s_axis_testdata[30]} {adctoddr/s_axis_testdata[31]} {adctoddr/s_axis_testdata[32]} {adctoddr/s_axis_testdata[33]} {adctoddr/s_axis_testdata[34]} {adctoddr/s_axis_testdata[35]} {adctoddr/s_axis_testdata[36]} {adctoddr/s_axis_testdata[37]} {adctoddr/s_axis_testdata[38]} {adctoddr/s_axis_testdata[39]} {adctoddr/s_axis_testdata[40]} {adctoddr/s_axis_testdata[41]} {adctoddr/s_axis_testdata[42]} {adctoddr/s_axis_testdata[43]} {adctoddr/s_axis_testdata[44]} {adctoddr/s_axis_testdata[45]} {adctoddr/s_axis_testdata[46]} {adctoddr/s_axis_testdata[47]} {adctoddr/s_axis_testdata[48]} {adctoddr/s_axis_testdata[49]} {adctoddr/s_axis_testdata[50]} {adctoddr/s_axis_testdata[51]} {adctoddr/s_axis_testdata[52]} {adctoddr/s_axis_testdata[53]} {adctoddr/s_axis_testdata[54]} {adctoddr/s_axis_testdata[55]} {adctoddr/s_axis_testdata[56]} {adctoddr/s_axis_testdata[57]} {adctoddr/s_axis_testdata[58]} {adctoddr/s_axis_testdata[59]} {adctoddr/s_axis_testdata[60]} {adctoddr/s_axis_testdata[61]} {adctoddr/s_axis_testdata[62]} {adctoddr/s_axis_testdata[63]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 2 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {adctoddr/wr_state[0]} {adctoddr/wr_state[1]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 32 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {adctoddr/fifo_wrlen[0]} {adctoddr/fifo_wrlen[1]} {adctoddr/fifo_wrlen[2]} {adctoddr/fifo_wrlen[3]} {adctoddr/fifo_wrlen[4]} {adctoddr/fifo_wrlen[5]} {adctoddr/fifo_wrlen[6]} {adctoddr/fifo_wrlen[7]} {adctoddr/fifo_wrlen[8]} {adctoddr/fifo_wrlen[9]} {adctoddr/fifo_wrlen[10]} {adctoddr/fifo_wrlen[11]} {adctoddr/fifo_wrlen[12]} {adctoddr/fifo_wrlen[13]} {adctoddr/fifo_wrlen[14]} {adctoddr/fifo_wrlen[15]} {adctoddr/fifo_wrlen[16]} {adctoddr/fifo_wrlen[17]} {adctoddr/fifo_wrlen[18]} {adctoddr/fifo_wrlen[19]} {adctoddr/fifo_wrlen[20]} {adctoddr/fifo_wrlen[21]} {adctoddr/fifo_wrlen[22]} {adctoddr/fifo_wrlen[23]} {adctoddr/fifo_wrlen[24]} {adctoddr/fifo_wrlen[25]} {adctoddr/fifo_wrlen[26]} {adctoddr/fifo_wrlen[27]} {adctoddr/fifo_wrlen[28]} {adctoddr/fifo_wrlen[29]} {adctoddr/fifo_wrlen[30]} {adctoddr/fifo_wrlen[31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 1 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list {trig/reg_i[status][1]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 32 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list {trig/reg_i[trig_cnt][0]} {trig/reg_i[trig_cnt][1]} {trig/reg_i[trig_cnt][2]} {trig/reg_i[trig_cnt][3]} {trig/reg_i[trig_cnt][4]} {trig/reg_i[trig_cnt][5]} {trig/reg_i[trig_cnt][6]} {trig/reg_i[trig_cnt][7]} {trig/reg_i[trig_cnt][8]} {trig/reg_i[trig_cnt][9]} {trig/reg_i[trig_cnt][10]} {trig/reg_i[trig_cnt][11]} {trig/reg_i[trig_cnt][12]} {trig/reg_i[trig_cnt][13]} {trig/reg_i[trig_cnt][14]} {trig/reg_i[trig_cnt][15]} {trig/reg_i[trig_cnt][16]} {trig/reg_i[trig_cnt][17]} {trig/reg_i[trig_cnt][18]} {trig/reg_i[trig_cnt][19]} {trig/reg_i[trig_cnt][20]} {trig/reg_i[trig_cnt][21]} {trig/reg_i[trig_cnt][22]} {trig/reg_i[trig_cnt][23]} {trig/reg_i[trig_cnt][24]} {trig/reg_i[trig_cnt][25]} {trig/reg_i[trig_cnt][26]} {trig/reg_i[trig_cnt][27]} {trig/reg_i[trig_cnt][28]} {trig/reg_i[trig_cnt][29]} {trig/reg_i[trig_cnt][30]} {trig/reg_i[trig_cnt][31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 32 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list {trig/trig_cnt[0]} {trig/trig_cnt[1]} {trig/trig_cnt[2]} {trig/trig_cnt[3]} {trig/trig_cnt[4]} {trig/trig_cnt[5]} {trig/trig_cnt[6]} {trig/trig_cnt[7]} {trig/trig_cnt[8]} {trig/trig_cnt[9]} {trig/trig_cnt[10]} {trig/trig_cnt[11]} {trig/trig_cnt[12]} {trig/trig_cnt[13]} {trig/trig_cnt[14]} {trig/trig_cnt[15]} {trig/trig_cnt[16]} {trig/trig_cnt[17]} {trig/trig_cnt[18]} {trig/trig_cnt[19]} {trig/trig_cnt[20]} {trig/trig_cnt[21]} {trig/trig_cnt[22]} {trig/trig_cnt[23]} {trig/trig_cnt[24]} {trig/trig_cnt[25]} {trig/trig_cnt[26]} {trig/trig_cnt[27]} {trig/trig_cnt[28]} {trig/trig_cnt[29]} {trig/trig_cnt[30]} {trig/trig_cnt[31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe6]
set_property port_width 3 [get_debug_ports u_ila_1/probe6]
connect_debug_port u_ila_1/probe6 [get_nets [list {trig/soft_trig_sr[0]} {trig/soft_trig_sr[1]} {trig/soft_trig_sr[2]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe7]
set_property port_width 1 [get_debug_ports u_ila_1/probe7]
connect_debug_port u_ila_1/probe7 [get_nets [list trig/dma_active]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe8]
set_property port_width 1 [get_debug_ports u_ila_1/probe8]
connect_debug_port u_ila_1/probe8 [get_nets [list trig/dma_adc_active]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe9]
set_property port_width 1 [get_debug_ports u_ila_1/probe9]
connect_debug_port u_ila_1/probe9 [get_nets [list trig/dma_done]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe10]
set_property port_width 1 [get_debug_ports u_ila_1/probe10]
connect_debug_port u_ila_1/probe10 [get_nets [list trig/dma_fa_active]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe11]
set_property port_width 1 [get_debug_ports u_ila_1/probe11]
connect_debug_port u_ila_1/probe11 [get_nets [list trig/dma_running]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe12]
set_property port_width 1 [get_debug_ports u_ila_1/probe12]
connect_debug_port u_ila_1/probe12 [get_nets [list trig/dma_tbt_active]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe13]
set_property port_width 1 [get_debug_ports u_ila_1/probe13]
connect_debug_port u_ila_1/probe13 [get_nets [list trig/dma_trig]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe14]
set_property port_width 1 [get_debug_ports u_ila_1/probe14]
connect_debug_port u_ila_1/probe14 [get_nets [list trig/dma_trig_lat]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe15]
set_property port_width 1 [get_debug_ports u_ila_1/probe15]
connect_debug_port u_ila_1/probe15 [get_nets [list trig/evr_trig_s]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe16]
set_property port_width 1 [get_debug_ports u_ila_1/probe16]
connect_debug_port u_ila_1/probe16 [get_nets [list adctoddr/p_0_in]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe17]
set_property port_width 1 [get_debug_ports u_ila_1/probe17]
connect_debug_port u_ila_1/probe17 [get_nets [list trig/p_1_in2_in]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe18]
set_property port_width 1 [get_debug_ports u_ila_1/probe18]
connect_debug_port u_ila_1/probe18 [get_nets [list adctoddr/s_axis_tlast]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe19]
set_property port_width 1 [get_debug_ports u_ila_1/probe19]
connect_debug_port u_ila_1/probe19 [get_nets [list adctoddr/s_axis_tready]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe20]
set_property port_width 1 [get_debug_ports u_ila_1/probe20]
connect_debug_port u_ila_1/probe20 [get_nets [list adctoddr/s_axis_tvalid]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe21]
set_property port_width 1 [get_debug_ports u_ila_1/probe21]
connect_debug_port u_ila_1/probe21 [get_nets [list trig/soft_trig_s]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe22]
set_property port_width 1 [get_debug_ports u_ila_1/probe22]
connect_debug_port u_ila_1/probe22 [get_nets [list adctoddr/trig]]
create_debug_core u_ila_2 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_2]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_2]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_2]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_2]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_2]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_2]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_2]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_2]
set_property port_width 1 [get_debug_ports u_ila_2/clk]
connect_debug_port u_ila_2/clk [get_nets [list system_i/zynq_ultra_ps_e_0/U0/pl_clk1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe0]
set_property port_width 8 [get_debug_ports u_ila_2/probe0]
connect_debug_port u_ila_2/probe0 [get_nets [list {adctoddr/m_axis_tkeep[0]} {adctoddr/m_axis_tkeep[1]} {adctoddr/m_axis_tkeep[2]} {adctoddr/m_axis_tkeep[3]} {adctoddr/m_axis_tkeep[4]} {adctoddr/m_axis_tkeep[5]} {adctoddr/m_axis_tkeep[6]} {adctoddr/m_axis_tkeep[7]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe1]
set_property port_width 64 [get_debug_ports u_ila_2/probe1]
connect_debug_port u_ila_2/probe1 [get_nets [list {adctoddr/m_axis_tdata[0]} {adctoddr/m_axis_tdata[1]} {adctoddr/m_axis_tdata[2]} {adctoddr/m_axis_tdata[3]} {adctoddr/m_axis_tdata[4]} {adctoddr/m_axis_tdata[5]} {adctoddr/m_axis_tdata[6]} {adctoddr/m_axis_tdata[7]} {adctoddr/m_axis_tdata[8]} {adctoddr/m_axis_tdata[9]} {adctoddr/m_axis_tdata[10]} {adctoddr/m_axis_tdata[11]} {adctoddr/m_axis_tdata[12]} {adctoddr/m_axis_tdata[13]} {adctoddr/m_axis_tdata[14]} {adctoddr/m_axis_tdata[15]} {adctoddr/m_axis_tdata[16]} {adctoddr/m_axis_tdata[17]} {adctoddr/m_axis_tdata[18]} {adctoddr/m_axis_tdata[19]} {adctoddr/m_axis_tdata[20]} {adctoddr/m_axis_tdata[21]} {adctoddr/m_axis_tdata[22]} {adctoddr/m_axis_tdata[23]} {adctoddr/m_axis_tdata[24]} {adctoddr/m_axis_tdata[25]} {adctoddr/m_axis_tdata[26]} {adctoddr/m_axis_tdata[27]} {adctoddr/m_axis_tdata[28]} {adctoddr/m_axis_tdata[29]} {adctoddr/m_axis_tdata[30]} {adctoddr/m_axis_tdata[31]} {adctoddr/m_axis_tdata[32]} {adctoddr/m_axis_tdata[33]} {adctoddr/m_axis_tdata[34]} {adctoddr/m_axis_tdata[35]} {adctoddr/m_axis_tdata[36]} {adctoddr/m_axis_tdata[37]} {adctoddr/m_axis_tdata[38]} {adctoddr/m_axis_tdata[39]} {adctoddr/m_axis_tdata[40]} {adctoddr/m_axis_tdata[41]} {adctoddr/m_axis_tdata[42]} {adctoddr/m_axis_tdata[43]} {adctoddr/m_axis_tdata[44]} {adctoddr/m_axis_tdata[45]} {adctoddr/m_axis_tdata[46]} {adctoddr/m_axis_tdata[47]} {adctoddr/m_axis_tdata[48]} {adctoddr/m_axis_tdata[49]} {adctoddr/m_axis_tdata[50]} {adctoddr/m_axis_tdata[51]} {adctoddr/m_axis_tdata[52]} {adctoddr/m_axis_tdata[53]} {adctoddr/m_axis_tdata[54]} {adctoddr/m_axis_tdata[55]} {adctoddr/m_axis_tdata[56]} {adctoddr/m_axis_tdata[57]} {adctoddr/m_axis_tdata[58]} {adctoddr/m_axis_tdata[59]} {adctoddr/m_axis_tdata[60]} {adctoddr/m_axis_tdata[61]} {adctoddr/m_axis_tdata[62]} {adctoddr/m_axis_tdata[63]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe2]
set_property port_width 1 [get_debug_ports u_ila_2/probe2]
connect_debug_port u_ila_2/probe2 [get_nets [list adctoddr/m_axis_tlast]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe3]
set_property port_width 1 [get_debug_ports u_ila_2/probe3]
connect_debug_port u_ila_2/probe3 [get_nets [list adctoddr/m_axis_tready]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe4]
set_property port_width 1 [get_debug_ports u_ila_2/probe4]
connect_debug_port u_ila_2/probe4 [get_nets [list adctoddr/m_axis_tvalid]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets fp_out_OBUF[1]]
