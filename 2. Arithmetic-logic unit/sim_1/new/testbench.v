`timescale 1 ns / 100 ps

//`define "define.v"


module testbench();

    reg  [31:0]  A;
    reg  [31:0]  B;
    reg  [4:0]   ALUOp;
    wire         Flag;    // reg потому что тебе потребуется мультиплексор 
    wire [31:0]  Result;  // описанный в case внутри always                
                          // а в always, слева от "равно", всегда стоит reg
    alu_riscv dut(A, B, ALUOp, Flag, Result);
    
    initial begin
       test_add();
       test_sub();
       test_sll();
       test_slt();
       test_sltu();
       test_xor();
       test_srp();
       test_sra();
       test_or();
       test_and();
       test_beq();
       test_bne();
       test_blt();
       test_bge();
       test_bltu();
       test_bgeu();
       
              
       $stop;
    
    end
    
    
    
    task test_add;
    begin
       ALUOp = 5'b00000;
       A = 10; B = 20; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A + B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 500; B = 100; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A + B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 0; B = 20;
       #10;
       assert(
           .real_Result(Result), .expected_Result(A + B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 10; B = 0; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A + B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A + B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = -2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A + B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = -125; B = -251; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A + B),
           .real_Flag(Flag), .expected_Flag(0)
       );

    end
    endtask
    
    task test_sub;
    begin
    ALUOp = 5'b01000;
    A = 10; B = 20; 
    #10;
    assert(
        .real_Result(Result), .expected_Result(A - B),
        .real_Flag(Flag), .expected_Flag(0)
    );
   
    A = 500; B = 100; 
    #10;
    assert(
        .real_Result(Result), .expected_Result(A - B),
        .real_Flag(Flag), .expected_Flag(0)
    );
   
    A = 0; B = 20;
    #10;
    assert(
        .real_Result(Result), .expected_Result(A - B),
        .real_Flag(Flag), .expected_Flag(0)
    );
   
    A = 10; B = 0; 
    #10;
    assert(
        .real_Result(Result), .expected_Result(A - B),
        .real_Flag(Flag), .expected_Flag(0)
    );
   
    A = 2_147_483_647; B = 2_147_483_647; 
    #10;
    assert(
        .real_Result(Result), .expected_Result(A - B),
        .real_Flag(Flag), .expected_Flag(0)
    );
   
    A = -2_147_483_100; B = 3; 
    #10;
    assert(
        .real_Result(Result), .expected_Result(A - B),
        .real_Flag(Flag), .expected_Flag(0)
    );
   
    A = -125; B = -251; 
    #10;
    assert(
        .real_Result(Result), .expected_Result(A - B),
        .real_Flag(Flag), .expected_Flag(0)
    );
    
    
    end
    endtask
    
    task test_sll;
    begin
    ALUOp = 5'b00001;
    A = 10; B = 20; 
    #10;
    assert(
        .real_Result(Result), .expected_Result(A << B),
        .real_Flag(Flag), .expected_Flag(0)
    );
   
    A = 500; B = 1; 
    #10;
    assert(
        .real_Result(Result), .expected_Result(A << B),
        .real_Flag(Flag), .expected_Flag(0)
    );
   
    A = 0; B = 20;
    #10;
    assert(
        .real_Result(Result), .expected_Result(A << B),
        .real_Flag(Flag), .expected_Flag(0)
    );
   
    A = 10; B = 0; 
    #10;
    assert(
        .real_Result(Result), .expected_Result(A << B),
        .real_Flag(Flag), .expected_Flag(0)
    );
   
    A = 2_147_483_647; B = 0; 
    #10;
    assert(
        .real_Result(Result), .expected_Result(A << B),
        .real_Flag(Flag), .expected_Flag(0)
    );
   
    A = -500; B = 1; 
    #10;
    assert(
        .real_Result(Result), .expected_Result(A << B),
        .real_Flag(Flag), .expected_Flag(0)
    );
   
    A = -125; B = 2; 
    #10;
    assert(
        .real_Result(Result), .expected_Result(A << B),
        .real_Flag(Flag), .expected_Flag(0)
    );
    
    
    
    end
    endtask
    
    task test_slt;
    begin
       ALUOp = 5'b00010;
       A = 10; B = 20; 
       #10;
       assert(
           .real_Result(Result), .expected_Result($signed(A < B)),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 500; B = 100; 
       #10;
       assert(
           .real_Result(Result), .expected_Result($signed(A < B)),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 0; B = 20;
       #10;
       assert(
           .real_Result(Result), .expected_Result($signed(A < B)),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 10; B = 0; 
       #10;
       assert(
           .real_Result(Result), .expected_Result($signed(A < B)),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result($signed(A < B)),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = -2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result($signed(A < B)),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = -125; B = -251; 
       #10;
       assert(
           .real_Result(Result), .expected_Result($signed(A < B)),
           .real_Flag(Flag), .expected_Flag(0)
       );

    end
    endtask
    
    task test_sltu;
    begin
       ALUOp = 5'b00011;
       A = 10; B = 20; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A < B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 500; B = 100; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A < B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 0; B = 20;
       #10;
       assert(
           .real_Result(Result), .expected_Result(A < B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 10; B = 0; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A < B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A < B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = -2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A < B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = -125; B = -251; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A < B),
           .real_Flag(Flag), .expected_Flag(0)
       );

    end
    endtask
    
    task test_xor;
    begin
       ALUOp = 5'b00100;
       A = 10; B = 20; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A ^ B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 500; B = 100; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A ^ B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 0; B = 20;
       #10;
       assert(
           .real_Result(Result), .expected_Result(A ^ B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 10; B = 0; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A ^ B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A ^ B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = -2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A ^ B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = -125; B = -251; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A ^ B),
           .real_Flag(Flag), .expected_Flag(0)
       );

    end
    endtask
    
    task test_srp;
    begin
       ALUOp = 5'b00101;
       A = 10; B = 20; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A >> B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 500; B = 100; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A >> B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 0; B = 20;
       #10;
       assert(
           .real_Result(Result), .expected_Result(A >> B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 10; B = 0; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A >> B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A >> B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = -2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A >> B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = -125; B = -251; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A >> B),
           .real_Flag(Flag), .expected_Flag(0)
       );

    end
    endtask
    
    task test_sra;
    begin
       ALUOp = 5'b01101;
       A = 10; B = 20; 
       #10;
       assert(
           .real_Result(Result), .expected_Result($signed(A) >>> B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 500; B = 100; 
       #10;
       assert(
           .real_Result(Result), .expected_Result($signed(A) >>> B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 0; B = 20;
       #10;
       assert(
           .real_Result(Result), .expected_Result($signed(A) >>> B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 10; B = 0; 
       #10;
       assert(
           .real_Result(Result), .expected_Result($signed(A) >>> B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result($signed(A) >>> B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = -2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result($signed(A) >>> B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = -125; B = -251; 
       #10;
       assert(
           .real_Result(Result), .expected_Result($signed(A) >>> B),
           .real_Flag(Flag), .expected_Flag(0)
       );

    end
    endtask
    
    task test_or;
    begin
       ALUOp = 5'b00110;
       A = 10; B = 20; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A | B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 500; B = 100; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A | B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 0; B = 20;
       #10;
       assert(
           .real_Result(Result), .expected_Result(A | B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 10; B = 0; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A | B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A | B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = -2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A | B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = -125; B = -251; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A | B),
           .real_Flag(Flag), .expected_Flag(0)
       );

    end
    endtask
    
    task test_and;
    begin
       ALUOp = 5'b00111;
       A = 10; B = 20; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A & B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 500; B = 100; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A & B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 0; B = 20;
       #10;
       assert(
           .real_Result(Result), .expected_Result(A & B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 10; B = 0; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A & B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A & B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = -2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A & B),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = -125; B = -251; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(A & B),
           .real_Flag(Flag), .expected_Flag(0)
       );

    end
    endtask
    
    task test_beq;
    begin
       ALUOp = 5'b11000;
       A = 10; B = 20; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(A == B)
       );
       
       A = 500; B = 100; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(A == B)
       );
       
       A = 0; B = 20;
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(A == B)
       );
       
       A = 10; B = 0; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(A == B)
       );
       
       A = 2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(A == B)
       );
       
       A = -2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(A == B)
       );
       
       A = -125; B = -251; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(A == B)
       );

    end
    endtask
    
    task test_bne;
    begin
       ALUOp = 5'b11001;
       A = 10; B = 20; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(A != B)
       );
       
       A = 500; B = 100; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(A != B)
       );
       
       A = 0; B = 20;
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(A != B)
       );
       
       A = 10; B = 0; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(A != B)
       );
       
       A = 2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(A != B)
       );
       
       A = -2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(A != B)
       );
       
       A = -125; B = -251; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(A != B)
       );

    end
    endtask
    
    task test_blt;
    begin
       ALUOp = 5'b11100;
       
       A = 500; B = 100; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 0; B = 20;
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(1)
       );
       
       A = 10; B = 0; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = -125; B = -251; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(0)
       );

    end
    endtask
    
    task test_bge;
    begin
       ALUOp = 5'b11101;
       A = 10; B = 20; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 500; B = 100; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(1)
       );
       
       A = 0; B = 20;
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 10; B = 0; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(1)
       );
       
       A = 2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(1)
       );
       
       A = -125; B = -251; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(1)
       );

    end
    endtask
    
    task test_bltu;
    begin
       ALUOp = 5'b11110;
       A = 10; B = 20; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(A < B)
       );
       
       A = 500; B = 100; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(A < B)
       );
       
       A = 0; B = 20;
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(A < B)
       );
       
       A = 10; B = 0; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(A < B)
       );
       
       A = 2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(A < B)
       );
       
       A = -2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(A < B)
       );
       
       A = -125; B = -251; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(A < B)
       );

    end
    endtask
    
    task test_bgeu;
    begin
       ALUOp = 5'b11111;
       A = 10; B = 20; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 500; B = 100; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(1)
       );
       
       A = 0; B = 20;
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(0)
       );
       
       A = 10; B = 0; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(1)
       );
       
       A = 2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(1)
       );
       
       A = -2_147_483_647; B = 2_147_483_647; 
       #10;
       assert(
           .real_Result(Result), .expected_Result(0),
           .real_Flag(Flag), .expected_Flag(1)
       );
       

    end
    endtask
    
    
    
    
    task assert;
    input [31:0] real_Result, expected_Result;
    input [1:0] real_Flag, expected_Flag;
    begin
 
       if (real_Result == expected_Result)
           $display("GOOD\t(real_Result) %d == %d (expected_Result)", real_Result, expected_Result);
       else begin
           $display("BAD\t(real_Result) %d != %d (expected_Result)", real_Result, expected_Result);
           $finish;
       end
       
       if (real_Flag == expected_Flag)
           $display("GOOD\t(real_Flag) %d == %d (expected_Flag)", real_Flag, expected_Flag);
       else begin
           $display("BAD\t(real_Flag) %d != %d (expected_Flag)", real_Flag, expected_Flag);
           $finish;
       end
       
    
    end
    endtask 
    
endmodule
