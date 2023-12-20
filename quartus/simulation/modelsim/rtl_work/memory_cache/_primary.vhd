library verilog;
use verilog.vl_types.all;
entity memory_cache is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        reset2          : in     vl_logic;
        w_reg           : in     vl_logic;
        reg_dest        : in     vl_logic_vector(1 downto 0);
        pcsrc           : in     vl_logic;
        pc_4            : in     vl_logic_vector(31 downto 0);
        rd              : in     vl_logic_vector(4 downto 0);
        alu_result      : in     vl_logic_vector(31 downto 0);
        pc_branch       : in     vl_logic_vector(31 downto 0);
        data_mem        : in     vl_logic_vector(31 downto 0);
        w_reg_out       : out    vl_logic;
        reg_dest_out    : out    vl_logic_vector(1 downto 0);
        pcsrc_out       : out    vl_logic;
        pc_4_out        : out    vl_logic_vector(31 downto 0);
        rd_out          : out    vl_logic_vector(4 downto 0);
        alu_result_out  : out    vl_logic_vector(31 downto 0);
        pc_branch_out   : out    vl_logic_vector(31 downto 0);
        data_mem_out    : out    vl_logic_vector(31 downto 0)
    );
end memory_cache;
