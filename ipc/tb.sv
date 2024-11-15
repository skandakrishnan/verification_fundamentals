// Code your testbench here
// or browse Examples
 // Semaphore
//Mailbox 
//with a custom constructor
//parameter for a mailbox 
//its always good practice to specify the datatype as the transaction class that is being used for the communication


  
class transaction;
  
  //let the design have these ports
  rand bit [7:0] a;
  rand bit [7:0] b;
  rand bit wr;
  
  
endclass

class generator;
  
  transaction t;
  mailbox #(transaction) mbx; // specify the data type of communication 
  // custom constructor to specify the common passage  
  function new (mailbox #(transaction) mbx);// specify the data type of communication 
    this.mbx = mbx;
  endfunction
  
  task main();
    for (int i = 0; i < 10;  i++) begin
      t = new();
      assert(t.randomize) else $display("Randomization Failed");
      $display("[GEN] : DATA SENT : a : %0d , b : %0d , wr : %0b", t.a, t.b, t.wr);
      mbx.put(t);
      #10;
    end
  endtask
endclass


class driver;
  
  transaction dc; // data container to recv fromm generator
  
  mailbox #(transaction) mbx; //drv2gen  // specify the data type of communication 
  // custom constructor to specify the common passage  
  function new (mailbox #(transaction) mbx);// specify the data type of communication 
    this.mbx = mbx;
  endfunction
  
  task main();
    forever begin
      mbx.get(dc);
      $display("[DRV] : DATA RCVD : a : %0d , b : %0d , wr : %0b", dc.a, dc.b, dc.wr);
      #10;
    end
  endtask
endclass

module tb;
  generator g;
  driver d;
  mailbox #(transaction) mbx;// specify the data type of communication 
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
