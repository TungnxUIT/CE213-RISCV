`timescale 1ps/100fs 
module riscv_cpu_ver1_tb();
reg clk, reset;
wire[31:0] r1, r2, re_mem,instruc, pc_now, imm, result_alu, adder_res, pc_n;
wire jump, alu_branch, pc_s;

initial begin

	clk = 0;
	reset = 1;
	#5 reset = 0;
	
	#10 clk = 1; #10 clk = 0;
	#10 clk = 1; #10 clk = 0;
	#10 clk = 1; #10 clk = 0;
	#10 clk = 1; #10 clk = 0;
	#10 clk = 1; #10 clk = 0;
	#10 clk = 1; #10 clk = 0;
	#10 clk = 1; #10 clk = 0;
	#10 clk = 1; #10 clk = 0;
	#10 clk = 1; #10 clk = 0;
	#10 clk = 1; #10 clk = 0;

end
riscv_cpu_ver1 cpu_tb_ver1(clk, reset, r1, r2, re_mem, instruc, pc_now, imm, result_alu, jump, alu_branch, adder_res, pc_n, pc_s);
endmodule