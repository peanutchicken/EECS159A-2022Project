`timescale 1ns / 1ps

module BSPD(
    input [7:0]b1,
    input [7:0]a1,
    input [7:0]a2,
    input fault
    );
endmodule

module IMD(
    input [7:0]in,
    output fault
    );
endmodule

module inertia(
    input[7:0]in,
    output fault
    );
endmodule

module shutdown(
    input left,
    input right,
    input center,
    output fault
    );
endmodule

module AMS(
    input [7:0]in,
    output fault
    );
endmodule

module masterSwitch(
    input [7:0]in,
    output fault
    );
endmodule

module HVDInterlock(
    input [7:0]in,
    output fault
    );
endmodule

module miscInterlock(
    input [7:0]in,
    output fault
    );
endmodule