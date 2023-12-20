module mux3to1_32bit( a, b, c, sel, out);
input[1:0] sel;
input[31:0] a, b, c;
output reg[31:0] out;

always@(*) begin
	if(sel == 0) out <= a;
	else if(sel == 1) out <= b;
	else if(sel == 2) out <= c;
	else out <= 0;
end

endmodule