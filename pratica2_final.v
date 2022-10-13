module pratica2_final (
    input wire [17:0] SW,
	 input wire CLOCK_50,

    output wire [6:0] HEX7,
    output wire [6:0] HEX6,
    output wire [6:0] HEX5,
    output wire [6:0] HEX4,
    output wire [6:0] HEX3,
    output wire [6:0] HEX2,
    output wire [6:0] HEX1,
    output wire [6:0] HEX0,
    output wire [7:0] LEDG
);
  wire Clock;
  Clock_divider #(50000000) divider (CLOCK_50, Clock); //delay clock

  wire [15:0] r0, r1, r2, r3, r4, pc;
  
  proc2 proc(1, Clock, 1, LEDG[0], r0, r1, r2, r3, r4, pc);

  // -------------------------- TESTE 1 ------------------------------
 /* Display D0(
    r0[3:0],
    HEX7
  );

  
	Display D1(
    r1[3:0],
    HEX6
  );

  Display D2(
    r2[3:0],
    HEX5
  );

  Display D3(
    r3[3:0],
    HEX4
  );
  
  assign HEX3 = 7'b1111111;
  assign HEX2 = 7'b1111111;
  assign HEX1 = 7'b1111111;
  assign HEX0 = 7'b1111111;*/
  
  // -------------------------- TESTE 2 ------------------------------
  /*Display D4(
    r0[15:12],
    HEX7
  );

  
	Display D5(
    r0[11:8],
    HEX6
  );

  Display D6(
    r0[7:4],
    HEX5
  );

  Display D7(
    r0[3:0],
    HEX4
  );
  
  Display D0(
    r1[15:12],
    HEX3
  );

  
	Display D1(
    r1[11:8],
    HEX2
  );

  Display D2(
    r1[7:4],
    HEX1
  );

  Display D3(
    r1[3:0],
    HEX0
  );*/
  
  // -------------------------- TESTE 3 ------------------------------
  /*Display D4(
    r0[15:12],
    HEX7
  );

  
	Display D5(
    r0[11:8],
    HEX6
  );

  Display D6(
    r0[7:4],
    HEX5
  );

  Display D7(
    r0[3:0],
    HEX4
  );
  
  Display D0(
    r4[15:12],
    HEX3
  );

  
	Display D1(
    r4[11:8],
    HEX2
  );

  Display D2(
    r4[7:4],
    HEX1
  );

  Display D3(
    r4[3:0],
    HEX0
  );*/
  
   // -------------------------- TESTE 4 ------------------------------
  Display D4(
    r0[15:12],
    HEX7
  );

  
	Display D5(
    r0[11:8],
    HEX6
  );

  Display D6(
    r0[7:4],
    HEX5
  );

  Display D7(
    r0[3:0],
    HEX4
  );
  
  Display D0(
    pc[15:12],
    HEX3
  );

  
	Display D1(
    pc[11:8],
    HEX2
  );

  Display D2(
    pc[7:4],
    HEX1
  );

  Display D3(
    pc[3:0],
    HEX0
  );
  
endmodule
