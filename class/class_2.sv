
//fundamentals of class

class first;
  //data members of class
  reg [2:0] data; 
  reg [1:0] data2;
  
  
endclass


module tb;
  first f; // instance of class first is created, using handler f

  initial begin
    // constructor to the class,memory allocated for the instance -> class objects dynamic in nature
    // constructor always needed or fatal error occur by trying to access a null pointer
    f = new (); 
    
    f.data = 3'b010;
    f.data2 = 2'b10;
    
    
    
    #1;
    $display("Value of data : %0d and data2 : %0d" ,f.data,f.data2);
    
    f = null; // de allocating the memory for the class, cannot access the data through the nulled handler, deleting an object
  end
  
endmodule