//fundamentals of class
//copying an object
//how to copy data from one instance of a class to another
class first;
  
  int data = 32;  
  task display ();
    $display("Value of data : %0d",data);
  endtask
  
endclass




module tb;
  first f1;
  first p1;
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
    
  end

endmodule

