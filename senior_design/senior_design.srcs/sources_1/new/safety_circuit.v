`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2022 10:23:37 PM
// Design Name: 
// Module Name: safety_circuit
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


module safety_circuit(
    input [7:0] AMS_Fault,
    input [7:0] BOTS_Fault,
    input [7:0] BSPD_b1,
    input [7:0] BSPD_a1,
    input [7:0] BSPD_a2,
    input [7:0] HVD_Fault,
    input [7:0] IMD_Fault,
    input [7:0] Inertia_Fault,
    input [7:0] Master_Fault,
    input [7:0] Misc_Fault,
    input [7:0] ShutdownL_Fault,
    input [7:0] ShutdownR_Fault,
    input [7:0] ShutdownC_Fault,
    input clk,
    output wire AMS_outputFault,
    output wire BSPD_outputFault,
    output wire BOTS_ouptputFault,
    output wire HVD_outputFault,
    output wire IMD_outputFault,
    output wire Inertia_outputFault,
    output wire Master_outputFault,
    output wire Misc_outputFault,
    output wire Shutdown_outputFault,
    output wire fault
    );
    
    
    AMS ams0(
        .clk(clk),
        .in(AMS_Fault),
        .fault(AMS_outputFault)
    );
    
    BSPD bspd0(
        .clk(clk),
        .b1(BSPD_b1),
        .a1(BSPD_a1),
        .a2(BSPD_a2),
        .fault(BSPD_outputFault)
    );
    
    IMD imd0(
        .clk(clk),
        .in(IMD_Fault),
        .fault(IMD_outputFault)
    );
    
    BOTS bots0(
        .clk(clk),
        .in(BOTS_Fault),
        .fault(BOTS_ouptputFault)
    );
    
    inertia ine0(
        .clk(clk),
        .in(Inertia_Fault),
        .fault(Inertia_outputFault)
    );
    
    shutdown shut0(
        .clk(clk),
        .left(ShutdownL_Fault),
        .right(ShutdownR_Fault),
        .center(ShutdownC_Fault),
        .fault(Shutdown_outputFault)
    );
    
    masterSwitch ms0(
        .clk(clk),
        .in(Master_Fault),
        .fault(Master_outputFault)
    );
    
    HVDInterlock hvd0(
        .clk(clk),
        .in(HVD_Fault),
        .fault(HVD_outputFault)
    );
    
    miscInterlock misc0(
        .clk(clk),
        .in(Misc_Fault),
        .fault(Misc_outputFault)
    );
    
    assign fault = AMS_outputFault | BSPD_outputFault | IMD_outputFault | BOTS_ouptputFault | Inertia_outputFault | Shutdown_outputFault | Master_outputFault | HVD_outputFault | Misc_outputFault;
endmodule
