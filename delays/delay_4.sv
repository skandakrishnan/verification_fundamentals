//floating point period
//timescale directive

// unit/precision

//need to use precision
// for 1ns/1ns = 10^0 = 1 precision digit. only integers are possible

// for 1ns/aps = 10^3 = 3 precision digit. decimal upto 3 digits.


// #10.234 DELAY IS POSSIBLE

//16MHz half period 31.25
//8MHz half period 62.5


//how to allign the clock edges

`timescale 1ns / 1ps
 
module tb();
 
  
  reg clk; //initial value = X
  
  reg clk16;
  reg clk8 = 0;  ///initialize variable
  
 
  initial begin
    clk16 = 1'b0;
    clk8 = 1'b0; 
  end
 
 
  
  always #5 clk = ~clk;
  always #31.25  clk16 = ~clk16;
   always #62.5 clk8 = ~clk8;
  
 
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
 
 
  initial begin
    #200;
    $finish();
  end
  
endmodule