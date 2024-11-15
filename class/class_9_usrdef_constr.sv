//fundamentals of class 

//user defined constructor


class first;
  
  int data;
  // no need of void for new function. 
  //If void is present compile error is generated
  //new is  a special function
  function new (input int i = 0); 
    if (i >32)
    	data = 32;
    else 
        data = 64;
  endfunction
endclass



module tb;
  first f1,f2,f3;
  
  initial begin
    f1 = new(33);
    f2 = new(21);
    f3 = new();
    $display("F1 data : %0d", f1.data);
    $display("F2 data : %0d", f2.data);
    $display("F3 data : %0d", f3.data);

  end
  
 

  
endmodule