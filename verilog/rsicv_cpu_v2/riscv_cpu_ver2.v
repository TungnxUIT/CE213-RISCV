module riscv_cpu_ver2(clk, reset, r1, r2, rd, re_mem, instruc, pc_now, imm, result_alu, pc_out, pc_out_2, s0, s1, wd, pc_b);
input clk, reset;

wire[31:0] write_data, data1, data2, memory_out, pc_4, adder_in, pc_branch, in, pc, operand_b, alu_result, extend_imm, pc_branch_out4;
wire[2:0] r_dm, sign_ext;
wire w_reg, branch, alu_src, pc_sel, w_reg_out2, w_reg_out3, w_reg_out4;
wire[4:0] alu_op, rd_out2, rd_out3, rd_out4;
wire[1:0] w_dm, reg_dest;
wire isbranch, pcsrc, pcsrc_out4;

//test variable
output reg[31:0] r1, r2, re_mem, instruc, pc_now, imm, result_alu, pc_out, pc_out_2, wd, pc_b;
output reg[4:0] rd;
output[31:0] s0, s1;
//output reg we;
//begin datapath

program_counter_ver2 pc_ver2(clk, reset, pc_branch_out4, pcsrc_out4, pc, pc_4);

instruction_mem ins(clk, pc, in);

// pipeline 1
wire[31:0] pc_out1, pc_4_out1, in_out1;
if_cache pipeline1(clk, reset, pc, pc_4, in, pc_out1, pc_4_out1, in_out1);

control_unit_ver1 cltr_ver1(in_out1[6:0], in_out1[31:25], in_out1[14:12], w_reg, alu_op, r_dm, w_dm, sign_ext, branch, alu_src, reg_dest, pc_sel);

register_file rf(clk, in_out1[19:15], in_out1[24:20], rd_out4, write_data, data1, data2, w_reg_out4, reset, s0, s1, flag);

sign_extend sign_ex(in_out1[31:7], extend_imm, sign_ext);

// pipeline 2
wire[2:0] r_dm_out2;
wire branch_out2, alu_src_out2, pc_sel_out2;
wire[4:0] alu_op_out2;
wire[1:0] w_dm_out2, reg_dest_out2;
wire[31:0] data1_out2, data2_out2, extend_imm_out2, pc_out2, pc_4_out2;

id_cache pipeline2(clk, reset, w_reg, w_dm, r_dm, alu_op, reg_dest, alu_src, pc_sel, branch, 
						data1, data2, extend_imm, pc_out1, pc_4_out1, in_out1[11:7], 
						w_reg_out2, w_dm_out2, r_dm_out2, alu_op_out2, reg_dest_out2, alu_src_out2, pc_sel_out2, branch_out2, 
						data1_out2, data2_out2, extend_imm_out2, pc_out2, pc_4_out2, rd_out2);

mux2to1_32bit mux0(data2_out2, extend_imm_out2, alu_src_out2, operand_b);

alu alu(alu_op_out2, data1_out2, operand_b, alu_result, isbranch);

mux2to1_32bit mux1(pc_out2, data1_out2, pc_sel_out2, adder_in);

adder adder1(adder_in, extend_imm_out2, pc_branch);

// pipeline 3
wire[2:0] r_dm_out3;
wire branch_out3, isbranch_out3;
wire[1:0] w_dm_out3, reg_dest_out3;
wire[31:0] pc_4_out3, data2_out3, pc_branch_out3, alu_result_out3;
alu_cache pipeline3(clk, reset, w_reg_out2, w_dm_out2, r_dm_out2, reg_dest_out2, branch_out2, pc_4_out2, rd_out2, alu_result, isbranch, pc_branch, data2_out2,
						w_reg_out3, w_dm_out3, r_dm_out3, reg_dest_out3, branch_out3, pc_4_out3, rd_out3, alu_result_out3, isbranch_out3, pc_branch_out3, data2_out3
						);

data_memory dm(clk, alu_result_out3, data2_out3, w_dm_out3, r_dm_out3, reset, memory_out);

assign pcsrc = branch_out3 & isbranch_out3;

// pipeline 4
wire[1:0] reg_dest_out4;													
wire[31:0]  pc_4_out4, alu_result_out4,  memory_out4;
memory_cache pipeline4(clk, reset, w_reg_out3, reg_dest_out3, pcsrc, pc_4_out3, rd_out3, alu_result_out3, pc_branch_out3, memory_out,
							w_reg_out4, reg_dest_out4, pcsrc_out4, pc_4_out4, rd_out4, alu_result_out4, pc_branch_out4, memory_out4
							);

mux4to1_32bit mux2(alu_result_out4, memory_out4, pc_branch_out4, pc_4_out4, reg_dest_out4, write_data);


// end datapath

always@(*) begin
 r1 <= data1;
 r2 <= data2;
 re_mem <= memory_out;
 instruc <= in_out1;
 pc_now <= pc;
 pc_out <= pc_out1;
 pc_out_2 <= pc_out2;
 result_alu <= alu_result_out3;
 imm <= extend_imm;
 wd <= write_data;
 rd <= rd_out4;
 pc_b <= pc_branch_out4;
 //we <= w_reg_out3;
end

endmodule

