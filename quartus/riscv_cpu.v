module riscv_cpu (
    clk, res
);

input clk;
output res;
always @(posedge clk ) begin
   res = clk 
end

    
endmodule