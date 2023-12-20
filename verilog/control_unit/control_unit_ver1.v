module control_unit_ver1(op, func7, func3, w_reg, alu_op, r_dm, w_dm, sign_ext, branch, alu_src, reg_dest, pc_sel);
input[6:0] op, func7;
input[2:0] func3;
output reg[2:0] r_dm, sign_ext;
output reg w_reg, branch, alu_src, pc_sel;
output reg[4:0] alu_op;
output reg[1:0] w_dm, reg_dest;

always @(*) begin
	w_reg = 0;
  r_dm = 0;
  w_dm = 0;
  alu_src = 0;
  branch = 0;
  reg_dest = 0;
  pc_sel = 0;
  alu_op = 0;
  sign_ext = 0;
		case(op)
			7'b0110011: begin			// R-type
				w_reg = 1; r_dm = 0; w_dm = 0; alu_src = 0; branch = 0; reg_dest = 0;
				
				if(func7 == 7'b0000000) begin
					case (func3)
						3'b000: alu_op = 5'b00000; //add   
						3'b001: alu_op = 5'b00001; // sll                         
						3'b010: alu_op = 5'b00010; // slt                            
						3'b011: alu_op = 5'b00011; // sltu                             
						3'b100: alu_op = 5'b00100; // XOR                             
						3'b101: alu_op = 5'b00101; // SRL                             
						3'b110: alu_op = 5'b00110; // OR                           
						3'b111: alu_op = 5'b00111; // AND
					endcase
				end
				else if(func7 == 7'b0100000) begin
					case (func3)
						3'b000: alu_op = 5'b10000; //SUB   
						3'b101: alu_op = 5'b10101; // SRA
						default: alu_op = 5'b00000;
					endcase
				end
				else if(func7[6:0] == 7'b0111011) begin
					case (func3)
						3'b000: alu_op = 5'b11000; //MUL    
						3'b001: alu_op = 5'b11001; // MULH                           
						3'b010: alu_op = 5'b11010 ;// MULHSU                             
						3'b011: alu_op = 5'b11011;// MULHU                             
						3'b100: alu_op = 5'b11100 ;// DIV                            
						3'b101: alu_op = 5'b11101; // REM                             
						3'b111: alu_op = 5'b11111; // REMU
						default: alu_op = 5'b00000;
					endcase
				end
			end
			
			7'b0100011: begin		// S-type
				w_reg = 0; r_dm = 0; alu_src = 1; branch = 0; sign_ext = 2; alu_op = 0;  // add

				case(func3)
					3'b000: w_dm = 1;		//SB
					3'b001: w_dm = 2;		//SH
					3'b010: w_dm = 3;		//SW
					default: w_dm = 0;
				endcase
			end
			
			7'b0000011: begin		//I-type load instruction
				w_reg = 1; w_dm = 0; alu_src = 1; branch = 0; reg_dest = 1; sign_ext = 0; alu_op = 0;  // add
				
				case(func3)
					3'b000: r_dm = 1;		//LB
					3'b001: r_dm = 2;		//LH
					3'b010: r_dm = 3;		//LW
					3'b100: r_dm = 4;		//LBU
					3'b101: r_dm = 5;		//LHU
					default: r_dm = 0;
				endcase
			end
			
			7'b0010011: begin			//I-type
				w_reg = 1; w_dm = 0; r_dm = 0; alu_src = 1; branch = 0; reg_dest = 0;
				
				case(func3)
					3'b000: begin  
						alu_op = 5'b00000; //add
						sign_ext = 3'b000;
					end
					3'b001: begin                          
						alu_op = 5'b00001; // sll
						sign_ext = 3'b001;
					end
					3'b010: begin                            
						alu_op = 5'b00010; // slt
						sign_ext = 3'b000;
					end
					3'b011: begin                            
						alu_op = 5'b00011; // sltu
						sign_ext = 3'b001;
					end
					3'b100: begin                            
						alu_op = 5'b00100; // XOR
						sign_ext = 3'b001;
					end
					3'b101: begin                            
						alu_op = 5'b00101; // SRL
						sign_ext = 3'b001;
					end
					3'b110: begin                            
						alu_op = 5'b00110; // OR
						sign_ext = 3'b001;
					end
					3'b111: begin                            
						alu_op = 5'b00111; // AND
						sign_ext = 3'b001;
					end
					default: begin w_reg = 1; w_dm = 0; r_dm = 0; alu_src = 1; branch = 0; sign_ext = 4; alu_op = 5'b00000; reg_dest = 2; pc_sel = 1; end	// AUIPC
				endcase
			end
			7'b1000000: begin 	//SRAI
				w_reg = 1; w_dm = 0; r_dm = 0; alu_src = 1; branch = 0; reg_dest = 0; alu_op = 5'b10101; sign_ext = 3'b001;
			end
			
			7'b1100111: begin		//JALR
				w_reg = 1; w_dm = 0; r_dm = 0; alu_src = 1; branch = 1; reg_dest = 2; alu_op = 5'b10001; sign_ext = 0; pc_sel = 1;
			end
			
			7'b1100011: begin		//B-type
				w_reg = 0; w_dm = 0; r_dm = 0; alu_src = 0; branch = 1; sign_ext = 3; pc_sel = 0; 
				
				case(func3)
					3'b000: alu_op = 5'b01000;    
					3'b001: alu_op = 5'b01001;                            
					3'b100: alu_op = 5'b01100 ;                             
					3'b101: alu_op = 5'b01101;                            
					3'b110: alu_op = 5'b01110 ;                             
					3'b111: alu_op = 5'b01111;
					default: alu_op = 5'b00000;
				endcase
			end
			
			7'b0110111: begin		//LUI
				w_reg = 1; w_dm = 0; r_dm = 0; alu_src = 1; branch = 0; sign_ext = 4; alu_op = 5'b11110; reg_dest = 0;
			end
			
			7'b1101111: begin		//JAL
				w_reg = 1; w_dm = 0; r_dm = 0; branch = 1; sign_ext = 5; pc_sel = 0; alu_op = 5'b10001; reg_dest = 2;
			end
			
			7'b1111111: begin
			w_reg = 0; w_dm = 0; r_dm = 0; branch = 1; alu_op = 5'b10001; pc_sel = 0; sign_ext = 1;
			end	//nop: pc = pc + imm (imm = 0 currently)
			
			default: begin w_reg = 0; w_dm = 0; r_dm = 0; branch = 0; alu_op = 0; pc_sel = 0; sign_ext = 0; reg_dest = 0; alu_src = 0; end
		endcase
	end
	
endmodule