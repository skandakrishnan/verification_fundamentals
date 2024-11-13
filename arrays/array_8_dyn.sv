//dynamic array 

module tb;
  int arr[];
  int farr[30]; //fixed size array of size 30
  initial begin
    arr = new [5]; // arr has 5 elements, without which there would be a compile error
    
    for(int i =0; i<5; i++) begin
      arr[i] = 5*i;
    end
    $display ("arr : %0p" , arr);
    
    
    
    arr.delete(); // delete the dynamic array
    arr = new [7];// arr has 7 elements, without which there would be a compile error
    for(int i =0; i<7; i++) begin
      arr[i] = 5*i;
    end
    $display ("arr : %0p" , arr);
    
    
    arr = new[30](arr); // increase size of array from 7 -> 30, old values will be copied to new array
    $display ("arr : %0p" , arr);
    
    farr = arr; //size, and datatype of arr is same as farr, so copy is possible
    $display ("farr : %0p" , farr);
    
    
    arr = new[30]; // increase size of array from 7 -> 30, but delete previous entries. all previous data will be deleeted
    $display ("arr : %0p" , arr);
    
    
    
  end
endmodule