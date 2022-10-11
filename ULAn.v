module ULAn (in_1, in_2, barrel_out, OPcode, result, zero);
	input [15:0] in_1, in_2, barrel_out;
	input  [1:0]OPcode;
	output reg [15:0] result;
	output reg zero;
	
	always@(*) begin
		if(OPcode == 2'b00) //add
			result = (in_1 + in_2);
		else if(OPcode == 2'b01)// sub
			result = (in_1 - in_2);
		else if (OPcode == 2'b10) begin // and
			if (in_1 & in_2) begin
				result = 16'b0000000000000001;
			end
			else begin
				result = 16'b0000000000000000;
			end
		end
		else if (OPcode == 2'b11) begin
			result = barrel_out;
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
