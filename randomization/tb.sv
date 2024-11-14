//checking if randomization is successfull or not 
//assert method

class generator;
  
  rand bit [3:0] a;
  randc bit [3:0] b;  // rand or randc
  
  bit [3:0] y;
  
  // randomization will fail as a cannot be greater than 15
  constraint data {a >15;} 
  
  
endclass

module tb;
  generator g;
  int i = 0;
  int status = 0; //successful randomization will have value 1 
  initial begin
    g = new();
    for (i=0; i<10; i++)begin
      status = g.randomize(); // random values for a and b //randomize method
      $display("Value of a: %0d and b : %0d with status : %0d", g.a, g.b,status);
      #10; //random delay
    
    
    
    end
    
    for (i = 0; i<10; i++) begin
      assert(g.randomize()) else begin 
        // randomization fail will return 0, aand assert will fail
        $display("Randomization Failed at %0t", $time);
        //$finish();
      end
      $display("Value of a: %0d and b : %0d" , g.a, g.b);
      #10;
      
    end
    
  end
endmodule
