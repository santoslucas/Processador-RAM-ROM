module Display(A, /*Clock,*/ saida);

    input [3:0] A; // valor
    output reg [6:0] saida; // Saída do display de sete segmentos
	 
    always @(*) begin
        case(A)
        4'b0000: saida <= 7'b1000000; // 0
        4'b0001: saida <= 7'b1111001; // 1
        4'b0010: saida <= 7'b0100100; // 2
        4'b0011: saida <= 7'b0110000; // 3
        4'b0100: saida <= 7'b0011001; // 4
        4'b0101: saida <= 7'b0010010; // 5
        4'b0110: saida <= 7'b0000010; // 6
        4'b0111: saida <= 7'b1111000; // 7
        4'b1000: saida <= 7'b0000000; // 8
        4'b1001: saida <= 7'b0010000; // 9
		  4'b1010: saida <= 7'b0001000; // A
		  4'b1011: saida <= 7'b0000011; // B
		  4'b1100: saida <= 7'b1000110; // C
		  4'b1101: saida <= 7'b0100001; // D
		  4'b1110: saida <= 7'b0000110; // E
		  4'b1111: saida <= 7'b0001110; // F
        default: saida <= 7'b1111111; // Desativamos todos os segmentos
        endcase
    end
endmodule
