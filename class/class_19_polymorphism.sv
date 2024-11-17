//fundamentals of class
//Polymorphism

class first; //parent
  
  int df = 32;
  
  function void display();
    $display ("First: Value of df : %0d",df);
  endfunction  

endclass


class first_virtual; //parent
  
  int df = 32;
  
  virtual function void display();
    $display ("First: Value of df : %0d",df);
  endfunction  

endclass


class second extends first; // second inherits everything first has

  int ds = 12;
  function void add();
    $display ("Second: Value of sum : %0d", ds+4);
  endfunction
  
  function void display(); // another mmethod with the same name  as the parent class
    $display ("Second: Value of df : %0d",df);
  endfunction  
    
endclass

class second_virtual extends first_virtual; // second inherits everything first has

  int ds = 12;
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
  
  first_virtual f_v;
  second_virtual s_v;
  initial begin 
    f = new();
    s = new();
    f = s; //adding extending class to parent class
    
    //still parent class display is called instead of child class 
    //KERNEL: First: Value of df : 32
    f.display();
    
    f_v = new();
    s_v = new();
    f_v = s_v;
    
    //child class display is called due to the parent class display defined in virtual.
    //child class method is followed
    //good practice to follow virtual fro most methods as user defining a child class
    //can then moify the method according to their needs
    //KERNEL: Second: Value of df : 32
    f_v.display();
    
  end
  
  
endmodule

