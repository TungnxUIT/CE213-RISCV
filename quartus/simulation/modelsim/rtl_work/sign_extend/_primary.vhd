library verilog;
use verilog.vl_types.all;
entity sign_extend is
    port(
        data_in         : in     vl_logic_vector(24 downto 0);
        data_out        : out    vl_logic_vector(31 downto 0);
        sel             : in     vl_logic_vector(2 downto 0)
    );
end sign_extend;
