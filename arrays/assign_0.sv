//initialize an array with elements squared of index 
// arr = 0,1,4,9,16.....81

module tb;
  int arr[10]; // uninitialized
  int i;
  
  
  
  initial begin
    for (i=0; i<10;i=i+1) begin
      arr[i] = i*i;
    end
    $display ("arr : %0p" , arr);
   end
  
endmodule