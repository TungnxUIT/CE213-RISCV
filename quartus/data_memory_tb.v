`timescale 1ps/100fs 
module data_memory_tb();
reg clk, reset;
reg[31:0] address, data_in;
reg[2:0] re;
reg[1:0] we;
wire[31:0] data_out, mem1;

initial begin
	clk = 0;
	reset = 1;
	#5 reset = 0;
	
	#5 clk = 1;
	address = 10; data_in = 32'h8000c0fe; re = 3; we = 0;
	#5 clk = 0;
	
	#5 clk = 1;
	address = 10; data_in = 32'h8000c0fe; we = 3; re = 0;	//sw 
	#5 clk = 0;
	
	#5 clk = 1;
	address = 10; data_in = 15; we = 0; re = 3;	//lw
	#5 clk = 0;
	
	#5 clk = 1;
	address = 10; data_in = 15; we = 0; re = 1;	//lb
	#5 clk = 0;
	
	#5 clk = 1;
	address = 10; data_in = 15; we = 0; re = 2;	//lh
	#5 clk = 0;
	
	#5 clk = 1;
	address = 10; data_in = 15; we = 0; re = 4;	//lbu
	#5 clk = 0;
	
	#5 clk = 1;
	address = 10; data_in = 15; we = 0; re = 5;	//lhu
	#5 clk = 0;
	
	#5 clk = 1;
	address = 32; data_in = 32'h8000c0fe; we = 1; re = 0;	//sb 
	#5 clk = 0;
	
	#5 clk = 1;
	address = 32; we = 0; re = 3;	//lw
	#5 clk = 0;
	
	#5 clk = 1;
	address = 32; data_in = 32'h8000c0fe; we = 2; re = 0;	//sh 
	#5 clk = 0;
	
	#5 clk = 1;
	address = 32; we = 0; re = 3;	//lw
	#5 clk = 0;
	
	#5 reset = 1;
	#1 reset = 0;
	
	#5 clk = 1;
	address = 10; data_in = 15; we = 0; re = 3;	//lw
	#20 clk = 0;
	
	#5 clk = 1;
	address = 10; data_in = 15; we = 0; re = 3;	//lw
	#20 clk = 0;
	

end
data_memory dm(clk, address, data_in, we, re, reset, data_out, mem1);
endmodule