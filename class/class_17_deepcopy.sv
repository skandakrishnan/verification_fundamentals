//fundamentals of class
//copying an object
//how to copy data from one instance of a class to another
//Deep copy


class first;
  
  int df = 32;  
  
  function first copy();
    copy = new ();
    copy.df = df;
  endfunction
  
  

endclass


class second;
  int ds = 12;
  
 
  first f1;
  function new();
    f1 = new();
  endfunction
  
  function second copy();
    copy  = new();
    copy.ds = ds;
    copy.f1 = f1.copy();
  endfunction
  
  
endclass


module tb;
  second s1, s2;
  
  initial begin
    s1 = new();
    s2 = new();
    $display("Value of s1 data : %0d",s1.ds);
    
    s1.ds = 24;
    
    s2 = s1.copy();
    
    
    $display("Value of s1 data f1 data : %0d %0d" ,s1.ds, s1.f1.df);
    $display("Value of s2 data f1 data : %0d %0d" ,s2.ds, s2.f1.df);
    
    s2.ds = 11;
    s2.f1.df = 13;
    // df changed to 13 only for s2 as the first class is independent 
    $display("Value of s1 data f1 data : %0d %0d" ,s1.ds, s1.f1.df);
    $display("Value of s2 data f1 data : %0d %0d" ,s2.ds, s2.f1.df);
    
   
  end

endmodule

