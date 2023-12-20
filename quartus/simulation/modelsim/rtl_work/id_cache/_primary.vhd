library verilog;
use verilog.vl_types.all;
entity id_cache is
    port(
        clk             : in     vl_logic;
        busy            : in     vl_logic;
        reset           : in     vl_logic;
        reset2          : in     vl_logic;
        w_reg           : in     vl_logic;
        w_dm            : in     vl_logic_vector(1 downto 0);
        r_dm            : in     vl_logic_vector(2 downto 0);
        alu_op          : in     vl_logic_vector(4 downto 0);
        reg_dest        : in     vl_logic_vector(1 downto 0);
        alu_src         : in     vl_logic;
        pc_sel          : in     vl_logic;
        branch          : in     vl_logic;
        data1           : in     vl_logic_vector(31 downto 0);
        data2           : in     vl_logic_vector(31 downto 0);
        extend_imm      : in     vl_logic_vector(31 downto 0);
        pc              : in     vl_logic_vector(31 downto 0);
        pc_4            : in     vl_logic_vector(31 downto 0);
        rd              : in     vl_logic_vector(4 downto 0);
        w_reg_out       : out    vl_logic;
        w_dm_out        : out    vl_logic_vector(1 downto 0);
        r_dm_out        : out    vl_logic_vector(2 downto 0);
        alu_op_out      : out    vl_logic_vector(4 downto 0);
        reg_dest_out    : out    vl_logic_vector(1 downto 0);
        alu_src_out     : out    vl_logic;
        pc_sel_out      : out    vl_logic;
        branch_out      : out    vl_logic;
        data1_out       : out    vl_logic_vector(31 downto 0);
        data2_out       : out    vl_logic_vector(31 downto 0);
        extend_imm_out  : out    vl_logic_vector(31 downto 0);
        pc_out          : out    vl_logic_vector(31 downto 0);
        pc_4_out        : out    vl_logic_vector(31 downto 0);
        rd_out          : out    vl_logic_vector(4 downto 0)
    );
end id_cache;
