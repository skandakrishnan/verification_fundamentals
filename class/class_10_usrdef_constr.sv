
//fundamentals of class 

//multiple arguments to constructor

class first;
  
  int data1;
  bit [7:0] data2;
  shortint data3;
  // no need of void for new function. 
  //If void is present compile error is generated
  //new is  a special function
  function new (input int data1 =0, input bit [7:0] data2 = 8'h00, input shortint data3 = 0); 
  	this.data1 = data1;
    this.data2 = data2;
    this.data3 = data3;
  endfunction
endclass



module tb;
  first f1,f2,f3;
  
  initial begin
    f1 = new(23,4,35);
    f2 = new(,4,); //follow position of arguments
    f3 = new(.data2(23),.data3(4),.data1(35)); // pass value by name
    $display("F1 data1 : %0d, data2 : %0d, data3 : %0d ", f1.data1,f1.data2,f1.data3);
    $display("F2 data1 : %0d, data2 : %0d, data3 : %0d ", f2.data1,f2.data2,f2.data3);
    $display("F3 data1 : %0d, data2 : %0d, data3 : %0d ", f3.data1,f3.data2,f3.data3);
  end
  
 

  
endmodule