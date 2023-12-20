`timescale 1ps/100fs 
module id_cache(clk, busy, reset, reset2, w_reg, w_dm, r_dm, alu_op, reg_dest, alu_src, pc_sel, branch, 
						data1, data2, extend_imm, pc, pc_4, rd,
						w_reg_out, w_dm_out, r_dm_out, alu_op_out, reg_dest_out, alu_src_out, pc_sel_out, branch_out, 
						data1_out, data2_out, extend_imm_out, pc_out, pc_4_out, rd_out
						);
input[2:0] r_dm;
input clk, w_reg, branch, alu_src, pc_sel, reset, reset2, busy;
input[4:0] alu_op, rd;
input[1:0] w_dm, reg_dest;
input[31:0] data1, data2, extend_imm, pc, pc_4;
output reg[2:0] r_dm_out;
output reg w_reg_out, branch_out, alu_src_out, pc_sel_out;
output reg[4:0] alu_op_out, rd_out;
output reg[1:0] w_dm_out, reg_dest_out;
output reg[31:0] data1_out, data2_out, extend_imm_out, pc_out, pc_4_out;

always@(posedge clk or posedge reset) begin
	if(reset) begin
		w_reg_out <=  0;
		branch_out <=  0;
		alu_src_out <=  0;
		pc_sel_out <=  0;
		r_dm_out <=  0;
		alu_op_out <= 0;
		w_dm_out <=  0;
		reg_dest_out <=  0;
		data1_out <=  0;
		data2_out <=  0;
		extend_imm_out <=  0;
		pc_out <=  0;
		pc_4_out <=  0;
		rd_out <=  0;
	end
	else if(reset2) begin
		w_reg_out <=  0;
		branch_out <=  0;
		alu_src_out <=  0;
		pc_sel_out <=  0;
		r_dm_out <=  0;
		alu_op_out <= 0;
		w_dm_out <=  0;
		reg_dest_out <=  0;
		data1_out <=  0;
		data2_out <=  0;
		extend_imm_out <=  0;
		pc_out <=  0;
		pc_4_out <=  0;
		rd_out <=  0;
	end
	else if(!busy) begin
		w_reg_out <=  w_reg;
		branch_out <=  branch;
		alu_src_out <=  alu_src;
		pc_sel_out <=  pc_sel;
		r_dm_out <=  r_dm;
		alu_op_out <=  alu_op;
		w_dm_out <=  w_dm;
		reg_dest_out <=  reg_dest;
		data1_out <=  data1;
		data2_out <=  data2;
		extend_imm_out <=  extend_imm;
		pc_out <=  pc;
		pc_4_out <=  pc_4;
		rd_out <=  rd;
	end
end

endmodule

