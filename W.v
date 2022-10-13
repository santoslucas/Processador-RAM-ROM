module W (W_D, Clock, w);
	input W_D, Clock; 
	output reg w;

	always @(posedge Clock) begin 
		if(W_D) begin //W_D habilita escritas na memoria
			w = 1'b1;
		end
		else begin
			w = 1'b0;
		end
	end
endmodule
