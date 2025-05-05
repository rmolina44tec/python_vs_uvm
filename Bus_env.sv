`include "Bus_agent.sv"  // ---> Revisar si es el nombre correcto   
`include "Bus_scoreboard.sv"

class bus_env extends uvm_env /* base class*/;
	bus_agent bus_agnt;
	bus_scoreboard bus_scb;

    `uvm_component_utils(bus_env)

function new(string name, uvm_component parent);
	super.new(name,parent);
endfunction : new

function void build_phase (uvm_phase phase);
	super.build_phase(phase);

	bus_agnt = bus_agent :: type_id::create("bus_agnt", this); //mayuscula o minuscula.
	bus_scb = bus_scoreboard::type_id::create("bus_scb", this);
endfunction : build_phase

function void connect_phase(uvm_phase phase);
	bus_agnt.monitor.item_collected_port.connect(bus_scb.item_collected_export);
endfunction : connect_phase

endclass : bus_env

 // Se podría revisar línea 17 y línea 18 si fuera necesario.