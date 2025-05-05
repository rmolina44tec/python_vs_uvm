class bus_seq_item extends uvm_sequence_item;

  rand bit push_device0;
  rand bit push_device1;
  rand bit push_device2;
  rand bit push_device3;
  rand bit [64:0] D_push_device0;  // VERDAD QUE AQU SON SOLO 60bits?
  rand bit [64:0] D_push_device1;  // Tenía 65, lo cambié por 60 bits.
  rand bit [64:0] D_push_device2;
  rand bit [64:0] D_push_device3;
  rand bit pop_device0;
  rand bit pop_device1;
  rand bit pop_device2;
  rand bit pop_device3;
  bit pndng_device0;
  bit pndng_device1;
  bit pndng_device2;
  bit pndng_device3;
  bit [64:0] D_pop_device0;   
  bit [64:0] D_pop_device1;
  bit [64:0] D_pop_device2;
  bit [64:0] D_pop_device3;

`uvm_object_utils_begin(bus_seq_item)
  `uvm_field_int(push_device0, UVM_ALL_ON)
  `uvm_field_int(push_device1, UVM_ALL_ON)
  `uvm_field_int(push_device2, UVM_ALL_ON)
  `uvm_field_int(push_device3, UVM_ALL_ON)
  `uvm_field_int(pop_device0, UVM_ALL_ON)
  `uvm_field_int(pop_device1, UVM_ALL_ON)
  `uvm_field_int(pop_device2, UVM_ALL_ON)
  `uvm_field_int(pop_device3, UVM_ALL_ON)
  `uvm_field_int(D_push_device0, UVM_ALL_ON)
  `uvm_field_int(D_push_device1, UVM_ALL_ON)
  `uvm_field_int(D_push_device2, UVM_ALL_ON)
  `uvm_field_int(D_push_device3, UVM_ALL_ON)
  `uvm_field_int(pndng_device0, UVM_ALL_ON)
  `uvm_field_int(pndng_device1, UVM_ALL_ON)
  `uvm_field_int(pndng_device2, UVM_ALL_ON)
  `uvm_field_int(pndng_device3, UVM_ALL_ON)
  `uvm_field_int(D_pop_device0, UVM_ALL_ON)
  `uvm_field_int(D_pop_device1, UVM_ALL_ON)
  `uvm_field_int(D_pop_device2, UVM_ALL_ON)
  `uvm_field_int(D_pop_device3, UVM_ALL_ON)
`uvm_object_utils_end


function new (string name= "bus_seq_item");
	super.new(name);
endfunction

endclass : bus_seq_item

/////////////REVISADOOOOOO///////////////////////////