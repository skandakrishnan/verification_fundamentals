`timescale 1ns / 1ps
 
module tb();
 
  
  //reg clk; //initial value = X
  
 // reg clk16;
  reg clk9 = 0;  ///initialize variable
  
 
  initial begin
   // clk16 = 1'b0;
    clk9 = 1'b0; 
  end
 
 
  
 // always #5 clk = ~clk;
 // always #31.25  clk16 = ~clk16;
   always #55.555 clk9 = ~clk9;
  
 
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
 
 
  initial begin
    #200;
    $finish();
  end
  
endmodule