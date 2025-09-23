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
connect_debug_port u_ila_0/probe0 [get_nets [list {evr/cnt[0]} {evr/cnt[1]} {evr/cnt[2]} {evr/cnt[3]} {evr/cnt[4]} {evr/cnt[5]} {evr/cnt[6]} {evr/cnt[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {evr/gth_rxctrl2[0]} {evr/gth_rxctrl2[1]} {evr/gth_rxctrl2[2]} {evr/gth_rxctrl2[3]} {evr/gth_rxctrl2[4]} {evr/gth_rxctrl2[5]} {evr/gth_rxctrl2[6]} {evr/gth_rxctrl2[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 16 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {evr/gth_rx_userdata[0]} {evr/gth_rx_userdata[1]} {evr/gth_rx_userdata[2]} {evr/gth_rx_userdata[3]} {evr/gth_rx_userdata[4]} {evr/gth_rx_userdata[5]} {evr/gth_rx_userdata[6]} {evr/gth_rx_userdata[7]} {evr/gth_rx_userdata[8]} {evr/gth_rx_userdata[9]} {evr/gth_rx_userdata[10]} {evr/gth_rx_userdata[11]} {evr/gth_rx_userdata[12]} {evr/gth_rx_userdata[13]} {evr/gth_rx_userdata[14]} {evr/gth_rx_userdata[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {evr/eventstream[0]} {evr/eventstream[1]} {evr/eventstream[2]} {evr/eventstream[3]} {evr/eventstream[4]} {evr/eventstream[5]} {evr/eventstream[6]} {evr/eventstream[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 64 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {evr/timestamp[0]} {evr/timestamp[1]} {evr/timestamp[2]} {evr/timestamp[3]} {evr/timestamp[4]} {evr/timestamp[5]} {evr/timestamp[6]} {evr/timestamp[7]} {evr/timestamp[8]} {evr/timestamp[9]} {evr/timestamp[10]} {evr/timestamp[11]} {evr/timestamp[12]} {evr/timestamp[13]} {evr/timestamp[14]} {evr/timestamp[15]} {evr/timestamp[16]} {evr/timestamp[17]} {evr/timestamp[18]} {evr/timestamp[19]} {evr/timestamp[20]} {evr/timestamp[21]} {evr/timestamp[22]} {evr/timestamp[23]} {evr/timestamp[24]} {evr/timestamp[25]} {evr/timestamp[26]} {evr/timestamp[27]} {evr/timestamp[28]} {evr/timestamp[29]} {evr/timestamp[30]} {evr/timestamp[31]} {evr/timestamp[32]} {evr/timestamp[33]} {evr/timestamp[34]} {evr/timestamp[35]} {evr/timestamp[36]} {evr/timestamp[37]} {evr/timestamp[38]} {evr/timestamp[39]} {evr/timestamp[40]} {evr/timestamp[41]} {evr/timestamp[42]} {evr/timestamp[43]} {evr/timestamp[44]} {evr/timestamp[45]} {evr/timestamp[46]} {evr/timestamp[47]} {evr/timestamp[48]} {evr/timestamp[49]} {evr/timestamp[50]} {evr/timestamp[51]} {evr/timestamp[52]} {evr/timestamp[53]} {evr/timestamp[54]} {evr/timestamp[55]} {evr/timestamp[56]} {evr/timestamp[57]} {evr/timestamp[58]} {evr/timestamp[59]} {evr/timestamp[60]} {evr/timestamp[61]} {evr/timestamp[62]} {evr/timestamp[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 4 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {evr/prev_datastream[0]} {evr/prev_datastream[1]} {evr/prev_datastream[2]} {evr/prev_datastream[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 5 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {evr/evr_syn.ts/Position[0]} {evr/evr_syn.ts/Position[1]} {evr/evr_syn.ts/Position[2]} {evr/evr_syn.ts/Position[3]} {evr/evr_syn.ts/Position[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 32 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {evr/evr_syn.ts/Seconds[0]} {evr/evr_syn.ts/Seconds[1]} {evr/evr_syn.ts/Seconds[2]} {evr/evr_syn.ts/Seconds[3]} {evr/evr_syn.ts/Seconds[4]} {evr/evr_syn.ts/Seconds[5]} {evr/evr_syn.ts/Seconds[6]} {evr/evr_syn.ts/Seconds[7]} {evr/evr_syn.ts/Seconds[8]} {evr/evr_syn.ts/Seconds[9]} {evr/evr_syn.ts/Seconds[10]} {evr/evr_syn.ts/Seconds[11]} {evr/evr_syn.ts/Seconds[12]} {evr/evr_syn.ts/Seconds[13]} {evr/evr_syn.ts/Seconds[14]} {evr/evr_syn.ts/Seconds[15]} {evr/evr_syn.ts/Seconds[16]} {evr/evr_syn.ts/Seconds[17]} {evr/evr_syn.ts/Seconds[18]} {evr/evr_syn.ts/Seconds[19]} {evr/evr_syn.ts/Seconds[20]} {evr/evr_syn.ts/Seconds[21]} {evr/evr_syn.ts/Seconds[22]} {evr/evr_syn.ts/Seconds[23]} {evr/evr_syn.ts/Seconds[24]} {evr/evr_syn.ts/Seconds[25]} {evr/evr_syn.ts/Seconds[26]} {evr/evr_syn.ts/Seconds[27]} {evr/evr_syn.ts/Seconds[28]} {evr/evr_syn.ts/Seconds[29]} {evr/evr_syn.ts/Seconds[30]} {evr/evr_syn.ts/Seconds[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 32 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {evr/evr_syn.ts/offsetReg[0]} {evr/evr_syn.ts/offsetReg[1]} {evr/evr_syn.ts/offsetReg[2]} {evr/evr_syn.ts/offsetReg[3]} {evr/evr_syn.ts/offsetReg[4]} {evr/evr_syn.ts/offsetReg[5]} {evr/evr_syn.ts/offsetReg[6]} {evr/evr_syn.ts/offsetReg[7]} {evr/evr_syn.ts/offsetReg[8]} {evr/evr_syn.ts/offsetReg[9]} {evr/evr_syn.ts/offsetReg[10]} {evr/evr_syn.ts/offsetReg[11]} {evr/evr_syn.ts/offsetReg[12]} {evr/evr_syn.ts/offsetReg[13]} {evr/evr_syn.ts/offsetReg[14]} {evr/evr_syn.ts/offsetReg[15]} {evr/evr_syn.ts/offsetReg[16]} {evr/evr_syn.ts/offsetReg[17]} {evr/evr_syn.ts/offsetReg[18]} {evr/evr_syn.ts/offsetReg[19]} {evr/evr_syn.ts/offsetReg[20]} {evr/evr_syn.ts/offsetReg[21]} {evr/evr_syn.ts/offsetReg[22]} {evr/evr_syn.ts/offsetReg[23]} {evr/evr_syn.ts/offsetReg[24]} {evr/evr_syn.ts/offsetReg[25]} {evr/evr_syn.ts/offsetReg[26]} {evr/evr_syn.ts/offsetReg[27]} {evr/evr_syn.ts/offsetReg[28]} {evr/evr_syn.ts/offsetReg[29]} {evr/evr_syn.ts/offsetReg[30]} {evr/evr_syn.ts/offsetReg[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 5 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {evr/evr_syn.ts/pos[0]} {evr/evr_syn.ts/pos[1]} {evr/evr_syn.ts/pos[2]} {evr/evr_syn.ts/pos[3]} {evr/evr_syn.ts/pos[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 32 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {evr/evr_syn.ts/secondsReg[0]} {evr/evr_syn.ts/secondsReg[1]} {evr/evr_syn.ts/secondsReg[2]} {evr/evr_syn.ts/secondsReg[3]} {evr/evr_syn.ts/secondsReg[4]} {evr/evr_syn.ts/secondsReg[5]} {evr/evr_syn.ts/secondsReg[6]} {evr/evr_syn.ts/secondsReg[7]} {evr/evr_syn.ts/secondsReg[8]} {evr/evr_syn.ts/secondsReg[9]} {evr/evr_syn.ts/secondsReg[10]} {evr/evr_syn.ts/secondsReg[11]} {evr/evr_syn.ts/secondsReg[12]} {evr/evr_syn.ts/secondsReg[13]} {evr/evr_syn.ts/secondsReg[14]} {evr/evr_syn.ts/secondsReg[15]} {evr/evr_syn.ts/secondsReg[16]} {evr/evr_syn.ts/secondsReg[17]} {evr/evr_syn.ts/secondsReg[18]} {evr/evr_syn.ts/secondsReg[19]} {evr/evr_syn.ts/secondsReg[20]} {evr/evr_syn.ts/secondsReg[21]} {evr/evr_syn.ts/secondsReg[22]} {evr/evr_syn.ts/secondsReg[23]} {evr/evr_syn.ts/secondsReg[24]} {evr/evr_syn.ts/secondsReg[25]} {evr/evr_syn.ts/secondsReg[26]} {evr/evr_syn.ts/secondsReg[27]} {evr/evr_syn.ts/secondsReg[28]} {evr/evr_syn.ts/secondsReg[29]} {evr/evr_syn.ts/secondsReg[30]} {evr/evr_syn.ts/secondsReg[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 32 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {evr/evr_syn.ts/seconds_tmp[0]} {evr/evr_syn.ts/seconds_tmp[1]} {evr/evr_syn.ts/seconds_tmp[2]} {evr/evr_syn.ts/seconds_tmp[3]} {evr/evr_syn.ts/seconds_tmp[4]} {evr/evr_syn.ts/seconds_tmp[5]} {evr/evr_syn.ts/seconds_tmp[6]} {evr/evr_syn.ts/seconds_tmp[7]} {evr/evr_syn.ts/seconds_tmp[8]} {evr/evr_syn.ts/seconds_tmp[9]} {evr/evr_syn.ts/seconds_tmp[10]} {evr/evr_syn.ts/seconds_tmp[11]} {evr/evr_syn.ts/seconds_tmp[12]} {evr/evr_syn.ts/seconds_tmp[13]} {evr/evr_syn.ts/seconds_tmp[14]} {evr/evr_syn.ts/seconds_tmp[15]} {evr/evr_syn.ts/seconds_tmp[16]} {evr/evr_syn.ts/seconds_tmp[17]} {evr/evr_syn.ts/seconds_tmp[18]} {evr/evr_syn.ts/seconds_tmp[19]} {evr/evr_syn.ts/seconds_tmp[20]} {evr/evr_syn.ts/seconds_tmp[21]} {evr/evr_syn.ts/seconds_tmp[22]} {evr/evr_syn.ts/seconds_tmp[23]} {evr/evr_syn.ts/seconds_tmp[24]} {evr/evr_syn.ts/seconds_tmp[25]} {evr/evr_syn.ts/seconds_tmp[26]} {evr/evr_syn.ts/seconds_tmp[27]} {evr/evr_syn.ts/seconds_tmp[28]} {evr/evr_syn.ts/seconds_tmp[29]} {evr/evr_syn.ts/seconds_tmp[30]} {evr/evr_syn.ts/seconds_tmp[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 8 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {evr/evr_syn.ts/EventStream[0]} {evr/evr_syn.ts/EventStream[1]} {evr/evr_syn.ts/EventStream[2]} {evr/evr_syn.ts/EventStream[3]} {evr/evr_syn.ts/EventStream[4]} {evr/evr_syn.ts/EventStream[5]} {evr/evr_syn.ts/EventStream[6]} {evr/evr_syn.ts/EventStream[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 32 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {evr/evr_syn.ts/Offset[0]} {evr/evr_syn.ts/Offset[1]} {evr/evr_syn.ts/Offset[2]} {evr/evr_syn.ts/Offset[3]} {evr/evr_syn.ts/Offset[4]} {evr/evr_syn.ts/Offset[5]} {evr/evr_syn.ts/Offset[6]} {evr/evr_syn.ts/Offset[7]} {evr/evr_syn.ts/Offset[8]} {evr/evr_syn.ts/Offset[9]} {evr/evr_syn.ts/Offset[10]} {evr/evr_syn.ts/Offset[11]} {evr/evr_syn.ts/Offset[12]} {evr/evr_syn.ts/Offset[13]} {evr/evr_syn.ts/Offset[14]} {evr/evr_syn.ts/Offset[15]} {evr/evr_syn.ts/Offset[16]} {evr/evr_syn.ts/Offset[17]} {evr/evr_syn.ts/Offset[18]} {evr/evr_syn.ts/Offset[19]} {evr/evr_syn.ts/Offset[20]} {evr/evr_syn.ts/Offset[21]} {evr/evr_syn.ts/Offset[22]} {evr/evr_syn.ts/Offset[23]} {evr/evr_syn.ts/Offset[24]} {evr/evr_syn.ts/Offset[25]} {evr/evr_syn.ts/Offset[26]} {evr/evr_syn.ts/Offset[27]} {evr/evr_syn.ts/Offset[28]} {evr/evr_syn.ts/Offset[29]} {evr/evr_syn.ts/Offset[30]} {evr/evr_syn.ts/Offset[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list evr/evr_syn.ts/clear]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list evr/evr_syn.ts/clear_reg__0]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list evr/gth_reset_rx_done]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list evr/tbt_trig]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list evr/tbt_trig_i]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list evr/trigactive]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list evr/usr_trig]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets fp_out_OBUF[3]]
