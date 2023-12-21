library verilog;
use verilog.vl_types.all;
entity riscv_cpu_ver3 is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        s0              : out    vl_logic_vector(31 downto 0);
        s1              : out    vl_logic_vector(31 downto 0);
        s2              : out    vl_logic_vector(31 downto 0);
        s3              : out    vl_logic_vector(31 downto 0);
        test            : out    vl_logic_vector(31 downto 0)
    );
end riscv_cpu_ver3;
