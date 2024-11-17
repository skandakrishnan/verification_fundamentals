// Code your testbench here
// or browse Examples

//Events
// Trigger an event : ->
// edge sensitive_blocking : @(),
// level sensitive non blocking : wait()

//level sensitive

module tb;
  task first();
    $display ("Task 1 started at %0t",$time);
    #20;
    $display ("Task 1 completed at %0t",$time);
  endtask
  
  task second();
    $display ("Task 2 started at %0t",$time);
    #30;
    $display ("Task 2 completed at %0t",$time);
  endtask
  
  task third();
    $display ("reached next to JOIN at %0t",$time);
  endtask
    
  
  initial begin
    fork //will executed parallel
      first();
      second();
      
    join //wont exit until all the above mentioned task completes execution
    third();
  end
endmodule