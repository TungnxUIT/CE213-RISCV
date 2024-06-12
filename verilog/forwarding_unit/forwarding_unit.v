`timescale 1ps/100fs 
module forwarding_unit(clk, reset2, opcode, r_dm, rd, rs1, rs2, rs1_src, rs2_src, invalid, busy);
input clk, reset2;
input[2:0] r_dm;
input[4:0] rd, rs1, rs2;
input[6:0] opcode;
output reg[1:0] rs1_src, rs2_src;
output reg invalid;
output reg busy;
reg[4:0] storage_1;
reg[4:0] storage_2;

parameter[1:0] register = 0;
parameter[1:0] alu_1 = 1;
parameter[1:0] alu_2 = 2;
parameter[1:0] mem = 3;


always@(posedge clk) begin
	if(reset2) begin
		storage_2 <= 5'bz;
		storage_1 <= 5'bz;
	end
	else begin
		if(storage_1 == rs1) rs1_src <= alu_1;
		else if(storage_2 == rs1 && !r_dm) rs1_src <= alu_2;
		else if(storage_2 == rs1 && r_dm) rs1_src <= mem;
	else rs1_src <= register;
		
		if(storage_1 == rs2) rs2_src <= alu_1;
		else if(storage_2 == rs2 && !r_dm ) rs2_src <= alu_2;
		else if(storage_2 == rs2 && r_dm ) rs2_src <= mem;	
	else rs2_src <= register;
		
		if((storage_1 == rs1 || storage_1 == rs2) && opcode == 7'b0000011) busy <= 1;
	else busy <= 0;	
		
	if(storage_1 == rs2 && (opcode == 7'b0010011 || opcode == 7'b0000011 || opcode == 7'b0100011 || opcode == 7'b0110111 || opcode == 7'b1101111))
		invalid <= 1;
	else invalid <=  0;
	
		storage_2 <= storage_1;
		storage_1 <=  rd;
end
	end	

always @(negedge clk) begin

end
endmodule
