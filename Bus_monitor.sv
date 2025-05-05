class bus_monitor extends uvm_monitor;

	virtual bus_if vif;
	uvm_analysis_port #(bus_seq_item) item_collected_port;
	bus_seq_item trans_collected;
	`uvm_component_utils(bus_monitor)
	function new (string name, uvm_component parent);
		super.new(name, parent);
		trans_collected = new();
		item_collected_port = new("item_collected_port", this);
	endfunction : new

	function void build_phase (uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual bus_if)::get (this, "","vif",vif))
			`uvm_fatal("NOVIF", {"virtual interface must be set for: ", get_full_name(),".vif"});	
	endfunction

	virtual task run_phase(uvm_phase phase);
		forever begin
			@(posedge vif.MONITOR.clk );  // cambié MONITOR por monitor_cb
          	// $display("A ver si esto sí MONITOR");
           //  $display(" MONITOR Dpush0", vif.monitor_cb.D_push_device0);
           //  $display(" MONITOR", vif.monitor_cb.D_push_device1);
           //  $display(" MONITOR", vif.monitor_cb.D_push_device2);
           //  $display(" MONITOR", vif.monitor_cb.D_push_device3);

            if (vif.monitor_cb.push_device0 || vif.monitor_cb.push_device1 || vif.monitor_cb.push_device2 || vif.monitor_cb.push_device3 || vif.monitor_cb.pop_device0 || vif.monitor_cb.pop_device1 || vif.monitor_cb.pop_device2 || vif.monitor_cb.pop_device3 ) begin
              $display("Entra al monitor");
              $display("Antes del item collected MONITOR", vif.monitor_cb.pndng_device1);
              trans_collected.push_device0 = vif.monitor_cb.push_device0;
              trans_collected.push_device1 = vif.monitor_cb.push_device1;
              trans_collected.push_device2 = vif.monitor_cb.push_device2;
              trans_collected.push_device3 = vif.monitor_cb.push_device3;
              trans_collected.D_push_device0 = vif.monitor_cb.D_push_device0;
              trans_collected.D_push_device1 = vif.monitor_cb.D_push_device1;
              trans_collected.D_push_device2 = vif.monitor_cb.D_push_device2;
              trans_collected.D_push_device3 = vif.monitor_cb.D_push_device3;
              trans_collected.pop_device0 = vif.monitor_cb.pop_device0;
              trans_collected.pop_device1 = vif.monitor_cb.pop_device1;
              trans_collected.pop_device3 = vif.monitor_cb.pop_device3;
              trans_collected.pop_device2 = vif.monitor_cb.pop_device2;
              trans_collected.pndng_device0 = vif.monitor_cb.pndng_device0;
              trans_collected.pndng_device1 = vif.monitor_cb.pndng_device1;
              trans_collected.pndng_device2 = vif.monitor_cb.pndng_device2;
              trans_collected.pndng_device3 = vif.monitor_cb.pndng_device3;
              trans_collected.D_pop_device0 = vif.monitor_cb.D_pop_device0;
              trans_collected.D_pop_device1 = vif.monitor_cb.D_pop_device1;
              trans_collected.D_pop_device2 = vif.monitor_cb.D_pop_device2;
              trans_collected.D_pop_device3 = vif.monitor_cb.D_pop_device3;
              item_collected_port.write(trans_collected);   
              $display("después del item collected MONITOR", vif.monitor_cb.pndng_device1);    
            end
        end
	endtask : run_phase

endclass : bus_monitor


//  me había equivocado en cada uno de los ifs por poner 65:63   -.-'



 // $display("Desde monitor, target, source, data %b ", vif.monitor_cb.D_push_device0[64:62], vif.monitor_cb.D_push_device0[61:60], vif.MONITOR.monitor_cb.D_push_device0);
 //            $display("target desde monitor:",vif.monitor_cb.D_push_device0[64:62]);
 //            $display("push_device0 monitor:", vif.monitor_cb.push_device0);
 //            $display("pndng_device1 monitor:", vif.monitor_cb.pndng_device1);





