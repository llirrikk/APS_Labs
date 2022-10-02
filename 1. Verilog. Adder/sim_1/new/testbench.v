`timescale 1ns / 1ps


module testbench();

    reg     [31:0]  A, B;
    reg             P_in;
    wire    [31:0]  S;
    wire            P_out;
    
    
    fulladder32 DUT(
                    .A(A),
                    .B(B),
                    .Pin(P_in),
                    .S(S),
                    .Pout(P_out)
    );
    
    initial begin
        A = 0; B = 0; P_in = 0;
        #5;
        
        A = 1; B = 0; P_in = 0;
		#5;                  // <- Делаем паузу в пять отсчётов
		                     // времени симуляции перед очередным
		A = 100; B = 300; P_in = 0;	// изменением входных сигналов
		#5;
		
		A = 0; B = 1337; P_in = 0;
		#5;
		
		A = 228; B = 1488; P_in = 1;  
		#5;
		
		A = 1; B = 1; P_in = 1;  
		#5;
		
		A = 500000; B = 10; P_in = 1;  
		#5;
		
		A = 6216144; B = 135761; P_in = 0;  
		#5;
	end
    

endmodule
