`timescale 1ps/100fs 
module data_memory(clk, address, data_in, we, re, reset, data_out);
input clk, reset;
input[31:0] address, data_in;
input[2:0] re;
input[1:0] we;
output reg[31:0] data_out;

reg[7:0] storage[63:0];		//256x8 bit storage
integer i;
always@(posedge reset or negedge clk) begin
		if(reset) begin
			for(i=0; i < 64; i = i + 1)	
				storage[i] <= 0;		//clear storage
		end
		else begin
			case(we)	//write enable
				1: storage[address] <= data_in[7:0];		//sb
				2: for (i = 0; i < 2; i = i + 1)
						storage[address + i] <= data_in[i * 8 +: 8];	//sh
				3: for(i = 0; i < 4; i = i + 1)
						storage[address + i] <= data_in[i * 8 +: 8];	//sw
				default: ;
			endcase
		end
end

always@(*) begin
	if(!reset) begin
		case(re)		//read enable
			1: data_out = {{24{storage[address][7]}}, storage[address]};		//lb
			2: data_out = {{16{storage[address + 1][7]}}, storage[address + 1], storage[address]};		//lh
			3: data_out = {storage[address + 3], storage[address + 2], storage[address + 1], storage[address]};	//lw
			4: data_out = {24'b0, storage[address]};		//lbu
			5: data_out = {16'b0, storage[address + 1], storage[address]};		//lhu
			default: data_out = 32'bz;
		endcase
	end
end



endmodule