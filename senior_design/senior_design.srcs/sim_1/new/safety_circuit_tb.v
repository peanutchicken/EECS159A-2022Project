`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2022 07:35:57 PM
// Design Name: 
// Module Name: safety_circuit_tb
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


module safety_circuit_tb();
    reg clk;
    wire fault;
    wire AMS_outputFault,
        BSPD_outputFault,
        BOTS_outputFault,
        HVD_outputFault,
        IMD_outputFault,
        Inertia_outputFault,
        Master_outputFault,
        Misc_outputFault,
        Shutdown_outputFault;
    reg [16:0]values = 0;
always begin
    clk = 1'b1; 
    #20; // high for 20 * timescale = 20 ns

    clk = 1'b0;
    #20; // low for 20 * timescale = 20 ns
end

    safety_circuit s1(
        .AMS_Fault(values[0]*16'd12000),
        .BSPD_b1(values[1*16'd12000]),
        .BSPD_a1(values[2]*16'd12000),
        .BSPD_a2(values[3]*16'd12000),
        .HVD_Fault(values[4]*16'd12000),
        .IMD_Fault(values[5]*16'd12000),
        .Inertia_Fault(values[6]*16'd12000),
        .Master_Fault(values[7]*16'd12000),
        .Misc_Fault(values[8]*16'd12000),
        .ShutdownL_Fault(values[9]*16'd12000),
        .ShutdownR_Fault(values[10]*16'd12000),
        .ShutdownC_Fault(values[11]*16'd12000),
        .clk(clk),
        .BOTS_Fault(values[12]*16'd12000),
        .fault(fault),
        .BSPD_c(values[13]*5'b11111),
        .BSPD_v(values[14]*16'd120),
        .AMS_outputFault(AMS_outputFault),
        .BSPD_outputFault(BSPD_outputFault),
        .BOTS_outputFault(BOTS_outputFault),
        .HVD_outputFault(HVD_outputFault),
        .IMD_outputFault(IMD_outputFault),
        .Inertia_outputFault(Inertia_outputFault),
        .Master_outputFault(Master_outputFault),
        .Misc_outputFault(Misc_outputFault),
        .Shutdown_outputFault(Shutdown_outputFault)
    );
always @( posedge clk) begin
    values = values + 1;
    #20;
end

endmodule


