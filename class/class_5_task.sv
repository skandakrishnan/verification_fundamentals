
//fundamentals of class
//class method can be done by using task or function

/*
tasks 
-> support timing control @(posedge) #10
-> multiple output ports
task sys_rst()
rst <= 1;
#30;
rst <=0;
endtask
->common usage : time dependent expression, scheduling prcesses in class



function 
-> do not support timing
-> do not support multiple outptu port
-> common usage :  printing values of data member, initializing of variable, time independent expression, return data from class

*/

//Using TASK

module tb;
  //default data direction wthout input/output is always input
  task add(
    input bit [3:0] a ,
    input bit [3:0] b ,
    output bit [4:0]y );
    y = a+b;
  endtask
  
  bit [4:0] res;
  bit [3:0] ain,bin;
  
  bit clk = 0;
  always #5 clk = ~clk; // 10ns -> 100 MHz
  
  
  //variables to be used in task defined before decalaration of task// no need to specify input/output 
  task add2();
    res = ain+bin;
    $display ("a : %0d & b : %0d & res : %0d " ,ain,bin,res);
  endtask

  task stim_clk();
    @(posedge clk); //wait for posedge 
    ain = $urandom();
    bin = $urandom();
    add2();
  endtask
  
  
  function void display_ain_bin(); //no value returned
    $display("Value of ain : %0d and bin : %0d", ain, bin);
  endfunction
  
  
  initial begin
    #110;
    $finish;
  end
    
  
  initial begin
    for(int i = 0; i<20; i++)
    	stim_clk();
    
  end
endmodule
