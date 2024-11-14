
//fundamentals of class Assignment

/*
Create a task that will generate stimulus for addr , wr, and en signal as mentioned in a waveform of the Instruction tab. Assume address is 6-bit wide while en and wr both are 1-bit wide. The stimulus should be sent on a positive edge of 25 MHz clock signal.
*/



module tb;
  
  bit [6:0] addr;
  bit wr,en;
  int i =0;
  bit clk = 0;
  always #20 clk = ~clk; // 10ns -> 100 MHz
  
  
  

  task stim_clk();
    @(posedge clk); //wait for posedge
    if(i == 0) begin
      addr = 12;
      wr = 1'b1;
      en = 1'b1;
    end
    else if(i == 1) begin
      addr = 14;
      wr = 1'b1;
      en = 1'b1;
    end
    else if(i == 2) begin
      addr = 23;
      wr = 1'b0;
      en = 1'b1;
    end
    else if(i == 3) begin
      addr = 48;
      wr = 1'b0;
      en = 1'b1;
    end
    else begin
      addr = 56;
      wr = 1'b0;
      en = 1'b0;
    end
    i = i+1;
  endtask
  
  
  
  
  
  initial begin
    #1000;
    $finish;
  end
    
  
  initial begin
    for(int i = 0; i<20; i++)
    	stim_clk();
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule
