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
connect_debug_port u_ila_0/probe0 [get_nets [list {evr/gth_rxctrl2[0]} {evr/gth_rxctrl2[1]} {evr/gth_rxctrl2[2]} {evr/gth_rxctrl2[3]} {evr/gth_rxctrl2[4]} {evr/gth_rxctrl2[5]} {evr/gth_rxctrl2[6]} {evr/gth_rxctrl2[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {evr/eventstream[0]} {evr/eventstream[1]} {evr/eventstream[2]} {evr/eventstream[3]} {evr/eventstream[4]} {evr/eventstream[5]} {evr/eventstream[6]} {evr/eventstream[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 4 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {evr/prev_datastream[0]} {evr/prev_datastream[1]} {evr/prev_datastream[2]} {evr/prev_datastream[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {evr/cnt[0]} {evr/cnt[1]} {evr/cnt[2]} {evr/cnt[3]} {evr/cnt[4]} {evr/cnt[5]} {evr/cnt[6]} {evr/cnt[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 64 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {evr/timestamp[0]} {evr/timestamp[1]} {evr/timestamp[2]} {evr/timestamp[3]} {evr/timestamp[4]} {evr/timestamp[5]} {evr/timestamp[6]} {evr/timestamp[7]} {evr/timestamp[8]} {evr/timestamp[9]} {evr/timestamp[10]} {evr/timestamp[11]} {evr/timestamp[12]} {evr/timestamp[13]} {evr/timestamp[14]} {evr/timestamp[15]} {evr/timestamp[16]} {evr/timestamp[17]} {evr/timestamp[18]} {evr/timestamp[19]} {evr/timestamp[20]} {evr/timestamp[21]} {evr/timestamp[22]} {evr/timestamp[23]} {evr/timestamp[24]} {evr/timestamp[25]} {evr/timestamp[26]} {evr/timestamp[27]} {evr/timestamp[28]} {evr/timestamp[29]} {evr/timestamp[30]} {evr/timestamp[31]} {evr/timestamp[32]} {evr/timestamp[33]} {evr/timestamp[34]} {evr/timestamp[35]} {evr/timestamp[36]} {evr/timestamp[37]} {evr/timestamp[38]} {evr/timestamp[39]} {evr/timestamp[40]} {evr/timestamp[41]} {evr/timestamp[42]} {evr/timestamp[43]} {evr/timestamp[44]} {evr/timestamp[45]} {evr/timestamp[46]} {evr/timestamp[47]} {evr/timestamp[48]} {evr/timestamp[49]} {evr/timestamp[50]} {evr/timestamp[51]} {evr/timestamp[52]} {evr/timestamp[53]} {evr/timestamp[54]} {evr/timestamp[55]} {evr/timestamp[56]} {evr/timestamp[57]} {evr/timestamp[58]} {evr/timestamp[59]} {evr/timestamp[60]} {evr/timestamp[61]} {evr/timestamp[62]} {evr/timestamp[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list evr/gth_reset_rx_done]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list evr/tbt_trig]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list evr/tbt_trig_i]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list evr/trigactive]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list evr/usr_trig]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets fp_out_OBUF[3]]
