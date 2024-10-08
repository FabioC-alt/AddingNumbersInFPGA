library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity stream_adder is
    Generic (DATA_WIDTH : integer := 16);
    Port ( clk : in STD_LOGIC;
           resetn : in STD_LOGIC;
           data_0_i_tdata : in STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
           data_0_i_tvalid : in STD_LOGIC;
           data_0_i_tlast : in STD_LOGIC;
           data_0_i_tready : out STD_LOGIC;
   
           data_1_i_tdata : in STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
           data_1_i_tvalid : in STD_LOGIC;
           data_1_i_tlast : in STD_LOGIC;
           data_1_i_tready : out STD_LOGIC;
           
           data_o_tdata : out STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
           data_o_tvalid : out STD_LOGIC;
           data_o_tlast  : out STD_LOGIC;
           data_o_tready : in STD_LOGIC);
           
            
end stream_adder;

architecture Behavioral of stream_adder is
    signal sum_reg : signed(DATA_WIDTH - 1 downto 0) := (others => '0');
    signal valid_reg : std_logic := '0';
    signal tlast_reg : std_logic := '0';
    
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if resetn = '0' then
                sum_reg <= (others => '0');
                valid_reg <= '0';
                tlast_reg <= '0';
            else
                if data_0_i_tvalid='1' and data_1_i_tvalid='1' and data_o_tready='1' then
                sum_reg <= signed(data_0_i_tdata) + signed(data_1_i_tdata);
                valid_reg <= data_0_i_tvalid and data_1_i_tvalid;
                tlast_reg <= data_0_i_tlast and data_1_i_tlast;
                else
                    valid_reg <= '0';
                    tlast_reg <= '0';
--                sum_reg <= signed(data_0_i_tdata) + signed(data_1_i_tdata);
--                valid_reg <= data_0_i_tvalid and data_1_i_tvalid;
                end if;
           end if;
        end if;
    end process;
    
    data_o_tvalid <= valid_reg;
    data_o_tdata <= std_logic_vector(sum_reg);
    data_o_tlast <= tlast_reg;
    
    data_1_i_tready <= data_o_tready;
    data_0_i_tready <= data_o_tready;


                      
end Behavioral;