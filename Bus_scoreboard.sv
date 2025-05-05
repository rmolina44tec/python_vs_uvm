//-------------------------------------------------------------------------
//						bus_scoreboard - www.verificationguide.com 
//-------------------------------------------------------------------------

// import "DPI-C" function void chequeoC (                   input int D_push_device0,   input int D_push_device1,
//            input int D_push_device2,                      input int D_push_device3,   input int pop_device0,
//            input int pop_device1,                         input int pop_device2,      input int pop_device3, 
//            input int push_device0,                        input int push_device1,     input int push_device2,
//            input int push_device3, input int destino0,    input int destino1,         input int destino2, 
//            input int destino3,     input int fuente0,     input int fuente1,          input int fuente2, 
//            input int fuente3, output long int nuevo);


 /*import "DPI-C" function int chequeoC (input int idestino0, input int destino1,
  input int destino2, input int destino3, input int fuente0, input int fuente1, 
  input int fuente2, input int fuente3, input int parte10, input int parte20, 
  input int parte11, input int parte21, input int parte12, input int parte22,
  input int parte13, input int parte23, input int push_device0,  
  input int push_device1,  input int push_device2,
  input int push_device3,  input int pndng_device0,
  input int pndng_device1, input int pndng_device2,
  input int pndng_device3, input int pop_device0,
  input int pop_device1,   input int pop_dsevice2,
  input int pop_device3,   input int D_pop_device0_fuente,
  input int D_pop_device0_destino, input int D_pop_device0_parte1,
  input int D_pop_device0_parte2, input int D_pop_device1_fuente,
  input int D_pop_device1_destino, input int D_pop_device1_parte1,
  input int D_pop_device1_parte2, input int D_pop_device2_fuente,
  input int D_pop_device2_destino, input int D_pop_device2_parte1,
  input int D_pop_device2_parte2, input int D_pop_device3_fuente,
  input int D_pop_device3_destino, input int D_pop_device3_parte1,
  input int D_pop_device3_parte2,  output int resultado);*/

 //import "DPI-C" function void initxyzzy();

 import "DPI-C" function void clanguage();

class bus_scoreboard extends uvm_scoreboard;
  bus_seq_item pkt_qu[$];
  logic [64:0] pred;
  int resultado;
  logic [1:0] fuente0;
  logic [1:0] fuente1; 
  logic [1:0] fuente3;
  logic [2:0] destino1;  
  logic [2:0] destino3; 
  logic [1:0] fuente2;
  logic [2:0] destino0;
  logic [2:0] destino2; 
  logic [29:0] parte10; 
  logic [29:0] parte20;
  logic [29:0] parte11; 
  logic [29:0] parte21;
  logic [29:0] parte12; 
  logic [29:0] parte22;
  logic [29:0] parte13; 
  logic [29:0] parte23;
  logic [64:0] D_pop_device0;
  logic [64:0] D_pop_device1;
  logic [64:0] D_pop_device2;
  logic [64:0] D_pop_device3;
  logic [1:0]  D_pop_device0_fuente;
  logic [2:0]  D_pop_device0_destino; 
  logic [29:0] D_pop_device0_parte1;
  logic [29:0] D_pop_device0_parte2; 
  logic [1:0]  D_pop_device1_fuente;
  logic [2:0]  D_pop_device1_destino; 
  logic [29:0] D_pop_device1_parte1;
  logic [29:0] D_pop_device1_parte2; 
  logic [1:0]  D_pop_device2_fuente;
  logic [2:0]  D_pop_device2_destino; 
  logic [29:0] D_pop_device2_parte1;
  logic [29:0] D_pop_device2_parte2; 
  logic [1:0]  D_pop_device3_fuente;
  logic [2:0]  D_pop_device3_destino; 
  logic [29:0] D_pop_device3_parte1;
  logic [29:0] D_pop_device3_parte2;
  logic push_device0;
  logic push_device2;
  logic pndng_device0;
  logic pndng_device2;
  logic pop_device0;
  logic pop_device2;
  logic push_device1;
  logic push_device3;
  logic pndng_device1;
  logic pndng_device3;
  logic pop_device1;
  logic pop_device3;
  int prueba;
  //---------------------------------------
  //port to recive packets from monitor
  //---------------------------------------
  uvm_analysis_imp#(bus_seq_item, bus_scoreboard) item_collected_export;
  `uvm_component_utils(bus_scoreboard)

  //---------------------------------------
  // new - constructor
  //---------------------------------------
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
      item_collected_export = new("item_collected_export", this);
  endfunction: build_phase
  
  //---------------------------------------
  // write task - recives the pkt from monitor and pushes into queue
  //---------------------------------------
  virtual function void write(bus_seq_item pkt);
    pkt.print();
    pkt_qu.push_back(pkt);
  endfunction : write

   
        

  virtual task run_phase(uvm_phase phase);
    bus_seq_item bus_pkt;
    forever begin
      wait(pkt_qu.size() > 0);
      bus_pkt = pkt_qu.pop_front();
      destino0=bus_pkt.D_push_device0[64:62];
      destino1=bus_pkt.D_push_device1[64:62];
      destino2=bus_pkt.D_push_device2[64:62];
      destino3=bus_pkt.D_push_device3[64:62];
      fuente0=bus_pkt.D_push_device0[61:60];
      fuente1=bus_pkt.D_push_device1[61:60];
      fuente2=bus_pkt.D_push_device2[61:60];
      fuente3=bus_pkt.D_push_device3[61:60]; 
      parte10=bus_pkt.D_push_device0[59:30];
      parte20=bus_pkt.D_push_device0[29:0];
      parte11=bus_pkt.D_push_device1[59:30];
      parte21=bus_pkt.D_push_device1[29:0];
      parte12=bus_pkt.D_push_device2[59:30];
      parte22=bus_pkt.D_push_device2[29:0];
      parte13=bus_pkt.D_push_device3[59:30];
      parte23=bus_pkt.D_push_device3[29:0];
      push_device0= bus_pkt.push_device0;  
      push_device2= bus_pkt.push_device2;
      pndng_device0=bus_pkt.pndng_device0;
      pndng_device2=bus_pkt.pndng_device2;
      pop_device0= bus_pkt.pop_device0;
      pop_device2= bus_pkt.pop_device2;
      push_device1= bus_pkt.push_device1; 
      push_device3=bus_pkt.push_device3;
      pndng_device1=bus_pkt.pndng_device1;
      pndng_device3=bus_pkt.pndng_device3;
      pop_device1 = bus_pkt.pop_device1;  
      pop_device3=bus_pkt.pop_device3;
      D_pop_device0 = bus_pkt.D_pop_device0;
      D_pop_device1 = bus_pkt.D_pop_device1;
      D_pop_device2 = bus_pkt.D_pop_device2;
      D_pop_device3 = bus_pkt.D_pop_device3;
      
      $display("Destino0, debería ser 1: ",destino0);
      $display("ANTES DE MANDAR EL PNDNG", pndng_device1);
      $display("ANTES DE MANDAR EL pop_device1",pop_device1);
      clanguage();
        

     //initxyzzy();
       /*resultado= chequeoC (destino0, destino1, destino2, destino3, 
       fuente0, fuente1, fuente2, fuente3, parte10, parte20, parte11, 
       parte21, parte12, parte22, parte13, parte23, push_device0, 
       push_device1,  push_device2,  push_device3, 
       pndng_device0, pndng_device1, pndng_device2, 
       pndng_device3, pop_device0,   pop_device1, 
       pop_device2,   pop_device3, D_pop_device0_fuente,
       D_pop_device0_destino, D_pop_device0_parte1,
       D_pop_device0_parte2, D_pop_device1_fuente,
       D_pop_device1_destino, D_pop_device1_parte1,
       D_pop_device1_parte2, D_pop_device2_fuente,
       D_pop_device2_destino, D_pop_device2_parte1,
       D_pop_device2_parte2, D_pop_device3_fuente,
       D_pop_device3_destino, D_pop_device3_parte1,
       D_pop_device3_parte2,  resultado);
       $display("RESULTADO DESDE C, PERO EN SV", resultado);*/

    //     if (bus_pkt.pndng_device0 && bus_pkt.pop_device0)begin                   
    //     pred = fifo0.pop_back();
    //     if (pred != bus_pkt.D_pop_device0)begin
    //       `uvm_error(get_type_name(),"------ ::ERROR :: ------")
    //       `uvm_info(get_type_name(),$sformatf("Debería contener el valor de: %0h",pred),UVM_LOW)
    //     end
    //     else 
    //       `uvm_info(get_type_name(),$sformatf("------ :: YAAAAAY llegó a dispositivo1:: ------"),UVM_LOW)
    //   end

    //   if (bus_pkt.pndng_device1 && bus_pkt.pop_device1)begin                   
    //     pred = fifo1.pop_back();
    //     if (pred != bus_pkt.D_pop_device1)begin
    //       `uvm_error(get_type_name(),"------ ::ERROR :: ------")
    //       `uvm_info(get_type_name(),$sformatf("Debería contener el valor de: %0h",pred),UVM_LOW)
    //     end
    //     else 
    //       `uvm_info(get_type_name(),$sformatf("------ :: YAAAAAY llegó a dispositivo1:: ------"),UVM_LOW)
    //   end

    //   if (bus_pkt.pndng_device2 && bus_pkt.pop_device2)begin                   
    //     pred = fifo2.pop_back();
    //     if (pred != bus_pkt.D_pop_device2)begin
    //       `uvm_error(get_type_name(),"------ ::ERROR :: ------")
    //       `uvm_info(get_type_name(),$sformatf("Debería contener el valor de: %0h",pred),UVM_LOW)
    //     end
    //     else 
    //       `uvm_info(get_type_name(),$sformatf("------ :: YAAAAAY llegó a dispositivo1:: ------"),UVM_LOW)
    //   end

    //   if (bus_pkt.pndng_device3 && bus_pkt.pop_device3)begin                   
    //     pred = fifo3.pop_back();
    //     if (pred != bus_pkt.D_pop_device3)begin
    //       `uvm_error(get_type_name(),"------ ::ERROR :: ------")
    //       `uvm_info(get_type_name(),$sformatf("Debería contener el valor de: %0h",pred),UVM_LOW)
    //     end
    //     else 
    //       `uvm_info(get_type_name(),$sformatf("------ :: YAAAAAY llegó a dispositivo1:: ------"),UVM_LOW)
    //   end
    // end

    end
  endtask 
endclass : bus_scoreboard
          

            










    




      // Insertar la función en Python
    //   $display("bus_pkt.push_device0", bus_pkt.push_device0);
    //   destino0=bus_pkt.D_push_device0[64:62];
    //   destino1=bus_pkt.D_push_device1[64:62];
    //   destino2=bus_pkt.D_push_device2[64:62];
    //   destino3=bus_pkt.D_push_device3[64:62];
    //   fuente0=bus_pkt.D_push_device0[61:60];
    //   fuente1=bus_pkt.D_push_device1[61:60];
    //   fuente2=bus_pkt.D_push_device2[61:60];
    //   fuente3=bus_pkt.D_push_device3[61:60];      
    //   if (bus_pkt.push_device0) begin 
    //       case (destino0)
    //       0: begin
    //           if(fifo0.size() <=3) begin
    //             fifo0.push_front(bus_pkt.D_push_device0);
    //           end
    //           else $display("FIFO 0 está lleno", fifo0.size() );
    //         end
        
    //       1:begin
    //           if(fifo1.size() <=3) begin
    //             fifo1.push_front(bus_pkt.D_push_device0);
    //           end
    //           else $display("FIFO 1 está lleno", fifo1.size() );
    //         end
              
    //       2: begin
    //           if(fifo2.size() <=3) begin
    //             fifo2.push_front(bus_pkt.D_push_device0);
    //           end
    //           else $display("FIFO 2 está lleno", fifo2.size() );
    //         end
    //       3: begin
    //           if(fifo3.size() <=3) begin
    //             fifo3.push_front(bus_pkt.D_push_device0);
    //           end
    //           else $display("FIFO 3 está lleno", fifo3.size() );
    //         end
    //       default: begin
    //             `uvm_error(get_type_name(),"------ ::ERROR :: ------")
    //             `uvm_info(get_type_name(),$sformatf("Sólo hay 4 dispositivos:"),UVM_LOW)
    //             end
    //       endcase // destino0
    //   end
      
    //   if (bus_pkt.push_device1) begin 
    //       case (destino0)
    //       0: begin
    //           if(fifo0.size() <=3) begin
    //             fifo0.push_front(bus_pkt.D_push_device1);
    //           end
    //           else $display("FIFO 0 está lleno", fifo0.size() );
    //         end
        
    //       1:begin
    //           if(fifo1.size() <=3) begin
    //             fifo1.push_front(bus_pkt.D_push_device1);
    //           end
    //           else $display("FIFO 1 está lleno", fifo1.size() );
    //         end
              
    //       2: begin
    //           if(fifo2.size() <=3) begin
    //             fifo2.push_front(bus_pkt.D_push_device1);
    //           end
    //           else $display("FIFO 2 está lleno", fifo2.size() );
    //         end
    //       3: begin
    //           if(fifo3.size() <=3) begin
    //             fifo3.push_front(bus_pkt.D_push_device1);
    //           end
    //           else $display("FIFO 3 está lleno", fifo3.size() );
    //         end
    //       default: begin
    //             `uvm_error(get_type_name(),"------ ::ERROR :: ------")
    //             `uvm_info(get_type_name(),$sformatf("Sólo hay 4 dispositivos:"),UVM_LOW)
    //             end
    //       endcase // destino0
    //     end

    //   if (bus_pkt.push_device2) begin 
    //       case (destino0)
    //       0: begin
    //           if(fifo0.size() <=3) begin
    //             fifo0.push_front(bus_pkt.D_push_device2);
    //           end
    //           else $display("FIFO 0 está lleno", fifo0.size() );
    //         end
        
    //       1:begin
    //           if(fifo1.size() <=3) begin
    //             fifo1.push_front(bus_pkt.D_push_device2);
    //           end
    //           else $display("FIFO 1 está lleno", fifo1.size() );
    //         end
              
    //       2: begin
    //           if(fifo2.size() <=3) begin
    //             fifo2.push_front(bus_pkt.D_push_device2);
    //           end
    //           else $display("FIFO 2 está lleno", fifo2.size() );
    //         end
    //       3: begin
    //           if(fifo3.size() <=3) begin
    //             fifo3.push_front(bus_pkt.D_push_device2);
    //           end
    //           else $display("FIFO 3 está lleno", fifo3.size() );
    //         end
    //       default: begin
    //             `uvm_error(get_type_name(),"------ ::ERROR :: ------")
    //             `uvm_info(get_type_name(),$sformatf("Sólo hay 4 dispositivos:"),UVM_LOW)
    //             end
    //       endcase // destino0
    //   end

    //   if (bus_pkt.push_device3) begin 
    //       case (destino0)
    //       0: begin
    //           if(fifo0.size() <=3) begin
    //             fifo0.push_front(bus_pkt.D_push_device3);
    //           end
    //           else $display("FIFO 0 está lleno", fifo0.size() );
    //         end
        
    //       1:begin
    //           if(fifo1.size() <=3) begin
    //             fifo1.push_front(bus_pkt.D_push_device3);
    //           end
    //           else $display("FIFO 1 está lleno", fifo1.size() );
    //         end
              
    //       2: begin
    //           if(fifo2.size() <=3) begin
    //             fifo2.push_front(bus_pkt.D_push_device3);
    //           end
    //           else $display("FIFO 2 está lleno", fifo2.size() );
    //         end
    //       3: begin
    //           if(fifo3.size() <=3) begin
    //             fifo3.push_front(bus_pkt.D_push_device3);
    //           end
    //           else $display("FIFO 3 está lleno", fifo3.size() );
    //         end
    //       default: begin
    //             `uvm_error(get_type_name(),"------ ::ERROR :: ------")
    //             `uvm_info(get_type_name(),$sformatf("Sólo hay 4 dispositivos:"),UVM_LOW)
    //             end
    //       endcase // destino0
    //   end

    //   if (bus_pkt.pndng_device0 && bus_pkt.pop_device0)begin                   
    //     pred = fifo0.pop_back();
    //     if (pred != bus_pkt.D_pop_device0)begin
    //       `uvm_error(get_type_name(),"------ ::ERROR :: ------")
    //       `uvm_info(get_type_name(),$sformatf("Debería contener el valor de: %0h",pred),UVM_LOW)
    //     end
    //     else 
    //       `uvm_info(get_type_name(),$sformatf("------ :: YAAAAAY llegó a dispositivo1:: ------"),UVM_LOW)
    //   end

    //   if (bus_pkt.pndng_device1 && bus_pkt.pop_device1)begin                   
    //     pred = fifo1.pop_back();
    //     if (pred != bus_pkt.D_pop_device1)begin
    //       `uvm_error(get_type_name(),"------ ::ERROR :: ------")
    //       `uvm_info(get_type_name(),$sformatf("Debería contener el valor de: %0h",pred),UVM_LOW)
    //     end
    //     else 
    //       `uvm_info(get_type_name(),$sformatf("------ :: YAAAAAY llegó a dispositivo1:: ------"),UVM_LOW)
    //   end

    //   if (bus_pkt.pndng_device2 && bus_pkt.pop_device2)begin                   
    //     pred = fifo2.pop_back();
    //     if (pred != bus_pkt.D_pop_device2)begin
    //       `uvm_error(get_type_name(),"------ ::ERROR :: ------")
    //       `uvm_info(get_type_name(),$sformatf("Debería contener el valor de: %0h",pred),UVM_LOW)
    //     end
    //     else 
    //       `uvm_info(get_type_name(),$sformatf("------ :: YAAAAAY llegó a dispositivo1:: ------"),UVM_LOW)
    //   end

    //   if (bus_pkt.pndng_device3 && bus_pkt.pop_device3)begin                   
    //     pred = fifo3.pop_back();
    //     if (pred != bus_pkt.D_pop_device3)begin
    //       `uvm_error(get_type_name(),"------ ::ERROR :: ------")
    //       `uvm_info(get_type_name(),$sformatf("Debería contener el valor de: %0h",pred),UVM_LOW)
    //     end
    //     else 
    //       `uvm_info(get_type_name(),$sformatf("------ :: YAAAAAY llegó a dispositivo1:: ------"),UVM_LOW)
    //   end
    // end
