// Code your testbench here
// or browse Examples
 // Semaphore


class first;
  rand int data;
  constraint data_c {data < 10 ; data > 0;}
  
endclass

class second;
  rand int data;
  constraint data_c {data < 20 ; data > 10;}
  
endclass

class main;
  semaphore sem;
  first f;
  second s;
  int data;
  int i =0;
  
  task send_first();
    sem.get(1); //get access of a semaphore
    for(i = 0; i <10 ; i++) begin
      f.randomize();
      data = f.data; //
      $display("First access Semaphore and Data sent : %0d" ,f.data);
      #10;
    end
    sem.put(1);  //relieve access of semaphore
    $display("Semaphore unoccupied");
  endtask
  
  
  task send_second();
    sem.get(1); //get access of a semaphore
    for(i = 0; i <10 ; i++) begin
      s.randomize();
      data = s.data;
      $display("Second access Semaphore and Data sent : %0d" ,s.data);
      #10;
    end
    sem.put(1); //relieve access of semaphore
    $display("Semaphore unoccupied");
  endtask
  
  
  task run();
    sem  = new(1); //only one semaphore is available
    f = new();
    s = new();
    fork 
      send_first();  //will get access to semaphore first even though both inside fork join
      
      send_second();
    join
    
  endtask
  
endclass

module tb;
  main m;
  initial begin 
    m = new();
    m.run();
    
  end
  initial begin 
    #250;
    $finish();
  end
  
endmodule