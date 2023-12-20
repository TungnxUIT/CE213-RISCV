module add_sub(a, b, sel, result);
input[31:0] a, b;
input sel;
output[31:0] result;
assign result = (sel) ? a - b : a + b;
endmodule