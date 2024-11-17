//fundamentals of class
//Super keyword
// Parent and child can have custom constructor.

class first; //parent
  
  int df = 32;
  
  function new(input int df);
    this.df = df;
  endfunction
  
  
  
  function void display();
    $display ("First: Value of df : %0d",df);
  endfunction  

endclass

class second extends first; // second inherits everything first has

  int ds = 12;
  
  function new(input int df, input int ds);
    super.new(df);
    this.ds = ds;
  endfunction
  
  function void add();
    $display ("Second: Value of sum : %0d", ds+4);
  endfunction
  
  function void display(); // another mmethod with the same name  as the parent class
    $display ("Second: Value of df : %0d",df);
  endfunction  
    
endclass





module tb;
  first f;
  second s;
  

  initial begin 
    f = new(13);
    s = new(15,19);
    $display ("First: Value of df : %0d", f.df);
    $display ("Second: Value of df ds : %0d %0d", s.df,s.ds);
  
  end
  
  
endmodule

