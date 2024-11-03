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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity trig_logic is
  port (
    adc_clk         : in  std_logic;  
    reset           : in  std_logic;
    soft_trig       : in  std_logic;
    evr_trig        : in  std_logic;
    trig_dly_reg    : in  std_logic_vector(31 downto 0);
    trig_evrintsel  : in  std_logic;
    dma_adc_active  : in  std_logic;
    dma_tbt_active  : in  std_logic;  
    dma_fa_active   : in  std_logic;  
    trig_cnt        : out std_logic_vector(31 downto 0);
    evr_ts          : in  std_logic_vector(63 downto 0);
    evr_ts_lat      : out std_logic_vector(63 downto 0);
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

  --debug signals (connect to ila)
--   attribute mark_debug     : string;
--   attribute mark_debug of dma_adc_active: signal is "true";
--   attribute mark_debug of dma_tbt_active: signal is "true";
--   attribute mark_debug of dma_fa_active: signal is "true";
--   attribute mark_debug of dma_active: signal is "true";
--   attribute mark_debug of dma_trig: signal is "true";  
--   attribute mark_debug of dma_trig_lat: signal is "true";
--   attribute mark_debug of dma_running: signal is "true";  
--   attribute mark_debug of dma_done: signal is "true";
--   attribute mark_debug of trig_cnt: signal is "true";
--   attribute mark_debug of evr_trig_s: signal is "true";
--   attribute mark_debug of soft_trig: signal is "true";
--   attribute mark_debug of soft_trig_sr: signal is "true";
--   attribute mark_debug of soft_trig_s: signal is "true";
--   attribute mark_debug of trig_evrintsel: signal is "true";

begin  


dma_active <= dma_adc_active or dma_tbt_active or dma_fa_active;

--register outputs
process (adc_clk)
begin
  if (rising_edge(adc_clk)) then
    if (reset = '1') then
      dma_trig <= '0';
    else
      if (trig_evrintsel = '0') then
         dma_trig <= evr_trig_s;
      else 
         dma_trig <= soft_trig_s;
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
      soft_trig_sr(0) <= soft_trig;
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