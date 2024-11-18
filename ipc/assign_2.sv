// Code your testbench here
// or browse Examples
 // Semaphore
//Mailbox 
//with a custom constructor
//parameter for a mailbox 
//its always good practice to specify the datatype as the transaction class that is being used for the communication

/*
Code for transaction class is mentioned in the Instruction tab. Write a code to send transaction data between generator and driver. Also, verify the data by printing the value of data members of Generator and Driver.
 */ 
class transaction;
  
  //let the design have these ports
  rand bit [7:0] addr = 7'h12;
  
  rand bit [3:0] data = 4'h4;
  rand bit we = 1'b1;
  rand bit rst = 1'b0;
  
  
endclass
class generator;
  
  transaction t;
  mailbox #(transaction) mbx; // specify the data type of communication 
  // custom constructor to specify the common passage  
  function new (mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
    
  task main();
    t = new();
    for (int i = 0; i < 10;  i++) begin
      
      
      $display("[GEN] : DATA SENT : addr : %0d, data : %0d, we : %0b, rst : %0b", t.addr, t.data,t.we,t.rst);
      mbx.put(t);
      assert(t.randomize) else $display("Randomization Failed");
     // t = new();
      #10;
    end
  endtask
endclass


class driver;
  
  transaction dc; // data container to recv fromm generator
  
  mailbox #(transaction) mbx; //drv2gen  
  // custom constructor to specify the common passage  
  function new (mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task main();
    forever begin
      mbx.get(dc);
      $display("[DRV] : DATA RCVD : addr : %0d, data : %0d, we : %0b, rst : %0b", dc.addr, dc.data,dc.we,dc.rst);
      #10;
    end
  endtask
endclass

module tb;
  generator g;
  driver d;
  mailbox #(transaction) mbx;
  initial begin
    mbx = new();
    g = new(mbx);
    d = new(mbx);
    
    fork
      g.main();
      d.main();
    join
    
    
  end
endmodule
     




