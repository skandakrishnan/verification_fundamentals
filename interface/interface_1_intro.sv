// Code your testbench here
// or browse Examples


//interface  
// make sure all the ports have the same name as the dut ports

/// why use logic over regor wire
// logic would enable the system to use reg or wire accordingly

//using only reg would not allow to us it on output ports. 
//uing only wire would not allow us to use these signals in procedural blocks

//logic allows us to us signals interchangeably

// use Design : interface_1_des.v
interface add_if;
  
  logic [3:0] a; //right now its birdirectional
  logic [3:0] b;
  logic [4:0] sum;
  
  
  
endinterface

//interface with all reg type, we are not allowed to connect variable in interface to the output port of DUT
//interface with all wire type, we are not allowed to apply stimulus using initial or always



module tb;
  
  add_if aif(); // paranthesis is necessary when declaring interface
  
  add dut (
           .a(aif.a),
           .b(aif.b),
           .sum(aif.sum)
           );
  initial begin
    aif.a = 4;
    aif.b = 4;
    #10;
    aif.a = 3;
    #10;
    aif.b = 7;
    #10;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  
  
endmodule