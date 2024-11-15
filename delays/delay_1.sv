//`timescale 1ns/1ps
//module tb();
  
 // always @()//always_comb, always_ff, always_latch //for design
    
  //for test benches , only always is necessary
    
 //   always begin
      
      
 //   end
    
//endmodule
    
//usage of always block
//clk1 100 MHz, 10ns

`timescale 1ns / 1ps
 
module tb();
 
/////global signal clk , rst
  
  reg clk;
  reg rst;
  reg clk50;
  reg clk25;
    
  
  reg [3:0] temp;
  
  //1. Initialized Global Variable
  initial begin
    clk = 1'b0;
    clk50 = 1'b0;
    clk25 = 1'b0;
    rst = 1'b0;
  end
  ////2. Random signal for data/ control 
  
  always #5 clk = ~clk;  //100Mhz
  
  always #10 clk50 = ~clk50; //50Mhz
  
  always #20 clk25 = ~clk25; //25Mhz
  
    
  ///////3. System Task at the start of simulation
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

  
  ///5. Stop simulation by forcefully calling $finish
  initial begin
    #200;
    $finish();
  end
  
endmodule
  