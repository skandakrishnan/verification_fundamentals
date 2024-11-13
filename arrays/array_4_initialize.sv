//array initialization

module tb;
  bit arr1[8]; // uninitialized
  logic arr2[8];
  
  int arr3[] = '{1,2,3,4}; //unizue values -> 4 elements, no error
//  int arr3[5] = '{1,2,3,4}; //will not compile as number of elements on RHS and LHS do not match
  int arr4[] = '{6{1}}; //repetitive values
  int arr5[10] = '{default :2}; //default  
  int arr6[8];
  
  
  
  initial begin
    $display ("arr1 : %0p" , arr1);
    $display ("arr2 : %0p" , arr2);
    $display ("arr3 : %0p" , arr3);
    $display ("arr4 : %0p" , arr4);
    $display ("arr5 : %0p" , arr5);
    $display ("arr6 : %0p" , arr6);
  end
  
endmodule