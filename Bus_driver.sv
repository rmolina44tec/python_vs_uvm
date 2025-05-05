
`define DRIV_IF vif.DRIVER.driver_cb

class bus_driver extends uvm_driver #(bus_seq_item);

	virtual bus_if vif;
	`uvm_component_utils(bus_driver)

	function new (string name, uvm_component parent);
		super.new(name, parent);
	endfunction : new

	function void build_phase (uvm_phase phase);
		super.build_phase(phase);
		if (!uvm_config_db#(virtual bus_if)::get(this,"","vif", vif))
			`uvm_fatal("NO_VIF", {"virtual interface must be set for:", get_full_name(),".vif"});
	endfunction : build_phase

	virtual task run_phase(uvm_phase phase);
    	forever begin
      		seq_item_port.get_next_item(req);
      		drive();
      		seq_item_port.item_done();
    	end
  	endtask : run_phase
	
	  virtual task drive();
     	  
        `DRIV_IF.push_device0 <= 0;
        `DRIV_IF.push_device1 <= 0;
        `DRIV_IF.push_device2 <= 0;
        `DRIV_IF.push_device3 <= 0;

    @(posedge vif.DRIVER.clk);
     // $display("Valor del push_device0 driver this :  %0b",req.push_device0);
     // $display("Valor del push_device1 driver this :  %0b",req.push_device1);
     // $display("Valor del Dpush_device0 driver this :  %0b",req.D_push_device0);
     // $display("Valor del Dpush_device1 driver this :  %0b",req.D_push_device1);
    if (req.pop_device0 || req.pop_device1 || req.pop_device2 || req.pop_device3 ||req.push_device0 || req.push_device1 || req.push_device2 || req.push_device3 || req.D_push_device0 || req.D_push_device1 || req.D_push_device2 || req.D_push_device3) begin
        vif.DRIVER.driver_cb.push_device0   <= req.push_device0;
        vif.DRIVER.driver_cb.D_push_device0 <= req.D_push_device0;
        vif.DRIVER.driver_cb.pop_device0    <= req.pop_device0;
        vif.DRIVER.driver_cb.pop_device1    <= req.pop_device1;
        vif.DRIVER.driver_cb.pop_device2    <= req.pop_device2;
        vif.DRIVER.driver_cb.pop_device3    <= req.pop_device3;
        vif.DRIVER.driver_cb.push_device1   <= req.push_device1;
        vif.DRIVER.driver_cb.D_push_device1 <= req.D_push_device1;
        vif.DRIVER.driver_cb.pop_device0    <= req.pop_device0;
        vif.DRIVER.driver_cb.pop_device1    <= req.pop_device1;
        vif.DRIVER.driver_cb.pop_device2    <= req.pop_device2;
        vif.DRIVER.driver_cb.pop_device3    <= req.pop_device3;
        vif.DRIVER.driver_cb.push_device2   <= req.push_device2;
        vif.DRIVER.driver_cb.D_push_device2 <= req.D_push_device2;
        vif.DRIVER.driver_cb.pop_device0    <= req.pop_device0;
        vif.DRIVER.driver_cb.pop_device1    <= req.pop_device1;
        vif.DRIVER.driver_cb.pop_device2    <= req.pop_device2;
        vif.DRIVER.driver_cb.pop_device3    <= req.pop_device3;
        vif.DRIVER.driver_cb.push_device3   <= req.push_device3;
        vif.DRIVER.driver_cb.D_push_device3 <= req.D_push_device3;
        vif.DRIVER.driver_cb.pop_device0    <= req.pop_device0;
        vif.DRIVER.driver_cb.pop_device1    <= req.pop_device1;
        vif.DRIVER.driver_cb.pop_device2    <= req.pop_device2;
        vif.DRIVER.driver_cb.pop_device3    <= req.pop_device3;
        @(posedge vif.DRIVER.clk);  // Para que dure un ciclo de reloj
        vif.DRIVER.driver_cb.push_device0 <= 0;
        vif.DRIVER.driver_cb.push_device1 <= 0;
        vif.DRIVER.driver_cb.push_device2 <= 0;
        vif.DRIVER.driver_cb.push_device3 <= 0;
        vif.DRIVER.driver_cb.pop_device0 <= 0;
        vif.DRIVER.driver_cb.pop_device1 <= 0;
        vif.DRIVER.driver_cb.pop_device2 <= 0;
        vif.DRIVER.driver_cb.pop_device3 <= 0;
    end
    //cODE THAT RUNS WHEN WE'RE ABOUT TO SEND DATA TO DUT
    endtask : drive
endclass



////   DE RESERVA 

//vif.DRIVER.driver_cb.pndng_device1    <= req.pndng_device1;
// // $display("Valor del D_push_device0 driver: ",req.D_push_device0);
// // $display("Valor del pop_device0 driver:  %0b",req.pop_device0);
// // $display("Valor del D_pop_device0 driver:  %0b",req.D_pop_device0);
// // $display("Valor del D_pop_device1 driver:  %0b",req.D_pop_device1);
//  $display("Valor del pndng_device0 driver:  %0b",req.pndng_device0);
//  $display("Valor del pndng_device1 driver:  %0b",req.pndng_device1);
//  $display("Valor del pndng_device2 driver:  %0b",req.pndng_device2);
//  $display("Valor del pndng_device3 driver:  %0b",req.pndng_device3);
// $display("Valor del push_device1 driver:  %0b",req.push_device1);
/// Aquí hay algo mal porque el pndng del device0 se está activando. 

// $display("Valor del D_push_device0 driver:  %0b",req.D_push_device0);

// $display("Valor del D_push_device1 driver:  %0b",req.D_push_device1);

// $display("Valor del pop_device0 driver:  %0b",req.pop_device0);

// $display("Valor del pop_device1 driver:  %0b",req.pop_device1);

//  $display("Valor del D_pop_device0 driver:  %0b",req.D_pop_device0);

//  $display("Valor del D_pop_device1 driver:  %0b",req.D_pop_device1);

//  $display("Valor del pndng_device0 driver:  %0b",req.pndng_device0);

//  $display("Valor del pndng_device1 driver:  %0b",req.pndng_device1);

// // $display("Valor del push_device0 driver:  %0b",req.push_device0);

// // $display("Valor del push_device1 driver:  %0b",req.push_device1);

// $display("Valor del D_pop_device0 driver:  %0b",req.D_pop_device0);

//  $display("Valor del D_pop_device1 driver:  %0b",req.D_pop_device1);

//vif.DRIVER.driver_cb.D_push_device0 <= 0;
// $display("Valor de push_device0 driver: ", req.push_device0, req.D_push_device0);  // Está llegando un 1 

// $display("Valor de push_device1 driver: ", req.push_device1, req.D_push_device1);  // Está llegando un 1 

// $display("Valor de push_device2 driver: ", req.push_device2, req.D_push_device2);  // Está llegando un 1 

// $display("Valor de push_device3 driver: ", req.push_device3, req.D_push_device3);  // Está llegando un 1 
