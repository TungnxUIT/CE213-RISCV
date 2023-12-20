library verilog;
use verilog.vl_types.all;
entity program_counter_ver2 is
    port(
        clk             : in     vl_logic;
        busy            : in     vl_logic;
        reset           : in     vl_logic;
        pc_forbranch    : in     vl_logic_vector(31 downto 0);
        branch          : in     vl_logic;
        pc              : out    vl_logic_vector(31 downto 0);
        pc_4            : out    vl_logic_vector(31 downto 0)
    );
end program_counter_ver2;
