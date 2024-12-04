

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
set_property port_width 3 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {therm_rdbk/csn[0]} {therm_rdbk/csn[1]} {therm_rdbk/csn[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 2 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {therm_rdbk/reg_o[sel][0]} {therm_rdbk/reg_o[sel][1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {therm_rdbk/reg_i[spi_rdata][0]} {therm_rdbk/reg_i[spi_rdata][1]} {therm_rdbk/reg_i[spi_rdata][2]} {therm_rdbk/reg_i[spi_rdata][3]} {therm_rdbk/reg_i[spi_rdata][4]} {therm_rdbk/reg_i[spi_rdata][5]} {therm_rdbk/reg_i[spi_rdata][6]} {therm_rdbk/reg_i[spi_rdata][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 32 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {therm_rdbk/reg_o[spi_wdata][0]} {therm_rdbk/reg_o[spi_wdata][1]} {therm_rdbk/reg_o[spi_wdata][2]} {therm_rdbk/reg_o[spi_wdata][3]} {therm_rdbk/reg_o[spi_wdata][4]} {therm_rdbk/reg_o[spi_wdata][5]} {therm_rdbk/reg_o[spi_wdata][6]} {therm_rdbk/reg_o[spi_wdata][7]} {therm_rdbk/reg_o[spi_wdata][8]} {therm_rdbk/reg_o[spi_wdata][9]} {therm_rdbk/reg_o[spi_wdata][10]} {therm_rdbk/reg_o[spi_wdata][11]} {therm_rdbk/reg_o[spi_wdata][12]} {therm_rdbk/reg_o[spi_wdata][13]} {therm_rdbk/reg_o[spi_wdata][14]} {therm_rdbk/reg_o[spi_wdata][15]} {therm_rdbk/reg_o[spi_wdata][16]} {therm_rdbk/reg_o[spi_wdata][17]} {therm_rdbk/reg_o[spi_wdata][18]} {therm_rdbk/reg_o[spi_wdata][19]} {therm_rdbk/reg_o[spi_wdata][20]} {therm_rdbk/reg_o[spi_wdata][21]} {therm_rdbk/reg_o[spi_wdata][22]} {therm_rdbk/reg_o[spi_wdata][23]} {therm_rdbk/reg_o[spi_wdata][24]} {therm_rdbk/reg_o[spi_wdata][25]} {therm_rdbk/reg_o[spi_wdata][26]} {therm_rdbk/reg_o[spi_wdata][27]} {therm_rdbk/reg_o[spi_wdata][28]} {therm_rdbk/reg_o[spi_wdata][29]} {therm_rdbk/reg_o[spi_wdata][30]} {therm_rdbk/reg_o[spi_wdata][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 2 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {therm_rdbk/state[0]} {therm_rdbk/state[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list therm_rdbk/csn_i]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {therm_rdbk/reg_o[spi_we]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list therm_rdbk/sck]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list therm_rdbk/sdi]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list therm_rdbk/sdo]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list therm_rdbk/sys_clk]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list therm_rdbk/we_lat]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets dbg_OBUF[0]]
