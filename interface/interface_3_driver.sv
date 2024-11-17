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

class driver;
  virtual add_if aif; //only prototype, no () required
  task run();
    
    forever begin
      @(posedge aif.clk);
      aif.a <= 3;
      aif.b <= 3;
    end
  
  endtask
endclass

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
  driver drv;
  
  initial begin
    drv = new();
    drv.aif = aif; //connect interface to driver
    drv.run();
  end
  

  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #100;
    $finish();
  end
  
  
  
endmodule


