`include "../BUS_Micro/Bus_Micro_lib.sv"

module Top_bus #(parameter bits = 65, parameter broadcast = {3{1'b1}}) (
  input clk,
  input reset,
  output  pndng_device0,
  output  pndng_device1,
  output  pndng_device2,
  output  pndng_device3,

  input  push_device0,
  input  push_device1,
  input  push_device2,
  input  push_device3,

  input  pop_device0,
  input  pop_device1,
  input  pop_device2,
  input  pop_device3,

  output  [bits-1:0] D_pop_device0,
  output  [bits-1:0] D_pop_device1,
  output  [bits-1:0] D_pop_device2,
  output  [bits-1:0] D_pop_device3,

  input [bits-1:0] D_push_device0,
  input [bits-1:0] D_push_device1,
  input [bits-1:0] D_push_device2,
  input [bits-1:0] D_push_device3
);
  wire [bits-1:0] bus;
  wire trn_chng;
  wire wrt;

  wire  pndng_device0;
  wire  pndng_device1;
  wire  pndng_device2;
  wire  pndng_device3;
  
  wire  push_device0;
  wire  push_device1;
  wire  push_device2;
  wire  push_device3;

  wire  pop_device0;
  wire  pop_device1;
  wire  pop_device2;
  wire  pop_device3;
  
  wire  [bits-1:0] D_pop_device0;
  wire  [bits-1:0] D_pop_device1;
  wire  [bits-1:0] D_pop_device2;
  wire  [bits-1:0] D_pop_device3;

  wire  [bits-1:0] D_push_device0;
  wire  [bits-1:0] D_push_device1;
  wire  [bits-1:0] D_push_device2;
  wire  [bits-1:0] D_push_device3;

        prll_bs_ntrfs_riscv #(.drvrs(3),.bits(bits),.id(0),.bdcst(broadcast)) device0 (
        .D_push(D_push_device0),
        .pndng(pndng_device0),
        .clk(clk),
        .reset(reset),
        .bus(bus),
        .trn_chng(trn_chng),
        .wrt(wrt),
        .pop(pop_device0),
        .push(push_device0),
        .D_pop(D_pop_device0));
        
         prll_bs_ntrfs_riscv #(.drvrs(3),.bits(bits),.id(1),.bdcst(broadcast)) device1 (
        .D_push(D_push_device1),
        .pndng(pndng_device1),
        .clk(clk),
        .reset(reset),
        .bus(bus),
        .trn_chng(trn_chng),
        .wrt(wrt),
        .pop(pop_device1),
        .push(push_device1),
        .D_pop(D_pop_device1));
        
        prll_bs_ntrfs_riscv #(.drvrs(3),.bits(bits),.id(2),.bdcst(broadcast)) device2 (
        .D_push(D_push_device2),
        .pndng(pndng_device2),
        .clk(clk),
        .reset(reset),
        .bus(bus),
        .trn_chng(trn_chng),
        .wrt(wrt),
        .pop(pop_device2),
        .push(push_device2),
        .D_pop(D_pop_device2));

        prll_bs_ntrfs_riscv # (.id(3))device3 (
        .D_push(D_push_device3),
        .pndng(pndng_device3),
        .clk(clk),
        .reset(reset),
        .bus(bus),
        .trn_chng(trn_chng),
        .wrt(wrt),
        .pop(pop_device3),
        .push(push_device3),
        .D_pop(D_pop_device3));

        fifo_flops_no_full #(.depth(3),.bits(65)) fifo_out_device0(
          .Din(D_push_device0),
          .Dout(D_pop_device0),
          .push(push_device0),
          .pop(pop_device0),
          .pndng(pndng_device0),
          .rst(reset),
          .clk(clk));

        fifo_flops_no_full #(.depth(3),.bits(65)) fifo_in_device0(
          .Din(D_push_device0),
          .Dout(D_pop_device0),
          .push(push_device0),
          .pop(pop_device0),
          .pndng(pndng_device0),
          .rst(reset),
          .clk(clk));

        fifo_flops_no_full #(.depth(2),.bits(65)) fifo_out_device1(
          .Din(D_push_device1),
          .Dout(D_pop_device1),
          .push(push_device1),
          .pop(pop_device1),
          .pndng(pndng_device1),
          .rst(reset),
          .clk(clk));

        fifo_flops_no_full #(.depth(2),.bits(65)) fifo_in_device1(
          .Din(D_push_device1),
          .Dout(D_pop_device1),
          .push(push_device1),
          .pop(pop_device1),
          .pndng(pndng_device1),
          .rst(reset),
          .clk(clk));

        fifo_flops_no_full #(.depth(2),.bits(65)) fifo_out_device2(
          .Din(D_push_device2),
          .Dout(D_pop_device2),
          .push(push_device2),
          .pop(pop_device2),
          .pndng(pndng_device2),
          .rst(reset),
          .clk(clk));

        fifo_flops_no_full #(.depth(2),.bits(65)) fifo_in_device2(
          .Din(D_push_device2),
          .Dout(D_pop_device2),
          .push(push_device2),
          .pop(pop_device2),
          .pndng(pndng_device2),
          .rst(reset),
          .clk(clk));

        fifo_flops_no_full #(.depth(2),.bits(65)) fifo_out_device3(
          .Din(D_push_device3),
          .Dout(D_pop_device3),
          .push(push_device3),
          .pop(pop_device3),
          .pndng(pndng_device3),
          .rst(reset),
          .clk(clk));

        fifo_flops_no_full #(.depth(2),.bits(65)) fifo_in_device3(
          .Din(D_push_device3),
          .Dout(D_pop_device3),
          .push(push_device3),
          .pop(pop_device3),
          .pndng(pndng_device3),
          .rst(reset),
          .clk(clk));
endmodule