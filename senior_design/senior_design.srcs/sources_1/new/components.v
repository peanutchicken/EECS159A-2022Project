`timescale 1ns / 1ps

//Kyle
module BSPD(
    input clk,
    input [7:0]b1,
    input [7:0]a1,
    input [7:0]a2,
    input [7:0]v,
    input signed [4:0]c,
    output reg fault
    );
    
    reg [23:0]counter; //counter reg
    reg [12:0]power; //power reg
    reg [4:0]abs_c; //absolute value of voltage reg
    
    always@(posedge clk)begin
        //gets abs value of the voltage
        if(c[4] == 1'b1)
            abs_c = -c;
        else
            abs_c = c;
         
        
        //calc power draw of motor
        power = abs_c / 2500 * 30;
        power = power * v;
        
        //checks if fault is high or too much power is being drawn
        if((b1 >= 8'd11500) && ((a1 >= 8'd11500) || (a2 >= 8'd11500)) && power >= 13'd5000000)
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
