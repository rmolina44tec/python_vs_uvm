//-------------------------------------------------------------------------
//---------------------------------------------------------------
//including interfcae and testcase files
`include "Bus_Interface.sv"
`include "Bus_base_test.sv"
`include "Bus_lib_test.sv"
`include "Bus_Micro2.sv"
//---------------------------------------------------------------

module tbench_top;

  //---------------------------------------
  //clock and reset signal declaration
  //---------------------------------------
  bit clk;
  bit reset;
  
  //---------------------------------------
  //clock generation
  //---------------------------------------
  always #5 clk = ~clk;
  
  //---------------------------------------
  //reset Generation
  //---------------------------------------
  initial begin
    reset = 1;
    #10 reset =0;
  end
  
  //---------------------------------------
  //interface instance
  //---------------------------------------
  bus_if intf(clk,reset);
  
  //---------------------------------------
  //DUT instance
  //---------------------------------------
  Top_bus DUT (  
    .clk(intf.clk),
    .reset(intf.reset),
    .D_push_device0(intf.D_push_device0),
    .D_push_device1(intf.D_push_device1),
    .D_push_device2(intf.D_push_device2),
    .D_push_device3(intf.D_push_device3),
    .push_device0(intf.push_device0),
    .push_device1(intf.push_device1),
    .push_device2(intf.push_device2),
    .push_device3(intf.push_device3),
    .pop_device0(intf.pop_device0),
    .pop_device1(intf.pop_device1),
    .pop_device2(intf.pop_device2),
    .pop_device3(intf.pop_device3),
    .D_pop_device0(intf.D_pop_device0),
    .D_pop_device1(intf.D_pop_device1),
    .D_pop_device2(intf.D_pop_device2),
    .D_pop_device3(intf.D_pop_device3),
    .pndng_device0(intf.pndng_device0),
    .pndng_device1(intf.pndng_device1),
    .pndng_device2(intf.pndng_device2),
    .pndng_device3(intf.pndng_device3)
   );
  
  //---------------------------------------
  //passing the interface handle to lower heirarchy using set method 
  //and enabling the wave dump
  //---------------------------------------
  initial begin 
    uvm_config_db#(virtual bus_if)::set(uvm_root::get(),"*","vif",intf); // Incluyendo la interface que instantcié arriba 
    //enable wave dump
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
  
  //---------------------------------------
  //calling test
  //---------------------------------------
  initial begin 
    run_test();
  end
  
endmodule