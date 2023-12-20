module riscv_cpu_ver1(clk, reset, r1, r2, re_mem, instruc, pc_now, imm, result_alu, jump, alu_branch, adder_res, pc_n, pc_s);
input clk, reset;

wire[31:0] write_data, data1, data2, memory_out, pc_next, pc_4, adder_in, pc_branch, in, pc, operand_b, alu_result, extend_imm;
wire[2:0] r_dm, sign_ext;
wire w_reg, branch, alu_src, pc_sel;
wire[4:0] alu_op;
wire[1:0] w_dm, reg_dest;
wire isbranch, pcsrc;

//test variable
output reg[31:0] r1, r2, re_mem, instruc, pc_now, imm, result_alu, adder_res, pc_n;
output reg jump, alu_branch, pc_s;


//begin datapath

program_counter pc1(clk, pc_next, reset, pc, pc_4);

instruction_mem ins(clk, pc, in);

// pipeline 1

control_unit_ver1 cltr_ver1(in[6:0], in[31:25], in[14:12], w_reg, alu_op, r_dm, w_dm, sign_ext, branch, alu_src, reg_dest, pc_sel);

register_file rf(clk, in[19:15], in[24:20], in[11:7], write_data, data1, data2, w_reg, reset);

sign_extend sign_ex(in[31:7], extend_imm, sign_ext);

// pipeline 2

mux2to1_32bit mux0(data2, extend_imm, alu_src, operand_b);

alu alu(alu_op, data1, operand_b, alu_result, isbranch);

// pipeline 3

data_memory dm(clk, alu_result, data2, w_dm, r_dm, reset, memory_out);

mux2to1_32bit mux1(pc, data1, pc_sel, adder_in);

adder adder1(adder_in, extend_imm, pc_branch);

// pipeline 4

mux4to1_32bit mux2(alu_result, memory_out, pc_branch, pc_4, reg_dest, write_data);

assign pcsrc = branch & isbranch;

mux2to1_32bit mux3(pc_4, pc_branch, pcsrc, pc_next);

// end datapath

always@(*) begin
 r1 <= data1;
 r2 <= data2;
 re_mem <= memory_out;
 instruc <= in;
 pc_now <= pc;
 result_alu <= alu_result;
 imm <= extend_imm;
 alu_branch <= isbranch;
 jump <= branch;
 adder_res <= pc_branch;
 pc_n <= pc_next;
 pc_s <= pc_sel;
end

endmodule

