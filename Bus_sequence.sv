class bus_sequence extends uvm_sequence # (bus_seq_item);

	`uvm_object_utils(bus_sequence) 
	function new(string name= "bus_sequence");
		super.new(name);
	endfunction
	`uvm_declare_p_sequencer(bus_sequencer)
	virtual task body();
	 begin
		req=bus_seq_item::type_id::create("req");
		wait_for_grant();
		req.randomize();
		send_request(req);
		wait_for_item_done();
	 end
	endtask
endclass 
//////////////////////////////////////////////////////////
/////  ENVÍO DE DATOS DEL DISPOSITIVO 1, 2 & 3 ....... /////  
//////////////////////////////////////////////////////////
class bus_envio0a0_sequence extends uvm_sequence # (bus_seq_item);
    logic [2:0] target0=0;
    logic [2:0] target1=1;
    logic [2:0] target2=2;
    logic [2:0] target3=3;
    logic [2:0] target4=4; // Sólo para probar el manejo de error del SC
    logic [1:0] source0=0;
    logic [1:0] source1=1;
    logic [1:0] source2=2;
    logic [1:0] source3=3;
    `uvm_object_utils(bus_envio0a0_sequence)
    //Constructor
    function new(string name = "bus_envio0a0_sequence");
    super.new(name);
   endfunction
    `uvm_declare_p_sequencer(bus_sequencer)
    // create, randomize and send the item to driver
    virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.push_device0=1;
    req.push_device1=0;
    req.push_device2=0;
    req.push_device3=0;
    req.D_push_device0={target0,source0,{60{1'b0}}};
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    send_request(req);
    wait_for_item_done();

   end 
  endtask
endclass

class bus_envio0a1_sequence extends uvm_sequence # (bus_seq_item);
  logic [2:0] target0=0;
    logic [2:0] target1=1;
    logic [2:0] target2=2;
    logic [2:0] target3=3;
    logic [2:0] target4=4; // Sólo para probar el manejo de error del SC
    logic [1:0] source0=0;
    logic [1:0] source1=1;
    logic [1:0] source2=2;
    logic [1:0] source3=3;
  `uvm_object_utils(bus_envio0a1_sequence)
  //Constructor
  function new(string name = "bus_envio0a1_sequence");
    super.new(name);
  endfunction
  
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.push_device0=1;
    req.push_device1=0;
    req.push_device2=0;
   	req.push_device3=0;
  	req.D_push_device0={target1,source0,{5{1'b1}},{55{1'b0}}};
   	req.D_push_device1=0;
  	req.D_push_device2=0;
  	req.D_push_device3=0;
    req.pop_device0=0;
    req.pop_device1=0;
    req.pop_device2=0;
    req.pop_device3=0;
    $display("D_push0 desde sequence: %0b", req.D_push_device0 );
    $display("D push1 desde sequence: %0b", req.D_push_device1 );
    send_request(req);
    wait_for_item_done(); 
    $display("target1 %b ",target1, "& source0 %b", source0, "desde sequence");

    $display("D_push0 desde sequence: %0b", req.D_push_device0 );
    $display("D push1 desde sequence: %0b", req.D_push_device1 );
    //// El sequence está bien, ya hice pruebas de impresión de datos.
   end 
  endtask
endclass

class bus_envio0a2_sequence extends uvm_sequence # (bus_seq_item);
  logic [2:0] target2=2;
  logic [2:0] target4=4; // Sólo para probar el manejo de error del SC
  logic [1:0] source0=0;
  `uvm_object_utils(bus_envio0a2_sequence)
  //Constructor
  function new(string name = "bus_envio0a2_sequence");
    super.new(name);
  endfunction
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.push_device0=1;
    req.push_device1=0;
    req.push_device2=0;
    req.push_device3=0;
    req.D_push_device0={target2,source0,{60{1'b0}}};
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    req.pop_device0=0;
    req.pop_device1=0;
    req.pop_device2=0;
    req.pop_device3=0;
    send_request(req);
    wait_for_item_done();

   end 
  endtask
endclass

class bus_envio0a3_sequence extends uvm_sequence # (bus_seq_item);
  logic [2:0] target3=3;
  logic [2:0] target4=4; // Sólo para probar el manejo de error del SC
  logic [1:0] source0=0;
  `uvm_object_utils(bus_envio0a3_sequence)
  //Constructor
  function new(string name = "bus_envio0a3_sequence");
    super.new(name);
  endfunction
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.push_device0=1;
    req.push_device1=0;
    req.push_device2=0;
    req.push_device3=0;
    req.D_push_device0={target3,source0,{60{1'b0}}};
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    req.pop_device0=0;
    req.pop_device1=0;
    req.pop_device2=0;
    req.pop_device3=0;
    send_request(req);
    wait_for_item_done();

   end 
  endtask
endclass
//////////////////////////////////////////////////////////
/////  DISPOSITIVO 1 AL...... /////////////
//////////////////////////////////////////////////////////
class bus_envio1a0_sequence extends uvm_sequence # (bus_seq_item);
  logic [2:0] target0=0;
    logic [2:0] target1=1;
    logic [2:0] target2=2;
    logic [2:0] target3=3;
    logic [2:0] target4=4; // Sólo para probar el manejo de error del SC
    logic [1:0] source0=0;
    logic [1:0] source1=1;
    logic [1:0] source2=2;
    logic [1:0] source3=3;
  `uvm_object_utils(bus_envio1a0_sequence)
  //Constructor
  function new(string name = "bus_envio1a0_sequence");
    super.new(name);
  endfunction
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.push_device0=0;
    req.push_device1=1;
    req.push_device2=0;
    req.push_device3=0;
    req.D_push_device0={target0,source1,{60{1'b1}}};
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    req.pop_device0=0;
    req.pop_device1=0;
    req.pop_device2=0;
    req.pop_device3=0;
    send_request(req);
    wait_for_item_done();

   end 
  endtask
endclass

class bus_envio1a1_sequence extends uvm_sequence # (bus_seq_item);
  logic [2:0] target0=0;
    logic [2:0] target1=1;
    logic [2:0] target2=2;
    logic [2:0] target3=3;
    logic [2:0] target4=4; // Sólo para probar el manejo de error del SC
    logic [1:0] source0=0;
    logic [1:0] source1=1;
    logic [1:0] source2=2;
    logic [1:0] source3=3;
  `uvm_object_utils(bus_envio1a1_sequence)
  //Constructor
  function new(string name = "bus_envio1a1_sequence");
    super.new(name);
  endfunction
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.push_device0=0;
    req.push_device1=1;
    req.push_device2=0;
    req.push_device3=0;
    req.D_push_device0={target1,source1,{60{1'b0}}};
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    req.pop_device0=0;
    req.pop_device1=0;
    req.pop_device2=0;
    req.pop_device3=0;
    send_request(req);
    wait_for_item_done();

   end 
  endtask
endclass

class bus_envio1a2_sequence extends uvm_sequence # (bus_seq_item);
 logic [2:0] target0=0;
    logic [2:0] target1=1;
    logic [2:0] target2=2;
    logic [2:0] target3=3;
    logic [2:0] target4=4; // Sólo para probar el manejo de error del SC
    logic [1:0] source0=0;
    logic [1:0] source1=1;
    logic [1:0] source2=2;
    logic [1:0] source3=3; 
  `uvm_object_utils(bus_envio1a2_sequence)
  //Constructor
  function new(string name = "bus_envio1a2_sequence");
    super.new(name);
  endfunction
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.push_device0=0;
    req.push_device1=1;
    req.push_device2=0;
    req.push_device3=0;
    req.D_push_device0={target2,source1,{60{1'b1}}};
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    req.pop_device0=0;
    req.pop_device1=0;
    req.pop_device2=0;
    req.pop_device3=0;
    send_request(req);
    wait_for_item_done();

   end 
  endtask
endclass

class bus_envio1a3_sequence extends uvm_sequence # (bus_seq_item);
  logic [2:0] target0=0;
    logic [2:0] target1=1;
    logic [2:0] target2=2;
    logic [2:0] target3=3;
    logic [2:0] target4=4; // Sólo para probar el manejo de error del SC
    logic [1:0] source0=0;
    logic [1:0] source1=1;
    logic [1:0] source2=2;
    logic [1:0] source3=3;
  `uvm_object_utils(bus_envio1a3_sequence)
  //Constructor
  function new(string name = "bus_envio1a3_sequence");
    super.new(name);
  endfunction
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.push_device0=0;
    req.push_device1=1;
    req.push_device2=0;
    req.push_device3=0;
    req.D_push_device0={target3,source1,{60{1'b0}}};
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    req.pop_device0=0;
    req.pop_device1=0;
    req.pop_device2=0;
    req.pop_device3=0;
    send_request(req);
    wait_for_item_done();

   end 
  endtask
endclass
//////////////////////////////////////////////////////////
/////  DISPOSITIVO 2 AL...... /////  ///////////// 
////////////////////////////////////////////////////////////
class bus_envio2a0_sequence extends uvm_sequence # (bus_seq_item);
  logic [2:0] target0=0;
    logic [2:0] target1=1;
    logic [2:0] target2=2;
    logic [2:0] target3=3;
    logic [2:0] target4=4; // Sólo para probar el manejo de error del SC
    logic [1:0] source0=0;
    logic [1:0] source1=1;
    logic [1:0] source2=2;
    logic [1:0] source3=3;
  `uvm_object_utils(bus_envio2a0_sequence)
  //Constructor
  function new(string name = "bus_envio2a0_sequence");
    super.new(name);
  endfunction
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.push_device0=0;
    req.push_device1=0;
    req.push_device2=1;
    req.push_device3=0;
    req.D_push_device0={target0,source2,{60{1'b0}}};
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    req.pop_device0=0;
    req.pop_device1=0;
    req.pop_device2=0;
    req.pop_device3=0;
    send_request(req);
    wait_for_item_done();

   end 
  endtask
endclass

class bus_envio2a1_sequence extends uvm_sequence # (bus_seq_item);
  logic [2:0] target0=0;
    logic [2:0] target1=1;
    logic [2:0] target2=2;
    logic [2:0] target3=3;
    logic [2:0] target4=4; // Sólo para probar el manejo de error del SC
    logic [1:0] source0=0;
    logic [1:0] source1=1;
    logic [1:0] source2=2;
    logic [1:0] source3=3;
  `uvm_object_utils(bus_envio2a1_sequence)
  //Constructor
  function new(string name = "bus_envio2a1_sequence");
    super.new(name);
  endfunction
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.push_device0=0;
    req.push_device1=0;
    req.push_device2=1;
    req.push_device3=0;
    req.D_push_device0={target1,source2,{60{1'b0}}};
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    req.pop_device0=0;
    req.pop_device1=0;
    req.pop_device2=0;
    req.pop_device3=0;
    send_request(req);
    wait_for_item_done();

   end 
  endtask
endclass

class bus_envio2a2_sequence extends uvm_sequence # (bus_seq_item);
  logic [2:0] target0=0;
    logic [2:0] target1=1;
    logic [2:0] target2=2;
    logic [2:0] target3=3;
    logic [2:0] target4=4; // Sólo para probar el manejo de error del SC
    logic [1:0] source0=0;
    logic [1:0] source1=1;
    logic [1:0] source2=2;
    logic [1:0] source3=3;
  `uvm_object_utils(bus_envio2a2_sequence)
  //Constructor
  function new(string name = "bus_envio2a2_sequence");
    super.new(name);
  endfunction
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.push_device0=0;
    req.push_device1=0;
    req.push_device2=1;
    req.push_device3=0;
    req.D_push_device0={target2,source2,{60{1'b0}}};
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    req.pop_device0=0;
    req.pop_device1=0;
    req.pop_device2=0;
    req.pop_device3=0;
    send_request(req);
    wait_for_item_done();

   end 
  endtask
endclass

class bus_envio2a3_sequence extends uvm_sequence # (bus_seq_item);
  logic [2:0] target0=0;
    logic [2:0] target1=1;
    logic [2:0] target2=2;
    logic [2:0] target3=3;
    logic [2:0] target4=4; // Sólo para probar el manejo de error del SC
    logic [1:0] source0=0;
    logic [1:0] source1=1;
    logic [1:0] source2=2;
    logic [1:0] source3=3;
  `uvm_object_utils(bus_envio2a3_sequence)
  //Constructor
  function new(string name = "bus_envio2a3_sequence");
    super.new(name);
  endfunction
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.push_device0=0;
    req.push_device1=0;
    req.push_device2=1;
    req.push_device3=0;
    req.D_push_device0={target3,source2,{60{1'b0}}};
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    req.pop_device0=0;
    req.pop_device1=0;
    req.pop_device2=0;
    req.pop_device3=0;
    send_request(req);
    wait_for_item_done();

   end 
  endtask
endclass
//////////////////////////////////////////////////////////
///  DISPOSITIVO 3 AL...... /////  ///////////// 
//////////////////////////////////////////////////////////
class bus_envio3a0_sequence extends uvm_sequence # (bus_seq_item);
  logic [2:0] target0=0;
    logic [2:0] target1=1;
    logic [2:0] target2=2;
    logic [2:0] target3=3;
    logic [2:0] target4=4; // Sólo para probar el manejo de error del SC
    logic [1:0] source0=0;
    logic [1:0] source1=1;
    logic [1:0] source2=2;
    logic [1:0] source3=3;
  `uvm_object_utils(bus_envio3a0_sequence)
  //Constructor
  function new(string name = "bus_envio3a0_sequence");
    super.new(name);
  endfunction
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.push_device0=0;
    req.push_device1=0;
    req.push_device2=0;
    req.push_device3=1;
    req.D_push_device0={target0,source3,{60{1'b0}}};
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    req.pop_device0=0;
    req.pop_device1=0;
    req.pop_device2=0;
    req.pop_device3=0;
    send_request(req);
    wait_for_item_done();

   end 
  endtask
endclass

class bus_envio3a1_sequence extends uvm_sequence # (bus_seq_item);
  logic [2:0] target0=0;
    logic [2:0] target1=1;
    logic [2:0] target2=2;
    logic [2:0] target3=3;
    logic [2:0] target4=4; // Sólo para probar el manejo de error del SC
    logic [1:0] source0=0;
    logic [1:0] source1=1;
    logic [1:0] source2=2;
    logic [1:0] source3=3;
  `uvm_object_utils(bus_envio3a1_sequence)
  //Constructor
  function new(string name = "bus_envio3a1_sequence");
    super.new(name);
  endfunction
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.push_device0=0;
    req.push_device1=0;
    req.push_device2=0;
    req.push_device3=1;
    req.D_push_device0={target1,source3,{60{1'b0}}};
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    req.pop_device0=0;
    req.pop_device1=0;
    req.pop_device2=0;
    req.pop_device3=0;
    send_request(req);
    wait_for_item_done();

   end 
  endtask
endclass

class bus_envio3a2_sequence extends uvm_sequence # (bus_seq_item);
  logic [2:0] target0=0;
    logic [2:0] target1=1;
    logic [2:0] target2=2;
    logic [2:0] target3=3;
    logic [2:0] target4=4; // Sólo para probar el manejo de error del SC
    logic [1:0] source0=0;
    logic [1:0] source1=1;
    logic [1:0] source2=2;
    logic [1:0] source3=3;
  `uvm_object_utils(bus_envio3a0_sequence)
  //Constructor
  function new(string name = "bus_envio3a2_sequence");
    super.new(name);
  endfunction
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.push_device0=0;
    req.push_device1=0;
    req.push_device2=0;
    req.push_device3=1;
    req.D_push_device0={target2,source3,{60{1'b0}}};
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    req.pop_device0=0;
    req.pop_device1=0;
    req.pop_device2=0;
    req.pop_device3=0;
    send_request(req);
    wait_for_item_done();

   end 
  endtask
endclass

class bus_envio3a3_sequence extends uvm_sequence # (bus_seq_item);
  logic [2:0] target0=0;
    logic [2:0] target1=1;
    logic [2:0] target2=2;
    logic [2:0] target3=3;
    logic [2:0] target4=4; // Sólo para probar el manejo de error del SC
    logic [1:0] source0=0;
    logic [1:0] source1=1;
    logic [1:0] source2=2;
    logic [1:0] source3=3;
  `uvm_object_utils(bus_envio3a3_sequence)
  //Constructor
  function new(string name = "bus_envio3a3_sequence");
    super.new(name);
  endfunction
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.push_device0=0;
    req.push_device1=0;
    req.push_device2=0;
    req.push_device3=1;
    req.D_push_device0={target3,source3,{60{1'b0}}};
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    req.pop_device0=0;
    req.pop_device1=0;
    req.pop_device2=0;
    req.pop_device3=0;
    send_request(req);
    wait_for_item_done();

   end 
  endtask
endclass
////////////////////////////////////////////////////////////
///// CAMBIO DE DATO EN EL DISPOSITIVO........ /////  
////////////////////////////////////////////////////////////
class bus_cambiodato1a1_sequence extends uvm_sequence # (bus_seq_item);
  logic [2:0] target0=0;
    logic [2:0] target1=1;
    logic [2:0] target2=2;
    logic [2:0] target3=3;
    logic [2:0] target4=4; // Sólo para probar el manejo de error del SC
    logic [1:0] source0=0;
    logic [1:0] source1=1;
    logic [1:0] source2=2;
    logic [1:0] source3=3;
  `uvm_object_utils(bus_cambiodato1a1_sequence)
  //Constructor
  function new(string name = "bus_cambiodato1a1_sequence");
    super.new(name);
  endfunction
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.push_device0=0;
    req.push_device1=0;
    req.push_device2=0;
    req.push_device3=0;
    req.D_push_device0={target1,source1,{60{1'b1}}};
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    req.pop_device0=0;
    req.pop_device1=0;
    req.pop_device2=0;
    req.pop_device3=0;
    send_request(req);
    wait_for_item_done();

   end 
  endtask
endclass

class bus_cambiodato0a0_sequence extends uvm_sequence # (bus_seq_item);
  logic [2:0] target0=0;
    logic [2:0] target1=1;
    logic [2:0] target2=2;
    logic [2:0] target3=3;
    logic [2:0] target4=4; // Sólo para probar el manejo de error del SC
    logic [1:0] source0=0;
    logic [1:0] source1=1;
    logic [1:0] source2=2;
    logic [1:0] source3=3;
  `uvm_object_utils(bus_cambiodato0a0_sequence)
  //Constructor
  function new(string name = "bus_cambiodato0a0_sequence");
    super.new(name);
  endfunction
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.push_device0=0;
    req.push_device1=0;
    req.push_device2=0;
    req.push_device3=0;
    req.D_push_device0={target0,source0,{60{1'b1}}};
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    req.pop_device0=0;
    req.pop_device1=0;
    req.pop_device2=0;
    req.pop_device3=0;
    send_request(req);
    wait_for_item_done();

   end 
  endtask
endclass

class bus_cambiodato2a2_sequence extends uvm_sequence # (bus_seq_item);
  logic [2:0] target0=0;
    logic [2:0] target1=1;
    logic [2:0] target2=2;
    logic [2:0] target3=3;
    logic [2:0] target4=4; // Sólo para probar el manejo de error del SC
    logic [1:0] source0=0;
    logic [1:0] source1=1;
    logic [1:0] source2=2;
    logic [1:0] source3=3;
  `uvm_object_utils(bus_cambiodato2a2_sequence)
  //Constructor
  function new(string name = "bus_cambiodato2a2_sequence");
    super.new(name);
  endfunction
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.push_device0=0;
    req.push_device1=0;
    req.push_device2=0;
    req.push_device3=0;
    req.D_push_device0={target2,source2,{60{1'b1}}};
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    req.pop_device0=0;
    req.pop_device1=0;
    req.pop_device2=0;
    req.pop_device3=0;
    send_request(req);
    wait_for_item_done();

   end 
  endtask
endclass

class bus_cambiodato3a3_sequence extends uvm_sequence # (bus_seq_item);
 logic [2:0] target0=0;
    logic [2:0] target1=1;
    logic [2:0] target2=2;
    logic [2:0] target3=3;
    logic [2:0] target4=4; // Sólo para probar el manejo de error del SC
    logic [1:0] source0=0;
    logic [1:0] source1=1;
    logic [1:0] source2=2;
    logic [1:0] source3=3; 
  `uvm_object_utils(bus_cambiodato3a3_sequence)
  //Constructor
  function new(string name = "bus_cambiodato3a3_sequence");
    super.new(name);
  endfunction
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.push_device0=0;
    req.push_device1=0;
    req.push_device2=0;
    req.push_device3=0;
    req.D_push_device0={target3,source3,{60{1'b1}}};
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    req.pop_device0=0;
    req.pop_device1=0;
    req.pop_device2=0;
    req.pop_device3=0;
    send_request(req);
    wait_for_item_done();

   end 
  endtask
endclass

////////////////////////////////////////////////////////////
/////  ACTIVACIÓN DE LOS POPS ....... /////  
////////////////////////////////////////////////////////////

class bus_pop0_sequence extends uvm_sequence # (bus_seq_item);
  
  `uvm_object_utils(bus_pop0_sequence)
  //Constructor
  function new(string name = "bus_pop0_sequence");
    super.new(name);
  endfunction
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.push_device0=0;
    req.push_device1=0;
    req.push_device2=0;
    req.push_device3=0;
    req.D_push_device0=0;
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    req.pop_device1=0;
    req.pop_device2=0;
    req.pop_device3=0;
    req.pop_device0=1;

    send_request(req);
    wait_for_item_done();

   end 
  endtask
endclass

class bus_pop1_sequence extends uvm_sequence # (bus_seq_item);
  `uvm_object_utils(bus_pop1_sequence)
  //Constructor
  function new(string name = "bus_pop1_sequence");
    super.new(name);
  endfunction
  
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    $display("pop1  :D ");
    req.randomize();
    req.push_device0=0;
    req.push_device1=0;
    req.push_device2=0;
    req.push_device3=0;
    req.D_push_device0=0;
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    req.pop_device0=0;
    req.pop_device1=1;
    req.pop_device2=0;
    req.pop_device3=0;
    send_request(req);
    wait_for_item_done();
   end 
  endtask
endclass

class bus_pop2_sequence extends uvm_sequence # (bus_seq_item);
  
  `uvm_object_utils(bus_pop2_sequence)
  //Constructor
  function new(string name = "bus_pop2_sequence");
    super.new(name);
  endfunction
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    req.push_device0=0;
    req.push_device1=0;
    req.push_device2=0;
    req.push_device3=0;
    req.D_push_device0=0;
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    req.pop_device0=0;
    req.pop_device1=0;
    req.pop_device3=0;
    req.pop_device2=1;

    send_request(req);
    wait_for_item_done();

   end 
  endtask
endclass

class bus_pop3_sequence extends uvm_sequence # (bus_seq_item);
  
  `uvm_object_utils(bus_pop3_sequence)
  //Constructor
  function new(string name = "bus_pop3_sequence");
    super.new(name);
  endfunction
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    req.push_device0=0;
    req.push_device1=0;
    req.push_device2=0;
    req.push_device3=0;
    req.D_push_device0=0;
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    req.pop_device0=0;
    req.pop_device1=0;
    req.pop_device2=0;
    req.pop_device3=1;
    send_request(req);
    wait_for_item_done();

   end 
  endtask
endclass

class bus_vacia_sequence extends uvm_sequence # (bus_seq_item);
  `uvm_object_utils(bus_vacia_sequence)
  //Constructor
  function new(string name = "bus_vacia_sequence");
    super.new(name);
  endfunction
  
  `uvm_declare_p_sequencer(bus_sequencer)
  // create, randomize and send the item to driver
  virtual task body();
    begin
    req = bus_seq_item::type_id::create("req");
    wait_for_grant();
    $display("vacia  :D ");
    req.randomize();
    req.push_device0=0;
    req.push_device1=0;
    req.push_device2=0;
    req.push_device3=0;
    req.D_push_device0=0;
    req.D_push_device1=0;
    req.D_push_device2=0;
    req.D_push_device3=0;
    req.pop_device0=0;
    req.pop_device1=0;
    req.pop_device2=0;
    req.pop_device3=0;
    send_request(req);
    wait_for_item_done();
   end 
  endtask
endclass
