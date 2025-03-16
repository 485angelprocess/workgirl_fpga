//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
//Date        : Sun Mar  9 12:26:54 2025
//Host        : MSI running 64-bit major release  (build 9200)
//Command     : generate_target display_driver.bd
//Design      : display_driver
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "display_driver,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=display_driver,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "display_driver.hwdef" *) 
module display_driver
   (clk,
    ext_reset_in,
    reset_indicator,
    vga_data,
    vga_hsync,
    vga_vsync);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN display_driver_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.EXT_RESET_IN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.EXT_RESET_IN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input ext_reset_in;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_INDICATOR RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_INDICATOR, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) output [0:0]reset_indicator;
  output [11:0]vga_data;
  output vga_hsync;
  output vga_vsync;

  wire clk_1;
  wire clk_wiz_0_clk_out1;
  wire ext_reset_in_1;
  wire lcd_to_vga_0_consume__ready;
  wire [11:0]lcd_to_vga_0_produce__data;
  wire lcd_to_vga_0_produce__valid;
  wire lcd_to_vga_0_produce__vsync;
  wire [0:0]proc_sys_reset_0_peripheral_reset;
  wire vga_driver_svga_0_consume__ready;
  wire [11:0]vga_driver_svga_0_data;
  wire vga_driver_svga_0_hsync;
  wire vga_driver_svga_0_vsync;
  wire [11:0]vga_verify_0_produce__data;
  wire vga_verify_0_produce__valid;
  wire vga_verify_0_produce__vsync;

  assign clk_1 = clk;
  assign ext_reset_in_1 = ext_reset_in;
  assign reset_indicator[0] = proc_sys_reset_0_peripheral_reset;
  assign vga_data[11:0] = vga_driver_svga_0_data;
  assign vga_hsync = vga_driver_svga_0_hsync;
  assign vga_vsync = vga_driver_svga_0_vsync;
  display_driver_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(clk_1),
        .clk_out1(clk_wiz_0_clk_out1));
  display_driver_lcd_to_vga_0_0 lcd_to_vga_0
       (.clk(clk_wiz_0_clk_out1),
        .consume__data(vga_verify_0_produce__data),
        .consume__ready(lcd_to_vga_0_consume__ready),
        .consume__valid(vga_verify_0_produce__valid),
        .consume__vsync(vga_verify_0_produce__vsync),
        .produce__data(lcd_to_vga_0_produce__data),
        .produce__ready(vga_driver_svga_0_consume__ready),
        .produce__valid(lcd_to_vga_0_produce__valid),
        .produce__vsync(lcd_to_vga_0_produce__vsync),
        .rst(proc_sys_reset_0_peripheral_reset));
  display_driver_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(ext_reset_in_1),
        .mb_debug_sys_rst(1'b0),
        .peripheral_reset(proc_sys_reset_0_peripheral_reset),
        .slowest_sync_clk(clk_wiz_0_clk_out1));
  display_driver_vga_driver_svga_0_0 vga_driver_svga_0
       (.clk(clk_wiz_0_clk_out1),
        .consume__data(lcd_to_vga_0_produce__data),
        .consume__ready(vga_driver_svga_0_consume__ready),
        .consume__valid(lcd_to_vga_0_produce__valid),
        .consume__vsync(lcd_to_vga_0_produce__vsync),
        .data(vga_driver_svga_0_data),
        .hsync(vga_driver_svga_0_hsync),
        .rst(proc_sys_reset_0_peripheral_reset),
        .vsync(vga_driver_svga_0_vsync));
  display_driver_vga_verify_0_0 vga_verify_0
       (.clk(clk_wiz_0_clk_out1),
        .produce__data(vga_verify_0_produce__data),
        .produce__ready(lcd_to_vga_0_consume__ready),
        .produce__valid(vga_verify_0_produce__valid),
        .produce__vsync(vga_verify_0_produce__vsync),
        .rst(proc_sys_reset_0_peripheral_reset));
endmodule
