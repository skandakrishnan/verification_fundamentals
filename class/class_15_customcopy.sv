//fundamentals of class
//copying an object
//how to copy data from one instance of a class to another
//custom method for copy


class first;
  
  int data = 32;  
  bit [7:0] temp = 8'h11;

  function first copy();
    copy = new();
    copy.data = data;
    copy.temp = temp;
  endfunction
  
  task display ();
    $display("Value of data : %0d",data);
  endtask
  
endclass




module tb;
  first f1;
  first p1;
  first f2;
  first p2;
  initial begin
    f1 = new();
    $display("Value of f1 data : %0d",f1.data);
    f1.data = 24;
    
    p1 = new f1; //copy all data in f1 to p1;
    
    
    $display("Value of f1 data : %0d",f1.data);
    $display("Value of p1 data : %0d",p1.data);
    
    p1.data = 10;
    
    $display("Value of f1 data : %0d",f1.data);
    $display("Value of p1 data : %0d",p1.data);
    
    
    f2 = new();
    p2 = new();
     
    p2 = f2.copy; //custom function for copying data 

    $display("Value of f2 data : %0d  %0d",f2.data,f2.temp);
    $display("Value of p2 data : %0d  %0d",p2.data,p2.temp);
    
    
  end

endmodule
