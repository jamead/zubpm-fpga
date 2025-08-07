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
connect_debug_port u_ila_0/clk [get_nets [list adc_inst/adc0_fco_pll/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 16 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {adc_data[0][0]} {adc_data[0][1]} {adc_data[0][2]} {adc_data[0][3]} {adc_data[0][4]} {adc_data[0][5]} {adc_data[0][6]} {adc_data[0][7]} {adc_data[0][8]} {adc_data[0][9]} {adc_data[0][10]} {adc_data[0][11]} {adc_data[0][12]} {adc_data[0][13]} {adc_data[0][14]} {adc_data[0][15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 16 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {adc_data[1][0]} {adc_data[1][1]} {adc_data[1][2]} {adc_data[1][3]} {adc_data[1][4]} {adc_data[1][5]} {adc_data[1][6]} {adc_data[1][7]} {adc_data[1][8]} {adc_data[1][9]} {adc_data[1][10]} {adc_data[1][11]} {adc_data[1][12]} {adc_data[1][13]} {adc_data[1][14]} {adc_data[1][15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 16 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {adc_data[2][0]} {adc_data[2][1]} {adc_data[2][2]} {adc_data[2][3]} {adc_data[2][4]} {adc_data[2][5]} {adc_data[2][6]} {adc_data[2][7]} {adc_data[2][8]} {adc_data[2][9]} {adc_data[2][10]} {adc_data[2][11]} {adc_data[2][12]} {adc_data[2][13]} {adc_data[2][14]} {adc_data[2][15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 16 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {adc_data_sw[1][0]} {adc_data_sw[1][1]} {adc_data_sw[1][2]} {adc_data_sw[1][3]} {adc_data_sw[1][4]} {adc_data_sw[1][5]} {adc_data_sw[1][6]} {adc_data_sw[1][7]} {adc_data_sw[1][8]} {adc_data_sw[1][9]} {adc_data_sw[1][10]} {adc_data_sw[1][11]} {adc_data_sw[1][12]} {adc_data_sw[1][13]} {adc_data_sw[1][14]} {adc_data_sw[1][15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 16 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {adc_data[3][0]} {adc_data[3][1]} {adc_data[3][2]} {adc_data[3][3]} {adc_data[3][4]} {adc_data[3][5]} {adc_data[3][6]} {adc_data[3][7]} {adc_data[3][8]} {adc_data[3][9]} {adc_data[3][10]} {adc_data[3][11]} {adc_data[3][12]} {adc_data[3][13]} {adc_data[3][14]} {adc_data[3][15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 16 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {adc_data_sw[0][0]} {adc_data_sw[0][1]} {adc_data_sw[0][2]} {adc_data_sw[0][3]} {adc_data_sw[0][4]} {adc_data_sw[0][5]} {adc_data_sw[0][6]} {adc_data_sw[0][7]} {adc_data_sw[0][8]} {adc_data_sw[0][9]} {adc_data_sw[0][10]} {adc_data_sw[0][11]} {adc_data_sw[0][12]} {adc_data_sw[0][13]} {adc_data_sw[0][14]} {adc_data_sw[0][15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 16 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {adc_data_sw[2][0]} {adc_data_sw[2][1]} {adc_data_sw[2][2]} {adc_data_sw[2][3]} {adc_data_sw[2][4]} {adc_data_sw[2][5]} {adc_data_sw[2][6]} {adc_data_sw[2][7]} {adc_data_sw[2][8]} {adc_data_sw[2][9]} {adc_data_sw[2][10]} {adc_data_sw[2][11]} {adc_data_sw[2][12]} {adc_data_sw[2][13]} {adc_data_sw[2][14]} {adc_data_sw[2][15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 16 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {adc_data_sw[3][0]} {adc_data_sw[3][1]} {adc_data_sw[3][2]} {adc_data_sw[3][3]} {adc_data_sw[3][4]} {adc_data_sw[3][5]} {adc_data_sw[3][6]} {adc_data_sw[3][7]} {adc_data_sw[3][8]} {adc_data_sw[3][9]} {adc_data_sw[3][10]} {adc_data_sw[3][11]} {adc_data_sw[3][12]} {adc_data_sw[3][13]} {adc_data_sw[3][14]} {adc_data_sw[3][15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 16 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {rffe_switcher/fa_cnt[0]} {rffe_switcher/fa_cnt[1]} {rffe_switcher/fa_cnt[2]} {rffe_switcher/fa_cnt[3]} {rffe_switcher/fa_cnt[4]} {rffe_switcher/fa_cnt[5]} {rffe_switcher/fa_cnt[6]} {rffe_switcher/fa_cnt[7]} {rffe_switcher/fa_cnt[8]} {rffe_switcher/fa_cnt[9]} {rffe_switcher/fa_cnt[10]} {rffe_switcher/fa_cnt[11]} {rffe_switcher/fa_cnt[12]} {rffe_switcher/fa_cnt[13]} {rffe_switcher/fa_cnt[14]} {rffe_switcher/fa_cnt[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 16 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {rffe_switcher/fa_cnt_lat[0]} {rffe_switcher/fa_cnt_lat[1]} {rffe_switcher/fa_cnt_lat[2]} {rffe_switcher/fa_cnt_lat[3]} {rffe_switcher/fa_cnt_lat[4]} {rffe_switcher/fa_cnt_lat[5]} {rffe_switcher/fa_cnt_lat[6]} {rffe_switcher/fa_cnt_lat[7]} {rffe_switcher/fa_cnt_lat[8]} {rffe_switcher/fa_cnt_lat[9]} {rffe_switcher/fa_cnt_lat[10]} {rffe_switcher/fa_cnt_lat[11]} {rffe_switcher/fa_cnt_lat[12]} {rffe_switcher/fa_cnt_lat[13]} {rffe_switcher/fa_cnt_lat[14]} {rffe_switcher/fa_cnt_lat[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 16 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {rffe_switcher/sw_cnt[0]} {rffe_switcher/sw_cnt[1]} {rffe_switcher/sw_cnt[2]} {rffe_switcher/sw_cnt[3]} {rffe_switcher/sw_cnt[4]} {rffe_switcher/sw_cnt[5]} {rffe_switcher/sw_cnt[6]} {rffe_switcher/sw_cnt[7]} {rffe_switcher/sw_cnt[8]} {rffe_switcher/sw_cnt[9]} {rffe_switcher/sw_cnt[10]} {rffe_switcher/sw_cnt[11]} {rffe_switcher/sw_cnt[12]} {rffe_switcher/sw_cnt[13]} {rffe_switcher/sw_cnt[14]} {rffe_switcher/sw_cnt[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list rffe_switcher/fa_trig]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list rffe_switcher/fa_trig_dlyd]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list rffe_switcher/sw_rffe_demux]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list rffe_switcher/sw_rffe_i]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list rffe_switcher/sw_rffe_p]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list rffe_switcher/tbt_trig]]
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
connect_debug_port u_ila_1/clk [get_nets [list system_i/zynq_ultra_ps_e_0/U0/pl_clk0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 9 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {rffe_switcher/reg_o[demuxdly][0]} {rffe_switcher/reg_o[demuxdly][1]} {rffe_switcher/reg_o[demuxdly][2]} {rffe_switcher/reg_o[demuxdly][3]} {rffe_switcher/reg_o[demuxdly][4]} {rffe_switcher/reg_o[demuxdly][5]} {rffe_switcher/reg_o[demuxdly][6]} {rffe_switcher/reg_o[demuxdly][7]} {rffe_switcher/reg_o[demuxdly][8]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 2 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {rffe_switcher/reg_o[enb][0]} {rffe_switcher/reg_o[enb][1]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 16 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {rffe_switcher/reg_o[trigdly][0]} {rffe_switcher/reg_o[trigdly][1]} {rffe_switcher/reg_o[trigdly][2]} {rffe_switcher/reg_o[trigdly][3]} {rffe_switcher/reg_o[trigdly][4]} {rffe_switcher/reg_o[trigdly][5]} {rffe_switcher/reg_o[trigdly][6]} {rffe_switcher/reg_o[trigdly][7]} {rffe_switcher/reg_o[trigdly][8]} {rffe_switcher/reg_o[trigdly][9]} {rffe_switcher/reg_o[trigdly][10]} {rffe_switcher/reg_o[trigdly][11]} {rffe_switcher/reg_o[trigdly][12]} {rffe_switcher/reg_o[trigdly][13]} {rffe_switcher/reg_o[trigdly][14]} {rffe_switcher/reg_o[trigdly][15]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 1 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list {rffe_switcher/reg_o[adcdma_sel]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets dbg_OBUF[0]]
