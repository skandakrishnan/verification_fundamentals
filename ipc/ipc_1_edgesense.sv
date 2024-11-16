// Code your testbench here
// or browse Examples

//Events
// Trigger an event : ->
// edge sensitive_blocking : @(),
// level sensitive non blocking : wait()

//Edge sensitive

module tb;
  event a;
  initial begin
    #10;
    -> a; // triggering an event after 10 ns
  end
  
  initial begin 
    @(a);  // sensing the event a
    $display("Event A Triggerred and Received at %0t", $time);
  end
endmodule