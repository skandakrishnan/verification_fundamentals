// Code your testbench here
// or browse Examples
//


`timescale 1 ns / 1 ps

module tb;
  
  time fix_time= 0;
  realtime real_time = 0;
  
  
  //////$time(); realtime();
  
  
  
  initial begin
    #12;
    fix_time = $time(); //incable of storing a floating potin value
    
    #12.45
    real_time =  $realtime(); //capable of storing a floating point
    $display("Current simulation time : %0t", fix_time);
    $display("Current simulation time : %0t", real_time);
    
    
    
  
  
  end
endmodule
