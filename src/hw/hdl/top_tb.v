`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 08:26:29 AM
// Design Name: 
// Module Name: top_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_tb; 

    reg tb_ACLK; 
    reg tb_ARESETn; 
    wire temp_clk; 
    wire temp_rstn;  
    reg [31:0] read_data; 
    wire [7:0] leds; 
    reg resp; 


    initial  
    begin        
        tb_ACLK = 1'b0; 
    end 

     

    //------------------------------------------------------------------------ 
    // Simple Clock Generator 
    //------------------------------------------------------------------------ 
    always #10 tb_ACLK = !tb_ACLK; 

        

    initial 
    begin 

        $display ("running the tb"); 
        tb_ARESETn = 1'b0; 
        repeat(20)@(posedge tb_ACLK);         
        tb_ARESETn = 1'b1; 
        @(posedge tb_ACLK); 
        repeat(5) @(posedge tb_ACLK); 

           
  	    tb.mpsoc_sys.mpsoc_preset_i.zynq_ultra_ps_e_0.inst.por_srstb_reset(1'b1); 
        #200; 
        tb.mpsoc_sys.mpsoc_preset_i.zynq_ultra_ps_e_0.inst.por_srstb_reset(1'b0); 
        tb.mpsoc_sys.mpsoc_preset_i.zynq_ultra_ps_e_0.inst.fpga_soft_reset(32'h1); 
        #2000 ;  // This delay depends on your clock frequency. It should be at least 16 clock cycles.  
        tb.mpsoc_sys.mpsoc_preset_i.zynq_ultra_ps_e_0.inst.por_srstb_reset(1'b1); 
        tb.mpsoc_sys.mpsoc_preset_i.zynq_ultra_ps_e_0.inst.fpga_soft_reset(32'h0); 
        #2000 ; 

 
        //This drives the LEDs on the GPIO output 
        tb.mpsoc_sys.mpsoc_preset_i.zynq_ultra_ps_e_0.inst.write_data(32'hA0000000,4, 32'hFFFFFFFF, resp); 
        tb.mpsoc_sys.mpsoc_preset_i.zynq_ultra_ps_e_0.inst.read_data(32'hA0000000,4, read_data, resp); 
        $display ("LEDs are toggled, observe the waveform"); 

        //Write into the BRAM through GP0 and read back 
        tb.mpsoc_sys.mpsoc_preset_i.zynq_ultra_ps_e_0.inst.write_data(32'hA0010000,4, 32'hDEADBEEF, resp); 
        tb.mpsoc_sys.mpsoc_preset_i.zynq_ultra_ps_e_0.inst.read_data(32'hA0010000,4,read_data,resp); 
        $display ("%t, running the testbench, data read from BRAM was 32'h%x",$time, read_data); 

    if(read_data == 32'hDEADBEEF) begin 
           $display ("AXI VIP Test PASSED"); 
        end 
        else begin 
           $display ("AXI VIP Test FAILED"); 
        end 
        $display ("Simulation completed"); 
        $stop; 
    end 

  

    assign temp_clk = tb_ACLK; 
    assign temp_rstn = tb_ARESETn; 

 
system system_i

( 

.led_8bits_tri_o(leds)     

); 

  

   

  

  

endmodule 