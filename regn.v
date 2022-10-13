module regn (BusWires, Resetn, enable, Clock, dado);
	input [15:0] BusWires;
	input Resetn, enable, Clock;
	output reg [15:0] dado;
	
	initial begin
		dado <= 16'b0; //dado zerado
	end

	// Escrita
	always @(posedge Clock, negedge Resetn) begin
		if(!Resetn) begin 
			dado <= 16'b0; //reset
		end
		else if(enable) begin //escreve novo dado
			dado <= BusWires; 
		end
	end
endmodule
