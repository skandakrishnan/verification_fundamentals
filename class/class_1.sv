
//fundamentals of class

class first;
  //data members of class
  bit [2:0] data; 
  bit [1:0] data2;
  
  
endclass


module tb;
  first f; // instance of class first is created

  initial begin
    // constructor to the class,memory allocated for the instance -> class objects dynamic in nature
    // constructor always needed or fatal error occur by trying to access a null pointer
    f = new (); 
    #1;
    $display("Value of data : %0d and data2 : 0%d" ,f.data,f.data2);
  end
  
endmodule