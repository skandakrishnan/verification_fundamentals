// Code your testbench here
// or browse Examples

//Events
// Trigger an event : ->
// edge sensitive_blocking : @(),
// level sensitive non blocking : wait()

//level sensitive

module tb;
  int data1, data2; //data1 we will add value, data2, we will access the value
  event done;
  int i =0;
  ////generator
  initial begin
    for(i=0; i<10; i++) begin
      data1 = $urandom();
      $display ("Data SENT : %0d",data1);
      #10;
    end
    
    -> done; //completed the process
  end
  
  ///driver
  initial begin
    forever begin
      #10;
      data2 = data1;
      $display ("Data RCVD : %0d",data2);
    end
  end
  
  //
  initial begin
    wait(done.triggered);
    $finish();
  end  
endmodule