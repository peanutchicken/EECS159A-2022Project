`timescale 1ns / 1ps

//Kyle
module BSPD(
    input clk,
    input [7:0]b1,
    input [7:0]a1,
    input [7:0]a2,
    input fault
    );
    
    //counter reg
    reg [23:0]counter;
    
    always@(posedge clk)begin
        //checks if fault is high
        if((b1 == 1'b1) || (a1 == 1'b1) || (a2 == 1'b1))
            counter++;
        else
            counter = 24'd0;
            
        //checks if it has been 40ns
        if(counter >= 24'd12500000)
            fault = 1;
        
    end
endmodule

//Kyle
module IMD(
    input clk,
    input [7:0]in,
    output reg fault
    );
    
    always@(*)begin
        if(in <= 8'd11500)begin
            fault = 1'b1;
        end
    end
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

//Kyle
module masterSwitch(
    input clk,
    input [7:0]in,
    output reg fault
    );
    
    always@(*)begin
        if(in <= 8'd11500)begin
            fault = 1'b1;
        end
    end
endmodule

//Kyle
module BOTS(
    input clk,
    input [7:0]in,
    output reg fault
    );
    
    always@(*)begin
        if(in <= 8'd11500)begin
            fault = 1'b1;
        end
    end
endmodule

//Kyle
module HVDInterlock(
    input clk,
    input [7:0]in,
    output reg fault
    );
    
    always@(*)begin
        if(in <= 8'd11500)begin
            fault = 1'b1;
        end
    end
endmodule

//Kyle
module miscInterlock(
    input clk,
    input [7:0]in,
    output reg fault
    );
    
    always@(*)begin
        if(in <= 8'd11500)begin
            fault = 1'b1;
        end
    end
endmodule