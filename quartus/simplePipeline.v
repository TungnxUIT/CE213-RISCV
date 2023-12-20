`timescale 1ps/100fs 
module simplePipeline(clk, data_in, data_out);
input clk;
input[7:0] data_in;
output reg[7:0] data_out;

always@(posedge clk) begin
	data_out <= #5 data_in;
end
endmodule


