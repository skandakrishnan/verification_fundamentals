// array repetitive operations 
// for loop, repeat loop, foreach loop

module tb;
  
  int arr1[10];
  int arr2[10];
  int arr3[10];
  int i =0;
  int k =0;
  
  
  initial begin
    for(i = 0; i<10; i++) begin
      arr1[i] = i;
    end
    $display ("arr : %0p" , arr1);
  end
  
  initial begin
    foreach(arr2[j]) begin //j need not be defined
      arr2[j] = j;
      $display (" %0d" , arr2[j]);
    end
  end
  
  initial begin 
    repeat(10) begin
      arr3[k] = k;
      k++;
    end
    $display ("arr : %0p" , arr3);
  end
    
endmodule