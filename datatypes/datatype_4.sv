//simulation datatype

//fixed time 
//realtime


`timescale 1 ns / 1 ps

module tb;
  
  time fix_time= 0;
  realtime real_time = 0;
  
  
  //////$time(); realtime();
  
  
  
  initial begin
    #12;
    fix_time = $time(); //incable of storing a floating potin value  // return current simulatoin in fixed point format //12.23 rounded to 12
    
    #12.45
    real_time =  $realtime(); //capable of storing a floating point  // return current simulation time in floating point format
    
    
    
    
    
    $display("Current simulation time : %0t", fix_time);
    $display("Current simulation time : %0t", real_time);
    
    
    
  
  
  end
endmodule