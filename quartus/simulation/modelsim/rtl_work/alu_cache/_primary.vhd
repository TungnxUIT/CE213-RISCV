library verilog;
use verilog.vl_types.all;
entity alu_cache is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        reset2          : in     vl_logic;
        w_reg           : in     vl_logic;
        w_dm            : in     vl_logic_vector(1 downto 0);
        r_dm            : in     vl_logic_vector(2 downto 0);
        reg_dest        : in     vl_logic_vector(1 downto 0);
        branch          : in     vl_logic;
        pc_4            : in     vl_logic_vector(31 downto 0);
        rd              : in     vl_logic_vector(4 downto 0);
        alu_result      : in     vl_logic_vector(31 downto 0);
        isbranch        : in     vl_logic;
        pc_branch       : in     vl_logic_vector(31 downto 0);
        data2           : in     vl_logic_vector(31 downto 0);
        w_reg_out       : out    vl_logic;
        w_dm_out        : out    vl_logic_vector(1 downto 0);
        r_dm_out        : out    vl_logic_vector(2 downto 0);
        reg_dest_out    : out    vl_logic_vector(1 downto 0);
        branch_out      : out    vl_logic;
        pc_4_out        : out    vl_logic_vector(31 downto 0);
        rd_out          : out    vl_logic_vector(4 downto 0);
        alu_result_out  : out    vl_logic_vector(31 downto 0);
        isbranch_out    : out    vl_logic;
        pc_branch_out   : out    vl_logic_vector(31 downto 0);
        data2_out       : out    vl_logic_vector(31 downto 0)
    );
end alu_cache;
