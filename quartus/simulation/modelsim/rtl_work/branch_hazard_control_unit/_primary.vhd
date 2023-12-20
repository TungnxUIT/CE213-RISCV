library verilog;
use verilog.vl_types.all;
entity branch_hazard_control_unit is
    port(
        clk             : in     vl_logic;
        branch          : in     vl_logic;
        reset_pipeline  : out    vl_logic
    );
end branch_hazard_control_unit;
