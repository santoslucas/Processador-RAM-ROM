module programCounter (BusWires, Resetn, pc_incr, pc_in, Clock, pc);
	input [15:0] BusWires;
	input Resetn, pc_incr, pc_in, Clock;
	output reg [15:0] pc;
	
	initial begin
		pc = 1'b0;
	end

	always @(posedge Clock) begin   //apenas na borda de subida do clock o valor de PC eh atualizado
		if(Resetn) begin
			if(pc_in) begin // operacoes de desvio
            	pc = (BusWires);
        	end
			else if(pc_incr) begin
				pc = pc + 1; // incrementa PC
			end	
		end
		else begin
			pc = 1'b0; // reseta PC
		end	
	end
endmodule
