
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

//Using Function

module tb;
  //default data direction wthout input/output is always input
  function bit [4:0] add(input bit [3:0] a = 4'b1111,b = 4'b1111);
    return a+b;
  endfunction
  
  bit [4:0] res = 0;
  bit [3:0] ain = 4'b1001;
  bit [3:0] bin = 4'b0001;
  
  function bit [4:0] add2();
    return ain+bin;
  endfunction
  
  function void display_ain_bin(); //no value returned
    $display("Value of ain : %0d and bin : %0d", ain, bin);
  endfunction
  
  initial begin 
    res = add(4'b0100,4'b0010);
    $display ("Value of addition : %0d" ,res);
    #1;
    res = add(ain,bin);
    $display ("Value of addition : %0d" ,res);
    #1;
    res = add(); // default value
    $display ("Value of addition : %0d" ,res);
    #1;
    res = add2(); // function using variables declared befaore function decalaration
    $display ("Value of addition : %0d" ,res);
    #1;
    ain = 4'b1010;
    bin = 4'b0101;
    res = add2(); // function using variables declared befaore function decalaration
    $display ("Value of addition : %0d" ,res);
    display_ain_bin();
    
  end
endmodule
