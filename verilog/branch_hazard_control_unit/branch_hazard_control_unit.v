`timescale 1ps/100fs 
module branch_hazard_control_unit(clk, branch, reset_pipeline);
input branch, clk;
output reg reset_pipeline;

always@(posedge clk) begin
	if(branch) begin
		reset_pipeline = 1;
	end
	else reset_pipeline = 0;
end

endmodule