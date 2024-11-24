// Code your testbench here
// or browse Examples


//interface  
// make sure all the ports have the same name as the dut ports
//USE of MODPORT - indicates the direction of interface variables
//USE of Gneerator class

// use Design : interface_2_des_clk.v

//RULES

/////1. Add transaction constructor in generator custom constructor
/////2. Send Deep copy of transaction between generator and driver


//// MONITOR


class transaction;
  randc bit [3:0] a;
  randc bit [3:0] b;
  bit [7:0] sum;
  
  function void display();
    $display ("a : %0d \t b :%0d \t sum : %0d",a,b,sum);
  endfunction
  
  
endclass


interface add_if;
  logic clk;
  logic [3:0] a; //right now its birdirectional
  logic [3:0] b;
  logic [4:0] sum;
  
  
  modport DRV (
    output a,  //driver can change
    output b,  //driver can change
    input sum,
    input clk  //driver cannot change clk
              ); //direction for when driver class is using the interface
  
  
  
endinterface


class monitor;
  mailbox #(transaction) mbx;
  transaction trans;
  virtual add_if aif;
  
  function new (mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    trans = new();
    forever begin
      @(posedge aif.clk);
      trans.a = aif.a;
      trans.b = aif.b;
      trans.sum = aif.sum;
      $display("[MON] : DATA SENT TO SCOREBOARD");
      trans.display();
      mbx.put(trans);
    end
  endtask
  
endclass


class scoreboard;
  mailbox #(transaction) mbx;
  transaction trans;

  function new (mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    forever begin
      mbx.get(trans);
      $display("[SCO] : DATA RCVD FROM MONITOR");
      trans.display();
      #20;
    end
  endtask
endclass
     
module tb;
  
  add_if aif(); // paranthesis is necessary when declaring interface
  
  mailbox #(transaction) mbx;
  monitor mon;
  scoreboard sco;
  initial begin
    mbx = new();
    mon = new(mbx);
    sco = new(mbx);
    mon.aif = aif;
    
  end
    
  
  
  
  event done;
  
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
  

  
 
  
	initial begin 
      for (int i = 0; i < 20 ; i++) begin
        @(posedge aif.clk);
        aif.a <= $urandom_range(0,15);
        aif.b <= $urandom_range(0,15);
      end
    end
  
  initial begin
    fork
      mon.run();
      sco.run();
    join
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #450;
    $finish();
  end
  
  
  
endmodule

