`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2025 12:28:31 PM
// Design Name: 
// Module Name: tb_verify_vga
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


module tb_verify_vga(

    );
    
    reg clk;
    
    initial begin
        clk = 0;
        forever begin
            #10; clk = ~clk;
        end
    end
    
    verify_vga_wrapper i_vga(
        .clk(clk),
        .ext_reset_in(1'b1)
    );
    
endmodule
