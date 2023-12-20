library verilog;
use verilog.vl_types.all;
entity register_file is
    port(
        clk             : in     vl_logic;
        rs1             : in     vl_logic_vector(4 downto 0);
        rs2             : in     vl_logic_vector(4 downto 0);
        rd              : in     vl_logic_vector(4 downto 0);
        data_in         : in     vl_logic_vector(31 downto 0);
        data1           : out    vl_logic_vector(31 downto 0);
        data2           : out    vl_logic_vector(31 downto 0);
        we              : in     vl_logic;
        reset           : in     vl_logic;
        s0              : out    vl_logic_vector(31 downto 0);
        s1              : out    vl_logic_vector(31 downto 0);
        s2              : out    vl_logic_vector(31 downto 0);
        s3              : out    vl_logic_vector(31 downto 0)
    );
end register_file;
