//assignment
/*
Create two tasks each capable of sending a message to Console at a fixed interval. Assume Task1 sends the message "Task 1 Trigger" at an interval of 20 ns while Task2 sends the message "Task 2 Trigger" at an interval of 40 ns. Keep the count of the number of times Task 1 and Task 2 trigger by adding a variable for keeping the track of task execution and incrementing with each trigger. Execute both tasks in parallel till 200 nsec. Display the number of times Task 1 and Task 2 executed after 200 ns before calling $finish for stopping the simulation.

*/

module tb;
  task first();
    int i = 0;
    forever begin
      
      #20;
      $display ("Task 1 Trigger %0t",$time);
      i++;
    end   
  endtask
  
  task second();
    int i = 0;
    forever begin
      
      #40;
      $display ("Task 2 Trigger %0t",$time);
      i++;
    end   
  endtask
  
  task third();
    $display ("Task1 trigger count : %0d",first.i);
    $display ("Task2 trigger count : %0d",second.i);
    $finish();
  endtask
    
  
  initial begin
    fork //will executed parallel
      first();
      second();
      
    join_none //after any of the tasks above completes, third is executed: @20 
    #200;
    third();
  end
endmodule