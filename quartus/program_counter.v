`timescale 1ps/100fs
module program_counter(clk, pc_next, reset, pc, pc_4);
input clk, reset;
input [31:0] pc_next;
output reg[31:0] pc, pc_4;

initial begin
	pc = 0;
	pc_4 = pc + 4;
end

always @(posedge clk or posedge reset) begin
  if (reset) begin
    pc = -4;  // Set pc to 0 when reset is asserted
	 pc_4 = 0;
  end else begin
    pc = pc_next;
  end
	pc_4 = pc + 4;	//wait for updating pc before updating pc_4
end

endmodule