
//fundamentals of class 

//using array in function






module tb;
  
  int res[16];
  function automatic void init_arr (ref bit [3:0] a [16]);
    for (int i = 0; i <16; i++)begin
      a [i] = i;
    end
    
  endfunction
  
  
  initial begin
    
    init_arr(res);
    
    
    $display ("Value of res : %0p", res);
    
  end

  
endmodule