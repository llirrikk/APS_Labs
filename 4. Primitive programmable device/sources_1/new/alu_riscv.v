`include "define.v"


module alu_riscv (
  input       [31:0]  A,
  input       [31:0]  B,
  input       [4:0]   ALUOp,
  output  reg         Flag,   // reg потому что тебе потребуется мультиплексор
  output  reg [31:0]  Result  // описанный в case внутри always 
);                            // а в always, слева от "равно", всегда стоит reg


wire [31:0] temp_sum;
wire ignore_bit;
fulladder32 adder(
                    .A(A),
                    .B(B),
                    .Pin(0),
                    .S(temp_sum),
                    .Pout(ignore_bit)
            );

wire [31:0] temp_sub;
fulladder32 subtracter(
                    .A(A),
                    .B(~B),
                    .Pin(0),
                    .S(temp_sub),
                    .Pout(ignore_bit)
            );


always @ * begin
    case(ALUOp)
        `ADD: begin
            Flag = 0;
            Result = temp_sum;
        end
        
        `SUB: begin
            Flag = 0;
            Result = temp_sub + 1'd1;
        end
        
        `SLL: begin
            Flag = 0;
            Result = A << B;
        end
        
        `SLT: begin
            Flag = 0;
            Result = $signed(A < B);
        end
        
        `SLTU: begin
            Flag = 0;
            Result = A < B;
        end
        
        `XOR: begin
            Flag = 0;
            Result = A ^ B;
        end
        
        `SRL: begin
            Flag = 0;
            Result = A >> B;
        end
        
        `SRA: begin
            Flag = 0;
            Result = $signed(A) >>> B;
        end
        
        `OR: begin
            Flag = 0;
            Result = A | B;
        end
        
        `AND: begin
            Flag = 0;
            Result = A & B;
        end
        
        `BEQ: begin
            Flag = A == B;
            Result = 0;
        end
        
        `BNE: begin
            Flag = A != B;
            Result = 0;
        end
        
        `BLT: begin
            Flag = $signed(A < B);
            Result = 0;
        end
        
        `BGE: begin
            Flag = $signed(A >= B);
            Result = 0;
        end
        
        `BLTU: begin
            Flag = A < B;
            Result = 0;
        end
        
        `BGEU: begin
            Flag = A >= B;
            Result = 0;
        end
        
        default: begin
            Flag = 1'bx;
            Result = {32{1'bx}};
        end
    endcase
end




endmodule

