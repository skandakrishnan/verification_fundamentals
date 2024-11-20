// Code your testbench here
// or browse Examples
 // Semaphore
//Mailbox 
//with a custom constructor

class generator;
  
  int data = 12;
  mailbox mbx; //gen2drv
  // custom constructor to specify the common passage  
  function new (mailbox mbx);
    this.mbx = mbx;
  endfunction
  task run();
    mbx.put(data);
    $display("[GEN] : SENT DATA : %0d", data);
  endtask
endclass


class driver;
  int datac = 0; //data container
  mailbox mbx; //drv2gen
  // custom constructor to specify the common passage  
  function new (mailbox mbx);
    this.mbx = mbx;
  endfunction
  task run();
    mbx.get(datac);
    $display("[DRV] : RCVD DATA : %0d", datac);
  endtask
endclass

module tb;
  generator gen;
  driver drv;
  mailbox mbx;
  initial begin
    mbx = new();
    gen = new(mbx);
    drv = new(mbx);
    
    
    
    gen.run();
    drv.run();
    
    
  end
endmodule
     




