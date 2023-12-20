`timescale 1ps/100fs 
module program_counter_ver2(clk, busy, reset, pc_forbranch, branch, pc, pc_4);
input clk ,reset, branch, busy;
input[31:0] pc_forbranch;
output reg[31:0] pc, pc_4;

reg[31:0] pc_hold;

always@(posedge clk or posedge reset) begin
	if(reset) begin
		pc_hold = -4;
	end
	else begin
		if(branch) pc_hold = pc_forbranch;
		else if(!busy) pc_hold = pc_hold + 4;
	end
	pc <= pc_hold;
	pc_4 <= pc_hold + 4;
end



endmodule