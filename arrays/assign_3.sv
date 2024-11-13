//assignment

/*Create a Fixed-size array capable of storing 20 elements. Add random values to all the 20 elements by using $urandom function. Now add all the elements of the fixed-size array to the Queue in such a way that the first element of the Fixed-size array should be the last element of the Queue. Print all the elements of both fixed-size array and Queue on Console.

*/

module tb;
  int arr1[20];
  int arr2[$];
  
  initial begin
    for (int i =0; i<20; i++) begin
      arr1 [i] =$urandom;
    end
  
    $display ("arr1 : %0p" , arr1);
 
    for (int i =0; i<20; i++) begin
      arr2.push_front(arr1[19-i]);
    end
    $display ("arr2 : %0p" , arr2);
  
  end
  
  
  
  

endmodule
