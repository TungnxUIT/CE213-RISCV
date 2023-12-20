`timescale 1ps/100fs 
module riscv_cpu_ver2_tb();
reg clk, reset, reset_cache;
wire[31:0] r1, r2, re_mem,instruc, pc_now, imm, result_alu, pc_out, pc_out_2, s0, s1, wd, pc_b;
wire[4:0] rd;
parameter PERIOD = 40;
initial begin
	clk = 0;
	reset_cache = 1;
	reset = 1;
	#5 reset = 0; reset_cache = 0;
end
  always #((PERIOD)/2) clk = ~clk;
riscv_cpu_ver2 cpu_tb_ver2(clk, reset, r1, r2, rd, re_mem, instruc, pc_now, imm, result_alu, pc_out, pc_out_2, s0, s1, wd, pc_b);
endmodule