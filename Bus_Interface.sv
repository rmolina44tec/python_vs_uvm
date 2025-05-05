////Bus_interface

interface bus_if(input logic clk, reset);
  	logic push_device0=0;
    logic push_device1=0;
    logic push_device2=0;
    logic push_device3=0;

    logic pop_device0=0;
    logic pop_device1=0;
    logic pop_device2=0;
    logic pop_device3=0;

    logic [64:0] D_push_device0;
    logic [64:0] D_push_device1;
    logic [64:0] D_push_device2;
    logic [64:0] D_push_device3;

    logic [64:0] D_pop_device0;
    logic [64:0] D_pop_device1;
    logic [64:0] D_pop_device2;
    logic [64:0] D_pop_device3;

    logic pndng_device0;
    logic pndng_device1;
    logic pndng_device2;
    logic pndng_device3;
  // driver clocking block

  clocking driver_cb @ (posedge clk);  // ENTRADAS Y SALIDAS INVERSAS AL DUT
    default input #1 output #1;
    output push_device0;
    output push_device1;
    output push_device2;
    output push_device3;

    output pop_device0;
    output pop_device1;
    output pop_device2;
    output pop_device3;

    output D_push_device0;
    output D_push_device1;
    output D_push_device2;
    output D_push_device3;

    input D_pop_device0;
    input D_pop_device1;
    input D_pop_device2;
    input D_pop_device3;

    input pndng_device0;
    input pndng_device1;
    input pndng_device2;
    input pndng_device3;

  endclocking

	clocking monitor_cb @(posedge clk);   // TODAS SON ENTRADAS
	default input #1 output #1;
    input push_device0;
    input push_device1;
    input push_device2;
    input push_device3;

    input pop_device0;
    input pop_device1;
    input pop_device2;
    input pop_device3;

    input D_push_device0;
    input D_push_device1;
    input D_push_device2;
    input D_push_device3;

    input D_pop_device0;
    input D_pop_device1;
    input D_pop_device2;
    input D_pop_device3;

    input pndng_device0;
    input pndng_device1;
    input pndng_device2;
    input pndng_device3;

	endclocking

  modport DRIVER (clocking driver_cb, input clk, reset);

  modport MONITOR (clocking monitor_cb, input clk, reset);
endinterface : bus_if


  //////////////////7 REVISADO//////////////////7
