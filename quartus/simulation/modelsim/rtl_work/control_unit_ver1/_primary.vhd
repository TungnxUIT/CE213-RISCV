library verilog;
use verilog.vl_types.all;
entity control_unit_ver1 is
    port(
        op              : in     vl_logic_vector(6 downto 0);
        func7           : in     vl_logic_vector(6 downto 0);
        func3           : in     vl_logic_vector(2 downto 0);
        w_reg           : out    vl_logic;
        alu_op          : out    vl_logic_vector(4 downto 0);
        r_dm            : out    vl_logic_vector(2 downto 0);
        w_dm            : out    vl_logic_vector(1 downto 0);
        sign_ext        : out    vl_logic_vector(2 downto 0);
        branch          : out    vl_logic;
        alu_src         : out    vl_logic;
        reg_dest        : out    vl_logic_vector(1 downto 0);
        pc_sel          : out    vl_logic
    );
end control_unit_ver1;
