//fundamentals of class
//inheritance

class first; //parent
  
  int df = 32;
  
  function void display();
    $display ("Value of df : %0d",df);
  endfunction  

endclass

//child
class second extends first; // second inherits everything first has

  int ds = 12;
  function void add();
    $display ("Value of sum : %0d",df+ds);
  endfunction
    
endclass


module tb;
  second s;
  
  initial begin
    s = new();
    s.display();
    $display("Value of f1 : %0d",s.df);
    s.add();
    
 
  end

endmodule