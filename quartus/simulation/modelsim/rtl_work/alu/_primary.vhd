library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        alu_opcode      : in     vl_logic_vector(4 downto 0);
        operand_a       : in     vl_logic_vector(31 downto 0);
        operand_b       : in     vl_logic_vector(31 downto 0);
        alu_result      : out    vl_logic_vector(31 downto 0);
        branch          : out    vl_logic
    );
end alu;
