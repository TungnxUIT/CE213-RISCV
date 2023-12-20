library verilog;
use verilog.vl_types.all;
entity if_cache is
    port(
        clk             : in     vl_logic;
        busy            : in     vl_logic;
        reset           : in     vl_logic;
        reset2          : in     vl_logic;
        pc              : in     vl_logic_vector(31 downto 0);
        pc_4            : in     vl_logic_vector(31 downto 0);
        instruction     : in     vl_logic_vector(31 downto 0);
        pc_out          : out    vl_logic_vector(31 downto 0);
        pc_4_out        : out    vl_logic_vector(31 downto 0);
        instruction_out : out    vl_logic_vector(31 downto 0)
    );
end if_cache;
