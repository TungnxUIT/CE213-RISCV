`timescale 1ps/100fs 
module register_file(clk, rs1, rs2, rd, data_in, data1, data2, we, reset, s0, s1, s2, s3);
  input clk;
  input we;
  input[4:0] rs1, rs2, rd;
  input[31:0] data_in;
  input reset;
  output reg [31:0] data1, data2, s0, s1, s2, s3;


  reg [31:0] storage[31:0];
  integer i;

  always @(negedge clk or posedge reset) begin
	i = 0;
    if (reset) begin
      for (i = 0; i < 32; i = i + 1)
        storage[i] <= 0;
    end
	 else begin
		if(we) begin
			storage[rd] = data_in;
		end
	end
  end

  always @(*) begin
    if (!reset) begin
      data1 = storage[rs1];
      data2 = storage[rs2];
    end
  end
	always@(*) begin
	s0 <= storage[0];
	s1 <= storage[1];
	s2 <= storage[2];
	s3 <= storage[3];
	end
endmodule
