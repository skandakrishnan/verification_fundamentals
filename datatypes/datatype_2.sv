//datatypes P1

//datatype to handle hardware, datatype to handle variable, datatype to handle simulation


/*
//datatype for hardware

reg - procedural assignment
wire - continuous assignement using otherwise causes compile error

in a system verilog the issue is solved using a logic datatype
logic datatype used for both procedual and continuous 

*/

module tb;
  
  
  bit a =0;
  byte b = 0;
  shortint c =0;
  longint e = 0;
   //2 state initialised to 0
  //4state initialised to x 
  
  bit [7:0] f = 8'd0;
  bit [15:0] g = 16'h0000;
  
  real h = 0;
  
  
  
  
  

endmodule