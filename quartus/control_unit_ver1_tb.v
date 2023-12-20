module control_unit_ver1_tb();
reg[6:0] op, func7;
reg[2:0] func3;
wire[2:0] r_dm, sign_ext;
wire w_reg, branch, alu_src, pc_sel, b_or_j;
wire[4:0] alu_op;
wire[1:0] w_dm, reg_dest;

initial begin
	#5
	op = 7'b0110011; func7 = 7'b0000000; func3 = 3'b000;		//add
	#5
	op = 7'b0110011; func7 = 7'b0100000; func3 = 3'b101;		//sra
	#5
	op = 7'b0000011; func3 = 3'b010;								//lw
	#5
	op = 7'b0010011; func3 = 3'b001;								//slli
	#5
	op = 7'b0100011; func3 = 3'b001;								//sh
	#5
	op = 7'b1101111; func3 = 3'b010;								//jal
	#5
	op = 7'b1100111; func3 = 3'b000;								//jalr
	#5
	op = 7'b1100011; func3 = 3'b001;								//bne
	#5
	op = 7'b0110111; 														//lui
	#5 ;
end
control_unit_ver1 ctrl_ver1_tb(op, func7, func3, w_reg, alu_op, r_dm, w_dm, sign_ext, branch, alu_src, reg_dest, pc_sel, b_or_j);
endmodule