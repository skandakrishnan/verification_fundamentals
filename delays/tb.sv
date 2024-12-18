// task which calculates the ton, toff, phase

`timescale 1ns / 1ps

module tb();
  reg clk = 0;
  reg clkf = 0;
  
  always #5 clk = ~clk;
  
  
  
	task calc(input real freq_hz, input real duty_cycle, input real phase,output real pout, output real ton, output real toff);
  
  	pout  =phase;
      ton = (1.0/freq_hz) * duty_cycle * 1000_000_000;
  	toff =  (1000_000_000 / freq_hz) - ton;
	endtask

  task clkgen(input real phase,input real ton, input real toff);
      
      @(posedge clk);
    #phase;
    while (1) begin
      clkf =1;
      #ton;
      clkf =0;
      #toff;
    end
    endtask
  
  
  real phase;
  real ton ;
  real toff ;
  
  
   initial begin
     calc(25_000_000,0.4,0,phase,ton,toff);
     clkgen(phase,ton,toff);
  end
  
   initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
 
 
  initial begin
    #200;
    $finish();
  end
  
endmodule
