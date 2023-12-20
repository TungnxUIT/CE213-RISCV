`timescale 1ps/100fs 
module alu_cache(clk, reset, reset2, w_reg, w_dm, r_dm, reg_dest, branch, pc_4, rd, alu_result, isbranch, pc_branch, data2,
						w_reg_out, w_dm_out, r_dm_out, reg_dest_out, branch_out, pc_4_out, rd_out, alu_result_out, isbranch_out, pc_branch_out, data2_out
						);
input clk, reset, w_reg, branch, isbranch, reset2;
input[1:0] w_dm, reg_dest;
input[2:0] r_dm;
input[4:0] rd;
input[31:0] pc_4, alu_result, pc_branch, data2;
output reg branch_out, isbranch_out, w_reg_out;
output reg[1:0] w_dm_out, reg_dest_out;
output reg[2:0] r_dm_out;
output reg[4:0] rd_out;
output reg[31:0] pc_4_out, alu_result_out, pc_branch_out, data2_out;

always@(posedge clk or posedge reset) begin

	if(reset) begin
		w_reg_out <= 0;
		w_dm_out <= 0;
		r_dm_out <= 0;
		reg_dest_out <= 0;
		branch_out <= 0;
		pc_4_out <= 0;
		rd_out <= 0;
		alu_result_out <= 0;
		isbranch_out <= 0;
		pc_branch_out <= 0;
		data2_out <= 0;
	end
	else if(reset2) begin
		w_reg_out <= 0;
		w_dm_out <= 0;
		r_dm_out <= 0;
		reg_dest_out <= 0;
		branch_out <= 0;
		pc_4_out <= 0;
		rd_out <= 0;
		alu_result_out <= 0;
		isbranch_out <= 0;
		pc_branch_out <= 0;
		data2_out <= 0;
	end
	else begin
		w_reg_out <=  w_reg;
		w_dm_out <=  w_dm;
		r_dm_out <=  r_dm;
		reg_dest_out <=  reg_dest;
		branch_out <=  branch;
		pc_4_out <=  pc_4;
		rd_out <=  rd;
		alu_result_out <=  alu_result;
		isbranch_out <=  isbranch;
		pc_branch_out <=  pc_branch;
		data2_out <=  data2;
	end

end

endmodule