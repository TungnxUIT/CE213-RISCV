`timescale 1ps/100fs 
module instruction_mem(pc, instruction);
input[31:0] pc;
output reg[31:0] instruction;

reg[7:0] storage[255:0];

initial begin
$readmemb("input.txt", storage);
end

always@(pc) begin
	  instruction = {storage[pc], storage[pc + 1], storage[pc + 2], storage[pc + 3]};
end

endmodule

