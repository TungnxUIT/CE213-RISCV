`timescale 1ps/100fs 
module simplePipeline_tb();
 reg clk;
  reg[7:0] data_in;
  wire[7:0] data_out;
  
  initial begin
	clk = 0;
	
	#10 clk = 1;
	data_in = 1;
	#3 data_in = 2;
	#10 clk = 0;
	
	#10 clk = 1;
	data_in = 3;
	#3 data_in = 4;
	#5 clk = 0;
	
	#10 clk = 1;
	data_in = 3;
	#10 clk = 0;
  end
  simplePipeline pl(clk, data_in, data_out);
endmodule