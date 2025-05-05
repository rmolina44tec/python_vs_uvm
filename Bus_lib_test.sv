
class bus_envio0a1_test extends bus_base_test;

  `uvm_component_utils(bus_envio0a1_test)

  bus_envio0a1_sequence seq1;
  bus_pop1_sequence seq2;
  bus_vacia_sequence seq3;

  function new(string name = "bus_envio0a1_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction : new
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // Create the sequence
    seq1 = bus_envio0a1_sequence::type_id::create("seq1");
    seq2 = bus_pop1_sequence::type_id::create("seq2");
    seq3 = bus_vacia_sequence::type_id::create("seq3");
  endfunction : build_phase
  task run_phase(uvm_phase phase);
    $display("Ejecuentando la primera secuencia desde Bus_lib_test 0a1");
    phase.raise_objection(this);
      seq1.start(env.bus_agnt.sequencer);
    phase.drop_objection(this);
    repeat (17) begin 
      phase.raise_objection(this);
        seq3.start(env.bus_agnt.sequencer);
      phase.drop_objection(this);
    end
    phase.raise_objection(this);
      $display("segunda secuencia");
      seq2.start(env.bus_agnt.sequencer);
    phase.drop_objection(this);

    phase.raise_objection(this);
        seq3.start(env.bus_agnt.sequencer);
      phase.drop_objection(this);

    phase.phase_done.set_drain_time(this, 100000);
  endtask : run_phase
endclass


class bus_envio0a2_test extends bus_base_test;

  `uvm_component_utils(bus_envio0a2_test)

  bus_envio0a2_sequence seq1;
  bus_pop2_sequence seq2;
  bus_vacia_sequence seq3;

  function new(string name = "bus_envio0a2_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction : new
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // Create the sequence
    seq1 = bus_envio0a2_sequence::type_id::create("seq1");
    seq2 = bus_pop2_sequence::type_id::create("seq2");
    seq3 = bus_vacia_sequence::type_id::create("seq3");
  endfunction : build_phase
  task run_phase(uvm_phase phase);
    $display("Ejecuentando la segunda secuencia desde Bus_lib_test 0a1");
    phase.raise_objection(this);
      seq1.start(env.bus_agnt.sequencer);
    phase.drop_objection(this);
    
    repeat (17) begin 
      phase.raise_objection(this);
        seq3.start(env.bus_agnt.sequencer);
      phase.drop_objection(this);
    end
    phase.raise_objection(this);
      $display("segunda secuencia");
      seq2.start(env.bus_agnt.sequencer);
    phase.drop_objection(this);

    phase.raise_objection(this);
        seq3.start(env.bus_agnt.sequencer);
      phase.drop_objection(this);

    phase.phase_done.set_drain_time(this, 100000);
  endtask : run_phase
endclass


class bus_envio0a3_test extends bus_base_test;
  `uvm_component_utils(bus_envio0a3_test)
  bus_envio0a3_sequence seq1;
  bus_pop3_sequence seq2;
  bus_vacia_sequence seq3;

  function new(string name = "bus_envio0a3_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction : new
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // Create the sequence
    seq1 = bus_envio0a3_sequence::type_id::create("seq1");
    seq2 = bus_pop3_sequence::type_id::create("seq2");
    seq3 = bus_vacia_sequence::type_id::create("seq3");
  endfunction : build_phase
  task run_phase(uvm_phase phase);
    $display("Ejecuentando la tercera secuencia desde Bus_lib_test 0a1");
    phase.raise_objection(this);
      seq1.start(env.bus_agnt.sequencer);
    phase.drop_objection(this);
    
    repeat (17) begin 
      phase.raise_objection(this);
        seq3.start(env.bus_agnt.sequencer);
      phase.drop_objection(this);
    end
    phase.raise_objection(this);
      $display("segunda secuencia");
      seq2.start(env.bus_agnt.sequencer);
    phase.drop_objection(this);

    phase.raise_objection(this);
        seq3.start(env.bus_agnt.sequencer);
      phase.drop_objection(this);

    phase.phase_done.set_drain_time(this, 10000);
  endtask : run_phase
endclass


class bus_envio0a2y0a3_test extends bus_base_test;
  `uvm_component_utils(bus_envio0a2y0a3_test)
  bus_envio0a2_sequence seq1;
  bus_pop2_sequence seq2;
  bus_vacia_sequence seq3;
  bus_envio0a3_sequence seq4;
  bus_pop3_sequence seq5;

  function new(string name = "bus_envio0a2y0a3_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction : new
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // Create the sequence
    seq1 = bus_envio0a2_sequence::type_id::create("seq1");
    seq2 = bus_pop2_sequence::type_id::create("seq2");
    seq3 = bus_vacia_sequence::type_id::create("seq3");
    seq4 = bus_envio0a3_sequence::type_id::create ("seq4");
    seq5 = bus_pop3_sequence::type_id::create("seq5");

  endfunction : build_phase
  task run_phase(uvm_phase phase);
    $display("Ejecuentando la cuarta secuencia desde Bus_lib_test 0a1");
    phase.raise_objection(this);
      seq1.start(env.bus_agnt.sequencer);
    phase.drop_objection(this);
    repeat (17) begin 
    phase.raise_objection(this);
        seq3.start(env.bus_agnt.sequencer);
    phase.drop_objection(this);
    end
    phase.raise_objection(this);
      $display("segunda secuencia");
      seq2.start(env.bus_agnt.sequencer);
    phase.drop_objection(this);

    phase.raise_objection(this);
        seq4.start(env.bus_agnt.sequencer);
    phase.drop_objection(this);
    repeat (17) begin 
    phase.raise_objection(this);
        seq3.start(env.bus_agnt.sequencer);
    phase.drop_objection(this);
    end
    phase.raise_objection(this);
        seq5.start(env.bus_agnt.sequencer);
    phase.drop_objection(this);

    phase.phase_done.set_drain_time(this, 10000);
  endtask : run_phase

endclass

/// REVISADO! 


