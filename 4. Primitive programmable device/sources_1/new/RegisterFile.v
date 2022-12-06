module ram32_32 (             // создать блок
  input           CLK,        // вход синхронизации
  input           WE3,        // сигнал разрешения на запись
  input   [4:0]   A1, A2, A3, // 5-битный адресные входы
  input           rst,        // сброс
  input   [31:0]  WD3,        // 32-битный вход чтоб записывать
  output  [31:0]  RD1, RD2    // 32-битные выходы чтоб читать
);

  reg [31:0] RAM [0:31];   // создать память с 32-ю 32-битными ячейками
  
  assign RD1 = (A1 == 0) ? 0 : RAM[A1];
  assign RD2 = (A2 == 0) ? 0 : RAM[A2];
  
  integer i;
  
  always @(posedge CLK)
  if (rst)
    for (i=0; i<31; i=i+1)
        RAM[i] <= 32'd0;
  else if (WE3)
    RAM[A3] <= WD3;


endmodule                 //  конец описания модуля
