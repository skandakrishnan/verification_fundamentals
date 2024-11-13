//assignment
/*Create a dynamic array capable of storing 7 elements. add a value of multiple of 7 starting from 7 in the array (7, 14, 21 ....49). After 20 nsec Update the size of the dynamic array to 20. Keep existing values of the array as it is and update the rest 13 elements to a multiple of 5 starting from 5. Print Value of the dynamic array after updating all the elements.

Expected result : 7, 14, 21, 28 ..... 49, 5, 10, 15 ..... 65 .

*/

//dynamic array 

module tb;
  int arr[];

  initial begin
    arr = new [7]; 
    
    for(int i =0; i<7; i++) begin
      arr[i] = 7*(i+1);
    end
    $display ("arr : %0p" , arr);
    
    #20
    
    
    
    arr = new[20](arr); // increase size of array from 7 -> 30, old values will be copied to new array
    $display ("arr : %0p" , arr);

    for(int i =7; i<20; i++) begin
      arr[i] = 5*(i-6);
    end
  
    $display ("arr : %0p" , arr);
    
    
    
  end
endmodule