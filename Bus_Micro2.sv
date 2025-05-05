`include "../BUS_Micro/Bus_Micro_lib.sv"


module prll_intrfs_cntrl_riscv #(parameter id = 0, parameter bdcst = 255, parameter drvrs = 4) (
  input clk,
  input reset,
  input [2:0] D_in,
  input pndng,
  output ld_w,
  output rst_w,
  output rst_r,
  output bs_grnt,
  output push,
  output pop,
  inout trn_chng,
  inout wrt
);
  reg c_r;
  reg bs_grnt_pre;
  reg c_w;
  reg sv_flg;
  reg c_a;
  wire s_ds_r;
  wire s_ds_w;
  reg  trn_chng_pre;
  reg  wt_flg;
  reg rd_flg;
  wire trn_chng_nthng_t_snd;
  wire wrt_pre;
  wire bs_rqst;
  wire rdi;
  wire [$clog2(drvrs)-1:0] cnt_rbtr;
  
  dff_async_rst bs_grnt_dly (.data(bs_grnt_pre),.clk(clk),.reset(reset),.q(bs_grnt));
  Counter_arb#(drvrs) arb_cntr(.count(cnt_rbtr),.clk(trn_chng),.rst(reset));
  Arbiter_st_Mchn arb_st_mchn (.clk(clk),.reset(reset),.condition_a(c_a),.trn_chng_nthng_t_snd(trn_chng_nthng_t_snd));
   prll_wt_st_mchn wt_st_mchn(.c_w(c_w),.reset(reset),.clk(clk),.rst_w(rst_w),.pop(pop),.wrt_pre(wrt_pre),.s_ds_w(s_ds_w),.bs_rqst(bs_rqst),.ld_w(ld_w));
   prll_rd_st_mchn rd_st_mchn(.c_r(c_r),.reset(reset),.clk(clk),.rst_r(rst_r),.push(push),.rdi(rdi),.s_ds_r(s_ds_r));
   tri_buf trn_chng_buf(.a(trn_chng_pre),.b(trn_chng),.en(bs_grnt_pre));
   tri_buf wrt_buf(.a(wrt_pre),.b(wrt),.en(bs_grnt_pre));

  always@(*)begin
    wt_flg = rdi && bs_grnt;
    c_w = (s_ds_w)?pndng:wt_flg;
    trn_chng_pre = trn_chng_nthng_t_snd || rst_w;
    rd_flg = wrt && ~bs_grnt;
    sv_flg = ((D_in==id)||(D_in==bdcst))?{1'b1}:{1'b0};
    c_r = (s_ds_r)?sv_flg:rd_flg;
    bs_grnt_pre = (cnt_rbtr == id)?{1'b1}:{1'b0};
    c_a = bs_grnt && ~bs_rqst;
  end
endmodule
///////////////////////////////////////////////////////////////////////
// Definition of the prll bus interface 
///////////////////////////////////////////////////////////////////////

module prll_bs_ntrfs_riscv #(parameter drvrs = 4, parameter bits = 32, parameter id = 0,parameter bdcst = 255)(
  output [bits-1:0] D_push,
  input pndng,
  input clk,
  input reset,
  inout [bits-1:0] bus,
  inout trn_chng,
  inout wrt,
  output pop,
  output push,
  input [bits-1:0] D_pop
);
  wire rst_r;
  wire rst_w;
  wire ld_w;
  wire bs_grnt;
  wire [bits-1:0] bus_pre_w;
  reg ld_r;

  prll_d_reg #(bits) D_reg_rd(.clk(ld_r),.reset(rst_r),.D_in(bus),.D_out(D_push));
  prll_d_reg #(bits) D_reg_wt(.clk(ld_w),.reset(rst_w),.D_in(D_pop),.D_out(bus_pre_w));
  prll_intrfs_cntrl_riscv #(id,bdcst,drvrs) prll_cntrl(.clk(clk),
             .reset(reset),
             .D_in(D_push[bits-1:bits-3]),
             .pndng(pndng),
             .ld_w(ld_w),
             .rst_w(rst_w),
             .rst_r(rst_r),
             .bs_grnt(bs_grnt),
             .push(push),
             .pop(pop),
             .trn_chng(trn_chng),
             .wrt(wrt));
  genvar i;
  generate
    for(i=0;i<bits;i=i+1) begin:bit_
     tri_buf bus_buf (.a(bus_pre_w[i]),.b(bus[i]),.en(bs_grnt)); 
    end
  endgenerate

  always@(*)begin
    ld_r <= ~bs_grnt && wrt;
    
  end
endmodule


module Top_bus #(parameter bits = 65, parameter broadcast = {3{1'b1}}) ( // cambié el bcst
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

  wire  pndng_device0_int;
  wire  pndng_device1_int;
  wire  pndng_device2_int;
  wire  pndng_device3_int;

  
  wire  push_device0_int;
  wire  push_device1_int;
  wire  push_device2_int;
  wire  push_device3_int;

  
  wire  pop_device0_int;
  wire  pop_device1_int;
  wire  pop_device2_int;
  wire  pop_device3_int;
  
  wire  [bits-1:0] D_pop_device0_int;
  wire  [bits-1:0] D_pop_device1_int;
  wire  [bits-1:0] D_pop_device2_int;
  wire  [bits-1:0] D_pop_device3_int;
  
  wire  [bits-1:0] D_push_device0_int;
  wire  [bits-1:0] D_push_device1_int;
  wire  [bits-1:0] D_push_device2_int;
  wire  [bits-1:0] D_push_device3_int;
  
        prll_bs_ntrfs_riscv #(.drvrs(4),.bits(bits),.id(0),.bdcst(broadcast)) device0 (
        .D_push(D_push_device0_int),
        .pndng(pndng_device0_int),
        .clk(clk),
        .reset(reset),
        .bus(bus),
        .trn_chng(trn_chng),
        .wrt(wrt),
        .pop(pop_device0_int),
        .push(push_device0_int),
        .D_pop(D_pop_device0_int));
        
         prll_bs_ntrfs_riscv #(.drvrs(4),.bits(bits),.id(1),.bdcst(broadcast)) device1 (
        .D_push(D_push_device1_int),
        .pndng(pndng_device1_int),
        .clk(clk),
        .reset(reset),
        .bus(bus),
        .trn_chng(trn_chng),
        .wrt(wrt),
        .pop(pop_device1_int),
        .push(push_device1_int),
        .D_pop(D_pop_device1_int));
        
        prll_bs_ntrfs_riscv #(.drvrs(4),.bits(bits),.id(2),.bdcst(broadcast)) device2 (
        .D_push(D_push_device2_int),
        .pndng(pndng_device2_int),
        .clk(clk),
        .reset(reset),
        .bus(bus),
        .trn_chng(trn_chng),
        .wrt(wrt),
        .pop(pop_device2_int),
        .push(push_device2_int),
        .D_pop(D_pop_device2_int));

        prll_bs_ntrfs_riscv # (.drvrs(4),.bits(bits),.id(3),.bdcst(broadcast))device3 (
        .D_push(D_push_device3_int),
        .pndng(pndng_device3_int),
        .clk(clk),
        .reset(reset),
        .bus(bus),
        .trn_chng(trn_chng),
        .wrt(wrt),
        .pop(pop_device3_int),
        .push(push_device3_int),
        .D_pop(D_pop_device3_int));

        fifo_flops_no_full #(.depth(3),.bits(65)) fifo_out_device0(
          .Din(D_push_device0_int),
          .Dout(D_pop_device0),
          .push(push_device0_int),
          .pop(pop_device0),
          .pndng(pndng_device0),
          .rst(reset),
          .clk(clk));

        fifo_flops_no_full #(.depth(3),.bits(65)) fifo_in_device0(
          .Din(D_push_device0),
          .Dout(D_pop_device0_int),
          .push(push_device0),
          .pop(pop_device0_int),
          .pndng(pndng_device0_int),
          .rst(reset),
          .clk(clk));

        fifo_flops_no_full #(.depth(3),.bits(65)) fifo_out_device1(
          .Din(D_push_device1_int),
          .Dout(D_pop_device1),
          .push(push_device1_int),
          .pop(pop_device1),
          .pndng(pndng_device1),
          .rst(reset),
          .clk(clk));

        fifo_flops_no_full #(.depth(3),.bits(65)) fifo_in_device1(
          .Din(D_push_device1),
          .Dout(D_pop_device1_int),
          .push(push_device1),
          .pop(pop_device1_int),
          .pndng(pndng_device1_int),
          .rst(reset),
          .clk(clk));

        fifo_flops_no_full #(.depth(3),.bits(65)) fifo_out_device2(
          .Din(D_push_device2_int),
          .Dout(D_pop_device2),
          .push(push_device2_int),
          .pop(pop_device2),
          .pndng(pndng_device2),
          .rst(reset),
          .clk(clk));

        fifo_flops_no_full #(.depth(3),.bits(65)) fifo_in_device2(
          .Din(D_push_device2),
          .Dout(D_pop_device2_int),
          .push(push_device2),
          .pop(pop_device2_int),
          .pndng(pndng_device2_int),
          .rst(reset),
          .clk(clk));

        fifo_flops_no_full #(.depth(3),.bits(65)) fifo_out_device3(
          .Din(D_push_device3_int),
          .Dout(D_pop_device3),
          .push(push_device3_int),
          .pop(pop_device3),
          .pndng(pndng_device3),
          .rst(reset),
          .clk(clk));

        fifo_flops_no_full #(.depth(3),.bits(65)) fifo_in_device3(
          .Din(D_push_device3),
          .Dout(D_pop_device3_int),
          .push(push_device3),
          .pop(pop_device3_int),
          .pndng(pndng_device3_int),
          .rst(reset),
          .clk(clk));
endmodule