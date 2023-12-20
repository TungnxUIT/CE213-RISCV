`timescale 1ps/100fs 
module riscv_cpu_ver3_tb();
reg clk, reset;
wire[31:0] s0, s1, s2, s3;	//Thanh ghi $0, $1, $2, $3 trong register file
reg[7:0] count_cycle;		//Dem chu ky
parameter PERIOD = 20;
initial begin					//Reset ban dau cho Datapath
	count_cycle = 0;
	clk = 0;
	reset = 1;
	#5 reset = 0;
end
always #((PERIOD)/2) begin
		clk = ~clk;
		if(clk) count_cycle = count_cycle + 1;		//Hoan thanh 1 chu ky
end
  always @* begin
    if (s2 == -1)begin
		$display("So fibonanci can tim: %d", s1);
		$display("So chu ky cycle: %d", count_cycle);
		$stop;		//Dung chuong trinh khi s2 = -1
	 end
  end
riscv_cpu_ver3 ver3_tb(clk, reset, s0, s1, s2, s3);
endmodule