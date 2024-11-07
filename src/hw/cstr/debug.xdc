

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
connect_debug_port u_ila_0/clk [get_nets [list evr/evr_rcvd_clk]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {evr/eventstream[0]} {evr/eventstream[1]} {evr/eventstream[2]} {evr/eventstream[3]} {evr/eventstream[4]} {evr/eventstream[5]} {evr/eventstream[6]} {evr/eventstream[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 16 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {evr/gth_rx_userdata[0]} {evr/gth_rx_userdata[1]} {evr/gth_rx_userdata[2]} {evr/gth_rx_userdata[3]} {evr/gth_rx_userdata[4]} {evr/gth_rx_userdata[5]} {evr/gth_rx_userdata[6]} {evr/gth_rx_userdata[7]} {evr/gth_rx_userdata[8]} {evr/gth_rx_userdata[9]} {evr/gth_rx_userdata[10]} {evr/gth_rx_userdata[11]} {evr/gth_rx_userdata[12]} {evr/gth_rx_userdata[13]} {evr/gth_rx_userdata[14]} {evr/gth_rx_userdata[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {evr/datastream[0]} {evr/datastream[1]} {evr/datastream[2]} {evr/datastream[3]} {evr/datastream[4]} {evr/datastream[5]} {evr/datastream[6]} {evr/datastream[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {evr/gth_rxctrl2[0]} {evr/gth_rxctrl2[1]} {evr/gth_rxctrl2[2]} {evr/gth_rxctrl2[3]} {evr/gth_rxctrl2[4]} {evr/gth_rxctrl2[5]} {evr/gth_rxctrl2[6]} {evr/gth_rxctrl2[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 4 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {evr/prev_datastream[0]} {evr/prev_datastream[1]} {evr/prev_datastream[2]} {evr/prev_datastream[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 64 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {evr/timestamp[0]} {evr/timestamp[1]} {evr/timestamp[2]} {evr/timestamp[3]} {evr/timestamp[4]} {evr/timestamp[5]} {evr/timestamp[6]} {evr/timestamp[7]} {evr/timestamp[8]} {evr/timestamp[9]} {evr/timestamp[10]} {evr/timestamp[11]} {evr/timestamp[12]} {evr/timestamp[13]} {evr/timestamp[14]} {evr/timestamp[15]} {evr/timestamp[16]} {evr/timestamp[17]} {evr/timestamp[18]} {evr/timestamp[19]} {evr/timestamp[20]} {evr/timestamp[21]} {evr/timestamp[22]} {evr/timestamp[23]} {evr/timestamp[24]} {evr/timestamp[25]} {evr/timestamp[26]} {evr/timestamp[27]} {evr/timestamp[28]} {evr/timestamp[29]} {evr/timestamp[30]} {evr/timestamp[31]} {evr/timestamp[32]} {evr/timestamp[33]} {evr/timestamp[34]} {evr/timestamp[35]} {evr/timestamp[36]} {evr/timestamp[37]} {evr/timestamp[38]} {evr/timestamp[39]} {evr/timestamp[40]} {evr/timestamp[41]} {evr/timestamp[42]} {evr/timestamp[43]} {evr/timestamp[44]} {evr/timestamp[45]} {evr/timestamp[46]} {evr/timestamp[47]} {evr/timestamp[48]} {evr/timestamp[49]} {evr/timestamp[50]} {evr/timestamp[51]} {evr/timestamp[52]} {evr/timestamp[53]} {evr/timestamp[54]} {evr/timestamp[55]} {evr/timestamp[56]} {evr/timestamp[57]} {evr/timestamp[58]} {evr/timestamp[59]} {evr/timestamp[60]} {evr/timestamp[61]} {evr/timestamp[62]} {evr/timestamp[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list trig/evr_trig]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list evr/tbt_trig]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list evr/tbt_trig_i]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list evr/usr_trig]]
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
set_property port_width 8 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {evr/dma_trigno[0]} {evr/dma_trigno[1]} {evr/dma_trigno[2]} {evr/dma_trigno[3]} {evr/dma_trigno[4]} {evr/dma_trigno[5]} {evr/dma_trigno[6]} {evr/dma_trigno[7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 32 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {trig/reg_o[tbt_len][0]} {trig/reg_o[tbt_len][1]} {trig/reg_o[tbt_len][2]} {trig/reg_o[tbt_len][3]} {trig/reg_o[tbt_len][4]} {trig/reg_o[tbt_len][5]} {trig/reg_o[tbt_len][6]} {trig/reg_o[tbt_len][7]} {trig/reg_o[tbt_len][8]} {trig/reg_o[tbt_len][9]} {trig/reg_o[tbt_len][10]} {trig/reg_o[tbt_len][11]} {trig/reg_o[tbt_len][12]} {trig/reg_o[tbt_len][13]} {trig/reg_o[tbt_len][14]} {trig/reg_o[tbt_len][15]} {trig/reg_o[tbt_len][16]} {trig/reg_o[tbt_len][17]} {trig/reg_o[tbt_len][18]} {trig/reg_o[tbt_len][19]} {trig/reg_o[tbt_len][20]} {trig/reg_o[tbt_len][21]} {trig/reg_o[tbt_len][22]} {trig/reg_o[tbt_len][23]} {trig/reg_o[tbt_len][24]} {trig/reg_o[tbt_len][25]} {trig/reg_o[tbt_len][26]} {trig/reg_o[tbt_len][27]} {trig/reg_o[tbt_len][28]} {trig/reg_o[tbt_len][29]} {trig/reg_o[tbt_len][30]} {trig/reg_o[tbt_len][31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 32 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {trig/reg_o[fa_len][0]} {trig/reg_o[fa_len][1]} {trig/reg_o[fa_len][2]} {trig/reg_o[fa_len][3]} {trig/reg_o[fa_len][4]} {trig/reg_o[fa_len][5]} {trig/reg_o[fa_len][6]} {trig/reg_o[fa_len][7]} {trig/reg_o[fa_len][8]} {trig/reg_o[fa_len][9]} {trig/reg_o[fa_len][10]} {trig/reg_o[fa_len][11]} {trig/reg_o[fa_len][12]} {trig/reg_o[fa_len][13]} {trig/reg_o[fa_len][14]} {trig/reg_o[fa_len][15]} {trig/reg_o[fa_len][16]} {trig/reg_o[fa_len][17]} {trig/reg_o[fa_len][18]} {trig/reg_o[fa_len][19]} {trig/reg_o[fa_len][20]} {trig/reg_o[fa_len][21]} {trig/reg_o[fa_len][22]} {trig/reg_o[fa_len][23]} {trig/reg_o[fa_len][24]} {trig/reg_o[fa_len][25]} {trig/reg_o[fa_len][26]} {trig/reg_o[fa_len][27]} {trig/reg_o[fa_len][28]} {trig/reg_o[fa_len][29]} {trig/reg_o[fa_len][30]} {trig/reg_o[fa_len][31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 32 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list {trig/reg_o[adc_len][0]} {trig/reg_o[adc_len][1]} {trig/reg_o[adc_len][2]} {trig/reg_o[adc_len][3]} {trig/reg_o[adc_len][4]} {trig/reg_o[adc_len][5]} {trig/reg_o[adc_len][6]} {trig/reg_o[adc_len][7]} {trig/reg_o[adc_len][8]} {trig/reg_o[adc_len][9]} {trig/reg_o[adc_len][10]} {trig/reg_o[adc_len][11]} {trig/reg_o[adc_len][12]} {trig/reg_o[adc_len][13]} {trig/reg_o[adc_len][14]} {trig/reg_o[adc_len][15]} {trig/reg_o[adc_len][16]} {trig/reg_o[adc_len][17]} {trig/reg_o[adc_len][18]} {trig/reg_o[adc_len][19]} {trig/reg_o[adc_len][20]} {trig/reg_o[adc_len][21]} {trig/reg_o[adc_len][22]} {trig/reg_o[adc_len][23]} {trig/reg_o[adc_len][24]} {trig/reg_o[adc_len][25]} {trig/reg_o[adc_len][26]} {trig/reg_o[adc_len][27]} {trig/reg_o[adc_len][28]} {trig/reg_o[adc_len][29]} {trig/reg_o[adc_len][30]} {trig/reg_o[adc_len][31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 1 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list evr/gth_cplllock]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 1 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list evr/gth_powergood]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe6]
set_property port_width 1 [get_debug_ports u_ila_1/probe6]
connect_debug_port u_ila_1/probe6 [get_nets [list evr/gth_reset_rx_done]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe7]
set_property port_width 1 [get_debug_ports u_ila_1/probe7]
connect_debug_port u_ila_1/probe7 [get_nets [list {trig/reg_o[adc_enb]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe8]
set_property port_width 1 [get_debug_ports u_ila_1/probe8]
connect_debug_port u_ila_1/probe8 [get_nets [list {trig/reg_o[fa_enb]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe9]
set_property port_width 1 [get_debug_ports u_ila_1/probe9]
connect_debug_port u_ila_1/probe9 [get_nets [list {trig/reg_o[fifo_rst]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe10]
set_property port_width 1 [get_debug_ports u_ila_1/probe10]
connect_debug_port u_ila_1/probe10 [get_nets [list {trig/reg_o[soft_trig]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe11]
set_property port_width 1 [get_debug_ports u_ila_1/probe11]
connect_debug_port u_ila_1/probe11 [get_nets [list {trig/reg_o[tbt_enb]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe12]
set_property port_width 1 [get_debug_ports u_ila_1/probe12]
connect_debug_port u_ila_1/probe12 [get_nets [list {trig/reg_o[trigsrc]}]]
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
connect_debug_port u_ila_2/clk [get_nets [list adc_inst/adc1_fco_pll/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe0]
set_property port_width 32 [get_debug_ports u_ila_2/probe0]
connect_debug_port u_ila_2/probe0 [get_nets [list {trig/trig_cnt[0]} {trig/trig_cnt[1]} {trig/trig_cnt[2]} {trig/trig_cnt[3]} {trig/trig_cnt[4]} {trig/trig_cnt[5]} {trig/trig_cnt[6]} {trig/trig_cnt[7]} {trig/trig_cnt[8]} {trig/trig_cnt[9]} {trig/trig_cnt[10]} {trig/trig_cnt[11]} {trig/trig_cnt[12]} {trig/trig_cnt[13]} {trig/trig_cnt[14]} {trig/trig_cnt[15]} {trig/trig_cnt[16]} {trig/trig_cnt[17]} {trig/trig_cnt[18]} {trig/trig_cnt[19]} {trig/trig_cnt[20]} {trig/trig_cnt[21]} {trig/trig_cnt[22]} {trig/trig_cnt[23]} {trig/trig_cnt[24]} {trig/trig_cnt[25]} {trig/trig_cnt[26]} {trig/trig_cnt[27]} {trig/trig_cnt[28]} {trig/trig_cnt[29]} {trig/trig_cnt[30]} {trig/trig_cnt[31]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe1]
set_property port_width 3 [get_debug_ports u_ila_2/probe1]
connect_debug_port u_ila_2/probe1 [get_nets [list {trig/soft_trig_sr[0]} {trig/soft_trig_sr[1]} {trig/soft_trig_sr[2]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe2]
set_property port_width 32 [get_debug_ports u_ila_2/probe2]
connect_debug_port u_ila_2/probe2 [get_nets [list {trig/reg_i[ts_ns][0]} {trig/reg_i[ts_ns][1]} {trig/reg_i[ts_ns][2]} {trig/reg_i[ts_ns][3]} {trig/reg_i[ts_ns][4]} {trig/reg_i[ts_ns][5]} {trig/reg_i[ts_ns][6]} {trig/reg_i[ts_ns][7]} {trig/reg_i[ts_ns][8]} {trig/reg_i[ts_ns][9]} {trig/reg_i[ts_ns][10]} {trig/reg_i[ts_ns][11]} {trig/reg_i[ts_ns][12]} {trig/reg_i[ts_ns][13]} {trig/reg_i[ts_ns][14]} {trig/reg_i[ts_ns][15]} {trig/reg_i[ts_ns][16]} {trig/reg_i[ts_ns][17]} {trig/reg_i[ts_ns][18]} {trig/reg_i[ts_ns][19]} {trig/reg_i[ts_ns][20]} {trig/reg_i[ts_ns][21]} {trig/reg_i[ts_ns][22]} {trig/reg_i[ts_ns][23]} {trig/reg_i[ts_ns][24]} {trig/reg_i[ts_ns][25]} {trig/reg_i[ts_ns][26]} {trig/reg_i[ts_ns][27]} {trig/reg_i[ts_ns][28]} {trig/reg_i[ts_ns][29]} {trig/reg_i[ts_ns][30]} {trig/reg_i[ts_ns][31]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe3]
set_property port_width 32 [get_debug_ports u_ila_2/probe3]
connect_debug_port u_ila_2/probe3 [get_nets [list {trig/reg_i[trig_cnt][0]} {trig/reg_i[trig_cnt][1]} {trig/reg_i[trig_cnt][2]} {trig/reg_i[trig_cnt][3]} {trig/reg_i[trig_cnt][4]} {trig/reg_i[trig_cnt][5]} {trig/reg_i[trig_cnt][6]} {trig/reg_i[trig_cnt][7]} {trig/reg_i[trig_cnt][8]} {trig/reg_i[trig_cnt][9]} {trig/reg_i[trig_cnt][10]} {trig/reg_i[trig_cnt][11]} {trig/reg_i[trig_cnt][12]} {trig/reg_i[trig_cnt][13]} {trig/reg_i[trig_cnt][14]} {trig/reg_i[trig_cnt][15]} {trig/reg_i[trig_cnt][16]} {trig/reg_i[trig_cnt][17]} {trig/reg_i[trig_cnt][18]} {trig/reg_i[trig_cnt][19]} {trig/reg_i[trig_cnt][20]} {trig/reg_i[trig_cnt][21]} {trig/reg_i[trig_cnt][22]} {trig/reg_i[trig_cnt][23]} {trig/reg_i[trig_cnt][24]} {trig/reg_i[trig_cnt][25]} {trig/reg_i[trig_cnt][26]} {trig/reg_i[trig_cnt][27]} {trig/reg_i[trig_cnt][28]} {trig/reg_i[trig_cnt][29]} {trig/reg_i[trig_cnt][30]} {trig/reg_i[trig_cnt][31]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe4]
set_property port_width 32 [get_debug_ports u_ila_2/probe4]
connect_debug_port u_ila_2/probe4 [get_nets [list {trig/reg_i[ts_s][0]} {trig/reg_i[ts_s][1]} {trig/reg_i[ts_s][2]} {trig/reg_i[ts_s][3]} {trig/reg_i[ts_s][4]} {trig/reg_i[ts_s][5]} {trig/reg_i[ts_s][6]} {trig/reg_i[ts_s][7]} {trig/reg_i[ts_s][8]} {trig/reg_i[ts_s][9]} {trig/reg_i[ts_s][10]} {trig/reg_i[ts_s][11]} {trig/reg_i[ts_s][12]} {trig/reg_i[ts_s][13]} {trig/reg_i[ts_s][14]} {trig/reg_i[ts_s][15]} {trig/reg_i[ts_s][16]} {trig/reg_i[ts_s][17]} {trig/reg_i[ts_s][18]} {trig/reg_i[ts_s][19]} {trig/reg_i[ts_s][20]} {trig/reg_i[ts_s][21]} {trig/reg_i[ts_s][22]} {trig/reg_i[ts_s][23]} {trig/reg_i[ts_s][24]} {trig/reg_i[ts_s][25]} {trig/reg_i[ts_s][26]} {trig/reg_i[ts_s][27]} {trig/reg_i[ts_s][28]} {trig/reg_i[ts_s][29]} {trig/reg_i[ts_s][30]} {trig/reg_i[ts_s][31]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe5]
set_property port_width 1 [get_debug_ports u_ila_2/probe5]
connect_debug_port u_ila_2/probe5 [get_nets [list {trig/reg_i[status][1]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe6]
set_property port_width 1 [get_debug_ports u_ila_2/probe6]
connect_debug_port u_ila_2/probe6 [get_nets [list trig/dma_active]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe7]
set_property port_width 1 [get_debug_ports u_ila_2/probe7]
connect_debug_port u_ila_2/probe7 [get_nets [list trig/dma_adc_active]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe8]
set_property port_width 1 [get_debug_ports u_ila_2/probe8]
connect_debug_port u_ila_2/probe8 [get_nets [list trig/dma_done]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe9]
set_property port_width 1 [get_debug_ports u_ila_2/probe9]
connect_debug_port u_ila_2/probe9 [get_nets [list trig/dma_fa_active]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe10]
set_property port_width 1 [get_debug_ports u_ila_2/probe10]
connect_debug_port u_ila_2/probe10 [get_nets [list trig/dma_running]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe11]
set_property port_width 1 [get_debug_ports u_ila_2/probe11]
connect_debug_port u_ila_2/probe11 [get_nets [list trig/dma_tbt_active]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe12]
set_property port_width 1 [get_debug_ports u_ila_2/probe12]
connect_debug_port u_ila_2/probe12 [get_nets [list trig/dma_trig]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe13]
set_property port_width 1 [get_debug_ports u_ila_2/probe13]
connect_debug_port u_ila_2/probe13 [get_nets [list trig/dma_trig_lat]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe14]
set_property port_width 1 [get_debug_ports u_ila_2/probe14]
connect_debug_port u_ila_2/probe14 [get_nets [list trig/evr_trig_s]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe15]
set_property port_width 1 [get_debug_ports u_ila_2/probe15]
connect_debug_port u_ila_2/probe15 [get_nets [list trig/soft_trig_s]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets dbg_OBUF[5]]
