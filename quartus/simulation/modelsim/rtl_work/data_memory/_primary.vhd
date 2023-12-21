library verilog;
use verilog.vl_types.all;
entity data_memory is
    port(
        clk             : in     vl_logic;
        address         : in     vl_logic_vector(31 downto 0);
        data_in         : in     vl_logic_vector(31 downto 0);
        we              : in     vl_logic_vector(1 downto 0);
        re              : in     vl_logic_vector(2 downto 0);
        reset           : in     vl_logic;
        data_out        : out    vl_logic_vector(31 downto 0)
    );
end data_memory;
