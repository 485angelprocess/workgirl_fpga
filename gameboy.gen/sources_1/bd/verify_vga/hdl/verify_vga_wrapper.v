//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
//Date        : Sun Mar  9 13:02:29 2025
//Host        : MSI running 64-bit major release  (build 9200)
//Command     : generate_target verify_vga_wrapper.bd
//Design      : verify_vga_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module verify_vga_wrapper
   (clk,
    ext_reset_in,
    reset_indicator,
    vga_data,
    vga_hsync,
    vga_vsync);
  input clk;
  input ext_reset_in;
  output [0:0]reset_indicator;
  output [11:0]vga_data;
  output vga_hsync;
  output vga_vsync;

  wire clk;
  wire ext_reset_in;
  wire [0:0]reset_indicator;
  wire [11:0]vga_data;
  wire vga_hsync;
  wire vga_vsync;

  verify_vga verify_vga_i
       (.clk(clk),
        .ext_reset_in(ext_reset_in),
        .reset_indicator(reset_indicator),
        .vga_data(vga_data),
        .vga_hsync(vga_hsync),
        .vga_vsync(vga_vsync));
endmodule
