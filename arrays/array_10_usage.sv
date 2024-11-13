//usage of fixed size array

class transaction;
  rand bit [7:0] din;
  randc bit [7:0] addr;
  bit wr;
  bit [7:0] dout;
  
  constraint addr_c {addr> 10; arr<18;};
  
endclass


class generator;
  
  transaction t;
  integer i;
  task run();
    for (i =0; i<100; i++) begin  //generate 100 random stimuli
      t = new();
      t.randomize();
    end
  endtask
endclass


class scoreboard;
  bit [7:0] tarr[256] = `{default:0}; //fixed array to store the memory and use later for comparison
  transaction t;
  task run();
    
    if (t.wr == 1'b1) begin
      tarr[t.addr] =t.din;
      $display("[SCO] : Data stored din : %0d addr : %0d ", t.din,t.addr);
    end
    if(t.wr ==1'b)begin
      if(t.dout ==0)
        $display("[SCO] : No Data written at this location test passed");
      else if (t.dout == tarrr[t.addr])
        $display("[SCO] : Valid data found test passed");
      else 
        $display("[SCO] : Test failed");
    end
  endtask
endclass
        
  