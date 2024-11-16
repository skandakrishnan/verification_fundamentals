//fundamentals of class
//copying an object
//how to copy data from one instance of a class to another
//Shallow copy 


class first;
  
  int df = 32;  

endclass


class second;
  int ds = 12;
  
 
  first f1;
  function new();
    f1 = new();
  endfunction
endclass


module tb;
  second s1, s2;
  
  initial begin
    s1 = new();
    $display("Value of s1 data : %0d",s1.ds);
    s1.ds = 24;
    
    s2 = new s1; //copy all data in s1 to s2; s1 & s2 will point to the same f1
    
    $display("Value of s1 data f1 data : %0d %0d" ,s1.ds, s1.f1.df);
    $display("Value of s2 data f1 data : %0d %0d" ,s2.ds, s2.f1.df);
    
    s2.ds = 11;
    s2.f1.df = 13;
	// df changed to 13 for both the s1,s2 as only handler is copied
    $display("Value of s1 data f1 data : %0d %0d" ,s1.ds, s1.f1.df);
    $display("Value of s2 data f1 data : %0d %0d" ,s2.ds, s2.f1.df);
    
   
  end

endmodule