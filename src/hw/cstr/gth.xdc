


## SI5347 OUT6  150MHz FMC_HPC0_GBTCLK_0  (MGT_229_REFCLK_0)
set_property PACKAGE_PIN R28 [get_ports gth_evr_refclk_n]
set_property PACKAGE_PIN R27 [get_ports gth_evr_refclk_p]
create_clock -period 3.200 -name clk_gth_evr_refclk_0 [get_ports gth_evr_refclk_p]



## SFP0
#set_property LOC GTHE4_CHANNEL_X0Y4 [get_cells evr/evr_syn.gth/inst/gen_gtwizard_gthe4_top.gth_wiz_gtwizard_gthe4_inst/gen_gtwizard_gthe4.gen_channel_container[1].gen_enabled_channel.gthe4_channel_wrapper_inst/channel_inst/gthe4_channel_gen.gen_gthe4_channel_inst[0].GTHE4_CHANNEL_PRIM_INST]

