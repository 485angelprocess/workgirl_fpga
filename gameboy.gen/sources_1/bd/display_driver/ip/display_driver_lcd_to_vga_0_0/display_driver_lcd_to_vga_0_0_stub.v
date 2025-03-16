// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Sun Mar  9 13:11:46 2025
// Host        : MSI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/magen/Documents/Programs/gameboy/gameboy.gen/sources_1/bd/display_driver/ip/display_driver_lcd_to_vga_0_0/display_driver_lcd_to_vga_0_0_stub.v
// Design      : display_driver_lcd_to_vga_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "lcd_to_vga,Vivado 2024.1" *)
module display_driver_lcd_to_vga_0_0(consume__valid, consume__vsync, 
  produce__ready, clk, rst, consume__ready, produce__data, produce__valid, produce__vsync, 
  consume__data)
/* synthesis syn_black_box black_box_pad_pin="consume__valid,consume__vsync,produce__ready,rst,consume__ready,produce__data[11:0],produce__valid,produce__vsync,consume__data[11:0]" */
/* synthesis syn_force_seq_prim="clk" */;
  input consume__valid;
  input consume__vsync;
  input produce__ready;
  input clk /* synthesis syn_isclock = 1 */;
  input rst;
  output consume__ready;
  output [11:0]produce__data;
  output produce__valid;
  output produce__vsync;
  input [11:0]consume__data;
endmodule
