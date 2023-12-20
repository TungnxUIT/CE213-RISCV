module shift_left_logic(data_in, data_out, sel);
input[32:0] data_in;
input sel;
output[32:0] data_out;

assign data_out = (sel) ? (data_in << 12) : (data_in << 1);

endmodule