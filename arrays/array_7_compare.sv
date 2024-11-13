//compare an array , same datatype, same number of elements
// different datatype -> compile error
// different storage capability -> compile error
module tb;
  
  int arr1 [5] = '{1,2,3,4,5};
  int arr2 [5] = '{1,2,3,4,5};
  int arr3 [5] = '{2,4,6,8,10};
  int status1,status2 ;
  initial begin
    status1 = (arr1 == arr2);
    status2 = (arr1 == arr3);
    $display ("1:status1 : %0d" , status1);//expect 1 because arrays are equal
    $display ("2:status2 : %0d" , status2);//expect 0 because arrays are not equal
    status1 = (arr1 != arr2);
    status2 = (arr1 != arr3);
    $display ("3:status1 : %0d" , status1);//expect 0 because arrays are equal
    $display ("4:status2 : %0d" , status2);//expect 1 because arrays are not equal

  end
endmodule