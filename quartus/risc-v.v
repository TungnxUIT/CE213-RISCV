`timescale 1ps/100fs 
module id_cache(clk, w_reg, w_dm, r_dm, alu_op, reg_dest, alusrc, pc_sel, branch, 
						data1, data2, extend_imm, pc, pc_4,
						w_reg_out, w_dm_out, r_dm_out, alu_op_out, reg_dest_out, alusrc_out, pc_sel_out, branch_out, 
						data1_out, data2_out, extend_imm_out, pc_out, pc_4_out
						);
input[2:0] r_dm;
input clk, w_reg, branch, alu_src, pc_sel;
input[4:0] alu_op;
input[1:0] w_dm, reg_dest;
input[31:0] data1, data2, extend_imm, pc, pc_4;
output reg[2:0] r_dm_out;
output reg w_reg_out, branch_out, alu_src_out, pc_sel_out;
output reg[4:0] alu_op_out;
output reg[1:0] w_dm_out, reg_dest_out;
output reg[31:0] data1_out, data2_out, extend_imm_out, pc_out, pc_4_out;

always@(posedge clk) begin
	#1
	w_reg_out <= #1 w_reg;
	branch_out <= #1 branch;
	alu_src_out <= #1 alu_src;
	pc_sel_out <= #1 pc_sel;
	r_dm_out <= #1 r_dm;
	alu_op_out <= #1 alu_op;
	w_dm_out <= #1 w_dm;
	reg_dest_out <= #1 reg_dest;
	data1_out <= #1 data1;
	data2_out <= #1 data2;
	extend_imm_out <= #1 extend_imm;
	pc_out <= #1 pc;
	pc_4_out <= #1 pc_4;
end

endmodule

