//Lara Gama Santos & Lucas Santos Rodrigues
//Pratica 2

module proc2 (Resetn, Clock, Run, Done, _r0, _r1, _r2, _r3, _r4, _pc);
	input Resetn, Clock, Run;
	output reg Done;
	
	wire [15:0] DIN;
	wire [15:0] DATA;
	output wire [15:0] _r0, _r1, _r2, _r3, _r4, _pc;
	wire [15:0] r0, r1, r2, r3, r4, r5, r6, a, g, IR, pc, result, addr, dout, barrel_out;
	wire [2:0] III, rX, rY, b_type;
	wire Imm, Imm_BShifter, w, mvt_or_b, cond, zero, f;
	wire [1:0] SS; // operacoes de SHIFT/ROTATE
	wire [6:0] R_in;

	reg A_in, rX_in, G_in, IR_in, ADDR_in, DOUT_in, W_D, pc_incr, pc_in, F_in;
	reg [1:0] ALU_op; //ALU_op: add->00, sub->01, and->10, barrelShifter->11
	reg [15:0] BusWires;
	reg [2:0] Tstep_D, Tstep_Q; //Estagios
	reg [3:0] Select;

	assign III = IR[15:13];
	assign Imm = IR[12]; // operacoes com/sem imediato
	assign rX = IR[11:9];
	assign rY = IR[2:0];
	assign mvt_or_b = IR[12];
	assign b_type = IR[11:9]; // tipo de desvio
	assign SS = IR[6:5]; // operacoes de SHIFT/ROTATE
	assign Imm_BShifter = IR[7]; // desvio com/sem imediato
	
	assign _r0 = r0;
	assign _r1 = r1;
	assign _r2 = r2;
	assign _r3 = r3;
	assign _r4 = r4;
	assign _pc = pc;
	
	dec3to8 decX (rX_in, rX, R_in); // produce r0 - r7 register enables
	ram memDados (addr, Clock, dout, w, DATA); //memoria de dados
	rom memInst ((pc-1), Clock, DIN); // memoria de instrucoes

	parameter T0 = 3'b000, T1 = 3'b001, T2 = 3'b010, T3 = 3'b011, T4 = 3'b100, T5 = 3'b101; // estagios
	
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
	parameter mv = 3'b000, mvt_b = 3'b001, add = 3'b010, sub = 3'b011, ld = 3'b100, st = 3'b101, And = 3'b110, shift_rot = 3'b111;
	// selectors for the BusWires multiplexer
	parameter R0 = 4'b0000, R1 = 4'b0001, R2 = 4'b0010,
	R3 = 4'b0011, R4 = 4'b0100, R5 = 4'b0101, R6 = 4'b0110, PC = 4'b0111, G = 4'b1000,
	IR8_IR8_0 /* signed-extended immediate data */ = 4'b1001,
	IR7_0_0 /* immediate data << 8 */ = 4'b1010,
	data = 4'b1011;

	// control FSM outputs
	always @(*) begin
		IR_in = 0; rX_in = 1'b0; Done = 1'b0; A_in = 1'b0; G_in = 1'b0; ADDR_in = 1'b0; DOUT_in = 1'b0; 
		W_D = 1'b0; pc_incr = 1'b0; pc_in = 1'b0; F_in = 1'b0; // valores iniciais de cada variavel
		case (Tstep_Q)
			T0: begin
				Select = PC;
				ADDR_in = 1'b1;
				pc_incr = 1'b1; // incrementa PC
			end
			T1: begin
				// ESPERA
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
					shift_rot: begin
						Select = rX;
						A_in = 1'b1;
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
				shift_rot: begin
						if (!Imm_BShifter) Select = rY; 
						else Select = IR8_IR8_0;
						ALU_op = 2'b11;
						G_in = 1'b1;
						F_in = 1'b1;
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
						pc_in = 1'b1; // enable PC
						Done = 1'b1;
					end
				end
				shift_rot: begin
						Select = G; 
						rX_in = 1'b1; // enable rX
						Done = 1'b1;
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
	
	//OUTROS REGISTRADORES
	regn reg_G (result,   Resetn, G_in,    Clock, g );
	regn reg_A (BusWires, Resetn, A_in,    Clock, a );
	regn reg_IR(DIN,      Resetn, IR_in,   Clock, IR);
	W wren (W_D, Clock, w);
	
	//COMUNICACAO COM A MEMORIA
	regn ADDR(BusWires,   Resetn, ADDR_in, Clock, addr);
	regn DOUT(BusWires,   Resetn, DOUT_in, Clock, dout);
	
	// ULA
	ULAn ula (a, BusWires, barrel_out, ALU_op, result, zero);
	
	//REGISTRADOR F
	F F_1 (F_in, zero, Clock, f);
	
	// Barrel Shifter
	barrel barrelShifter(SS, BusWires[3:0], a, barrel_out);

	// MULTIPLEXADOR: define the internal processor bus
	always @(*) begin
		case (Select)
			R0: BusWires <= r0;
			R1: BusWires <= r1;
			R2: BusWires <= r2;
			R3: BusWires <= r3;
			R4: BusWires <= r4;
			R5: BusWires <= r5;
			R6: BusWires <= r6;
			PC: BusWires <= pc;
			G: BusWires <= g;
			IR8_IR8_0: BusWires <= {{7{IR[8]}}, IR[8:0]};
			IR7_0_0: BusWires <= {IR[7:0], 8'b00000000};
			data: BusWires <= DATA;
			default: BusWires = 16'bxxxxxxxxxxxxxxxx;
		endcase
	end
endmodule
