library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library UNISIM;
use UNISIM.VComponents.all;


entity spi_pe43701 is
  
  port (
    clk         : in  std_logic;                        -- clock input
    reset       : in  std_logic;                        -- active low reset
    strobe		: in  std_logic;
	wrdata		: in  std_logic_vector(7 downto 0);

    sclk        : out std_logic;                        -- sclk output
    sdi 	    : out std_logic;
    csb         : out std_logic;                        -- dsa latch
    debug       : out std_logic_vector(8 downto 0)      -- debug output
  );    

end spi_pe43701;
 
architecture rtl of spi_pe43701 is



  type   state_type is (IDLE, CLKP1, CLKP2);                    
  signal state             : state_type;
  signal sys_clk       		: std_logic; 
  signal sys_clk_i          : std_logic;                                                                               
  signal treg              : std_logic_vector(15 downto 0);  
  signal bcnt          		: integer range 0 to 31;          
  signal xfer_active 		: std_logic;                      
  
  signal int_rwn				: std_logic;     
  signal int_sclk          : std_logic;
  signal int_csb           : std_logic;
  signal int_sdi           : std_logic;
  
  signal clk_cnt           : std_logic_vector(7 downto 0);  
  
  signal sync_trig			: std_logic;
  signal sync_trig_r1		: std_logic;
  signal strobe_lat			: std_logic;
  signal strobe_clr			: std_logic;

  
  
begin  



  
  
  debug(0) <= sync_trig; 
  debug(1) <= xfer_active;
  debug(2) <= sys_clk;
  debug(8 downto 3) <= (others => '0');

 
  sclk <= int_sclk;
  csb <= int_csb when (strobe = '1') else '0';
  sdi <= int_sdi; 

 

  process (sys_clk, reset)
  begin  
    if (reset = '1') then               
      int_sclk  <= '0';
      int_csb  <= '0';
	   int_sdi <= '0';
		strobe_clr <= '0';
      treg <= (others => '0');
      bcnt <= 0;
      xfer_active <= '0';
      state <= IDLE;

    elsif (sys_clk'event and sys_clk = '1') then 
      case state is
        when IDLE =>     
            int_sclk  <= '0';
            int_csb  <= '0';
				int_sdi  <= '0';
            xfer_active <= '0';
            strobe_clr <= '0';
            if (sync_trig = '1') then
                xfer_active <= '1';
					 strobe_clr <= '1';
                treg <= x"00" & wrdata; 
                bcnt <= 16;  -- 8-bit address and 8-bit data
                state <= CLKP1;
            end if;

        when CLKP1 =>                   -- CLKP1 clock phase 1
          int_sclk  <= '0';
          int_csb  <= '0';
          state <= CLKP2;
			 treg <= '0' & treg(15 downto 1);
          int_sdi <= treg(0);

        when CLKP2 =>                   -- CLKP1 clock phase 2
          if (bcnt = 0) then
            int_csb <= '1';
				xfer_active <= '0';
            state <= IDLE;
          else
            int_sclk <= '1';
            bcnt <= bcnt - 1;
            state <= CLKP1;
			 end if;
 
    
        when others =>
            state <= IDLE;
      end case;
    end if;
  end process;





sys_clk_i <= clk_cnt(3);

BUFH_inst : BUFH  port map ( O => sys_clk, I => sys_clk_i );


clkdivide : process(clk, reset)
   begin
      if (reset = '1') then  
          clk_cnt <= (others => '0');
      elsif (clk'event AND clk = '1') then  
			clk_cnt <= clk_cnt + 1; 
      end if;
   end process; 




process (strobe, strobe_clr, reset)
   begin
      if (reset = '1') OR (strobe_clr = '1') then
	     strobe_lat <= '0';
      elsif (strobe'event and strobe = '1') then
	     strobe_lat <= '1';
      end if;
   end process;



sync_trig_gen: process (sys_clk, reset)
  begin
    if (reset = '1') then
      sync_trig_r1 <= '0';
      sync_trig    <= '0';
    elsif (rising_edge(sys_clk)) then
      sync_trig_r1  <= strobe_lat; 
      sync_trig     <= sync_trig_r1; 
    end if;
  end process;






  
end rtl;
