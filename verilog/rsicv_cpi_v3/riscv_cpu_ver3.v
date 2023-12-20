module riscv_cpu_ver3(clk, reset, s0, s1, s2, s3);
input clk, reset;

wire[31:0] write_data, data1, data2, memory_out, pc_4, adder_in, pc_branch, in, alu_result, pc_branch_out4, alu_result_out3, alu_result_out4, extend_imm;
wire[2:0] r_dm, sign_ext;
wire w_reg, branch, alu_src, pc_sel, w_reg_out2, w_reg_out3, w_reg_out4;
wire[4:0] alu_op, rd_out2, rd_out3, rd_out4;
wire[1:0] w_dm, reg_dest;
wire isbranch, pcsrc_out4, reset2;
wire pcsrc, busy;
wire[31:0] pc;
//output[31:0] pc;
//output pcsrc;

//test variable	
output[31:0] s0, s1, s2, s3;
wire[31:0] operand_a, operand_b;
/*output reg[31:0] a, b;
output reg[1:0] f1, f2;
output reg[31:0] alu4;*/
//output reg we;
//begin datapath
wire[31:0] pc_branch_out3, mem1;

//program_counter_ver2 pc_ver2(clk, busy, reset, pc_branch_out3, pcsrc, pc, pc_4);
program_counter_ver2 pc_ver2(clk, busy, reset, pc_branch, pcsrc, pc, pc_4);

instruction_mem ins(pc, in);

// pipeline 1
wire[31:0] pc_out1, pc_4_out1, in_out1;
if_cache pipeline1(clk, busy, reset, reset2, pc, pc_4, in, pc_out1, pc_4_out1, in_out1);

control_unit_ver1 cltr_ver1(in_out1[6:0], in_out1[31:25], in_out1[14:12], w_reg, alu_op, r_dm, w_dm, sign_ext, branch, alu_src, reg_dest, pc_sel);

register_file rf(clk, in_out1[19:15], in_out1[24:20], rd_out4, write_data, data1, data2, w_reg_out4, reset, s0, s1, s2, s3);

sign_extend sign_ex(in_out1[31:7], extend_imm, sign_ext);

// pipeline 2
wire[2:0] r_dm_out2, sign_ext_out2;
wire branch_out2, alu_src_out2, pc_sel_out2;
wire[4:0] alu_op_out2;
wire[1:0] w_dm_out2, reg_dest_out2;
wire[31:0] data1_out2, data2_out2, extend_imm_out2, pc_out2, pc_4_out2;

id_cache pipeline2(clk, busy, reset , reset2, w_reg, w_dm, r_dm, alu_op, reg_dest, alu_src, pc_sel, branch, 
						data1, data2, extend_imm, pc_out1, pc_4_out1, in_out1[11:7],
						w_reg_out2, w_dm_out2, r_dm_out2, alu_op_out2, reg_dest_out2, alu_src_out2, pc_sel_out2, branch_out2, 
						data1_out2, data2_out2, extend_imm_out2, pc_out2, pc_4_out2, rd_out2);
wire[31:0] operand_b_1, operand_b_2, memory_out4;
wire[1:0] rs1_src, rs2_src;
wire invalid; 

						
mux2to1_32bit mux0(data2_out2, extend_imm_out2, alu_src_out2, operand_b_1);

mux4to1_32bit mux1(data1_out2, alu_result_out3, alu_result_out4, memory_out4, rs1_src, operand_a);

mux4to1_32bit mux2(operand_b_1, alu_result_out3, alu_result_out4, memory_out4, rs2_src, operand_b_2);

mux2to1_32bit mux3(operand_b_2, operand_b_1, invalid, operand_b);

alu alu(alu_op_out2, operand_a, operand_b, alu_result, isbranch);

mux2to1_32bit mux4(pc_out2, data1_out2, pc_sel_out2, adder_in);

adder adder1(adder_in, extend_imm_out2, pc_branch);

assign pcsrc = branch_out2 & isbranch;

// pipeline 3
 wire[2:0] r_dm_out3;
wire branch_out3, isbranch_out3;
wire[1:0] w_dm_out3, reg_dest_out3;
wire[31:0] pc_4_out3, data2_out3; 
alu_cache pipeline3(clk, reset , reset2, w_reg_out2, w_dm_out2, r_dm_out2, reg_dest_out2, branch_out2, pc_4_out2, rd_out2, alu_result, isbranch, pc_branch, operand_b_2,
						w_reg_out3, w_dm_out3, r_dm_out3, reg_dest_out3, branch_out3, pc_4_out3, rd_out3, alu_result_out3, isbranch_out3, pc_branch_out3, data2_out3
						);

data_memory dm(clk, alu_result_out3, data2_out3, w_dm_out3, r_dm_out3, reset, memory_out, mem1);

//assign pcsrc = branch_out3 & isbranch_out3;

// pipeline 4
wire[1:0] reg_dest_out4;													
wire[31:0]  pc_4_out4;
memory_cache pipeline4(clk, reset, 1'b0, w_reg_out3, reg_dest_out3, pcsrc, pc_4_out3, rd_out3, alu_result_out3, pc_branch_out3, memory_out,
							w_reg_out4, reg_dest_out4, pcsrc_out4, pc_4_out4, rd_out4, alu_result_out4, pc_branch_out4, memory_out4
							);

mux3to1_32bit mux5(alu_result_out4, memory_out4, pc_branch_out4, reg_dest_out4, write_data);

forwarding_unit fw(clk, reset2, in_out1[6:0], r_dm_out3, in_out1[11:7], in_out1[19:15], in_out1[24:20], rs1_src, rs2_src, invalid, busy);

branch_hazard_control_unit bhcu(clk, pcsrc, reset2);

//output reg br;
// end datapath
always@* begin
/*a <= operand_a;
b <= operand_b;
f1 <= rs1_src;
f2 <= rs2_src;
alu4 <= alu_result_out4;
br <= reset2;*/
end

endmodule

