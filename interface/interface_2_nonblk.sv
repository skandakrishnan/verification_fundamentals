// Code your testbench here
// or browse Examples


//interface  
// make sure all the ports have the same name as the dut ports
// use Design : interface_2_des_clk.v

interface add_if;
  
  logic [3:0] a; //right now its birdirectional
  logic [3:0] b;
  logic [4:0] sum;
  logic clk;
  
  
  
endinterface

module tb;
  
  add_if aif(); // paranthesis is necessary when declaring interface
  
  add dut (
    .a(aif.a),
    .b(aif.b),
    .sum(aif.sum),
    .clk(aif.clk)  
  );
  
  initial begin 
    aif.clk = 0;
  end
  always #10 aif.clk = ~aif.clk;
  //using blocking operator '='
  
  /*
  initial begin
    aif.a = 4;
    aif.b = 4;
    #22;
    aif.a = 3;
    #20;
    aif.a = 4;
    #8;
    aif.a = 5;
    #20;
    aif.a = 6;
    #10;
    $finish();
  end
  
  */
  //using non blocking operator '<='
   initial begin
    aif.a <= 4;
    aif.b <= 4;
     repeat (3) @(posedge aif.clk);
    aif.a <= 3;
    #20;
    aif.a <= 4;
    #8;
    aif.a <= 5;
    #20;
    aif.a <= 6;
    #10;
    $finish();
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  
  
endmodule


