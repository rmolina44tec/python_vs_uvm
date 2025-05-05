import random 
import cocotb
 from cocotb.clock import clock
 from cocotb.triggers import Timer, RisingEdge
 from cocotb.result import TestFailure, ReturnValue

@cocotb.coroutine
