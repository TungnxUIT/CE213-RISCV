`timescale 1ps/100fs 
module pc_ins_mem_tb();
reg clk, reset;
wire[31:0] instruction, pc, pc_4;

initial begin
	clk = 0;
	reset = 1;
	#5 reset = 0;
	
	#10 clk = 1;
	
	#10 clk = 0;
	
	#10 clk = 1;
	
	#10 clk = 0;
	
	#10 clk = 1;
	
	#10 clk = 0;
	
	#10 clk = 1;
	
	#10 clk = 0;
end
pc_ins_mem pcc_tb(clk, reset, instruction, pc, pc_4);
endmodule
