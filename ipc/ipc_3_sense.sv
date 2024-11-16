// Code your testbench here
// or browse Examples

//Events
// Trigger an event : ->
// edge sensitive_blocking : @(),
// level sensitive non blocking : wait()

//level sensitive

module tb;
  event a1,a2,a3,a4;
  initial begin
    // no delay specified therefore simulation will be stuck at @(a1); 
    -> a1; // triggering an event after 10 ns
    -> a2;
  end
  
  initial begin
    @(a1);
    $display("Event A1 Triggerred and Received");
    @(a2);  // sensing the event a
    $display("Event A1 Triggerred and Received");
    
  end


  initial begin //wait statement will be executed as it will see the event has been triggerred
    wait(a1.triggered);
    $display("Event A1 Triggerred and Received due to Wait");
    wait(a2.triggered);  // sensing the event a
    $display("Event A2 Triggerred and Received due to Wait");
    
  end
endmodule