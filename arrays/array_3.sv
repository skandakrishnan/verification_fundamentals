module tb;
  bit arr1[8]; // 8 elements in a bit array
  bit arr2[]; //empty array
  
  
  
  initial begin
    $display("Size of arr1 : %0d", $size(arr1));
    $display("Size of arr2 : %0d", $size(arr2));
    $display("Value of first element : %0d", arr1[0]); //if not initialised, default is 0
    
    arr1[1] =1;
    $display("Value of element : %0d", arr1[1]); //update value
    
    //to print all the elements of an array %0p is used
    
    arr2[0] =1; //will produce an error since it was unititialised and would be taken as empty array with 0 eleements 
    //RUNTIME: Warning: RUNTIME_0222 testbench.sv (17): Index 0 is out of array dimension bounds (array is empty).
    $display("Value of all elements : %0p", arr2);
    
    
    
    
  end
  
endmodule