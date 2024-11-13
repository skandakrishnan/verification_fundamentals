// Code your testbench here
// or browse Examples

`timescale 1 ns / 1 ps
module tb;
  bit arr1[8]; // 8 elements in a bit array
  bit arr2[] = {1,0,1,1}; //4 elements
  
  
  
  initial begin
    $display("Size of arr1 : %0d", $size(arr2));
    
  
  end
  
endmodule
