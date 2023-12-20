module mux4to1_32bit(a, b, c, d, sel, out);
input[31:0] a, b, c, d;
input[1:0] sel;
output[31:0] out;

assign out = (sel == 0) ? a : (sel == 1) ? b : (sel == 2) ? c : d;

endmodule