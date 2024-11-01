
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library desyrdl;
use desyrdl.common.all;
use desyrdl.pkg_pl_regs.all;

library xil_defaultlib;
use xil_defaultlib.bpm_package.ALL;


entity ps_io is
  port (  
     pl_clock         : in std_logic;
     pl_reset         : in std_logic;
   
     m_axi4_m2s       : in t_pl_regs_m2s;
     m_axi4_s2m       : out t_pl_regs_s2m;   
     
     adc_data        : in t_adc_raw;
     adc_spi_we      : out std_logic;
     adc_spi_wdata   : out std_logic_vector(31 downto 0);
     adc_spi_rdata   : in std_logic_vector(31 downto 0);
     adc_idly_wrval  : out std_logic_vector(8 downto 0);
     adc_idly_wrstr  : out std_logic_vector(15 downto 0);
     adc_idly_rdval  : in std_logic_vector(8 downto 0);       
     adc_fco_dlystr  : out std_logic_vector(1 downto 0); 
	 ad9510_we		 : out std_logic;
	 ad9510_data     : out std_logic_vector(31 downto 0); 
	 dsa_we		     : out std_logic;
	 dsa_data        : out std_logic_vector(7 downto 0); 	      
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

adc_spi_we <= reg_o.adc_spi.data.swmod; 
adc_spi_wdata <= reg_o.adc_spi.data.data; 
reg_i.adc_spi.data.data <= adc_spi_rdata;    
adc_idly_wrval <= reg_o.adc_idlyval.data.data;  
adc_idly_wrstr <= reg_o.adc_idlystr.data.data; 

adc_fco_dlystr <= reg_o.adc_mmcmdlystr.data.data;     

ad9510_we <= reg_o.pll_spi.data.swmod;                
ad9510_data <= reg_o.pll_spi.data.data;

dsa_we <= reg_o.dsa_spi.data.swmod;
dsa_data <= reg_o.dsa_spi.data.data;

reg_i.adc_cha.data.data <= adc_data(0);
reg_i.adc_chb.data.data <= adc_data(1);
reg_i.adc_chc.data.data <= adc_data(2);
reg_i.adc_chd.data.data <= adc_data(3);


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
