//queue


module tb;
  
  int arr[$]; //$ specifies a queue
  int j;
  
  initial begin
    arr = {2,4,6}; // no ' required
    $display ("arr : %0p" , arr);
    
    arr.push_front(7); //push '7' to the front of the queue
    $display ("arr : %0p" , arr);
    
    arr.push_back(9); //push '9' to the back of the queue
    $display ("arr : %0p" , arr);
    
    arr.insert(2,10); //insert 10 at index '2'
    $display ("arr : %0p" , arr);
    
    j = arr.pop_front(); // pop front element from the array
    $display ("arr : %0p" , arr);
    $display ("j : %0d" , j);
    
    j = arr.pop_back(); // pop back element from the array
    $display ("arr : %0p" , arr);
    $display ("j : %0d" , j);
    
    arr.delete(1); //  remove index'1' element from the array, no return value for function
    $display ("arr : %0p" , arr);
   
    
    
  end
  
  
endmodule