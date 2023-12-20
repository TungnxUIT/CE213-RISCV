module alu(alu_opcode,operand_a,operand_b, alu_result,branch);
input [31:0] operand_a;
input [31:0] operand_b;
input [4:0] alu_opcode;
output reg [31:0] alu_result;
output reg branch;


initial begin
	branch = 0;
end

always@(*)
begin
     case(alu_opcode)
     5'b00000: alu_result = operand_a + operand_b; //add
	  5'b00001: alu_result = operand_a << operand_b; //sll
	  5'b00010: alu_result = $signed(operand_a) < $signed(operand_b) ? 1'b1 : 1'b0; //slt
	  5'b00011: alu_result = $unsigned(operand_a) < $unsigned(operand_b) ? 1'b1 : 1'b0; //sltu
	  5'b00100: alu_result = operand_a ^ operand_b; //xor
	  5'b00101: alu_result = operand_a >> operand_b; //srl
	  5'b10101: alu_result = operand_a >>> operand_b;	//sra
	  5'b00110: alu_result = operand_a | operand_b; //or
	  5'b00111: alu_result = operand_a & operand_b; //and
	  5'b10000: alu_result = operand_a - operand_b; //sub
	  5'b11000: alu_result = operand_a * operand_b;//mul
	  5'b11100: alu_result = operand_a / operand_b;//div
	  5'b11110: alu_result = operand_b;	//lui
	  5'b10001:	alu_result = operand_a + operand_b;	//forward with add
     default: alu_result = 0;
     endcase
end
always@(*)
begin 
case(alu_opcode)
	  5'b01000: branch = (operand_a == operand_b); //beq
	  5'b01001: branch = (operand_a != operand_b);//bne
	  5'b01100: branch = ($signed(operand_a) < $signed(operand_b)); //blt
	  5'b01101: branch = ($signed(operand_a) >= $signed(operand_b)); //bge;
	  5'b01110: branch = operand_a < operand_b; //bltu
	  5'b01111: branch = operand_a >= operand_b; //bgeu
	  5'b10001: branch = 1; 		//forward with branch
	  default: branch = 0;
endcase
end
endmodule