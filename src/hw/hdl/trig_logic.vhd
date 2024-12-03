------------------------------------------------------------------------------
-- Title         : Trigger Source Select
-------------------------------------------------------------------------------
-- File          : trig_src.vhd
-- Author        : Joseph Mead  mead@bnl.gov
-- Created       : 09/24/2010
-------------------------------------------------------------------------------
-- Description:
-- Provides logic to select which trigger source will be used to store to NPI.
-- Choices are : 0=soft_trig, 1=event link, 2=front panel
-- Also provides programmable delay capability. 
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Modification history:
-- 09/24/2010: created.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.ALL;


library work;
use work.bpm_package.ALL;  


entity trig_logic is
  port (
    adc_clk         : in  std_logic;  
    reset           : in  std_logic;
    reg_o           : in t_reg_o_dma;
    reg_i           : out  t_reg_i_dma;
    evr_trig        : in  std_logic;
    dma_adc_active  : in  std_logic;
    dma_tbt_active  : in  std_logic;  
    dma_fa_active   : in  std_logic;  
    evr_ts          : in  std_logic_vector(63 downto 0);
    evr_ts_lat      : out std_logic_vector(63 downto 0);
    dma_permit      : out std_logic;
    dma_trig        : out std_logic
  );    
end trig_logic;

architecture behv of trig_logic is

 
 
  signal soft_trig_sr      : std_logic_vector(2 downto 0);
  signal soft_trig_s       : std_logic;
  signal evr_trig_sr       : std_logic_vector(2 downto 0);  
  signal evr_trig_s        : std_logic;
  signal dma_active        : std_logic;
  signal dma_trig_lat      : std_logic;
  signal dma_running       : std_logic;
  signal dma_done          : std_logic;
  signal trig_cnt          : std_logic_vector(31 downto 0);
  signal adc_enb_last      : std_logic;

  --debug signals (connect to ila)
   attribute mark_debug     : string;
   attribute mark_debug of reg_i: signal is "true";
   attribute mark_debug of reg_o: signal is "true";
   attribute mark_debug of evr_trig: signal is "true";
   attribute mark_debug of dma_adc_active: signal is "true";
   attribute mark_debug of dma_tbt_active: signal is "true";
   attribute mark_debug of dma_fa_active: signal is "true";
   attribute mark_debug of dma_active: signal is "true";
   attribute mark_debug of dma_trig: signal is "true";  
   attribute mark_debug of dma_trig_lat: signal is "true";
   attribute mark_debug of dma_running: signal is "true";  
   attribute mark_debug of dma_done: signal is "true";
   attribute mark_debug of trig_cnt: signal is "true";
   attribute mark_debug of evr_trig_s: signal is "true";
   attribute mark_debug of soft_trig_sr: signal is "true";
   attribute mark_debug of soft_trig_s: signal is "true";


begin  

reg_i.trig_cnt <= trig_cnt;
reg_i.status <= dma_adc_active & dma_tbt_active & dma_fa_active & dma_permit & dma_running;



dma_active <= dma_adc_active or dma_tbt_active or dma_fa_active;

--only allow trigger when all enables are asserted and dma is not running
dma_permit <= reg_o.adc_enb and reg_o.tbt_enb and reg_o.fa_enb and not dma_trig_lat;





--register outputs
process (adc_clk)
begin
  if (rising_edge(adc_clk)) then
    if (reset = '1') then
      dma_trig <= '0';
    else
      if (reg_o.trigsrc = '0') then
         dma_trig <= evr_trig_s when (dma_permit = '1') else '0';
      else 
         dma_trig <= soft_trig_s when (dma_permit = '1') else '0';
      end if; 
    end if;
  end if;
end process;



--dma done
process (adc_clk)
begin
  if (rising_edge(adc_clk)) then
    if (reset = '1') then
      dma_trig_lat <= '0';
      dma_running <= '0';
      dma_done <= '0';
      
    else
      adc_enb_last <= reg_o.adc_enb;
      dma_done <= '0';
      if (dma_trig = '1') then
        dma_trig_lat <= '1';
      end if;
      if (dma_trig_lat = '1' and dma_active = '1') then
        dma_running <= '1';
      end if;
      if (dma_running = '1' and dma_active = '0') then 
        dma_done <= '1';
        dma_running <= '0';
      end if;
      if (dma_running = '0' and reg_o.adc_enb = '1' and adc_enb_last = '0') then
        dma_trig_lat <= '0';
      end if;
    end if;
  end if;
end process;



--count triggers,update after dma is complete
process (adc_clk)
begin
  if (rising_edge(adc_clk)) then
    if (reset = '1') then
      trig_cnt <= (others => '0');
    else
      if (dma_done = '1') then
        trig_cnt <= trig_cnt + 1;
      end if;
    end if;
  end if;
end process;



--latch timestamp -- must sync...
process (adc_clk)
begin
  if (rising_edge(adc_clk)) then
    if (reset = '1') then
      evr_ts_lat <= (others => '0');
    else
      if (dma_trig = '1') then
        evr_ts_lat <= evr_ts;
        reg_i.ts_s <= evr_ts(63 downto 32);
        reg_i.ts_ns <= evr_ts(31 downto 0);
      end if;
    end if;
  end if;
end process;




-- sync soft trig to adc clock domain
process (adc_clk)
begin
  if (rising_edge(adc_clk)) then
	if (reset = '1') then
	  soft_trig_sr <= "000";
    else
      soft_trig_sr(0) <= reg_o.soft_trig;
      soft_trig_sr(1) <= soft_trig_sr(0);
      soft_trig_sr(2) <= soft_trig_sr(1);
    end if;
    if (soft_trig_sr(2) = '0' and soft_trig_sr(1) = '1') then
      soft_trig_s <= '1';
    else
      soft_trig_s <= '0';
    end if;
  end if;
end process;


-- sync evr trig to adc clock domain
process (adc_clk)
begin
  if (rising_edge(adc_clk)) then
	if (reset = '1') then
	  evr_trig_sr <= "000";
    else
      evr_trig_sr(0) <= evr_trig;
      evr_trig_sr(1) <= evr_trig_sr(0);
      evr_trig_sr(2) <= evr_trig_sr(1);
    end if;
    if (evr_trig_sr(2) = '0' and evr_trig_sr(1) = '1') then
      evr_trig_s <= '1';
    else
      evr_trig_s <= '0';
    end if;
  end if;
end process;




  
end behv;