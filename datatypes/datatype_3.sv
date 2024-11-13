/*

datatype P2 is variable

fixed 2 state, 4state

2 state is 0,1
4 state is 0,1,z,x


2 state could be further divided into signed or unsigned
2 state signed 8-bit=byte, 16bit=shortint, 32bit=int, 64bit= long   , 
signed range from -2^(n-1) -> 2^(n-1) -1
unsigned range from 0 -> 2^(n) -1

unsigned 8bit [7:0], 16bit bit[15:0], or int unsigned




floating held by real datatype 


*/

module  tb;
  
  byte var1 = -126 ; //-128 to 127
  
  bit [7:0] var2 = 130; //0 to 255
  
  initial begin
    #10; 
    $display ("Value of VAR : %0d",var1);
    
  
  
  
  end
  
  
endmodule