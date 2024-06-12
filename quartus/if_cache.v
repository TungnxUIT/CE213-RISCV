`timescale 1ps/100fs 
module if_cache(clk, busy, reset, reset2, pc, pc_4, instruction, pc_out, pc_4_out, instruction_out);
input clk, reset, reset2, busy;
input[31:0] pc, pc_4, instruction;
output reg[31:0] pc_out, pc_4_out, instruction_out;

//wire[31:0] storage_pc, storage_pc4, storage_instruction;


always@(posedge clk or posedge reset) begin
		if(reset) begin
			pc_out <= 0;
			pc_4_out <= 0;
			instruction_out <= 32'bz;
		end
		else if(reset2) begin
			pc_out <= pc;
			pc_4_out <= pc_4;
			instruction_out <= instruction;
		end
		else if(!busy) begin
		pc_out <= pc;
		pc_4_out <=  pc_4;
		instruction_out <=  instruction;
		end

end

endmodule

