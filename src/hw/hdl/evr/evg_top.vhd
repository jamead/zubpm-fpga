

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use ieee.std_logic_unsigned.all;

library UNISIM;
use UNISIM.VComponents.all;

library xil_defaultlib;
use xil_defaultlib.bpm_package.ALL;



entity evg_top is
  port (
  sys_clk        : in std_logic;
  evg_clk        : in std_logic;
  sys_rst        : in std_logic;
  gth_txdata     : out std_logic_vector(15 downto 0);
  gth_txcharisk  : out std_logic_vector(7 downto 0)
);  
 

end evg_top;

architecture behv of evg_top is




  signal cnt_1hz     : unsigned(31 downto 0) := (others => '0');
  signal sig_1hz     : std_logic := '0';
  signal epoch_time  : unsigned(31 downto 0);
  signal txcnt       : unsigned(15 downto 0);


  

  attribute mark_debug     : string;
  attribute mark_debug of gth_txdata: signal is "true";  
  attribute mark_debug of gth_txcharisk: signal is "true";





begin 


-- tx a counter
process (evg_clk)
begin
  if (rising_edge(evg_clk)) then
    if (sys_rst = '1') then
      gth_txdata <= x"50BC";
      gth_txcharisk <= x"01";
      txcnt <= 16d"0";
    else
      if (txcnt = 16d"500") then
        gth_txdata <= x"50BC";
        gth_txcharisk <= x"01";
        txcnt <= 16d"0"; 
      else
        gth_txdata <= std_logic_vector(txcnt);
        gth_txcharisk <= x"00";
        txcnt <= txcnt + 1;
      end if;
    end if;
  end if;
end process;
             







-- generate 1 Hz signal for updating timestamp
process(sys_clk)
  begin
    if rising_edge(sys_clk) then
      if sys_rst = '1' then
        cnt_1hz <= (others => '0');
        sig_1hz  <= '0';
        epoch_time <= to_unsigned(1761037205,32);
      else
        if cnt_1hz = to_unsigned(50000000 - 1, 32) then
          if sig_1hz = '0' then
             epoch_time <= epoch_time + 1;
          end if;
          cnt_1hz <= (others => '0');
          sig_1hz  <= not sig_1hz;  -- toggle every 0.5 s
        else
          cnt_1hz <= cnt_1hz + 1;
        end if;
      end if;
    end if;
end process;




end behv;
