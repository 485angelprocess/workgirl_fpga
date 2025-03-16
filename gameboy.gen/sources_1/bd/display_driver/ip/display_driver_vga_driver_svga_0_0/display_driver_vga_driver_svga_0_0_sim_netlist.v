// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Sun Mar  9 12:27:49 2025
// Host        : MSI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/magen/Documents/Programs/gameboy/gameboy.gen/sources_1/bd/display_driver/ip/display_driver_vga_driver_svga_0_0/display_driver_vga_driver_svga_0_0_sim_netlist.v
// Design      : display_driver_vga_driver_svga_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "display_driver_vga_driver_svga_0_0,vga_driver_svga,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "vga_driver_svga,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module display_driver_vga_driver_svga_0_0
   (consume__valid,
    consume__vsync,
    clk,
    rst,
    consume__ready,
    data,
    hsync,
    vsync,
    consume__data);
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\signature.py:18" *) input consume__valid;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\signature.py:20" *) input consume__vsync;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 120000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) (* src = "C:\\Users\\magen\\AppData\\Local\\Packages\\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\\LocalCache\\local-packages\\Python311\\site-packages\\amaranth\\hdl\\_ir.py:283" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) (* src = "C:\\Users\\magen\\AppData\\Local\\Packages\\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\\LocalCache\\local-packages\\Python311\\site-packages\\amaranth\\hdl\\_ir.py:283" *) input rst;
  output consume__ready;
  output [11:0]data;
  output hsync;
  output vsync;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:86" *) input [11:0]consume__data;

  wire clk;
  wire [11:0]consume__data;
  wire consume__ready;
  wire consume__valid;
  wire consume__vsync;
  wire [11:0]data;
  wire hsync;
  wire rst;
  wire vsync;

  display_driver_vga_driver_svga_0_0_vga_driver_svga inst
       (.clk(clk),
        .consume__data(consume__data),
        .consume__ready(consume__ready),
        .consume__valid(consume__valid),
        .consume__vsync(consume__vsync),
        .data(data),
        .hsync(hsync),
        .rst(rst),
        .vsync(vsync));
endmodule

(* ORIG_REF_NAME = "vga_driver_svga" *) 
module display_driver_vga_driver_svga_0_0_vga_driver_svga
   (vsync,
    data,
    consume__ready,
    hsync,
    rst,
    clk,
    consume__data,
    consume__valid,
    consume__vsync);
  output vsync;
  output [11:0]data;
  output consume__ready;
  output hsync;
  input rst;
  input clk;
  input [11:0]consume__data;
  input consume__valid;
  input consume__vsync;

  wire clk;
  wire clk_en$12;
  wire [11:0]consume__data;
  wire consume__ready;
  wire consume__valid;
  wire consume__vsync;
  wire [11:0]data;
  wire hcounter_n_0;
  wire hcounter_n_2;
  wire hsync;
  wire input_enable;
  wire input_enable_i_2_n_0;
  wire pix_clk;
  wire [1:0]pix_counter;
  wire \pix_counter[0]_i_1_n_0 ;
  wire \pix_counter[1]_i_1_n_0 ;
  wire rst;
  wire vcounter_n_0;
  wire vsync;

  \display_driver_vga_driver_svga_0_0_vga_driver_svga.hcounter  hcounter
       (.E(clk_en$12),
        .clk(clk),
        .\counter_reg[10]_0 (hcounter_n_2),
        .\counter_reg[5]_0 (hcounter_n_0),
        .hsync(hsync),
        .input_enable(input_enable),
        .pix_counter(pix_counter),
        .\pix_counter_reg[1] (pix_clk),
        .rst(rst));
  LUT2 #(
    .INIT(4'h7)) 
    input_enable_i_2
       (.I0(consume__valid),
        .I1(consume__vsync),
        .O(input_enable_i_2_n_0));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:117" *) 
  FDRE #(
    .INIT(1'b0)) 
    input_enable_reg
       (.C(clk),
        .CE(1'b1),
        .D(vcounter_n_0),
        .Q(input_enable),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \pix_counter[0]_i_1 
       (.I0(pix_counter[1]),
        .I1(pix_counter[0]),
        .I2(rst),
        .O(\pix_counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \pix_counter[1]_i_1 
       (.I0(pix_counter[1]),
        .I1(pix_counter[0]),
        .I2(rst),
        .O(\pix_counter[1]_i_1_n_0 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:97" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\pix_counter[0]_i_1_n_0 ),
        .Q(pix_counter[0]),
        .R(1'b0));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:97" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\pix_counter[1]_i_1_n_0 ),
        .Q(pix_counter[1]),
        .R(1'b0));
  \display_driver_vga_driver_svga_0_0_vga_driver_svga.vcounter  vcounter
       (.E(clk_en$12),
        .clk(clk),
        .consume__data(consume__data),
        .consume__ready(consume__ready),
        .consume__ready_0(hcounter_n_0),
        .consume__ready_1(hcounter_n_2),
        .data(data),
        .input_enable(input_enable),
        .input_enable_reg(vcounter_n_0),
        .input_enable_reg_0(pix_clk),
        .input_enable_reg_1(input_enable_i_2_n_0),
        .pix_counter(pix_counter),
        .rst(rst),
        .vsync(vsync));
endmodule

(* ORIG_REF_NAME = "vga_driver_svga.hcounter" *) 
module \display_driver_vga_driver_svga_0_0_vga_driver_svga.hcounter 
   (\counter_reg[5]_0 ,
    hsync,
    \counter_reg[10]_0 ,
    E,
    \pix_counter_reg[1] ,
    input_enable,
    rst,
    pix_counter,
    clk);
  output \counter_reg[5]_0 ;
  output hsync;
  output \counter_reg[10]_0 ;
  output [0:0]E;
  output [0:0]\pix_counter_reg[1] ;
  input input_enable;
  input rst;
  input [1:0]pix_counter;
  input clk;

  wire [10:0]\$4 ;
  wire \$5 ;
  wire [0:0]E;
  wire clk;
  wire consume__ready_INST_0_i_7_n_0;
  wire \counter[5]_i_1__0_n_0 ;
  wire \counter[8]_i_2_n_0 ;
  wire \counter[8]_i_3_n_0 ;
  wire \counter[9]_i_2_n_0 ;
  wire \counter[9]_i_5_n_0 ;
  wire \counter[9]_i_6_n_0 ;
  wire [10:0]counter_reg;
  wire \counter_reg[10]_0 ;
  wire \counter_reg[5]_0 ;
  wire hsync;
  wire hsync_INST_0_i_1_n_0;
  wire input_enable;
  wire [1:0]pix_counter;
  wire [0:0]\pix_counter_reg[1] ;
  wire rst;

  LUT6 #(
    .INIT(64'h000000000000001F)) 
    consume__ready_INST_0_i_4
       (.I0(counter_reg[5]),
        .I1(\counter[8]_i_3_n_0 ),
        .I2(counter_reg[6]),
        .I3(counter_reg[8]),
        .I4(counter_reg[10]),
        .I5(consume__ready_INST_0_i_7_n_0),
        .O(\counter_reg[5]_0 ));
  LUT6 #(
    .INIT(64'hFFEFEFEFEFEFEFEF)) 
    consume__ready_INST_0_i_5
       (.I0(hsync_INST_0_i_1_n_0),
        .I1(counter_reg[10]),
        .I2(input_enable),
        .I3(counter_reg[7]),
        .I4(counter_reg[9]),
        .I5(counter_reg[8]),
        .O(\counter_reg[10]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hE)) 
    consume__ready_INST_0_i_7
       (.I0(counter_reg[7]),
        .I1(counter_reg[9]),
        .O(consume__ready_INST_0_i_7_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_1 
       (.I0(counter_reg[0]),
        .O(\$4 [0]));
  LUT2 #(
    .INIT(4'hE)) 
    \counter[10]_i_1 
       (.I0(rst),
        .I1(E),
        .O(\$5 ));
  LUT2 #(
    .INIT(4'h1)) 
    \counter[10]_i_2 
       (.I0(pix_counter[1]),
        .I1(pix_counter[0]),
        .O(\pix_counter_reg[1] ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \counter[10]_i_3 
       (.I0(counter_reg[10]),
        .I1(counter_reg[7]),
        .I2(hsync_INST_0_i_1_n_0),
        .I3(counter_reg[2]),
        .I4(counter_reg[1]),
        .I5(counter_reg[0]),
        .O(\$4 [10]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \counter[1]_i_1 
       (.I0(counter_reg[0]),
        .I1(counter_reg[1]),
        .O(\$4 [1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \counter[2]_i_1 
       (.I0(counter_reg[0]),
        .I1(counter_reg[1]),
        .I2(counter_reg[2]),
        .O(\$4 [2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \counter[3]_i_1 
       (.I0(counter_reg[3]),
        .I1(counter_reg[0]),
        .I2(counter_reg[1]),
        .I3(counter_reg[2]),
        .O(\$4 [3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \counter[4]_i_1 
       (.I0(counter_reg[4]),
        .I1(counter_reg[3]),
        .I2(counter_reg[0]),
        .I3(counter_reg[1]),
        .I4(counter_reg[2]),
        .O(\$4 [4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \counter[5]_i_1__0 
       (.I0(counter_reg[5]),
        .I1(counter_reg[3]),
        .I2(counter_reg[4]),
        .I3(counter_reg[2]),
        .I4(counter_reg[1]),
        .I5(counter_reg[0]),
        .O(\counter[5]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \counter[6]_i_1 
       (.I0(counter_reg[6]),
        .I1(\counter[8]_i_2_n_0 ),
        .I2(counter_reg[4]),
        .I3(counter_reg[3]),
        .I4(counter_reg[5]),
        .O(\$4 [6]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \counter[7]_i_1 
       (.I0(counter_reg[7]),
        .I1(counter_reg[4]),
        .I2(counter_reg[3]),
        .I3(counter_reg[6]),
        .I4(counter_reg[5]),
        .I5(\counter[8]_i_2_n_0 ),
        .O(\$4 [7]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \counter[8]_i_1 
       (.I0(counter_reg[8]),
        .I1(\counter[8]_i_2_n_0 ),
        .I2(counter_reg[5]),
        .I3(counter_reg[6]),
        .I4(\counter[8]_i_3_n_0 ),
        .I5(counter_reg[7]),
        .O(\$4 [8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \counter[8]_i_2 
       (.I0(counter_reg[2]),
        .I1(counter_reg[1]),
        .I2(counter_reg[0]),
        .O(\counter[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \counter[8]_i_3 
       (.I0(counter_reg[3]),
        .I1(counter_reg[4]),
        .O(\counter[8]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \counter[9]_i_1 
       (.I0(counter_reg[9]),
        .I1(\counter[9]_i_2_n_0 ),
        .I2(counter_reg[8]),
        .O(\$4 [9]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \counter[9]_i_2 
       (.I0(counter_reg[7]),
        .I1(counter_reg[4]),
        .I2(counter_reg[3]),
        .I3(counter_reg[6]),
        .I4(counter_reg[5]),
        .I5(\counter[8]_i_2_n_0 ),
        .O(\counter[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    \counter[9]_i_2__0 
       (.I0(\counter[9]_i_5_n_0 ),
        .I1(counter_reg[10]),
        .I2(counter_reg[8]),
        .I3(counter_reg[6]),
        .I4(counter_reg[5]),
        .I5(\counter[9]_i_6_n_0 ),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \counter[9]_i_5 
       (.I0(counter_reg[9]),
        .I1(counter_reg[7]),
        .I2(pix_counter[0]),
        .I3(pix_counter[1]),
        .O(\counter[9]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \counter[9]_i_6 
       (.I0(counter_reg[0]),
        .I1(counter_reg[1]),
        .I2(counter_reg[2]),
        .I3(counter_reg[4]),
        .I4(counter_reg[3]),
        .O(\counter[9]_i_6_n_0 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk),
        .CE(\pix_counter_reg[1] ),
        .D(\$4 [0]),
        .Q(counter_reg[0]),
        .R(\$5 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[10] 
       (.C(clk),
        .CE(\pix_counter_reg[1] ),
        .D(\$4 [10]),
        .Q(counter_reg[10]),
        .R(\$5 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk),
        .CE(\pix_counter_reg[1] ),
        .D(\$4 [1]),
        .Q(counter_reg[1]),
        .R(\$5 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk),
        .CE(\pix_counter_reg[1] ),
        .D(\$4 [2]),
        .Q(counter_reg[2]),
        .R(\$5 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk),
        .CE(\pix_counter_reg[1] ),
        .D(\$4 [3]),
        .Q(counter_reg[3]),
        .R(\$5 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(clk),
        .CE(\pix_counter_reg[1] ),
        .D(\$4 [4]),
        .Q(counter_reg[4]),
        .R(\$5 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(clk),
        .CE(\pix_counter_reg[1] ),
        .D(\counter[5]_i_1__0_n_0 ),
        .Q(counter_reg[5]),
        .R(\$5 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(clk),
        .CE(\pix_counter_reg[1] ),
        .D(\$4 [6]),
        .Q(counter_reg[6]),
        .R(\$5 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(clk),
        .CE(\pix_counter_reg[1] ),
        .D(\$4 [7]),
        .Q(counter_reg[7]),
        .R(\$5 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(clk),
        .CE(\pix_counter_reg[1] ),
        .D(\$4 [8]),
        .Q(counter_reg[8]),
        .R(\$5 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(clk),
        .CE(\pix_counter_reg[1] ),
        .D(\$4 [9]),
        .Q(counter_reg[9]),
        .R(\$5 ));
  LUT3 #(
    .INIT(8'hEA)) 
    hsync_INST_0
       (.I0(counter_reg[10]),
        .I1(hsync_INST_0_i_1_n_0),
        .I2(counter_reg[7]),
        .O(hsync));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    hsync_INST_0_i_1
       (.I0(counter_reg[9]),
        .I1(counter_reg[8]),
        .I2(counter_reg[5]),
        .I3(counter_reg[6]),
        .I4(counter_reg[3]),
        .I5(counter_reg[4]),
        .O(hsync_INST_0_i_1_n_0));
endmodule

(* ORIG_REF_NAME = "vga_driver_svga.vcounter" *) 
module \display_driver_vga_driver_svga_0_0_vga_driver_svga.vcounter 
   (input_enable_reg,
    vsync,
    data,
    consume__ready,
    rst,
    E,
    input_enable,
    input_enable_reg_0,
    input_enable_reg_1,
    consume__data,
    pix_counter,
    consume__ready_0,
    consume__ready_1,
    clk);
  output input_enable_reg;
  output vsync;
  output [11:0]data;
  output consume__ready;
  input rst;
  input [0:0]E;
  input input_enable;
  input [0:0]input_enable_reg_0;
  input input_enable_reg_1;
  input [11:0]consume__data;
  input [1:0]pix_counter;
  input consume__ready_0;
  input consume__ready_1;
  input clk;

  wire [9:0]\$4__0 ;
  wire \$5 ;
  wire [0:0]E;
  wire clk;
  wire [11:0]consume__data;
  wire consume__ready;
  wire consume__ready_0;
  wire consume__ready_1;
  wire consume__ready_INST_0_i_1_n_0;
  wire consume__ready_INST_0_i_2_n_0;
  wire consume__ready_INST_0_i_3_n_0;
  wire consume__ready_INST_0_i_6_n_0;
  wire \counter[3]_i_1__0_n_0 ;
  wire \counter[8]_i_2__0_n_0 ;
  wire \counter[9]_i_4_n_0 ;
  wire \counter[9]_i_7_n_0 ;
  wire [9:0]counter_reg;
  wire [11:0]data;
  wire input_enable;
  wire input_enable_reg;
  wire [0:0]input_enable_reg_0;
  wire input_enable_reg_1;
  wire [1:0]pix_counter;
  wire rst;
  wire vsync;
  wire vsync_INST_0_i_1_n_0;
  wire vsync_INST_0_i_2_n_0;
  wire vsync_INST_0_i_3_n_0;

  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h01)) 
    consume__ready_INST_0
       (.I0(pix_counter[0]),
        .I1(pix_counter[1]),
        .I2(consume__ready_INST_0_i_1_n_0),
        .O(consume__ready));
  LUT5 #(
    .INIT(32'hFFFFFFF4)) 
    consume__ready_INST_0_i_1
       (.I0(consume__ready_INST_0_i_2_n_0),
        .I1(counter_reg[9]),
        .I2(consume__ready_INST_0_i_3_n_0),
        .I3(consume__ready_0),
        .I4(consume__ready_1),
        .O(consume__ready_INST_0_i_1_n_0));
  LUT6 #(
    .INIT(64'h0001111111111111)) 
    consume__ready_INST_0_i_2
       (.I0(counter_reg[8]),
        .I1(counter_reg[7]),
        .I2(counter_reg[4]),
        .I3(\counter[8]_i_2__0_n_0 ),
        .I4(counter_reg[5]),
        .I5(counter_reg[6]),
        .O(consume__ready_INST_0_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000055557FFF)) 
    consume__ready_INST_0_i_3
       (.I0(counter_reg[4]),
        .I1(counter_reg[2]),
        .I2(counter_reg[0]),
        .I3(counter_reg[1]),
        .I4(counter_reg[3]),
        .I5(consume__ready_INST_0_i_6_n_0),
        .O(consume__ready_INST_0_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    consume__ready_INST_0_i_6
       (.I0(counter_reg[8]),
        .I1(counter_reg[7]),
        .I2(counter_reg[6]),
        .I3(counter_reg[9]),
        .I4(counter_reg[5]),
        .O(consume__ready_INST_0_i_6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_1__0 
       (.I0(counter_reg[0]),
        .O(\$4__0 [0]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \counter[1]_i_1__0 
       (.I0(counter_reg[0]),
        .I1(counter_reg[1]),
        .O(\$4__0 [1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \counter[2]_i_1__0 
       (.I0(counter_reg[2]),
        .I1(counter_reg[0]),
        .I2(counter_reg[1]),
        .O(\$4__0 [2]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \counter[3]_i_1__0 
       (.I0(counter_reg[3]),
        .I1(counter_reg[2]),
        .I2(counter_reg[0]),
        .I3(counter_reg[1]),
        .O(\counter[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \counter[4]_i_1__0 
       (.I0(counter_reg[4]),
        .I1(counter_reg[1]),
        .I2(counter_reg[0]),
        .I3(counter_reg[2]),
        .I4(counter_reg[3]),
        .O(\$4__0 [4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \counter[5]_i_1 
       (.I0(counter_reg[4]),
        .I1(counter_reg[1]),
        .I2(counter_reg[0]),
        .I3(counter_reg[2]),
        .I4(counter_reg[3]),
        .I5(counter_reg[5]),
        .O(\$4__0 [5]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \counter[6]_i_1__0 
       (.I0(counter_reg[6]),
        .I1(counter_reg[4]),
        .I2(\counter[8]_i_2__0_n_0 ),
        .I3(counter_reg[5]),
        .O(\$4__0 [6]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \counter[7]_i_1__0 
       (.I0(counter_reg[7]),
        .I1(counter_reg[4]),
        .I2(counter_reg[5]),
        .I3(counter_reg[6]),
        .I4(\counter[8]_i_2__0_n_0 ),
        .O(\$4__0 [7]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \counter[8]_i_1__0 
       (.I0(\counter[8]_i_2__0_n_0 ),
        .I1(counter_reg[6]),
        .I2(counter_reg[5]),
        .I3(counter_reg[4]),
        .I4(counter_reg[7]),
        .I5(counter_reg[8]),
        .O(\$4__0 [8]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \counter[8]_i_2__0 
       (.I0(counter_reg[3]),
        .I1(counter_reg[2]),
        .I2(counter_reg[0]),
        .I3(counter_reg[1]),
        .O(\counter[8]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hAEAAAAAAAAAAAAAA)) 
    \counter[9]_i_1__0 
       (.I0(rst),
        .I1(E),
        .I2(\counter[9]_i_4_n_0 ),
        .I3(counter_reg[4]),
        .I4(counter_reg[5]),
        .I5(counter_reg[6]),
        .O(\$5 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \counter[9]_i_3 
       (.I0(counter_reg[9]),
        .I1(\counter[9]_i_7_n_0 ),
        .I2(counter_reg[8]),
        .O(\$4__0 [9]));
  LUT6 #(
    .INIT(64'hEFFFFFFFFFFFFFFF)) 
    \counter[9]_i_4 
       (.I0(counter_reg[2]),
        .I1(counter_reg[3]),
        .I2(counter_reg[9]),
        .I3(vsync_INST_0_i_3_n_0),
        .I4(counter_reg[0]),
        .I5(counter_reg[1]),
        .O(\counter[9]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \counter[9]_i_7 
       (.I0(\counter[8]_i_2__0_n_0 ),
        .I1(counter_reg[6]),
        .I2(counter_reg[5]),
        .I3(counter_reg[4]),
        .I4(counter_reg[7]),
        .O(\counter[9]_i_7_n_0 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk),
        .CE(E),
        .D(\$4__0 [0]),
        .Q(counter_reg[0]),
        .R(\$5 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk),
        .CE(E),
        .D(\$4__0 [1]),
        .Q(counter_reg[1]),
        .R(\$5 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk),
        .CE(E),
        .D(\$4__0 [2]),
        .Q(counter_reg[2]),
        .R(\$5 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk),
        .CE(E),
        .D(\counter[3]_i_1__0_n_0 ),
        .Q(counter_reg[3]),
        .R(\$5 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(clk),
        .CE(E),
        .D(\$4__0 [4]),
        .Q(counter_reg[4]),
        .R(\$5 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(clk),
        .CE(E),
        .D(\$4__0 [5]),
        .Q(counter_reg[5]),
        .R(\$5 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(clk),
        .CE(E),
        .D(\$4__0 [6]),
        .Q(counter_reg[6]),
        .R(\$5 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(clk),
        .CE(E),
        .D(\$4__0 [7]),
        .Q(counter_reg[7]),
        .R(\$5 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(clk),
        .CE(E),
        .D(\$4__0 [8]),
        .Q(counter_reg[8]),
        .R(\$5 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(clk),
        .CE(E),
        .D(\$4__0 [9]),
        .Q(counter_reg[9]),
        .R(\$5 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data[0]_INST_0 
       (.I0(consume__data[0]),
        .I1(consume__ready_INST_0_i_1_n_0),
        .O(data[0]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data[10]_INST_0 
       (.I0(consume__data[10]),
        .I1(consume__ready_INST_0_i_1_n_0),
        .O(data[10]));
  LUT2 #(
    .INIT(4'h2)) 
    \data[11]_INST_0 
       (.I0(consume__data[11]),
        .I1(consume__ready_INST_0_i_1_n_0),
        .O(data[11]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data[1]_INST_0 
       (.I0(consume__data[1]),
        .I1(consume__ready_INST_0_i_1_n_0),
        .O(data[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data[2]_INST_0 
       (.I0(consume__data[2]),
        .I1(consume__ready_INST_0_i_1_n_0),
        .O(data[2]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data[3]_INST_0 
       (.I0(consume__data[3]),
        .I1(consume__ready_INST_0_i_1_n_0),
        .O(data[3]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data[4]_INST_0 
       (.I0(consume__data[4]),
        .I1(consume__ready_INST_0_i_1_n_0),
        .O(data[4]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data[5]_INST_0 
       (.I0(consume__data[5]),
        .I1(consume__ready_INST_0_i_1_n_0),
        .O(data[5]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data[6]_INST_0 
       (.I0(consume__data[6]),
        .I1(consume__ready_INST_0_i_1_n_0),
        .O(data[6]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data[7]_INST_0 
       (.I0(consume__data[7]),
        .I1(consume__ready_INST_0_i_1_n_0),
        .O(data[7]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data[8]_INST_0 
       (.I0(consume__data[8]),
        .I1(consume__ready_INST_0_i_1_n_0),
        .O(data[8]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data[9]_INST_0 
       (.I0(consume__data[9]),
        .I1(consume__ready_INST_0_i_1_n_0),
        .O(data[9]));
  LUT6 #(
    .INIT(64'h00000000FFFFAA8A)) 
    input_enable_i_1
       (.I0(input_enable),
        .I1(consume__ready_INST_0_i_1_n_0),
        .I2(input_enable_reg_0),
        .I3(input_enable_reg_1),
        .I4(vsync),
        .I5(rst),
        .O(input_enable_reg));
  LUT6 #(
    .INIT(64'h88888808AAAAAAAA)) 
    vsync_INST_0
       (.I0(counter_reg[9]),
        .I1(vsync_INST_0_i_1_n_0),
        .I2(vsync_INST_0_i_2_n_0),
        .I3(counter_reg[2]),
        .I4(counter_reg[3]),
        .I5(vsync_INST_0_i_3_n_0),
        .O(vsync));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h80)) 
    vsync_INST_0_i_1
       (.I0(counter_reg[6]),
        .I1(counter_reg[5]),
        .I2(counter_reg[4]),
        .O(vsync_INST_0_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h7)) 
    vsync_INST_0_i_2
       (.I0(counter_reg[0]),
        .I1(counter_reg[1]),
        .O(vsync_INST_0_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h1)) 
    vsync_INST_0_i_3
       (.I0(counter_reg[7]),
        .I1(counter_reg[8]),
        .O(vsync_INST_0_i_3_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
