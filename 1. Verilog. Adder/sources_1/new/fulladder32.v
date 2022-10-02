`timescale 1ns / 1ps


module fulladder32 #(parameter BITS = 32)(
                    input   [BITS - 1:0]    A,
                    input   [BITS - 1:0]    B,
                    input                   Pin,
                    output  [BITS - 1:0]    S,
                    output                  Pout
    );
    
    wire    [BITS - 2:0]  P;
    
    genvar  i;
    generate
        for (i = 0; i < BITS; i = i + 1) begin : newgen
            case (i)
                0: 
                    begin : if_first
                        fulladder new(
                                    .a(A[i]),
                                    .b(B[i]),
                                    .Pin(Pin),
                                    .S(S[i]),
                                    .Pout(P[i])
                        );
                    end
                
                BITS - 1:
                    begin : if_last
                        fulladder new(
                                    .a(A[i]),
                                    .b(B[i]),
                                    .Pin(P[i - 1]),
                                    .S(S[i]),
                                    .Pout(Pout)
                        );
                    end
                
                default:
                    begin : if_middle
                        fulladder new(
                                    .a(A[i]),
                                    .b(B[i]),
                                    .Pin(P[i - 1]),
                                    .S(S[i]),
                                    .Pout(P[i])
                        );
                    end
            endcase

        end
    endgenerate
    

    
endmodule
