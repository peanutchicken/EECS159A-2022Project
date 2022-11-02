`timescale 1ns / 1ps

//Kyle
module BSPD(
    input clk,
    input [7:0]b1,
    input [7:0]a1,
    input [7:0]a2,
    output reg fault
    );
    
    //counter reg
    reg [23:0]counter;
    
    always@(posedge clk)begin
        //checks if fault is high
        if((b1 >= 8'd11500) && (a1 >= 8'd11500) || (a2 >= 8'd11500))
            counter = counter + 1;
        else
            counter = 24'd0;
            
        //checks if it has been 0.5s
        if(counter >= 24'd12500000) begin
            fault = 1;
        end else begin
            fault = 1'b0;
        end    
        
    end
endmodule

//Kyle
module IMD(
    input clk,
    input [7:0]in,
    output reg fault
    );
    
    always@(posedge clk) begin
        if(in <= 8'd11500) begin
            fault = 1'b1;
        end else begin
            fault = 1'b0;    
        end
    end
endmodule

module inertia(
    input clk,
    input[7:0]in,
    output reg fault
    );
    always @(posedge clk) begin
        if (in <= 8'd11500) begin
            fault = 1'b1;
        end else begin
            fault = 1'b0;    
        end
     end
endmodule


//Kyle
module masterSwitch(
    input clk,
    input [7:0]in,
    output reg fault
    );
    
    always @(posedge clk) begin
        if(in <= 8'd11500)begin
            fault = 1'b1;
        end else begin
            fault = 1'b0;    
        end
    end
endmodule

//Kyle
module BOTS(
    input clk,
    input [7:0]in,
    output reg fault
    );
    
    always @(posedge clk) begin
        if(in <= 8'd11500) begin
            fault = 1'b1;
        end else begin
            fault = 1'b0;    
        end
    end
endmodule

//Kyle
module HVDInterlock(
    input clk,
    input [7:0]in,
    output reg fault
    );
    
    always @(posedge clk) begin
        if(in <= 8'd11500) begin
            fault = 1'b1;
        end else begin
            fault = 1'b0;    
        end
    end
endmodule

//Kyle
module miscInterlock(
    input clk,
    input [7:0]in,
    output reg fault
    );
    
    always @(posedge clk) begin
        if(in <= 8'd11500) begin
            fault = 1'b1;
        end else begin
            fault = 1'b0;    
        end
    end
endmodule

module shutdown(
    input clk,
    input left,
    input right,
    input center,
    output reg fault
    );
    always @ (posedge clk) begin
        if (left || right || center || fault) begin 
            fault = 1'b1;
        end else begin
            fault = 1'b0;
        end
     end
endmodule

module AMS(
    input clk,
    input [7:0]in,
    output reg fault
    );

    always @ (posedge clk) begin
        if (in <= 8'd11500) begin
            fault = 1;
        end else begin
            fault = 1'b0;    
        end
     end
endmodule
