`timescale 1ps/100fs 
module memory_cache(clk, reset, reset2, w_reg, reg_dest, pcsrc, pc_4, rd, alu_result, pc_branch, data_mem,
							w_reg_out, reg_dest_out, pcsrc_out, pc_4_out, rd_out, alu_result_out, pc_branch_out, data_mem_out
							);
input clk, reset, w_reg, pcsrc, reset2;
input[1:0] reg_dest;
input[4:0] rd;
input[31:0] pc_4, alu_result, pc_branch, data_mem;
output reg w_reg_out, pcsrc_out;	
output reg[1:0] reg_dest_out;						
output reg[4:0] rd_out;							
output reg[31:0]  pc_4_out, alu_result_out, pc_branch_out, data_mem_out;

always@(posedge clk or posedge reset) begin

	if(reset) begin
		w_reg_out <= 0;
		pcsrc_out <= 0;
		reg_dest_out <= 0;
		rd_out <= 0;
		pc_4_out <= 0;
		alu_result_out <= 0;
		pc_branch_out <= 0;
		data_mem_out <= 0;
	end
	else if(reset2) begin
		w_reg_out <= 0;
		pcsrc_out <= 0;
		reg_dest_out <= 0;
		rd_out <= 0;
		pc_4_out <= 0;
		alu_result_out <= 0;
		pc_branch_out <= 0;
		data_mem_out <= 0;
	end
	else begin
		w_reg_out <=  w_reg;
		pcsrc_out <=  pcsrc;
		reg_dest_out <=  reg_dest;
		rd_out <=  rd;
		pc_4_out <=  pc_4;
		alu_result_out <=  alu_result;
		pc_branch_out <=  pc_branch;
		data_mem_out <=  data_mem;
	end
end
endmodule