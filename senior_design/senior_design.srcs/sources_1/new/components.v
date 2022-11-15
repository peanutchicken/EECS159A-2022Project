`timescale 1ns / 1ps

//Kyle
module BSPD(
    input clk,
    input [7:0]b1,
    input [7:0]a1,
    input [7:0]a2,
    input signed [4:0]v,
    input [3:0]c,
    output reg fault
    );
    
    reg [23:0]counter; //counter reg
    reg [4:0]power; //power reg
    reg [4:0]abs_v; //absolute value of voltage reg
    
    always@(posedge clk)begin
        //gets abs value of the voltage
        if(v[4] == 1'b1)
            abs_v = -v;
        else
            abs_v = v;
              
        //calc power draw of motor
        power = abs_v * c;
        
        //checks if fault is high or too much power is being drawn
        if((b1 >= 8'd11500) && (a1 >= 8'd11500) || (a2 >= 8'd11500) || power >= 5'd5000)
            counter = counter + 1;
        else
            counter = 24'd0;
            
        //checks if it has been 0.5s
        if(counter >= 24'd12500000) begin
            fault = 1'b1;
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
