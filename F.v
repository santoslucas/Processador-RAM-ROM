module F (F_in, zero, Clock, f);
	input F_in, zero, Clock;
	output reg f;
	
	always@(posedge Clock) begin
		if(F_in) begin
			f = zero;
		end
	end
endmodule
