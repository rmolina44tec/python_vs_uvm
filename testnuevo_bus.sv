`timescale 1ns / 1ns
`default_nettype none
`define PCKG_SZ 65 
`define BROADCAST {3{1'b1}}
`define DRVRS 4   // cambio 4 por 5 
`define MAX_MSGS 1024
`include "Bus_Micro2.sv" 


module Simulacion;
	//inputs
  logic clk;
  logic reset;
  logic push_device0;
  logic push_device1;
  // logic push_device2;
  // logic push_device3;
  logic pop_device0;
  logic pop_device1;
  // logic pop_device2;
  // logic pop_device3;

  logic [64:0] D_push_device0;
  logic [64:0] D_push_device1;
  // logic [64:0] D_push_device2;
  // logic [64:0] D_push_device3;

 //outputs
  wire  [64:0] D_pop_device0;
  wire  [64:0] D_pop_device1;
  // wire  [64:0] D_pop_device2;
  // wire  [64:0] D_pop_device3;

  wire  pndng_device0;
  wire  pndng_device1;
  // wire  pndng_device2;
  // wire  pndng_device3;


  Top_bus uut(
  .clk(clk),
  .reset(reset),
  .pndng_device0(pndng_device0),
  .pndng_device1(pndng_device1),
  // .pndng_device2(pndng_device2),
  // .pndng_device3(pndng_device3),
  .push_device0(push_device0),
  .push_device1(push_device1),
  // .push_device2(push_device2),
  // .push_device3(push_device3),
  .pop_device0(pop_device0),
  .pop_device1(pop_device1),
  // .pop_device2(pop_device2),
  // .pop_device3(pop_device3),
  .D_pop_device0(D_pop_device0),
  .D_pop_device1(D_pop_device1),
  // .D_pop_device2(D_pop_device2),
  // .D_pop_device3(D_pop_device3),
  .D_push_device0(D_push_device0),
  .D_push_device1(D_push_device1)
  // .D_push_device2(D_push_device2),
  // .D_push_device3(D_push_device3)

);

logic bandera ;

initial begin
  clk=0;
  reset=1;
  bandera=0;
  
  push_device0=0;
  push_device1=0;
  // push_device2=0;
  // push_device3=0;

  pop_device0=0;
  pop_device1=0;
  // pop_device2=0;
  // pop_device3=0;

  D_push_device0=0;
  D_push_device1=0;
  // D_push_device2=0;
  // D_push_device3=0;

  //enable wave dump // para generar un reporte después de cada simulación
  $dumpfile("dump.vcd");
  $dumpvars;
end

  always #1 clk=~clk;   
  always @(posedge clk)begin
    prueba();
  end


  task prueba ();
    if ($time > 4) begin
      reset =0;
      begin 
        D_push_device0 = {3'b001,2'b00,{60{1'b1}}};
        push_device0=1;
        if (pndng_device1)
        begin 
          pop_device1=1;
          D_push_device1= {3'b000,2'b01,{60{1'b1001110101011}}};  
          push_device1=1;
        end   
        if(pndng_device0)
          begin
            pop_device0=1; 
          end
      end 


    end
  endtask : prueba 
   

  // task prueba ();
  //   if($time > 4) begin
  //     reset = 0;
  //   end
  //   if($time > 8) 
  //   begin
  //     if (bandera==1) begin
  //       push_device0=0;
  //       D_push_device0 = 0;
  //     end
  //     if (bandera==0) begin 
  //       bandera=1;
  //       reset = 0;
  //       D_push_device0 = {3'b001,2'b00,{60{1'b1}}};
  //       push_device0=1;
  //       if (Simulacion.uut.pop_device0_int)begin
  //         $display("D_push_device0",D_push_device0);
  //       end

  //     end
  //   end

  // endtask

 
endmodule