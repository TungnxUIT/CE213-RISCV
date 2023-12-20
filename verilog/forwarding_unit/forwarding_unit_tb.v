`timescale 1ps/100fs 
module forwarding_unit_tb();
reg clk;
reg[4:0] rd, rs1, rs2;
wire[1:0] rs1_src, rs2_src;

initial begin
	clk = 0;
	
	#5 clk = 1;
	rd = 0; rs1 = 1; rs2 = 2;
	#5 clk = 0;
	
	#5 clk = 1;
	rd = 1; rs1 = 0; rs2 = 2;
	#5 clk = 0;
	
	#5 clk = 1;
	rd = 1; rs1 = 0; rs2 = 1;
	#5 clk = 0;
	
	#5 clk = 1;
	rd = 3; rs1 = 1; rs2 = 2;
	#5 clk = 0;
	
end
forwarding_unit fw_tb(clk, rd, rs1, rs2, rs1_src, rs2_src);
endmodule