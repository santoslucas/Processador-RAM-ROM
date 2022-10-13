module dec3to8(E, W, Y);
	input E; // enable
	input [2:0] W;
	output [6:0] Y;
	reg [6:0] Y;
	
	always @(*) begin
		if (E == 0)
			Y = 7'b00000000;
	else
		case (W) // habilitadores de cada registrador
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
