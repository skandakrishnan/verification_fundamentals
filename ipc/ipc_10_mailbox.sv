// Code your testbench here
// or browse Examples
 // Semaphore
//Mailbox

class generator;
  
  int data = 12;
  mailbox mbx; //gen2drv
  task run();
    mbx.put(data);
    $display("[GEN] : SENT DATA : %0d", data);
  endtask
endclass


class driver;
  int datac = 0; //data container
  mailbox mbx; //drv2gen
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
    gen = new();
    drv = new();
    mbx = new();
    
    gen.mbx = mbx;  //specify the passage for gen to drv mailbox and vice versa
    drv.mbx = mbx;
    
    gen.run();
    drv.run();
    
    
  end
endmodule
     




