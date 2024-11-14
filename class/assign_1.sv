
//fundamentals of class
/*
Create a Class consisting of 3 data members each of unsigned integer type. Initialize them to 45,78, and 90. Use the display function to print the values on the console.

*/
class first;
  //data members of class
  int  data1 = 45; 
  int  data2 = 78;
  int  data3 = 90;
  
  
  
endclass


module tb;
  first f; // instance of class first is created, using handler f

  initial begin
    // constructor to the class,memory allocated for the instance -> class objects dynamic in nature
    // constructor always needed or fatal error occur by trying to access a null pointer
    f = new (); 
    
    
    #1;
    $display("Value of data1 : %0d",f.data1);
    $display("Value of data2 : %0d",f.data2);
    $display("Value of data3 : %0d",f.data3);
    
    f = null; // de allocating the memory for the class, cannot access the data through the nulled handler, deleting an object
  end
  
endmodule