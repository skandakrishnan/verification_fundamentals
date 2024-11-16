// Code your testbench here
// or browse Examples

//Events
// Trigger an event : ->
// edge sensitive_blocking : @(),
// level sensitive non blocking : wait()

//level sensitive

module tb;
  bit[7:0] data1, data2; //data1 we will add value, data2, we will access the value
  event done;
  event next;
  int i =0;
  ////generator
  task generator();
    for(i=0; i<10; i++) begin
      data1 = $urandom();
      $display ("Data SENT : %0d",data1);
      #10;
      wait(next.triggered); //wait for recvr //to sync up gen and rcv
    end
    
    
    -> done; //completed the process
  endtask
  
  ///driver
  task receiver();
    forever begin
      #10;
      data2 = data1;
      $display ("Data RCVD : %0d",data2);
      ->next; //to release gen from wait
    end
  endtask
  
  //
  task wait_event();
    wait(done.triggered);
    $display ("Completed Sending all Stimuli");
    $finish();
  endtask  
  
  initial begin
    fork //will executed parallel
      generator();
      receiver();
      wait_event();
    join //wont exit until all the above mentioned task completes execution
  end
endmodule