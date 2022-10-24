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
    input [7:0] BSPD_b1,
    input [7:0] BSPD_a1,
    input [7:0] BSPD_a2,
    input [7:0] HVD_Fault,
    input [7:0] IMD_Fault,
    input [7:0] Inertia_Fault,
    input [7:0] Master_Fault,
    input [7:0] BOTS_Fault,
    input [7:0] Misc_Fault,
    input [7:0] ShutdownL_Fault,
    input [7:0] ShutdownR_Fault,
    input [7:0] ShutdownC_Fault,
    output fault
    );
    
    AMS ams0(
        .in(AMS_Fault),
        .fault(fault)
    );
    
    BSPD bspd0(
        .b1(BSPD_b1),
        .a1(BSPD_a1),
        .a2(BSPD_a2),
        .fault(fault)
    );
    
    IMD imd0(
        .in(IMD_Fault),
        .fault(fault)
    );
    
    inertia ine0(
        .in(IMD_Fault),
        .fault(fault)
    );
    
    shutdown shut0(
        .left(ShutdownL_Fault),
        .right(ShutdownR_Fault),
        .center(ShutdownC_Fault),
        .fault(fault)
    );
    
    masterSwitch ms0(
        .in(Master_Fault),
        .fault(fault)
    );
    
    BOTS misc0(
        .in(BOTS_Fault),
        .fault(fault)
    );
    
    HVDInterlock hvd0(
        .in(HVD_Fault),
        .fault(fault)
    );
    
    miscInterlock misc0(
        .in(HVD_Fault),
        .fault(fault)
    );
    
endmodule
