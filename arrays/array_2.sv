module tb;
  bit arr1[8]; // 8 elements in a bit array
  bit arr2[] = {1,0,1,1}; //4 elements
  
  
  
  initial begin
    $display("Size of arr1 : %0d", $size(arr1));
    $display("Size of arr2 : %0d", $size(arr2));
    $display("Value of first element : %0d", arr1[0]); //if not initialised, default is 0
    
    arr1[1] =1;
    $display("Value of element : %0d", arr1[1]); //update value
    
    //to print all the elements of an array %0p is used
    
    
    $display("Value of all elements : %0p", arr2);
    
    
    
    
  end
  
endmodule