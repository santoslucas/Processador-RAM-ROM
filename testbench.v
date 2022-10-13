module testbench;
	reg Resetn, Clock, Run;
	wire Done, f, zero;
	wire [2:0] Tstep_Q;
	wire [15:0] r0, r1, r2, r3, r4, r5, r6, pc, a, g, DIN, addr, dout, DATA;

    proc2 proc(Resetn, Clock, Run, Done, Tstep_Q, DIN, addr, dout, DATA, r0, r1, r2, r3, r4, r5, r6, pc, a, g, f, zero);

   initial begin
        Clock = 1'b0;
        Run = 1'b1;
        Resetn = 1'b1;
        $monitor("T%d | Done: %b | r0: %h | r1: %h | r2: %h | r3: %h | r4: %h | r5: %h | r6: %h | buswires: %h | pc: %h | pc_incr: %b\naddr: %d | addr_in: %b | DATA: %h | dout: %h | dout_in: %b | a: %h | g: %h | f: %d | F_in: %b | zero: %b | IR: %b | W: %b\n", proc.Tstep_Q, Done, proc.r0,proc.r1,proc.r2,proc.r3,proc.r4,proc.r5,proc.r6, proc.BusWires, proc.pc,proc.pc_incr, proc.addr, proc.ADDR_in, proc.DATA, proc.dout, proc.DOUT_in, proc.a,proc.g,proc.f, proc.F_in, proc.zero, proc.IR,proc.w);
    end

   initial begin
		  $display("-------------------------------------- MV R0, #2 --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  
		  $display("-------------------------------------- MV R1, #3 --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  
		  
        $display("-------------------------------------- ADD R1, R0 --------------------------------------");
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
		  #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1

        $display("-------------------------------------- MV R2, R0 --------------------------------------");
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
		  #1
        
		  $display("-------------------------------------- ADD R2, #4 --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  
		  $display("-------------------------------------- SUB R2, R1 --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  
		  $display("-------------------------------------- MV R3, R2 --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  
		  $display("-------------------------------------- ADD R0,R3 --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  
		  $display("-------------------------------------- AND R0, R1 --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  
		  $display("-------------------------------------- SLL R1, R3  --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  
		  $display("-------------------------------------- SRL R1, R3 --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  
		  $display("-------------------------------------- MV R2, R1 --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  
		  $display("-------------------------------------- AND R2, #3 --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  
		  $display("-------------------------------------- SLL R0, #2 --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  
		  $display("-------------------------------------- SUB R0, #1 --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  
		  $display("-------------------------------------- SRL R1, #2 --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  
		  $display("-------------------------------------- ADD R1, R1 --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  
		  $display("-------------------------------------- LD R2, R0 --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  
		  $display("-------------------------------------- ADD R2, R3 --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  
		  $display("-------------------------------------- SUB R0, #3 --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  
		  $display("-------------------------------------- SD R2, R0 --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  
		  $display("-------------------------------------- LD R0, R0 --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  
		  $display("-------------------------------------- SUB R0, R3 --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1

        Clock = ~Clock;
        #1
        Clock = ~Clock;
    end
endmodule
 