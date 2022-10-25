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
    reg [11:0]values = 0;
always begin
    clk = 1'b1; 
    #20; // high for 20 * timescale = 20 ns

    clk = 1'b0;
    #20; // low for 20 * timescale = 20 ns
end

    safety_circuit(
        .AMS_Fault(values[0]*8'd12000),
        .BSPD_b1(values[1*8'd12000]),
        .BSPD_a1(values[2]*8'd12000),
        .BSPD_a2(values[3]*8'd12000),
        .HVD_Fault(values[4]*8'd12000),
        .IMD_Fault(values[5]*8'd12000),
        .Inertia_Fault(values[6]*8'd12000),
        .Master_Fault(values[7]*8'd12000),
        .Misc_Fault(values[8]*8'd12000),
        .ShutdownL_Fault(values[9]*8'd12000),
        .ShutdownR_Fault(values[10]*8'd12000),
        .ShutdownC_Fault(values[11]*8'd12000),
        .fault(fault)
    );
always @( posedge clk) begin
    values = values + 1;
    #20;
end

endmodule


