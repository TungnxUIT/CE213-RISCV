library verilog;
use verilog.vl_types.all;
entity mux4to1_32bit is
    port(
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        c               : in     vl_logic_vector(31 downto 0);
        d               : in     vl_logic_vector(31 downto 0);
        sel             : in     vl_logic_vector(1 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end mux4to1_32bit;
