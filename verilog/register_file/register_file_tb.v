module register_file_tb();
reg clk, we;
reg[4:0] rs1, rs2, rd;
reg[31:0] data_in;
reg reset;
wire[31:0] data1, data2;
initial begin
	clk = 0;
	reset = 1;
	#1 reset = 0;
	
	#10 clk = 1;
	rs1 = 5'd1; rs2 = 5'd2; rd = 5'd3; data_in = 32'd16; we = 1;	//$3 = 16
	#10 clk = 0;
	
	#10 clk = 1;
	rs1 = 5'd3; rs2 = 5'd2; rd = 5'd2; data_in = 32'd8; we = 0;
	#10 clk = 0;
	
	#10 clk = 1;
	rs1 = 5'd3; rs2 = 5'd2; rd = 5'd2; data_in = 32'd8; we = 1;		//$2 = 8
	#10 clk = 0;
	
	#10 clk = 1;
	#10 clk = 0;
end
 register_file rf1(
    .clk(clk),
	 .we(we),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .data_in(data_in),
    .reset(reset),
    .data1(data1),
    .data2(data2)
  );
endmodule