
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library desyrdl;
use desyrdl.common.all;
use desyrdl.pkg_pl_regs.all;

library xil_defaultlib;
use xil_defaultlib.bpm_package.ALL;


entity top is
generic(
    FPGA_VERSION			: integer := 9;
    SIM_MODE				: integer := 0
    );
  port (  
    -- 2 dual adc I/O for LTC2195
    adc_csb                : out std_logic_vector(1 downto 0);
    adc_sdi                : out std_logic_vector(1 downto 0);
    adc_sdo                : in std_logic_vector(1 downto 0);
    adc_sclk               : out std_logic_vector(1 downto 0);   
    adc_fco_p              : in std_logic_vector(1 downto 0);
    adc_fco_n              : in std_logic_vector(1 downto 0); 
    adc_dco_p              : in std_logic_vector(1 downto 0);
    adc_dco_n              : in std_logic_vector(1 downto 0);   
    adc_sdata_p            : in std_logic_vector(15 downto 0);
    adc_sdata_n            : in std_logic_vector(15 downto 0);    

    -- adc clock input (from AD9510)
    adc_clk_p               : in std_logic;
    adc_clk_n               : in std_logic;
    
    -- tbt clock input
    tbt_clk_p               : in std_logic;
    tbt_clk_n               : in std_logic;
    
    -- adc clock synthesizer (AD9510)
    ad9510_sclk             : out std_logic;
    ad9510_sdata            : out std_logic;
    ad9510_lat              : out std_logic;
    ad9510_func             : out std_logic;
    ad9510_status           : in std_logic;
    ad9510_sdo              : in std_logic;   
    
   -- rf digital attenuator
    dsa_clk                 : out std_logic;
    dsa_sdata               : out std_logic;
    dsa_latch               : out std_logic;   
    
   -- Thermistor Readback (LT2986)
    therm_sclk              : out std_logic;
    therm_sdo               : in std_logic;
    therm_sdi               : out std_logic;
    therm_csn               : out std_logic_vector(2 downto 0);
    therm_rstn              : out std_logic;   
    
   -- heat pump controller daughterboard DAC's (AD5754)
    heatdac_syncn           : out std_logic_vector(1 downto 0);
    heatdac_sclk            : out std_logic_vector(1 downto 0);  
    heatdac_sdin            : out std_logic_vector(1 downto 0);
    heatdac_sdo             : in std_logic_vector(1 downto 0); 
    heatdac_ldacn           : out std_logic_vector(1 downto 0);
    
    heatdac_clrn            : out std_logic;  
    heatdac_bin2s           : out std_logic;             
         

	-- afe power management
	afe_pwrenb              : out std_logic;
	afe_pwrflt              : in std_logic;

    --evr transceiver
    --gth_evr_refclk_p        : in std_logic;
    --gth_evr_refclk_n        : in std_logic;
    --gth_evr_tx_p            : out std_logic;
    --gth_evr_tx_n            : out std_logic;
    --gth_evr_rx_p            : in std_logic;
    --gth_evr_rx_n            : in std_logic;   
    
    -- afe switch signals
	afe_sw_rffe_p           : out std_logic;
	afe_sw_rffe_n           : out std_logic; 
    
    sfp_led                 : out std_logic_vector(11 downto 0);
    sfp_rxlos               : in std_logic_vector(5 downto 0);
    
    fp_in                   : in std_logic_vector(3 downto 0);
    fp_out                  : out std_logic_vector(3 downto 0);
    fp_led                  : out std_logic_vector(7 downto 0);
    dbg                     : out std_logic_vector(19 downto 0) 

  );
end top;


architecture behv of top is

  
  signal pl_clk0      : std_logic;
  signal adc_clk      : std_logic;
  signal pl_resetn    : std_logic;
  signal pl_reset     : std_logic;
  
  signal m_axi4_m2s   : t_pl_regs_m2s;
  signal m_axi4_s2m   : t_pl_regs_s2m;
 
  signal adc_clk_in   : std_logic;
  signal adc_data     : t_adc_raw; 
  signal adc_dbg      : std_logic_vector(3 downto 0);
  
  signal adc_spi_we      : std_logic;
  signal adc_spi_wdata   : std_logic_vector(31 downto 0);
  signal adc_spi_rdata   : std_logic_vector(31 downto 0);
  signal adc_idly_wrval  : std_logic_vector(8 downto 0);
  signal adc_idly_wrstr  : std_logic_vector(15 downto 0);
  signal adc_idly_rdval  : std_logic_vector(8 downto 0);       
  signal adc_fco_dlystr  : std_logic_vector(1 downto 0);    
  
  signal ad9510_we		 : std_logic;
  signal ad9510_data     : std_logic_vector(31 downto 0);  
  
  signal dsa_we		     : std_logic;
  signal dsa_data        : std_logic_vector(7 downto 0);    




  attribute mark_debug     : string;
  --attribute mark_debug of reg_o: signal is "true";
  attribute mark_debug of dsa_clk: signal is "true";
  attribute mark_debug of dsa_sdata: signal is "true";
  attribute mark_debug of dsa_latch: signal is "true";  
 

begin

afe_pwrenb <= '1';



dbg(0) <= pl_clk0;
dbg(1) <= '0'; --adc_fco_dlystr(0); --'0';
dbg(2) <= adc_dbg(1);  --psdone 
dbg(3) <= '0';
dbg(4) <= adc_dbg(2); -- adc_fco_bufg 
dbg(5) <= adc_dbg(3); --adc_fco_mmcm 
dbg(6) <= '0'; --gth_refclk_buf; --'0';
dbg(7) <= '0'; --gth_txusr_clk;
dbg(8) <= '0'; --gth_rxusr_clk;
dbg(9) <= '0';
dbg(10) <= '0';
dbg(11) <= '0';
dbg(12) <= '0'; --tbt_trig; 
dbg(13) <= '0'; --fa_trig;
dbg(14) <= '0'; --sa_trig;
dbg(15) <= '0'; --tbt_extclk; --'0';
dbg(16) <= fp_in(0);
dbg(17) <= fp_in(1);
dbg(18) <= fp_in(2);
dbg(19) <= fp_in(3);


fp_out(0) <= pl_clk0;
fp_out(1) <= adc_clk_in;
fp_out(2) <= adc_clk; --'0'; --tbt_trig;
fp_out(3) <= '0'; --sa_trig;


adc_clk_inst  : IBUFDS  port map (O => adc_clk_in, I => adc_clk_p, IB => adc_clk_n); 


pl_reset <= not pl_resetn;




---- reads in ADC data
adc_inst: entity work.adc_ltc2195
  generic map (
    SIM_MODE => SIM_MODE
  )
  port map(
    sys_clk => pl_clk0,
    sys_rst => pl_reset,  
    adc_spi_we => adc_spi_we,  
    adc_spi_wdata => adc_spi_wdata, 
    adc_spi_rdata => adc_spi_rdata,     
    adc_idly_wrval => adc_idly_wrval,   
    adc_idly_wrstr => adc_idly_wrstr,  
    adc_idly_rdval => open, 
    adc_fco_dlystr => adc_fco_dlystr,                       
    adc_csb => adc_csb,
    adc_sdi => adc_sdi,
    adc_sdo => adc_sdo,
    adc_sclk => adc_sclk,     
    adc_fco_p => adc_fco_p, 
    adc_fco_n => adc_fco_n, 
    adc_dco_p => adc_dco_p, 
    adc_dco_n => adc_dco_n,    
    adc_sdata_p => adc_sdata_p, 
    adc_sdata_n => adc_sdata_n,   
    adc_clk_out => adc_clk,
    adc_data => adc_data,
    dbg => adc_dbg
    );     


--AD9510 PLL: generates adc_clk
pll_spi: entity work.spi_ad9510 
  port map(
    clk => pl_clk0,
    reset => pl_reset,  
    we => ad9510_we, 
	data => ad9510_data,  
    sclk => ad9510_sclk, 
	sdo	=> ad9510_sdo, 		
    sdi => ad9510_sdata,
    csb => ad9510_lat, 
    func => ad9510_func
  );  


--programmable attenuator for rf chain  
atten_pt: entity work.spi_pe43701 
  port map(
    clk => pl_clk0,                  
    reset => pl_reset,                         
    strobe => dsa_we,
	wrdata => dsa_data,
    sclk => dsa_clk,                         
    sdi => dsa_sdata, 
    csb => dsa_latch,                         
    debug => open
  );    



ps_pl: entity work.ps_io
  port map (
    pl_clock => pl_clk0, 
    pl_reset => not pl_resetn, 
    m_axi4_m2s => m_axi4_m2s, 
    m_axi4_s2m => m_axi4_s2m, 
    fp_leds => fp_led,
    adc_spi_we => adc_spi_we,
    adc_data => adc_data,
    adc_spi_wdata => adc_spi_wdata, 
    adc_spi_rdata => adc_spi_rdata, 
    adc_idly_wrval => adc_idly_wrval, 
    adc_idly_wrstr => adc_idly_wrstr, 
    adc_idly_rdval => adc_idly_rdval,       
    adc_fco_dlystr => adc_fco_dlystr,
    ad9510_we => ad9510_we,
    ad9510_data => ad9510_data,
    dsa_we => dsa_we,
    dsa_data => dsa_data       
   
  );




system_i: component system
  port map (
    pl_clk0 => pl_clk0,
    pl_resetn => pl_resetn,
     
    m_axi_araddr => m_axi4_m2s.araddr, 
    m_axi_arprot => m_axi4_m2s.arprot,
    m_axi_arready => m_axi4_s2m.arready,
    m_axi_arvalid => m_axi4_m2s.arvalid,
    m_axi_awaddr => m_axi4_m2s.awaddr,
    m_axi_awprot => m_axi4_m2s.awprot,
    m_axi_awready => m_axi4_s2m.awready,
    m_axi_awvalid => m_axi4_m2s.awvalid,
    m_axi_bready => m_axi4_m2s.bready,
    m_axi_bresp => m_axi4_s2m.bresp,
    m_axi_bvalid => m_axi4_s2m.bvalid,
    m_axi_rdata => m_axi4_s2m.rdata,
    m_axi_rready => m_axi4_m2s.rready,
    m_axi_rresp => m_axi4_s2m.rresp,
    m_axi_rvalid => m_axi4_s2m.rvalid,
    m_axi_wdata => m_axi4_m2s.wdata,
    m_axi_wready => m_axi4_s2m.wready,
    m_axi_wstrb => m_axi4_m2s.wstrb,
    m_axi_wvalid => m_axi4_m2s.wvalid
    );





end behv;
