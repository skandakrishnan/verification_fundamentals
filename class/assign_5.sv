//fundamentals of class
/*
Assume class consists of three data members a, b, and c each of size 4-bit. Create a task inside the class that returns the result of the addition of data members. The task must also be capable of sending the value of a, b, c, and result to the console. Verify code for a = 1, b = 2, and c = 4.
*/

class first;
  
  
  bit [3:0] a;
  bit [3:0] b;
  bit [3:0] c;
  
  // no need of void for new function. 
  //If void is present compile error is generated
  //new is  a special function
  function new ( input bit [3:0] a = 4'h0, input bit [3:0] b = 4'h0, input bit [3:0] c = 4'h0); 
  	this.a = a;
    this.b = b;
    this.c = c;
   endfunction

  
  
  
  task display (output bit [5:0] res);
    res = a + b + c;
    $display("a : %0d, b : %0d, c : %0d ", a,b,c);
  endtask
  endclass



module tb;
  first f1,f2,f3;
  bit [5:0] res;
  initial begin
    f1 = new(15,4,12);
    f2 = new(,4,); //follow position of arguments
    f3 = new(.a(1),.b(2),.c(4)); // pass value by name
    f1.display(res);
    $display("res : %0d", res);
    f2.display(res);
    $display("res : %0d", res);
    f3.display(res);
    $display("res : %0d", res);
  end
  
 

  
endmodule