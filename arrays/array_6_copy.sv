//copy an array , same datatype, same number of elements
// different datatype -> compile error
// different storage capability -> compile error
module tb;
  
  int arr1 [5];
  int arr2[5];
  initial begin
    for(int i =0; i<5; i++) begin
      arr1[i] = 5*i;
    end
    arr2 = arr1;
    $display ("arr1 : %0p" , arr1);
    $display ("arr2 : %0p" , arr2);
  end
endmodule