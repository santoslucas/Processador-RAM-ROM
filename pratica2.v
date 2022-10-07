//Lara Gama Santos & Lucas Santos Rodrigues
//Pratica 2

module pratica2 (Resetn, Clock, Run, Done);
	input Resetn, Clock, Run;
	output reg Done;
	
	wire [15:0] DIN;
	wire [15:0] DATA;
	wire [15:0] r0, r1, r2, r3, r4, r5, r6, a, g, IR, pc, result, addr, dout;
	wire [2:0] III, rX, rY, b_type;
	wire Imm, w, mvt_or_b, cond, zero, f;
	wire [6:0] R_in;

	reg A_in, rX_in, G_in, IR_in, ADDR_in, DOUT_in, W_D, pc_incr, pc_in, F_in;
	reg [1:0] ALU_op; //ALU_op: add->00, sub->01, and->10
	reg [15:0] BusWires;
	reg [2:0] Tstep_D, Tstep_Q;
	reg [3:0] Select;

	assign III = IR[15:13];
	assign Imm = IR[12];
	assign rX = IR[11:9];
	assign rY = IR[2:0];
	assign mvt_or_b = IR[12];
	assign b_type = IR[11:9];
	
	dec3to8 decX (rX_in, rX, R_in); // produce r0 - r7 register enables
	ram memDados (addr, Clock, dout, w, DATA);
	rom memInst (pc, Clock, DIN);

	parameter T0 = 3'b000, T1 = 3'b001, T2 = 3'b010, T3 = 3'b011, T4 = 3'b100, T5 = 3'b101;
	
	initial begin
		Tstep_D = T0;
		Tstep_Q = T0;
		IR_in = 0;
		A_in = 0;
		G_in = 0;
		Done = 0;
		ADDR_in = 0;
		DOUT_in = 0;
		W_D = 0;
		pc_in = 0;
		pc_incr = 0;

	end
	
	// Control FSM state table
	always @(Tstep_Q, Run, Done)
		case (Tstep_Q)
			T0: // data is loaded into IR in this time step
				if (~Run) Tstep_D = T0;
				else Tstep_D = T1;
			T1: begin
				if (~Done) Tstep_D = T2;
				else Tstep_D = T0;
			end
			T2: begin
				if (~Done) Tstep_D = T3;
				else Tstep_D = T0;
			end
			T3: begin
				if (~Done) Tstep_D = T4;
				else Tstep_D = T0;
			end
			T4: begin
				if (~Done) Tstep_D = T5;
				else Tstep_D = T0;
			end
			T5: begin
				if (~Done) Tstep_D = T0;
				else Tstep_D = T0;
			end
	endcase
	
	parameter b = 3'b000, beq = 3'b001, bne = 3'b010;
	parameter mv = 3'b000, mvt_b = 3'b001, add = 3'b010, sub = 3'b011, ld = 3'b100, st = 3'b101, And = 3'b110;
	// selectors for the BusWires multiplexer
	parameter R0 = 4'b0000, R1 = 4'b0001, R2 = 4'b0010,
	R3 = 4'b0011, R4 = 4'b0100, R5 = 4'b0101, R6 = 4'b0110, PC = 4'b0111, G = 4'b1000,
	IR8_IR8_0 /* signed-extended immediate data */ = 4'b1001,
	IR7_0_0 /* immediate data << 8 */ = 4'b1010,
	data = 4'b1011;

	// control FSM outputs
	always @(*) begin
		IR_in = 0; rX_in = 1'b0; Done = 1'b0; A_in = 1'b0; G_in = 1'b0; ADDR_in = 1'b0; DOUT_in = 1'b0; 
		W_D = 1'b0; pc_incr = 1'b0; pc_in = 1'b0; F_in = 1'b0; ALU_op = 2'b11; //default values for variables

		case (Tstep_Q)
			T0: begin
				Select = PC;
				ADDR_in = 1'b1;
				pc_incr = 1'b1;
			end
			T1: begin
				
			end

			T2: begin// store DIN into IR
				IR_in = 1'b1;
			end
			T3: begin// define signals in time step T3
				case (III)
					mv: begin
						if (!Imm) Select = rY; // mv rX, rY
						else Select = IR8_IR8_0; // mv rX, #D
						rX_in = 1'b1; // enable rX
						Done = 1'b1;
					end
					mvt_b: begin
						if(mvt_or_b) begin //mvt instruction
							Select = IR7_0_0; // mvt rX, #D
							rX_in = 1'b1; // enable rX
							Done = 1'b1;
						end
						else begin //branch instruction
							Select = PC;
							A_in = 1'b1;
							if(b_type == beq) begin
								if(!f) begin //condition is not satisfied
									Done = 1'b1;
								end
							end
							else if(b_type == bne) begin
								if(f) begin //condition is not satisfied
									Done = 1'b1;
								end
							end
						end
					end
					add: begin
						Select = rX;
						A_in = 1'b1;
					end
					sub: begin
						Select = rX;
						A_in = 1'b1;
					end
					And: begin
						Select = rX;
						A_in = 1'b1;
					end
					ld: begin
						Select = rY;
						ADDR_in = 1'b1;
					end
					st: begin
						Select = rY;
						ADDR_in = 1'b1;
					end
					default: ;
				endcase
			end
			T4: begin// define signals in time step T4
				case (III)
				add: begin
					if (!Imm) Select = rY; 
					else Select = IR8_IR8_0;
					ALU_op = 2'b00;
					G_in = 1'b1;
					F_in = 1'b1;
				end
				sub: begin
					if (!Imm) Select = rY; 
					else Select = IR8_IR8_0; 
					ALU_op = 2'b01;
					G_in = 1'b1;
					F_in = 1'b1;
				end
				And: begin
					if (!Imm) Select = rY; 
					else Select = IR8_IR8_0; 
					ALU_op = 2'b10;
					G_in = 1'b1;
					F_in = 1'b1;
				end
				st: begin
					Select = rX; 
					DOUT_in = 1'b1;
					W_D = 1'b1;
					Done = 1'b1;
				end
				mvt_b: begin
					if(!mvt_or_b) begin // branch instruction 
						ALU_op = 2'b00;
						Select = IR8_IR8_0;
						G_in = 1'b1;
					end
				end
				default: ;
				endcase
			end
			T5: begin// define signals in time step T5
				case (III)
				add: begin
					Select = G;
					rX_in = 1'b1; // enable rX
					Done = 1'b1;
				end
				sub: begin
					Select = G;
					rX_in = 1'b1; // enable rX
					Done = 1'b1;
				end
				And: begin
					Select = G;
					rX_in = 1'b1; // enable rX
					Done = 1'b1;
				end
				ld: begin
					Select = data;
					rX_in = 1'b1; // enable rX
					Done = 1'b1;
				end
				mvt_b: begin
					if(!mvt_or_b) begin // branch instruction 
						Select = G;
						pc_in = 1'b1;
						Done = 1'b1;
					end
				end
				default: ;
				endcase
			end
		endcase
	end

	// Control FSM flip-flops
	always @(posedge Clock, negedge Resetn)
		if (!Resetn)
			Tstep_Q = T0;
		else
			Tstep_Q = Tstep_D;

	//REGISTRADORES	
	regn reg_0 (BusWires, Resetn, R_in[0], Clock, r0);
	regn reg_1 (BusWires, Resetn, R_in[1], Clock, r1);
	regn reg_2 (BusWires, Resetn, R_in[2], Clock, r2);
	regn reg_3 (BusWires, Resetn, R_in[3], Clock, r3);
	regn reg_4 (BusWires, Resetn, R_in[4], Clock, r4);
	regn reg_5 (BusWires, Resetn, R_in[5], Clock, r5);
	regn reg_6 (BusWires, Resetn, R_in[6], Clock, r6);
	
	//PC
	programCounter PC_1 (BusWires, Resetn, pc_incr, pc_in, Clock, pc);
	
	regn reg_G (result,   Resetn, G_in,    Clock, g );
	regn reg_A (BusWires, Resetn, A_in,    Clock, a );
	regn reg_IR(DIN,      Resetn, IR_in,   Clock, IR);
	W wren (W_D, Clock, w);
	
	//COMUNICAÃ‡ÃƒO COM A MEMÃ“RIA
	regn ADDR(BusWires,   Resetn, ADDR_in, Clock, addr);
	regn DOUT(BusWires,   Resetn, DOUT_in, Clock, dout);

	ULAn ula (a, BusWires, ALU_op, result, zero);
	F F_1 (F_in, zero, Clock, f);

	// MULTIPLEXADOR: define the internal processor bus
	always @(*) begin
		case (Select)
			R0: BusWires = r0;
			R1: BusWires = r1;
			R2: BusWires = r2;
			R3: BusWires = r3;
			R4: BusWires = r4;
			R5: BusWires = r5;
			R6: BusWires = r6;
			PC: BusWires = pc;
			G: BusWires = g;
			IR8_IR8_0: BusWires = {{7{IR[8]}}, IR[8:0]};
			IR7_0_0: BusWires = {IR[7:0], 8'b00000000};
			data: BusWires = DATA;
			default: BusWires = 16'bxxxxxxxxxxxxxxxx;
		endcase
	end
endmodule
	
module dec3to8(E, W, Y);
	input E; // enable
	input [2:0] W;
	output [6:0] Y;
	reg [6:0] Y;
	
	always @(*) begin
		if (E == 0)
			Y = 7'b00000000;
	else
		case (W)
			3'b000: Y = 7'b0000001;
			3'b001: Y = 7'b0000010;
			3'b010: Y = 7'b0000100;
			3'b011: Y = 7'b0001000;
			3'b100: Y = 7'b0010000;
			3'b101: Y = 7'b0100000;
			3'b110: Y = 7'b1000000;
		endcase
	end
endmodule

module regn (BusWires, Resetn, enable, Clock, dado);
	input [15:0] BusWires;
	input Resetn, enable, Clock;
	output reg [15:0] dado;

	// Escrita
	always @(posedge Clock, negedge Resetn) begin
		if(!Resetn) begin
			dado = 16'bx;
		end
		else if(enable) begin
			dado = BusWires;
		end
	end
endmodule

module ULAn (in_1, in_2, OPcode, result, zero);
	input [15:0] in_1, in_2;
	input  [1:0]OPcode;
	output reg [15:0] result;
	output reg zero;
	
	always@(*) begin
		if(OPcode == 2'b00) //add
			result = (in_1 + in_2);
		if(OPcode == 2'b01)// sub
			result = (in_1 - in_2);
		else if (OPcode == 2'b10) begin // and
			if (in_1 & in_2) begin
				result = 16'b0000000000000001;
			end
			else begin
				result = 16'b0000000000000000;
			end
		end
	end
	
	always@(*) begin
		if(result == 0) begin
			zero = 1'b1;
		end
		else begin
			zero = 1'b0;
		end
	end
endmodule

module programCounter (BusWires, Resetn, pc_incr, pc_in, Clock, pc);
	input [15:0] BusWires;
	input Resetn, pc_incr, pc_in, Clock;
	output reg [15:0] pc;
	
	initial begin
		pc = 0;
	end

	always @(negedge Clock) begin   //apenas na borda de subida do clock o valor de PC Ã© atualizado
		if(Resetn) begin
			if(pc_in) begin //pc_in Ã© usado para fazer desvios (endereÃ§o Ã© armazenado em pc)
            	pc = (BusWires);
        	end
			else if(pc_incr) begin
				pc = pc + 1; //Ã‰ ASSIM QUE PEGA A PÅ”OXIMA INSTRUÃ‡ÃƒO?????????????
			end	
		end
		else begin
			pc = 0;
		end	
	end
endmodule

module W (W_D, Clock, w);
	input W_D, Clock; 
	output reg w;

	always @(posedge Clock) begin 
		if(W_D) begin //W_D habilita escritas na memÃ³ria
			w = 1'b1;
		end
		else begin
			w = 1'b0;
		end
	end
endmodule

module F (F_in, zero, Clock, f);
	input F_in, zero, Clock;
	output reg f;
	
	always@(posedge Clock) begin
		if(F_in) begin
			f = zero;
		end
	end
endmodule
