//fundamentals of class
// using class in another class
//scope of a data member :private protected, public(default)
//local is like private
class first;
  local int local_data = 22; // local , visible only within the class
  
  //seperate tasks are provided to set and read the local data
  
  task set (input int data);
    this.local_data = data;
  endtask
  
  function int get();
    return local_data;
  endfunction
  
  int data = 32;  
  task display ();
    $display("Value of data : %0d",data);
  endtask
  
endclass


class second;
  first f1;
  function new();
    f1 = new();
  endfunction
endclass


module tb;
  second s;
  initial begin
    s = new();
    $display("Value of data : %0d",s.f1.data);
    s.f1.display();
    s.f1.data = 45;
    s.f1.display();
    
    //setting local data 
    s.f1.set(123);
    //reading local data
    $display("Value of localdata : %0d",s.f1.get());
    
    
  end

endmodule