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


//// INJECTING ERROR
////CHILD Class creates error by having a duplicate copy function. Transaction copy is virtual and thus error copy supercedes it

class transaction;
  randc bit [3:0] a;
  randc bit [3:0] b;
  bit [7:0] sum;
  
  function void display();
    $display ("a : %0d \t b :%0d \t sum : %0d",a,b,sum);
  endfunction
  
  virtual function transaction copy();
    copy = new();
    copy.a = this.a;
    copy.b = this.b;
    copy.sum = this.sum;
  endfunction

endclass

//to inject error
class error extends transaction;
  
  
  function transaction copy();
    copy = new();
    copy.a = 0;
    copy.b = 0;
    copy.sum = this.sum;
  endfunction
  
  //constraint data_c {a ==0; b ==0;}
  
endclass


class generator;
  transaction trans;
  mailbox #(transaction) mbx;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
    trans = new();
  endfunction
  
  event done;
  
  
  task run();
    
    for(int i = 0; i<10; i++) begin
      
      // cannot do this as the randc functionality may not work properly
      //trans = new(); 
      
      assert(trans.randomize()) else $display("Randomization failed");
      //independent object reated so multiple stimuli can be generated
      //use deep copy of the object
      mbx.put(trans.copy); 
      $display("[GEN] : DATA SENT TO DRIVER @ %0t", $time);
      trans.display();
      #20;
    end
    #20;
    -> done;
  endtask
  
endclass
interface add_if;
  
  logic [3:0] a; //right now its birdirectional
  logic [3:0] b;
  logic [4:0] sum;
  logic clk;
  
  modport DRV (
    output a,  //driver can change
    output b,  //driver can change
    input sum,
    input clk  //driver cannot change clk
              ); //direction for when driver class is using the interface
  
  
  
endinterface

class driver;
  //only prototype, no () required
  virtual add_if.DRV aif; //use DRV MODPORT within this class
  mailbox #(transaction) mbx;
  transaction data;
  event next;
  
  
  
  function new (mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    
    forever begin
      mbx.get(data);
      @(posedge aif.clk);
      aif.a <= data.a;
      aif.b <= data.b;
      $display("[DRV] : Interface Trigger");
      data.display();
      -> next;
    end
  endtask
endclass
     
module tb;
  
  add_if aif(); // paranthesis is necessary when declaring interface
  
  driver drv;
  generator gen;
  
  
  error err;
  
  mailbox #(transaction) mbx;
  
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
    mbx = new();
    err = new();
    
    drv = new(mbx);
    gen = new(mbx);
    
    gen.trans = err;
    
    drv.aif = aif;
    done = gen.done;
  end
  
  initial begin
    fork
      gen.run();
      drv.run();
    join_any
    wait(done.triggered);
    $finish();
  end
  

  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  
  
endmodule


