module sign_extend(data_in, data_out, sel);
input[24:0] data_in;
input[2:0] sel;
output reg[31:0] data_out;


always@(*) begin
	case(sel)
		0: data_out = {{20{data_in[24]}}, data_in[24:13]};			//I-type
		1: data_out = {20'b0, data_in[24:13]};			//I-type unsigned
		2: data_out = {{20{data_in[24]}}, data_in[24:18], data_in[4:0]};	//S-type
		3: data_out = {{20{data_in[24]}}, data_in[0], data_in[23:18], data_in[4:1], 1'b0};	//B-type
		4: data_out = {data_in[24:5], 12'b0};		//U-type
		5: data_out = {{12{data_in[24]}}, data_in[12:5], data_in[13], data_in[23:14], 1'b0};	//J-type
		default: data_out = 0;
	endcase
end

endmodule
