module ProgramCounter(
                        input               CLK,
                        input               rst,
                        input               PCOp,
                        output  reg [7:0]   PC,
                        output              OUT
                        
    );

    
    reg [7:0] pcInput;

    always @ (*) begin
        case(PCOp)
            0: pcInput = 8'h1;
            1: pcInput = instr[12:5];
        endcase    
    end



    always @ (posedge CLK or posedge rst)
    begin
        if (rst)
            PC <= 0;
        else
            PC <= PC + pcInput;
    end


endmodule
