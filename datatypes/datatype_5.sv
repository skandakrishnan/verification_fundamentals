// 2:1 mux


`timescale 1ns/1ps

module top (
  input a,b,sel,
  output y
);
  
  
  reg temp;
  
  always @(*) 
    begin
      if(sel == 1'b0)
        temp = a;
      else
        temp = b;
    end
  assign y =temp;
  
endmodule