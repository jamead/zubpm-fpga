
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library desyrdl;
use desyrdl.common.all;
use desyrdl.pkg_pl_regs.all;

library xil_defaultlib;
use xil_defaultlib.bpm_package.ALL;

library work;
use work.bpm_package.ALL;


entity ps_io is
  port (  
     pl_clock         : in std_logic;
     pl_reset         : in std_logic;
   
     m_axi4_m2s       : in t_pl_regs_m2s;
     m_axi4_s2m       : out t_pl_regs_s2m;   
     
     adc_data        : in t_adc_raw;
     
	 reg_o_dsa       : out t_reg_o_dsa;
	 reg_o_pll       : out t_reg_o_pll;
	 tbt_params      : out t_tbt_params;	
	 reg_o_adcfifo   : out t_reg_o_adc_fifo_rdout;
	 reg_i_adcfifo   : in  t_reg_i_adc_fifo_rdout; 
	 reg_o_adc       : out t_reg_o_adc_cntrl;
	 reg_i_adc       : in  t_reg_i_adc_status; 
	 sa_cnt          : in std_logic_vector(31 downto 0);
   
     fp_leds         : out std_logic_vector(7 downto 0)
  );
end ps_io;


architecture behv of ps_io is

  

  
  signal reg_i        : t_addrmap_pl_regs_in;
  signal reg_o        : t_addrmap_pl_regs_out;

  --attribute mark_debug     : string;
  --attribute mark_debug of reg_o: signal is "true";



begin

fp_leds <= reg_o.FP_LEDS.val.data;

reg_o_adc.spi_we <= reg_o.adc_spi.data.swmod; 
reg_o_adc.spi_wdata <= reg_o.adc_spi.data.data; 
reg_i.adc_spi.data.data <= reg_i_adc.spi_rdata;    
reg_o_adc.idly_wval <= reg_o.adc_idlyval.data.data;  
reg_o_adc.idly_wstr <= reg_o.adc_idlystr.data.data; 
reg_o_adc.fco_dlystr <= reg_o.adc_mmcmdlystr.data.data;     

reg_o_pll.str <= reg_o.pll_spi.data.swmod;                
reg_o_pll.data <= reg_o.pll_spi.data.data;

reg_o_dsa.str <= reg_o.dsa_spi.data.swmod;
reg_o_dsa.data <= reg_o.dsa_spi.data.data;

reg_i.adc_cha.data.data <= adc_data(0);
reg_i.adc_chb.data.data <= adc_data(1);
reg_i.adc_chc.data.data <= adc_data(2);
reg_i.adc_chd.data.data <= adc_data(3);

tbt_params.kx <= reg_o.kx.data.data;
tbt_params.ky <= reg_o.ky.data.data;
tbt_params.cha_gain <= reg_o.cha_gain.data.data;
tbt_params.chb_gain <= reg_o.chb_gain.data.data;
tbt_params.chc_gain <= reg_o.chc_gain.data.data;
tbt_params.chd_gain <= reg_o.chd_gain.data.data;
tbt_params.xpos_offset <= reg_o.xpos_offset.data.data;
tbt_params.ypos_offset <= reg_o.ypos_offset.data.data;
tbt_params.gate_delay <= reg_o.gate_delay.data.data;
tbt_params.gate_width <= reg_o.gate_width.data.data;

reg_o_adcfifo.enb <= reg_o.adcfifo_streamenb.data.data(0);
reg_o_adcfifo.rst <= reg_o.adcfifo_reset.data.data(0);
reg_o_adcfifo.rdstr <= reg_o.adcfifo_data.data.swacc;
reg_i.adcfifo_rdcnt.data.data <= reg_i_adcfifo.rdcnt;
reg_i.adcfifo_data.data.data <= reg_i_adcfifo.dout;

reg_i.sa_cnt.val.data <= sa_cnt;



regs: pl_regs
  port map (
    pi_clock => pl_clock, 
    pi_reset => pl_reset, 

    pi_s_top => m_axi4_m2s, 
    po_s_top => m_axi4_s2m, 
    -- to logic interface
    pi_addrmap => reg_i,  
    po_addrmap => reg_o
  );





end behv;
