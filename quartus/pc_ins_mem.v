
module pc_ins_mem(clk, reset, instruction, pc, pc_4);
input clk, reset;
output[31:0] instruction;

output[31:0] pc, pc_4;

program_counter pcc(clk, pc_4, reset, pc, pc_4);
instruction_mem ins_mem(clk, pc, instruction);

endmodule