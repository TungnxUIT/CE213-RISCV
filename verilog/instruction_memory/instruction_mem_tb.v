module instruction_mem_tb();
reg clk;
reg[31:0] pc;
wire[31:0] instruction;

initial begin
	clk = 0;
	pc = 0;
	#10 clk = 1;
	
	#10 clk = 0;
end
instruction_mem ins_mem(pc, instruction);
endmodule