`timescale 1ns / 1ps

module BSPD(
    input clk,
    input [7:0]b1,
    input [7:0]a1,
    input [7:0]a2,
    input fault
    );
endmodule

module IMD(
    input clk,
    input [7:0]in,
    output reg fault
    );
endmodule

module inertia(
    input clk,
    input[7:0]in,
    output reg fault
    );
always @ (*)
 begin
    if (in <= 8'd11500)
    begin
        fault = 1'b1;
    end
 end
endmodule

module shutdown(
    input clk,
    input left,
    input right,
    input center,
    input fault,
    output reg shutdown_signal
    );
always @ (*)
 begin
    if (left || right || center || fault)
        shutdown_signal = 1'b1;
 end
endmodule

module AMS(
    input clk,
    input [7:0]in,
    output reg fault
    );

always @ (*)
 begin
    if (in <= 8'd11500)
    begin
        fault = 1;
    end
 end
endmodule

module masterSwitch(
    input clk,
    input [7:0]in,
    output reg fault
    );
endmodule

module HVDInterlock(
    input clk,
    input [7:0]in,
    output reg fault
    );
endmodule

module missInterlock(
    input clk,
    input [7:0]in,
    output reg fault
    );
endmodule