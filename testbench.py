import random 
import cocotb
 from cocotb.clock import clock
 from cocotb.triggers import Timer, RisingEdge
 from cocotb.result import TestFailure, ReturnValue


def envio_0a1(DUT, valor_enviado, valor_recibido, fifo):
    yield RisingEdge(DUT.clk)
    dut.D_push_device0=valor_enviado


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