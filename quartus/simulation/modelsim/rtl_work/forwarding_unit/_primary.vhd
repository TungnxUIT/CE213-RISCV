library verilog;
use verilog.vl_types.all;
entity forwarding_unit is
    generic(
        \register\      : vl_logic_vector(1 downto 0) := (Hi0, Hi0);
        alu_1           : vl_logic_vector(1 downto 0) := (Hi0, Hi1);
        alu_2           : vl_logic_vector(1 downto 0) := (Hi1, Hi0);
        mem             : vl_logic_vector(1 downto 0) := (Hi1, Hi1)
    );
    port(
        clk             : in     vl_logic;
        reset2          : in     vl_logic;
        opcode          : in     vl_logic_vector(6 downto 0);
        r_dm            : in     vl_logic_vector(2 downto 0);
        rd              : in     vl_logic_vector(4 downto 0);
        rs1             : in     vl_logic_vector(4 downto 0);
        rs2             : in     vl_logic_vector(4 downto 0);
        rs1_src         : out    vl_logic_vector(1 downto 0);
        rs2_src         : out    vl_logic_vector(1 downto 0);
        invalid         : out    vl_logic;
        busy            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of \register\ : constant is 2;
    attribute mti_svvh_generic_type of alu_1 : constant is 2;
    attribute mti_svvh_generic_type of alu_2 : constant is 2;
    attribute mti_svvh_generic_type of mem : constant is 2;
end forwarding_unit;
