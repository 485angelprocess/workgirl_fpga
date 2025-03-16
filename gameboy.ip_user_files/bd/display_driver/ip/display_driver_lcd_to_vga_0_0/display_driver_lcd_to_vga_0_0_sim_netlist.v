// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Sun Mar  9 12:27:49 2025
// Host        : MSI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/magen/Documents/Programs/gameboy/gameboy.gen/sources_1/bd/display_driver/ip/display_driver_lcd_to_vga_0_0/display_driver_lcd_to_vga_0_0_sim_netlist.v
// Design      : display_driver_lcd_to_vga_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "display_driver_lcd_to_vga_0_0,lcd_to_vga,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "lcd_to_vga,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module display_driver_lcd_to_vga_0_0
   (consume__valid,
    consume__vsync,
    produce__ready,
    clk,
    rst,
    consume__ready,
    produce__data,
    produce__valid,
    produce__vsync,
    consume__data);
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\signature.py:18" *) input consume__valid;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\signature.py:20" *) input consume__vsync;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\signature.py:19" *) input produce__ready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 120000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) (* src = "C:\\Users\\magen\\AppData\\Local\\Packages\\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\\LocalCache\\local-packages\\Python311\\site-packages\\amaranth\\hdl\\_ir.py:283" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) (* src = "C:\\Users\\magen\\AppData\\Local\\Packages\\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\\LocalCache\\local-packages\\Python311\\site-packages\\amaranth\\hdl\\_ir.py:283" *) input rst;
  output consume__ready;
  output [11:0]produce__data;
  output produce__valid;
  output produce__vsync;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:185" *) input [11:0]consume__data;

  wire clk;
  wire [11:0]consume__data;
  wire consume__ready;
  wire consume__valid;
  wire consume__vsync;
  wire [11:0]produce__data;
  wire produce__ready;
  wire produce__valid;
  wire produce__vsync;
  wire rst;

  display_driver_lcd_to_vga_0_0_lcd_to_vga inst
       (.clk(clk),
        .consume__data(consume__data),
        .consume__ready(consume__ready),
        .consume__valid(consume__valid),
        .consume__vsync(consume__vsync),
        .produce__data(produce__data),
        .produce__ready(produce__ready),
        .produce__valid(produce__valid),
        .produce__vsync(produce__vsync),
        .rst(rst));
endmodule

(* ORIG_REF_NAME = "lcd_to_vga" *) 
module display_driver_lcd_to_vga_0_0_lcd_to_vga
   (produce__data,
    consume__ready,
    produce__valid,
    produce__vsync,
    consume__valid,
    produce__ready,
    rst,
    clk,
    consume__data,
    consume__vsync);
  output [11:0]produce__data;
  output consume__ready;
  output produce__valid;
  output produce__vsync;
  input consume__valid;
  input produce__ready;
  input rst;
  input clk;
  input [11:0]consume__data;
  input consume__vsync;

  wire clk;
  wire [11:0]consume__data;
  wire consume__ready;
  wire consume__valid;
  wire consume__vsync;
  wire [11:0]produce__data;
  wire produce__ready;
  wire produce__valid;
  wire produce__vsync;
  wire rst;

  \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample  upsample
       (.clk(clk),
        .consume__data(consume__data),
        .consume__ready(consume__ready),
        .consume__valid(consume__valid),
        .consume__vsync(consume__vsync),
        .produce__data(produce__data),
        .produce__ready(produce__ready),
        .produce__valid(produce__valid),
        .produce__vsync(produce__vsync),
        .rst(rst));
endmodule

(* ORIG_REF_NAME = "lcd_to_vga.upsample" *) 
module \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample 
   (produce__data,
    consume__ready,
    produce__valid,
    produce__vsync,
    consume__valid,
    produce__ready,
    rst,
    clk,
    consume__data,
    consume__vsync);
  output [11:0]produce__data;
  output consume__ready;
  output produce__valid;
  output produce__vsync;
  input consume__valid;
  input produce__ready;
  input rst;
  input clk;
  input [11:0]consume__data;
  input consume__vsync;

  wire \$1 ;
  wire clk;
  wire [11:0]consume__data;
  wire consume__ready;
  wire consume__valid;
  wire consume__vsync;
  wire consume__vsync$14;
  wire hor_n_12;
  wire hor_n_13;
  wire hor_n_15;
  wire [1:0]line_counter;
  wire [11:0]produce__data;
  wire produce__ready;
  wire produce__valid;
  wire produce__vsync;
  wire rst;
  wire ver_n_1;
  wire ver_n_10;
  wire ver_n_11;
  wire ver_n_12;
  wire ver_n_15;
  wire ver_n_2;
  wire ver_n_3;
  wire ver_n_4;
  wire ver_n_5;
  wire ver_n_6;
  wire ver_n_7;
  wire ver_n_8;
  wire ver_n_9;
  wire write_port__en;

  \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.hor  hor
       (.\$1 (\$1 ),
        .D({ver_n_1,ver_n_2,ver_n_3,ver_n_4,ver_n_5,ver_n_6,ver_n_7,ver_n_8,ver_n_9,ver_n_10,ver_n_11,ver_n_12}),
        .clk(clk),
        .consume__valid(consume__valid),
        .consume__vsync$14(consume__vsync$14),
        .\counter_reg[0]_0 (hor_n_13),
        .\counter_reg[0]_1 (ver_n_15),
        .\counter_reg[1]_0 (hor_n_12),
        .\counter_reg[1]_1 (hor_n_15),
        .line_counter(line_counter),
        .produce__data(produce__data),
        .produce__ready(produce__ready),
        .produce__vsync(produce__vsync),
        .rst(rst),
        .write_port__en(write_port__en));
  \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.ver  ver
       (.\$1 (\$1 ),
        .D({ver_n_1,ver_n_2,ver_n_3,ver_n_4,ver_n_5,ver_n_6,ver_n_7,ver_n_8,ver_n_9,ver_n_10,ver_n_11,ver_n_12}),
        .\addr_reg[7]_0 (hor_n_12),
        .\addr_reg[7]_1 (hor_n_13),
        .buffer_reg_192_255_6_8_0(hor_n_15),
        .clk(clk),
        .consume__data(consume__data),
        .consume__ready(consume__ready),
        .consume__valid(consume__valid),
        .consume__vsync(consume__vsync),
        .consume__vsync$14(consume__vsync$14),
        .line_counter(line_counter),
        .\line_counter_reg[1]_0 (ver_n_15),
        .produce__ready(produce__ready),
        .produce__valid(produce__valid),
        .rst(rst),
        .write_port__en(write_port__en));
endmodule

(* ORIG_REF_NAME = "lcd_to_vga.upsample.hor" *) 
module \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.hor 
   (produce__data,
    \counter_reg[1]_0 ,
    \counter_reg[0]_0 ,
    write_port__en,
    \counter_reg[1]_1 ,
    produce__vsync,
    rst,
    \$1 ,
    consume__vsync$14,
    clk,
    D,
    consume__valid,
    produce__ready,
    line_counter,
    \counter_reg[0]_1 );
  output [11:0]produce__data;
  output \counter_reg[1]_0 ;
  output \counter_reg[0]_0 ;
  output write_port__en;
  output \counter_reg[1]_1 ;
  output produce__vsync;
  input rst;
  input \$1 ;
  input consume__vsync$14;
  input clk;
  input [11:0]D;
  input consume__valid;
  input produce__ready;
  input [1:0]line_counter;
  input \counter_reg[0]_1 ;

  wire \$1 ;
  wire [11:0]D;
  wire clk;
  wire consume__valid;
  wire consume__vsync$14;
  wire \counter[0]_i_1_n_0 ;
  wire \counter[1]_i_1_n_0 ;
  wire \counter_reg[0]_0 ;
  wire \counter_reg[0]_1 ;
  wire \counter_reg[1]_0 ;
  wire \counter_reg[1]_1 ;
  wire [11:0]data_reg;
  wire [1:0]line_counter;
  wire [11:0]produce__data;
  wire produce__ready;
  wire produce__vsync;
  wire rst;
  wire sync_reg;
  wire write_port__en;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hE)) 
    buffer_reg_0_63_0_2_i_11
       (.I0(\counter_reg[1]_0 ),
        .I1(\counter_reg[0]_0 ),
        .O(\counter_reg[1]_1 ));
  LUT6 #(
    .INIT(64'h000000000FF00FE0)) 
    \counter[0]_i_1 
       (.I0(consume__valid),
        .I1(\counter_reg[0]_1 ),
        .I2(produce__ready),
        .I3(\counter_reg[0]_0 ),
        .I4(\counter_reg[1]_0 ),
        .I5(rst),
        .O(\counter[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0078)) 
    \counter[1]_i_1 
       (.I0(produce__ready),
        .I1(\counter_reg[0]_0 ),
        .I2(\counter_reg[1]_0 ),
        .I3(rst),
        .O(\counter[1]_i_1_n_0 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:25" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter[0]_i_1_n_0 ),
        .Q(\counter_reg[0]_0 ),
        .R(1'b0));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:25" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter[1]_i_1_n_0 ),
        .Q(\counter_reg[1]_0 ),
        .R(1'b0));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[0] 
       (.C(clk),
        .CE(\$1 ),
        .D(D[0]),
        .Q(data_reg[0]),
        .R(rst));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[10] 
       (.C(clk),
        .CE(\$1 ),
        .D(D[10]),
        .Q(data_reg[10]),
        .R(rst));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[11] 
       (.C(clk),
        .CE(\$1 ),
        .D(D[11]),
        .Q(data_reg[11]),
        .R(rst));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[1] 
       (.C(clk),
        .CE(\$1 ),
        .D(D[1]),
        .Q(data_reg[1]),
        .R(rst));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[2] 
       (.C(clk),
        .CE(\$1 ),
        .D(D[2]),
        .Q(data_reg[2]),
        .R(rst));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[3] 
       (.C(clk),
        .CE(\$1 ),
        .D(D[3]),
        .Q(data_reg[3]),
        .R(rst));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[4] 
       (.C(clk),
        .CE(\$1 ),
        .D(D[4]),
        .Q(data_reg[4]),
        .R(rst));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[5] 
       (.C(clk),
        .CE(\$1 ),
        .D(D[5]),
        .Q(data_reg[5]),
        .R(rst));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[6] 
       (.C(clk),
        .CE(\$1 ),
        .D(D[6]),
        .Q(data_reg[6]),
        .R(rst));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[7] 
       (.C(clk),
        .CE(\$1 ),
        .D(D[7]),
        .Q(data_reg[7]),
        .R(rst));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[8] 
       (.C(clk),
        .CE(\$1 ),
        .D(D[8]),
        .Q(data_reg[8]),
        .R(rst));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[9] 
       (.C(clk),
        .CE(\$1 ),
        .D(D[9]),
        .Q(data_reg[9]),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[0]_INST_0 
       (.I0(data_reg[0]),
        .I1(\counter_reg[1]_0 ),
        .I2(\counter_reg[0]_0 ),
        .I3(D[0]),
        .O(produce__data[0]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[10]_INST_0 
       (.I0(data_reg[10]),
        .I1(\counter_reg[1]_0 ),
        .I2(\counter_reg[0]_0 ),
        .I3(D[10]),
        .O(produce__data[10]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[11]_INST_0 
       (.I0(data_reg[11]),
        .I1(\counter_reg[1]_0 ),
        .I2(\counter_reg[0]_0 ),
        .I3(D[11]),
        .O(produce__data[11]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[1]_INST_0 
       (.I0(data_reg[1]),
        .I1(\counter_reg[1]_0 ),
        .I2(\counter_reg[0]_0 ),
        .I3(D[1]),
        .O(produce__data[1]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[2]_INST_0 
       (.I0(data_reg[2]),
        .I1(\counter_reg[1]_0 ),
        .I2(\counter_reg[0]_0 ),
        .I3(D[2]),
        .O(produce__data[2]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[3]_INST_0 
       (.I0(data_reg[3]),
        .I1(\counter_reg[1]_0 ),
        .I2(\counter_reg[0]_0 ),
        .I3(D[3]),
        .O(produce__data[3]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[4]_INST_0 
       (.I0(data_reg[4]),
        .I1(\counter_reg[1]_0 ),
        .I2(\counter_reg[0]_0 ),
        .I3(D[4]),
        .O(produce__data[4]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[5]_INST_0 
       (.I0(data_reg[5]),
        .I1(\counter_reg[1]_0 ),
        .I2(\counter_reg[0]_0 ),
        .I3(D[5]),
        .O(produce__data[5]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[6]_INST_0 
       (.I0(data_reg[6]),
        .I1(\counter_reg[1]_0 ),
        .I2(\counter_reg[0]_0 ),
        .I3(D[6]),
        .O(produce__data[6]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[7]_INST_0 
       (.I0(data_reg[7]),
        .I1(\counter_reg[1]_0 ),
        .I2(\counter_reg[0]_0 ),
        .I3(D[7]),
        .O(produce__data[7]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[8]_INST_0 
       (.I0(data_reg[8]),
        .I1(\counter_reg[1]_0 ),
        .I2(\counter_reg[0]_0 ),
        .I3(D[8]),
        .O(produce__data[8]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[9]_INST_0 
       (.I0(data_reg[9]),
        .I1(\counter_reg[1]_0 ),
        .I2(\counter_reg[0]_0 ),
        .I3(D[9]),
        .O(produce__data[9]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h80)) 
    produce__vsync_INST_0
       (.I0(sync_reg),
        .I1(\counter_reg[0]_0 ),
        .I2(\counter_reg[1]_0 ),
        .O(produce__vsync));
  LUT6 #(
    .INIT(64'h0000000000000200)) 
    sync_flag_i_3
       (.I0(consume__valid),
        .I1(\counter_reg[0]_0 ),
        .I2(\counter_reg[1]_0 ),
        .I3(produce__ready),
        .I4(line_counter[1]),
        .I5(line_counter[0]),
        .O(write_port__en));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:22" *) 
  FDRE #(
    .INIT(1'b0)) 
    sync_reg_reg
       (.C(clk),
        .CE(\$1 ),
        .D(consume__vsync$14),
        .Q(sync_reg),
        .R(rst));
endmodule

(* ORIG_REF_NAME = "lcd_to_vga.upsample.ver" *) 
module \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.ver 
   (\$1 ,
    D,
    line_counter,
    \line_counter_reg[1]_0 ,
    consume__ready,
    produce__valid,
    consume__vsync$14,
    clk,
    consume__data,
    produce__ready,
    buffer_reg_192_255_6_8_0,
    consume__valid,
    consume__vsync,
    write_port__en,
    rst,
    \addr_reg[7]_0 ,
    \addr_reg[7]_1 );
  output \$1 ;
  output [11:0]D;
  output [1:0]line_counter;
  output \line_counter_reg[1]_0 ;
  output consume__ready;
  output produce__valid;
  output consume__vsync$14;
  input clk;
  input [11:0]consume__data;
  input produce__ready;
  input buffer_reg_192_255_6_8_0;
  input consume__valid;
  input consume__vsync;
  input write_port__en;
  input rst;
  input \addr_reg[7]_0 ;
  input \addr_reg[7]_1 ;

  wire \$1 ;
  wire \$10 ;
  wire [7:0]\$8 ;
  wire [11:0]D;
  wire [7:6]addr;
  wire \addr[6]_i_2_n_0 ;
  wire [5:0]addr_reg;
  wire \addr_reg[7]_0 ;
  wire \addr_reg[7]_1 ;
  wire buffer_reg_0_63_0_2_i_4_n_0;
  wire buffer_reg_0_63_0_2_n_0;
  wire buffer_reg_0_63_0_2_n_1;
  wire buffer_reg_0_63_0_2_n_2;
  wire buffer_reg_0_63_3_5_n_0;
  wire buffer_reg_0_63_3_5_n_1;
  wire buffer_reg_0_63_3_5_n_2;
  wire buffer_reg_0_63_6_8_n_0;
  wire buffer_reg_0_63_6_8_n_1;
  wire buffer_reg_0_63_6_8_n_2;
  wire buffer_reg_0_63_9_11_n_0;
  wire buffer_reg_0_63_9_11_n_1;
  wire buffer_reg_0_63_9_11_n_2;
  wire buffer_reg_128_191_0_2_i_1_n_0;
  wire buffer_reg_128_191_0_2_n_0;
  wire buffer_reg_128_191_0_2_n_1;
  wire buffer_reg_128_191_0_2_n_2;
  wire buffer_reg_128_191_3_5_n_0;
  wire buffer_reg_128_191_3_5_n_1;
  wire buffer_reg_128_191_3_5_n_2;
  wire buffer_reg_128_191_6_8_n_0;
  wire buffer_reg_128_191_6_8_n_1;
  wire buffer_reg_128_191_6_8_n_2;
  wire buffer_reg_128_191_9_11_n_0;
  wire buffer_reg_128_191_9_11_n_1;
  wire buffer_reg_128_191_9_11_n_2;
  wire buffer_reg_192_255_0_2_i_1_n_0;
  wire buffer_reg_192_255_0_2_n_0;
  wire buffer_reg_192_255_0_2_n_1;
  wire buffer_reg_192_255_0_2_n_2;
  wire buffer_reg_192_255_3_5_n_0;
  wire buffer_reg_192_255_3_5_n_1;
  wire buffer_reg_192_255_3_5_n_2;
  wire buffer_reg_192_255_6_8_0;
  wire buffer_reg_192_255_6_8_n_0;
  wire buffer_reg_192_255_6_8_n_1;
  wire buffer_reg_192_255_6_8_n_2;
  wire buffer_reg_192_255_9_11_n_0;
  wire buffer_reg_192_255_9_11_n_1;
  wire buffer_reg_192_255_9_11_n_2;
  wire buffer_reg_64_127_0_2_i_1_n_0;
  wire buffer_reg_64_127_0_2_n_0;
  wire buffer_reg_64_127_0_2_n_1;
  wire buffer_reg_64_127_0_2_n_2;
  wire buffer_reg_64_127_3_5_n_0;
  wire buffer_reg_64_127_3_5_n_1;
  wire buffer_reg_64_127_3_5_n_2;
  wire buffer_reg_64_127_6_8_n_0;
  wire buffer_reg_64_127_6_8_n_1;
  wire buffer_reg_64_127_6_8_n_2;
  wire buffer_reg_64_127_9_11_n_0;
  wire buffer_reg_64_127_9_11_n_1;
  wire buffer_reg_64_127_9_11_n_2;
  wire clk;
  wire [11:0]consume__data;
  wire consume__ready;
  wire consume__valid;
  wire consume__vsync;
  wire consume__vsync$14;
  wire [1:0]line_counter;
  wire \line_counter[0]_i_1_n_0 ;
  wire \line_counter[1]_i_1_n_0 ;
  wire \line_counter[1]_i_2_n_0 ;
  wire \line_counter[1]_i_3_n_0 ;
  wire \line_counter_reg[1]_0 ;
  wire produce__ready;
  wire produce__valid;
  wire [11:0]read_port__data;
  wire rst;
  wire sync_flag;
  wire sync_flag_i_1_n_0;
  wire sync_flag_i_2_n_0;
  wire sync_reg_i_2_n_0;
  wire [5:0]write_port__addr;
  wire [11:0]write_port__data;
  wire write_port__en;
  wire NLW_buffer_reg_0_63_0_2_DOD_UNCONNECTED;
  wire NLW_buffer_reg_0_63_3_5_DOD_UNCONNECTED;
  wire NLW_buffer_reg_0_63_6_8_DOD_UNCONNECTED;
  wire NLW_buffer_reg_0_63_9_11_DOD_UNCONNECTED;
  wire NLW_buffer_reg_128_191_0_2_DOD_UNCONNECTED;
  wire NLW_buffer_reg_128_191_3_5_DOD_UNCONNECTED;
  wire NLW_buffer_reg_128_191_6_8_DOD_UNCONNECTED;
  wire NLW_buffer_reg_128_191_9_11_DOD_UNCONNECTED;
  wire NLW_buffer_reg_192_255_0_2_DOD_UNCONNECTED;
  wire NLW_buffer_reg_192_255_3_5_DOD_UNCONNECTED;
  wire NLW_buffer_reg_192_255_6_8_DOD_UNCONNECTED;
  wire NLW_buffer_reg_192_255_9_11_DOD_UNCONNECTED;
  wire NLW_buffer_reg_64_127_0_2_DOD_UNCONNECTED;
  wire NLW_buffer_reg_64_127_3_5_DOD_UNCONNECTED;
  wire NLW_buffer_reg_64_127_6_8_DOD_UNCONNECTED;
  wire NLW_buffer_reg_64_127_9_11_DOD_UNCONNECTED;

  LUT2 #(
    .INIT(4'hE)) 
    \addr[0]_i_1 
       (.I0(rst),
        .I1(\line_counter[1]_i_2_n_0 ),
        .O(\$10 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addr[0]_i_2 
       (.I0(addr_reg[0]),
        .O(\$8 [0]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \addr[1]_i_1 
       (.I0(addr_reg[1]),
        .I1(addr_reg[0]),
        .O(\$8 [1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \addr[2]_i_1 
       (.I0(addr_reg[2]),
        .I1(addr_reg[1]),
        .I2(addr_reg[0]),
        .O(\$8 [2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \addr[3]_i_1 
       (.I0(addr_reg[0]),
        .I1(addr_reg[1]),
        .I2(addr_reg[2]),
        .I3(addr_reg[3]),
        .O(\$8 [3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \addr[4]_i_1 
       (.I0(addr_reg[4]),
        .I1(addr_reg[0]),
        .I2(addr_reg[1]),
        .I3(addr_reg[2]),
        .I4(addr_reg[3]),
        .O(\$8 [4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \addr[5]_i_1 
       (.I0(addr_reg[5]),
        .I1(addr_reg[3]),
        .I2(addr_reg[2]),
        .I3(addr_reg[1]),
        .I4(addr_reg[0]),
        .I5(addr_reg[4]),
        .O(\$8 [5]));
  LUT5 #(
    .INIT(32'hA6AAAAAA)) 
    \addr[6]_i_1 
       (.I0(addr[6]),
        .I1(addr_reg[4]),
        .I2(\addr[6]_i_2_n_0 ),
        .I3(addr_reg[3]),
        .I4(addr_reg[5]),
        .O(\$8 [6]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \addr[6]_i_2 
       (.I0(addr_reg[0]),
        .I1(addr_reg[1]),
        .I2(addr_reg[2]),
        .O(\addr[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA6AAAAAAAAAAAAA)) 
    \addr[7]_i_1 
       (.I0(addr[7]),
        .I1(addr_reg[5]),
        .I2(addr_reg[3]),
        .I3(\addr[6]_i_2_n_0 ),
        .I4(addr_reg[4]),
        .I5(addr[6]),
        .O(\$8 [7]));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:75" *) 
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[0] 
       (.C(clk),
        .CE(\$1 ),
        .D(\$8 [0]),
        .Q(addr_reg[0]),
        .R(\$10 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:75" *) 
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[1] 
       (.C(clk),
        .CE(\$1 ),
        .D(\$8 [1]),
        .Q(addr_reg[1]),
        .R(\$10 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:75" *) 
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[2] 
       (.C(clk),
        .CE(\$1 ),
        .D(\$8 [2]),
        .Q(addr_reg[2]),
        .R(\$10 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:75" *) 
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[3] 
       (.C(clk),
        .CE(\$1 ),
        .D(\$8 [3]),
        .Q(addr_reg[3]),
        .R(\$10 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:75" *) 
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[4] 
       (.C(clk),
        .CE(\$1 ),
        .D(\$8 [4]),
        .Q(addr_reg[4]),
        .R(\$10 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:75" *) 
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[5] 
       (.C(clk),
        .CE(\$1 ),
        .D(\$8 [5]),
        .Q(addr_reg[5]),
        .R(\$10 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:75" *) 
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[6] 
       (.C(clk),
        .CE(\$1 ),
        .D(\$8 [6]),
        .Q(addr[6]),
        .R(\$10 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:75" *) 
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[7] 
       (.C(clk),
        .CE(\$1 ),
        .D(\$8 [7]),
        .Q(addr[7]),
        .R(\$10 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "2400" *) 
  (* RTL_RAM_NAME = "inst/upsample/ver/buffer_reg_0_63_0_2" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    buffer_reg_0_63_0_2
       (.ADDRA(addr_reg),
        .ADDRB(addr_reg),
        .ADDRC(addr_reg),
        .ADDRD(write_port__addr),
        .DIA(write_port__data[0]),
        .DIB(write_port__data[1]),
        .DIC(write_port__data[2]),
        .DID(1'b0),
        .DOA(buffer_reg_0_63_0_2_n_0),
        .DOB(buffer_reg_0_63_0_2_n_1),
        .DOC(buffer_reg_0_63_0_2_n_2),
        .DOD(NLW_buffer_reg_0_63_0_2_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_reg_0_63_0_2_i_4_n_0));
  LUT3 #(
    .INIT(8'h02)) 
    buffer_reg_0_63_0_2_i_1
       (.I0(consume__data[0]),
        .I1(line_counter[0]),
        .I2(line_counter[1]),
        .O(write_port__data[0]));
  LUT3 #(
    .INIT(8'h02)) 
    buffer_reg_0_63_0_2_i_10
       (.I0(addr_reg[0]),
        .I1(line_counter[0]),
        .I2(line_counter[1]),
        .O(write_port__addr[0]));
  LUT3 #(
    .INIT(8'h02)) 
    buffer_reg_0_63_0_2_i_2
       (.I0(consume__data[1]),
        .I1(line_counter[0]),
        .I2(line_counter[1]),
        .O(write_port__data[1]));
  LUT3 #(
    .INIT(8'h02)) 
    buffer_reg_0_63_0_2_i_3
       (.I0(consume__data[2]),
        .I1(line_counter[0]),
        .I2(line_counter[1]),
        .O(write_port__data[2]));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    buffer_reg_0_63_0_2_i_4
       (.I0(produce__ready),
        .I1(buffer_reg_192_255_6_8_0),
        .I2(consume__valid),
        .I3(addr[6]),
        .I4(\line_counter_reg[1]_0 ),
        .I5(addr[7]),
        .O(buffer_reg_0_63_0_2_i_4_n_0));
  LUT3 #(
    .INIT(8'h02)) 
    buffer_reg_0_63_0_2_i_5
       (.I0(addr_reg[5]),
        .I1(line_counter[0]),
        .I2(line_counter[1]),
        .O(write_port__addr[5]));
  LUT3 #(
    .INIT(8'h02)) 
    buffer_reg_0_63_0_2_i_6
       (.I0(addr_reg[4]),
        .I1(line_counter[0]),
        .I2(line_counter[1]),
        .O(write_port__addr[4]));
  LUT3 #(
    .INIT(8'h02)) 
    buffer_reg_0_63_0_2_i_7
       (.I0(addr_reg[3]),
        .I1(line_counter[0]),
        .I2(line_counter[1]),
        .O(write_port__addr[3]));
  LUT3 #(
    .INIT(8'h02)) 
    buffer_reg_0_63_0_2_i_8
       (.I0(addr_reg[2]),
        .I1(line_counter[0]),
        .I2(line_counter[1]),
        .O(write_port__addr[2]));
  LUT3 #(
    .INIT(8'h02)) 
    buffer_reg_0_63_0_2_i_9
       (.I0(addr_reg[1]),
        .I1(line_counter[0]),
        .I2(line_counter[1]),
        .O(write_port__addr[1]));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "2400" *) 
  (* RTL_RAM_NAME = "inst/upsample/ver/buffer_reg_0_63_3_5" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    buffer_reg_0_63_3_5
       (.ADDRA(addr_reg),
        .ADDRB(addr_reg),
        .ADDRC(addr_reg),
        .ADDRD(write_port__addr),
        .DIA(write_port__data[3]),
        .DIB(write_port__data[4]),
        .DIC(write_port__data[5]),
        .DID(1'b0),
        .DOA(buffer_reg_0_63_3_5_n_0),
        .DOB(buffer_reg_0_63_3_5_n_1),
        .DOC(buffer_reg_0_63_3_5_n_2),
        .DOD(NLW_buffer_reg_0_63_3_5_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_reg_0_63_0_2_i_4_n_0));
  LUT3 #(
    .INIT(8'h02)) 
    buffer_reg_0_63_3_5_i_1
       (.I0(consume__data[3]),
        .I1(line_counter[0]),
        .I2(line_counter[1]),
        .O(write_port__data[3]));
  LUT3 #(
    .INIT(8'h02)) 
    buffer_reg_0_63_3_5_i_2
       (.I0(consume__data[4]),
        .I1(line_counter[0]),
        .I2(line_counter[1]),
        .O(write_port__data[4]));
  LUT3 #(
    .INIT(8'h02)) 
    buffer_reg_0_63_3_5_i_3
       (.I0(consume__data[5]),
        .I1(line_counter[0]),
        .I2(line_counter[1]),
        .O(write_port__data[5]));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "2400" *) 
  (* RTL_RAM_NAME = "inst/upsample/ver/buffer_reg_0_63_6_8" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    buffer_reg_0_63_6_8
       (.ADDRA(addr_reg),
        .ADDRB(addr_reg),
        .ADDRC(addr_reg),
        .ADDRD(write_port__addr),
        .DIA(write_port__data[6]),
        .DIB(write_port__data[7]),
        .DIC(write_port__data[8]),
        .DID(1'b0),
        .DOA(buffer_reg_0_63_6_8_n_0),
        .DOB(buffer_reg_0_63_6_8_n_1),
        .DOC(buffer_reg_0_63_6_8_n_2),
        .DOD(NLW_buffer_reg_0_63_6_8_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_reg_0_63_0_2_i_4_n_0));
  LUT3 #(
    .INIT(8'h02)) 
    buffer_reg_0_63_6_8_i_1
       (.I0(consume__data[6]),
        .I1(line_counter[0]),
        .I2(line_counter[1]),
        .O(write_port__data[6]));
  LUT3 #(
    .INIT(8'h02)) 
    buffer_reg_0_63_6_8_i_2
       (.I0(consume__data[7]),
        .I1(line_counter[0]),
        .I2(line_counter[1]),
        .O(write_port__data[7]));
  LUT3 #(
    .INIT(8'h02)) 
    buffer_reg_0_63_6_8_i_3
       (.I0(consume__data[8]),
        .I1(line_counter[0]),
        .I2(line_counter[1]),
        .O(write_port__data[8]));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "2400" *) 
  (* RTL_RAM_NAME = "inst/upsample/ver/buffer_reg_0_63_9_11" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    buffer_reg_0_63_9_11
       (.ADDRA(addr_reg),
        .ADDRB(addr_reg),
        .ADDRC(addr_reg),
        .ADDRD(write_port__addr),
        .DIA(write_port__data[9]),
        .DIB(write_port__data[10]),
        .DIC(write_port__data[11]),
        .DID(1'b0),
        .DOA(buffer_reg_0_63_9_11_n_0),
        .DOB(buffer_reg_0_63_9_11_n_1),
        .DOC(buffer_reg_0_63_9_11_n_2),
        .DOD(NLW_buffer_reg_0_63_9_11_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_reg_0_63_0_2_i_4_n_0));
  LUT3 #(
    .INIT(8'h02)) 
    buffer_reg_0_63_9_11_i_1
       (.I0(consume__data[9]),
        .I1(line_counter[0]),
        .I2(line_counter[1]),
        .O(write_port__data[9]));
  LUT3 #(
    .INIT(8'h02)) 
    buffer_reg_0_63_9_11_i_2
       (.I0(consume__data[10]),
        .I1(line_counter[0]),
        .I2(line_counter[1]),
        .O(write_port__data[10]));
  LUT3 #(
    .INIT(8'h02)) 
    buffer_reg_0_63_9_11_i_3
       (.I0(consume__data[11]),
        .I1(line_counter[0]),
        .I2(line_counter[1]),
        .O(write_port__data[11]));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "2400" *) 
  (* RTL_RAM_NAME = "inst/upsample/ver/buffer_reg_128_191_0_2" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    buffer_reg_128_191_0_2
       (.ADDRA(addr_reg),
        .ADDRB(addr_reg),
        .ADDRC(addr_reg),
        .ADDRD(write_port__addr),
        .DIA(write_port__data[0]),
        .DIB(write_port__data[1]),
        .DIC(write_port__data[2]),
        .DID(1'b0),
        .DOA(buffer_reg_128_191_0_2_n_0),
        .DOB(buffer_reg_128_191_0_2_n_1),
        .DOC(buffer_reg_128_191_0_2_n_2),
        .DOD(NLW_buffer_reg_128_191_0_2_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_reg_128_191_0_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000040000000000)) 
    buffer_reg_128_191_0_2_i_1
       (.I0(addr[6]),
        .I1(addr[7]),
        .I2(\line_counter_reg[1]_0 ),
        .I3(consume__valid),
        .I4(buffer_reg_192_255_6_8_0),
        .I5(produce__ready),
        .O(buffer_reg_128_191_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "2400" *) 
  (* RTL_RAM_NAME = "inst/upsample/ver/buffer_reg_128_191_3_5" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    buffer_reg_128_191_3_5
       (.ADDRA(addr_reg),
        .ADDRB(addr_reg),
        .ADDRC(addr_reg),
        .ADDRD(write_port__addr),
        .DIA(write_port__data[3]),
        .DIB(write_port__data[4]),
        .DIC(write_port__data[5]),
        .DID(1'b0),
        .DOA(buffer_reg_128_191_3_5_n_0),
        .DOB(buffer_reg_128_191_3_5_n_1),
        .DOC(buffer_reg_128_191_3_5_n_2),
        .DOD(NLW_buffer_reg_128_191_3_5_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_reg_128_191_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "2400" *) 
  (* RTL_RAM_NAME = "inst/upsample/ver/buffer_reg_128_191_6_8" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    buffer_reg_128_191_6_8
       (.ADDRA(addr_reg),
        .ADDRB(addr_reg),
        .ADDRC(addr_reg),
        .ADDRD(write_port__addr),
        .DIA(write_port__data[6]),
        .DIB(write_port__data[7]),
        .DIC(write_port__data[8]),
        .DID(1'b0),
        .DOA(buffer_reg_128_191_6_8_n_0),
        .DOB(buffer_reg_128_191_6_8_n_1),
        .DOC(buffer_reg_128_191_6_8_n_2),
        .DOD(NLW_buffer_reg_128_191_6_8_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_reg_128_191_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "2400" *) 
  (* RTL_RAM_NAME = "inst/upsample/ver/buffer_reg_128_191_9_11" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    buffer_reg_128_191_9_11
       (.ADDRA(addr_reg),
        .ADDRB(addr_reg),
        .ADDRC(addr_reg),
        .ADDRD(write_port__addr),
        .DIA(write_port__data[9]),
        .DIB(write_port__data[10]),
        .DIC(write_port__data[11]),
        .DID(1'b0),
        .DOA(buffer_reg_128_191_9_11_n_0),
        .DOB(buffer_reg_128_191_9_11_n_1),
        .DOC(buffer_reg_128_191_9_11_n_2),
        .DOD(NLW_buffer_reg_128_191_9_11_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_reg_128_191_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "2400" *) 
  (* RTL_RAM_NAME = "inst/upsample/ver/buffer_reg_192_255_0_2" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "199" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    buffer_reg_192_255_0_2
       (.ADDRA(addr_reg),
        .ADDRB(addr_reg),
        .ADDRC(addr_reg),
        .ADDRD(write_port__addr),
        .DIA(write_port__data[0]),
        .DIB(write_port__data[1]),
        .DIC(write_port__data[2]),
        .DID(1'b0),
        .DOA(buffer_reg_192_255_0_2_n_0),
        .DOB(buffer_reg_192_255_0_2_n_1),
        .DOC(buffer_reg_192_255_0_2_n_2),
        .DOD(NLW_buffer_reg_192_255_0_2_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_reg_192_255_0_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000200000000000)) 
    buffer_reg_192_255_0_2_i_1
       (.I0(produce__ready),
        .I1(buffer_reg_192_255_6_8_0),
        .I2(consume__valid),
        .I3(addr[6]),
        .I4(\line_counter_reg[1]_0 ),
        .I5(addr[7]),
        .O(buffer_reg_192_255_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "2400" *) 
  (* RTL_RAM_NAME = "inst/upsample/ver/buffer_reg_192_255_3_5" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "199" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    buffer_reg_192_255_3_5
       (.ADDRA(addr_reg),
        .ADDRB(addr_reg),
        .ADDRC(addr_reg),
        .ADDRD(write_port__addr),
        .DIA(write_port__data[3]),
        .DIB(write_port__data[4]),
        .DIC(write_port__data[5]),
        .DID(1'b0),
        .DOA(buffer_reg_192_255_3_5_n_0),
        .DOB(buffer_reg_192_255_3_5_n_1),
        .DOC(buffer_reg_192_255_3_5_n_2),
        .DOD(NLW_buffer_reg_192_255_3_5_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_reg_192_255_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "2400" *) 
  (* RTL_RAM_NAME = "inst/upsample/ver/buffer_reg_192_255_6_8" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "199" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    buffer_reg_192_255_6_8
       (.ADDRA(addr_reg),
        .ADDRB(addr_reg),
        .ADDRC(addr_reg),
        .ADDRD(write_port__addr),
        .DIA(write_port__data[6]),
        .DIB(write_port__data[7]),
        .DIC(write_port__data[8]),
        .DID(1'b0),
        .DOA(buffer_reg_192_255_6_8_n_0),
        .DOB(buffer_reg_192_255_6_8_n_1),
        .DOC(buffer_reg_192_255_6_8_n_2),
        .DOD(NLW_buffer_reg_192_255_6_8_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_reg_192_255_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "2400" *) 
  (* RTL_RAM_NAME = "inst/upsample/ver/buffer_reg_192_255_9_11" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "199" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    buffer_reg_192_255_9_11
       (.ADDRA(addr_reg),
        .ADDRB(addr_reg),
        .ADDRC(addr_reg),
        .ADDRD(write_port__addr),
        .DIA(write_port__data[9]),
        .DIB(write_port__data[10]),
        .DIC(write_port__data[11]),
        .DID(1'b0),
        .DOA(buffer_reg_192_255_9_11_n_0),
        .DOB(buffer_reg_192_255_9_11_n_1),
        .DOC(buffer_reg_192_255_9_11_n_2),
        .DOD(NLW_buffer_reg_192_255_9_11_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_reg_192_255_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "2400" *) 
  (* RTL_RAM_NAME = "inst/upsample/ver/buffer_reg_64_127_0_2" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    buffer_reg_64_127_0_2
       (.ADDRA(addr_reg),
        .ADDRB(addr_reg),
        .ADDRC(addr_reg),
        .ADDRD(write_port__addr),
        .DIA(write_port__data[0]),
        .DIB(write_port__data[1]),
        .DIC(write_port__data[2]),
        .DID(1'b0),
        .DOA(buffer_reg_64_127_0_2_n_0),
        .DOB(buffer_reg_64_127_0_2_n_1),
        .DOC(buffer_reg_64_127_0_2_n_2),
        .DOD(NLW_buffer_reg_64_127_0_2_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_reg_64_127_0_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000040000000000)) 
    buffer_reg_64_127_0_2_i_1
       (.I0(addr[7]),
        .I1(addr[6]),
        .I2(\line_counter_reg[1]_0 ),
        .I3(consume__valid),
        .I4(buffer_reg_192_255_6_8_0),
        .I5(produce__ready),
        .O(buffer_reg_64_127_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "2400" *) 
  (* RTL_RAM_NAME = "inst/upsample/ver/buffer_reg_64_127_3_5" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    buffer_reg_64_127_3_5
       (.ADDRA(addr_reg),
        .ADDRB(addr_reg),
        .ADDRC(addr_reg),
        .ADDRD(write_port__addr),
        .DIA(write_port__data[3]),
        .DIB(write_port__data[4]),
        .DIC(write_port__data[5]),
        .DID(1'b0),
        .DOA(buffer_reg_64_127_3_5_n_0),
        .DOB(buffer_reg_64_127_3_5_n_1),
        .DOC(buffer_reg_64_127_3_5_n_2),
        .DOD(NLW_buffer_reg_64_127_3_5_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_reg_64_127_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "2400" *) 
  (* RTL_RAM_NAME = "inst/upsample/ver/buffer_reg_64_127_6_8" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    buffer_reg_64_127_6_8
       (.ADDRA(addr_reg),
        .ADDRB(addr_reg),
        .ADDRC(addr_reg),
        .ADDRD(write_port__addr),
        .DIA(write_port__data[6]),
        .DIB(write_port__data[7]),
        .DIC(write_port__data[8]),
        .DID(1'b0),
        .DOA(buffer_reg_64_127_6_8_n_0),
        .DOB(buffer_reg_64_127_6_8_n_1),
        .DOC(buffer_reg_64_127_6_8_n_2),
        .DOD(NLW_buffer_reg_64_127_6_8_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_reg_64_127_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "2400" *) 
  (* RTL_RAM_NAME = "inst/upsample/ver/buffer_reg_64_127_9_11" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    buffer_reg_64_127_9_11
       (.ADDRA(addr_reg),
        .ADDRB(addr_reg),
        .ADDRC(addr_reg),
        .ADDRD(write_port__addr),
        .DIA(write_port__data[9]),
        .DIB(write_port__data[10]),
        .DIC(write_port__data[11]),
        .DID(1'b0),
        .DOA(buffer_reg_64_127_9_11_n_0),
        .DOB(buffer_reg_64_127_9_11_n_1),
        .DOC(buffer_reg_64_127_9_11_n_2),
        .DOD(NLW_buffer_reg_64_127_9_11_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_reg_64_127_0_2_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    consume__ready_INST_0
       (.I0(line_counter[0]),
        .I1(line_counter[1]),
        .I2(produce__ready),
        .I3(\addr_reg[7]_0 ),
        .I4(\addr_reg[7]_1 ),
        .O(consume__ready));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \counter[0]_i_2 
       (.I0(line_counter[1]),
        .I1(line_counter[0]),
        .O(\line_counter_reg[1]_0 ));
  LUT6 #(
    .INIT(64'h000000000000FE00)) 
    \data_reg[11]_i_1 
       (.I0(line_counter[1]),
        .I1(line_counter[0]),
        .I2(consume__valid),
        .I3(produce__ready),
        .I4(\addr_reg[7]_0 ),
        .I5(\addr_reg[7]_1 ),
        .O(\$1 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h12)) 
    \line_counter[0]_i_1 
       (.I0(line_counter[0]),
        .I1(rst),
        .I2(\line_counter[1]_i_2_n_0 ),
        .O(\line_counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h060C)) 
    \line_counter[1]_i_1 
       (.I0(line_counter[0]),
        .I1(line_counter[1]),
        .I2(rst),
        .I3(\line_counter[1]_i_2_n_0 ),
        .O(\line_counter[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000080)) 
    \line_counter[1]_i_2 
       (.I0(\$1 ),
        .I1(addr[7]),
        .I2(addr[6]),
        .I3(addr_reg[5]),
        .I4(addr_reg[4]),
        .I5(\line_counter[1]_i_3_n_0 ),
        .O(\line_counter[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hBFFF)) 
    \line_counter[1]_i_3 
       (.I0(addr_reg[3]),
        .I1(addr_reg[2]),
        .I2(addr_reg[1]),
        .I3(addr_reg[0]),
        .O(\line_counter[1]_i_3_n_0 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:80" *) 
  FDRE #(
    .INIT(1'b0)) 
    \line_counter_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\line_counter[0]_i_1_n_0 ),
        .Q(line_counter[0]),
        .R(1'b0));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:80" *) 
  FDRE #(
    .INIT(1'b0)) 
    \line_counter_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\line_counter[1]_i_1_n_0 ),
        .Q(line_counter[1]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[0]_INST_0_i_1 
       (.I0(read_port__data[0]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[0]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \produce__data[0]_INST_0_i_2 
       (.I0(buffer_reg_192_255_0_2_n_0),
        .I1(buffer_reg_128_191_0_2_n_0),
        .I2(addr[7]),
        .I3(buffer_reg_64_127_0_2_n_0),
        .I4(addr[6]),
        .I5(buffer_reg_0_63_0_2_n_0),
        .O(read_port__data[0]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[10]_INST_0_i_1 
       (.I0(read_port__data[10]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[10]),
        .O(D[10]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \produce__data[10]_INST_0_i_2 
       (.I0(buffer_reg_192_255_9_11_n_1),
        .I1(buffer_reg_128_191_9_11_n_1),
        .I2(addr[7]),
        .I3(buffer_reg_64_127_9_11_n_1),
        .I4(addr[6]),
        .I5(buffer_reg_0_63_9_11_n_1),
        .O(read_port__data[10]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[11]_INST_0_i_1 
       (.I0(read_port__data[11]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[11]),
        .O(D[11]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \produce__data[11]_INST_0_i_2 
       (.I0(buffer_reg_192_255_9_11_n_2),
        .I1(buffer_reg_128_191_9_11_n_2),
        .I2(addr[7]),
        .I3(buffer_reg_64_127_9_11_n_2),
        .I4(addr[6]),
        .I5(buffer_reg_0_63_9_11_n_2),
        .O(read_port__data[11]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[1]_INST_0_i_1 
       (.I0(read_port__data[1]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[1]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \produce__data[1]_INST_0_i_2 
       (.I0(buffer_reg_192_255_0_2_n_1),
        .I1(buffer_reg_128_191_0_2_n_1),
        .I2(addr[7]),
        .I3(buffer_reg_64_127_0_2_n_1),
        .I4(addr[6]),
        .I5(buffer_reg_0_63_0_2_n_1),
        .O(read_port__data[1]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[2]_INST_0_i_1 
       (.I0(read_port__data[2]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[2]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \produce__data[2]_INST_0_i_2 
       (.I0(buffer_reg_192_255_0_2_n_2),
        .I1(buffer_reg_128_191_0_2_n_2),
        .I2(addr[7]),
        .I3(buffer_reg_64_127_0_2_n_2),
        .I4(addr[6]),
        .I5(buffer_reg_0_63_0_2_n_2),
        .O(read_port__data[2]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[3]_INST_0_i_1 
       (.I0(read_port__data[3]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[3]),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \produce__data[3]_INST_0_i_2 
       (.I0(buffer_reg_192_255_3_5_n_0),
        .I1(buffer_reg_128_191_3_5_n_0),
        .I2(addr[7]),
        .I3(buffer_reg_64_127_3_5_n_0),
        .I4(addr[6]),
        .I5(buffer_reg_0_63_3_5_n_0),
        .O(read_port__data[3]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[4]_INST_0_i_1 
       (.I0(read_port__data[4]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[4]),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \produce__data[4]_INST_0_i_2 
       (.I0(buffer_reg_192_255_3_5_n_1),
        .I1(buffer_reg_128_191_3_5_n_1),
        .I2(addr[7]),
        .I3(buffer_reg_64_127_3_5_n_1),
        .I4(addr[6]),
        .I5(buffer_reg_0_63_3_5_n_1),
        .O(read_port__data[4]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[5]_INST_0_i_1 
       (.I0(read_port__data[5]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[5]),
        .O(D[5]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \produce__data[5]_INST_0_i_2 
       (.I0(buffer_reg_192_255_3_5_n_2),
        .I1(buffer_reg_128_191_3_5_n_2),
        .I2(addr[7]),
        .I3(buffer_reg_64_127_3_5_n_2),
        .I4(addr[6]),
        .I5(buffer_reg_0_63_3_5_n_2),
        .O(read_port__data[5]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[6]_INST_0_i_1 
       (.I0(read_port__data[6]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[6]),
        .O(D[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \produce__data[6]_INST_0_i_2 
       (.I0(buffer_reg_192_255_6_8_n_0),
        .I1(buffer_reg_128_191_6_8_n_0),
        .I2(addr[7]),
        .I3(buffer_reg_64_127_6_8_n_0),
        .I4(addr[6]),
        .I5(buffer_reg_0_63_6_8_n_0),
        .O(read_port__data[6]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[7]_INST_0_i_1 
       (.I0(read_port__data[7]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[7]),
        .O(D[7]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \produce__data[7]_INST_0_i_2 
       (.I0(buffer_reg_192_255_6_8_n_1),
        .I1(buffer_reg_128_191_6_8_n_1),
        .I2(addr[7]),
        .I3(buffer_reg_64_127_6_8_n_1),
        .I4(addr[6]),
        .I5(buffer_reg_0_63_6_8_n_1),
        .O(read_port__data[7]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[8]_INST_0_i_1 
       (.I0(read_port__data[8]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[8]),
        .O(D[8]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \produce__data[8]_INST_0_i_2 
       (.I0(buffer_reg_192_255_6_8_n_2),
        .I1(buffer_reg_128_191_6_8_n_2),
        .I2(addr[7]),
        .I3(buffer_reg_64_127_6_8_n_2),
        .I4(addr[6]),
        .I5(buffer_reg_0_63_6_8_n_2),
        .O(read_port__data[8]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[9]_INST_0_i_1 
       (.I0(read_port__data[9]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[9]),
        .O(D[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \produce__data[9]_INST_0_i_2 
       (.I0(buffer_reg_192_255_9_11_n_0),
        .I1(buffer_reg_128_191_9_11_n_0),
        .I2(addr[7]),
        .I3(buffer_reg_64_127_9_11_n_0),
        .I4(addr[6]),
        .I5(buffer_reg_0_63_9_11_n_0),
        .O(read_port__data[9]));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    produce__valid_INST_0
       (.I0(line_counter[1]),
        .I1(line_counter[0]),
        .I2(consume__valid),
        .I3(\addr_reg[7]_1 ),
        .I4(\addr_reg[7]_0 ),
        .O(produce__valid));
  LUT6 #(
    .INIT(64'h00000000DDDDD000)) 
    sync_flag_i_1
       (.I0(\line_counter[1]_i_2_n_0 ),
        .I1(sync_flag_i_2_n_0),
        .I2(consume__vsync),
        .I3(write_port__en),
        .I4(sync_flag),
        .I5(rst),
        .O(sync_flag_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    sync_flag_i_2
       (.I0(line_counter[0]),
        .I1(line_counter[1]),
        .I2(sync_flag),
        .O(sync_flag_i_2_n_0));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:69" *) 
  FDRE #(
    .INIT(1'b0)) 
    sync_flag_reg
       (.C(clk),
        .CE(1'b1),
        .D(sync_flag_i_1_n_0),
        .Q(sync_flag),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h4000)) 
    sync_reg_i_1
       (.I0(sync_reg_i_2_n_0),
        .I1(sync_flag),
        .I2(line_counter[1]),
        .I3(line_counter[0]),
        .O(consume__vsync$14));
  LUT6 #(
    .INIT(64'hFFFEFFFFFFFFFFFF)) 
    sync_reg_i_2
       (.I0(\addr[6]_i_2_n_0 ),
        .I1(addr_reg[3]),
        .I2(addr_reg[4]),
        .I3(addr_reg[5]),
        .I4(addr[6]),
        .I5(addr[7]),
        .O(sync_reg_i_2_n_0));
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
