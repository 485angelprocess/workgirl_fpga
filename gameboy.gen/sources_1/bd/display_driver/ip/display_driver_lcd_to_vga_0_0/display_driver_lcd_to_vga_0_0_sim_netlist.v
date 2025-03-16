// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Sun Mar  9 13:11:46 2025
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
    rst,
    produce__ready,
    clk,
    consume__valid,
    consume__data,
    consume__vsync);
  output [11:0]produce__data;
  output consume__ready;
  output produce__valid;
  output produce__vsync;
  input rst;
  input produce__ready;
  input clk;
  input consume__valid;
  input [11:0]consume__data;
  input consume__vsync;

  wire border_n_1;
  wire border_n_2;
  wire border_n_3;
  wire border_n_4;
  wire clk;
  wire [11:0]consume__data;
  wire consume__ready;
  wire consume__valid;
  wire consume__vsync;
  wire \hor/$7 ;
  wire \hor/$9 ;
  wire [11:0]produce__data;
  wire produce__ready;
  wire produce__valid;
  wire produce__vsync;
  wire rst;
  wire upsample_n_17;
  wire \ver/$1 ;
  wire \ver/active ;

  \display_driver_lcd_to_vga_0_0_lcd_to_vga.border  border
       (.\$7 (\hor/$7 ),
        .E(\ver/$1 ),
        .SR(\hor/$9 ),
        .active(\ver/active ),
        .active_reg(border_n_1),
        .active_reg_0(border_n_3),
        .clk(clk),
        .\counter_reg[5] (border_n_4),
        .\counter_reg[7] (border_n_2),
        .produce__ready(produce__ready),
        .produce__vsync(produce__vsync),
        .rst(rst),
        .sync_reg_reg(upsample_n_17));
  \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample  upsample
       (.\$7 (\hor/$7 ),
        .E(\ver/$1 ),
        .SR(\hor/$9 ),
        .active(\ver/active ),
        .clk(clk),
        .consume__data(consume__data),
        .consume__ready(consume__ready),
        .consume__valid(consume__valid),
        .consume__vsync(consume__vsync),
        .\counter_reg[0] (border_n_4),
        .\counter_reg[1] (border_n_1),
        .\counter_reg[9] (border_n_2),
        .\line_counter_reg[1] (upsample_n_17),
        .produce__data(produce__data),
        .produce__ready(produce__ready),
        .produce__valid(produce__valid),
        .produce__valid_0(border_n_3),
        .rst(rst));
endmodule

(* ORIG_REF_NAME = "lcd_to_vga.border" *) 
module \display_driver_lcd_to_vga_0_0_lcd_to_vga.border 
   (active,
    active_reg,
    \counter_reg[7] ,
    active_reg_0,
    \counter_reg[5] ,
    produce__vsync,
    clk,
    rst,
    produce__ready,
    sync_reg_reg,
    \$7 ,
    SR,
    E);
  output active;
  output active_reg;
  output \counter_reg[7] ;
  output active_reg_0;
  output \counter_reg[5] ;
  output produce__vsync;
  input clk;
  input rst;
  input produce__ready;
  input sync_reg_reg;
  input \$7 ;
  input [0:0]SR;
  input [0:0]E;

  wire \$7 ;
  wire [0:0]E;
  wire [0:0]SR;
  wire active;
  wire active_reg;
  wire active_reg_0;
  wire clk;
  wire \counter_reg[5] ;
  wire \counter_reg[7] ;
  wire hor_n_0;
  wire hor_n_1;
  wire produce__ready;
  wire produce__vsync;
  wire rst;
  wire sync_reg_reg;
  wire ver_n_2;

  \display_driver_lcd_to_vga_0_0_lcd_to_vga.border.hor  hor
       (.\$7 (\$7 ),
        .E(E),
        .SR(SR),
        .clk(clk),
        .\counter_reg[5]_0 (\counter_reg[5] ),
        .\counter_reg[7]_0 (\counter_reg[7] ),
        .\pix_counter_reg[14] (active),
        .produce__ready(produce__ready),
        .produce__ready_0(hor_n_0),
        .rst(rst),
        .sync_reg_reg_0(hor_n_1),
        .sync_reg_reg_1(sync_reg_reg),
        .sync_reg_reg_2(ver_n_2));
  \display_driver_lcd_to_vga_0_0_lcd_to_vga.border.ver  ver
       (.active_reg_0(active),
        .active_reg_1(active_reg),
        .active_reg_2(active_reg_0),
        .clk(clk),
        .\pix_counter_reg[0]_0 (hor_n_1),
        .\pix_counter_reg[14]_0 (hor_n_0),
        .produce__ready(produce__ready),
        .produce__ready_0(ver_n_2),
        .produce__valid(\counter_reg[7] ),
        .produce__vsync(produce__vsync),
        .rst(rst));
endmodule

(* ORIG_REF_NAME = "lcd_to_vga.border.hor" *) 
module \display_driver_lcd_to_vga_0_0_lcd_to_vga.border.hor 
   (produce__ready_0,
    sync_reg_reg_0,
    \counter_reg[7]_0 ,
    \counter_reg[5]_0 ,
    clk,
    produce__ready,
    \pix_counter_reg[14] ,
    rst,
    sync_reg_reg_1,
    sync_reg_reg_2,
    \$7 ,
    SR,
    E);
  output produce__ready_0;
  output sync_reg_reg_0;
  output \counter_reg[7]_0 ;
  output \counter_reg[5]_0 ;
  input clk;
  input produce__ready;
  input \pix_counter_reg[14] ;
  input rst;
  input sync_reg_reg_1;
  input sync_reg_reg_2;
  input \$7 ;
  input [0:0]SR;
  input [0:0]E;

  wire [9:0]\$5 ;
  wire \$7 ;
  wire [0:0]E;
  wire [0:0]SR;
  wire clk;
  wire \counter[5]_i_1_n_0 ;
  wire \counter[9]_i_5_n_0 ;
  wire [9:0]counter_reg;
  wire \counter_reg[5]_0 ;
  wire \counter_reg[7]_0 ;
  wire \pix_counter[14]_i_8_n_0 ;
  wire \pix_counter[14]_i_9_n_0 ;
  wire \pix_counter_reg[14] ;
  wire produce__ready;
  wire produce__ready_0;
  wire rst;
  wire sync_reg;
  wire sync_reg_i_1__0_n_0;
  wire sync_reg_reg_0;
  wire sync_reg_reg_1;
  wire sync_reg_reg_2;

  LUT6 #(
    .INIT(64'hC8C1C8C1C8C1C1C1)) 
    consume__ready_INST_0_i_1
       (.I0(counter_reg[7]),
        .I1(counter_reg[9]),
        .I2(counter_reg[8]),
        .I3(counter_reg[6]),
        .I4(counter_reg[5]),
        .I5(counter_reg[4]),
        .O(\counter_reg[7]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_1 
       (.I0(counter_reg[0]),
        .O(\$5 [0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \counter[1]_i_1 
       (.I0(counter_reg[0]),
        .I1(counter_reg[1]),
        .O(\$5 [1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \counter[2]_i_1 
       (.I0(counter_reg[2]),
        .I1(counter_reg[0]),
        .I2(counter_reg[1]),
        .O(\$5 [2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \counter[3]_i_1 
       (.I0(counter_reg[3]),
        .I1(counter_reg[1]),
        .I2(counter_reg[0]),
        .I3(counter_reg[2]),
        .O(\$5 [3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \counter[4]_i_1 
       (.I0(counter_reg[4]),
        .I1(counter_reg[2]),
        .I2(counter_reg[0]),
        .I3(counter_reg[1]),
        .I4(counter_reg[3]),
        .O(\$5 [4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \counter[5]_i_1 
       (.I0(counter_reg[5]),
        .I1(counter_reg[4]),
        .I2(counter_reg[2]),
        .I3(counter_reg[0]),
        .I4(counter_reg[1]),
        .I5(counter_reg[3]),
        .O(\counter[5]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \counter[6]_i_1 
       (.I0(counter_reg[6]),
        .I1(\counter[9]_i_5_n_0 ),
        .I2(counter_reg[5]),
        .O(\$5 [6]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h9AAA)) 
    \counter[7]_i_1 
       (.I0(counter_reg[7]),
        .I1(\counter[9]_i_5_n_0 ),
        .I2(counter_reg[5]),
        .I3(counter_reg[6]),
        .O(\$5 [7]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hAA6AAAAA)) 
    \counter[8]_i_1 
       (.I0(counter_reg[8]),
        .I1(counter_reg[6]),
        .I2(counter_reg[5]),
        .I3(\counter[9]_i_5_n_0 ),
        .I4(counter_reg[7]),
        .O(\$5 [8]));
  LUT6 #(
    .INIT(64'hA6AAAAAAAAAAAAAA)) 
    \counter[9]_i_3 
       (.I0(counter_reg[9]),
        .I1(counter_reg[7]),
        .I2(\counter[9]_i_5_n_0 ),
        .I3(counter_reg[5]),
        .I4(counter_reg[6]),
        .I5(counter_reg[8]),
        .O(\$5 [9]));
  LUT6 #(
    .INIT(64'hFFFEFFFFFFFFFFFF)) 
    \counter[9]_i_4 
       (.I0(\counter[9]_i_5_n_0 ),
        .I1(counter_reg[5]),
        .I2(counter_reg[6]),
        .I3(counter_reg[7]),
        .I4(counter_reg[8]),
        .I5(counter_reg[9]),
        .O(\counter_reg[5]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \counter[9]_i_5 
       (.I0(counter_reg[3]),
        .I1(counter_reg[1]),
        .I2(counter_reg[0]),
        .I3(counter_reg[2]),
        .I4(counter_reg[4]),
        .O(\counter[9]_i_5_n_0 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:217" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk),
        .CE(E),
        .D(\$5 [0]),
        .Q(counter_reg[0]),
        .R(SR));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:217" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk),
        .CE(E),
        .D(\$5 [1]),
        .Q(counter_reg[1]),
        .R(SR));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:217" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk),
        .CE(E),
        .D(\$5 [2]),
        .Q(counter_reg[2]),
        .R(SR));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:217" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk),
        .CE(E),
        .D(\$5 [3]),
        .Q(counter_reg[3]),
        .R(SR));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:217" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(clk),
        .CE(E),
        .D(\$5 [4]),
        .Q(counter_reg[4]),
        .R(SR));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:217" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(clk),
        .CE(E),
        .D(\counter[5]_i_1_n_0 ),
        .Q(counter_reg[5]),
        .R(SR));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:217" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(clk),
        .CE(E),
        .D(\$5 [6]),
        .Q(counter_reg[6]),
        .R(SR));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:217" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(clk),
        .CE(E),
        .D(\$5 [7]),
        .Q(counter_reg[7]),
        .R(SR));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:217" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(clk),
        .CE(E),
        .D(\$5 [8]),
        .Q(counter_reg[8]),
        .R(SR));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:217" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(clk),
        .CE(E),
        .D(\$5 [9]),
        .Q(counter_reg[9]),
        .R(SR));
  LUT4 #(
    .INIT(16'hFFAE)) 
    \pix_counter[14]_i_2 
       (.I0(sync_reg_reg_0),
        .I1(produce__ready),
        .I2(\pix_counter_reg[14] ),
        .I3(rst),
        .O(produce__ready_0));
  LUT6 #(
    .INIT(64'h00000000000000A2)) 
    \pix_counter[14]_i_4 
       (.I0(sync_reg),
        .I1(sync_reg_reg_1),
        .I2(\counter_reg[7]_0 ),
        .I3(sync_reg_reg_2),
        .I4(\pix_counter[14]_i_8_n_0 ),
        .I5(\pix_counter[14]_i_9_n_0 ),
        .O(sync_reg_reg_0));
  LUT6 #(
    .INIT(64'hBFFFFFFFFFFFFFFF)) 
    \pix_counter[14]_i_8 
       (.I0(counter_reg[5]),
        .I1(counter_reg[4]),
        .I2(counter_reg[2]),
        .I3(counter_reg[0]),
        .I4(counter_reg[1]),
        .I5(counter_reg[3]),
        .O(\pix_counter[14]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFF7)) 
    \pix_counter[14]_i_9 
       (.I0(counter_reg[9]),
        .I1(counter_reg[8]),
        .I2(counter_reg[7]),
        .I3(counter_reg[6]),
        .O(\pix_counter[14]_i_9_n_0 ));
  LUT4 #(
    .INIT(16'h00F2)) 
    sync_reg_i_1__0
       (.I0(sync_reg),
        .I1(sync_reg_reg_0),
        .I2(\$7 ),
        .I3(rst),
        .O(sync_reg_i_1__0_n_0));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:216" *) 
  FDRE #(
    .INIT(1'b0)) 
    sync_reg_reg
       (.C(clk),
        .CE(1'b1),
        .D(sync_reg_i_1__0_n_0),
        .Q(sync_reg),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "lcd_to_vga.border.ver" *) 
module \display_driver_lcd_to_vga_0_0_lcd_to_vga.border.ver 
   (active_reg_0,
    active_reg_1,
    produce__ready_0,
    active_reg_2,
    produce__vsync,
    clk,
    rst,
    produce__ready,
    \pix_counter_reg[0]_0 ,
    produce__valid,
    \pix_counter_reg[14]_0 );
  output active_reg_0;
  output active_reg_1;
  output produce__ready_0;
  output active_reg_2;
  output produce__vsync;
  input clk;
  input rst;
  input produce__ready;
  input \pix_counter_reg[0]_0 ;
  input produce__valid;
  input \pix_counter_reg[14]_0 ;

  wire \$4_carry__0_n_0 ;
  wire \$4_carry__0_n_1 ;
  wire \$4_carry__0_n_2 ;
  wire \$4_carry__0_n_3 ;
  wire \$4_carry__1_n_0 ;
  wire \$4_carry__1_n_1 ;
  wire \$4_carry__1_n_2 ;
  wire \$4_carry__1_n_3 ;
  wire \$4_carry__2_n_3 ;
  wire \$4_carry_n_0 ;
  wire \$4_carry_n_1 ;
  wire \$4_carry_n_2 ;
  wire \$4_carry_n_3 ;
  wire active_i_1_n_0;
  wire active_reg_0;
  wire active_reg_1;
  wire active_reg_2;
  wire clk;
  wire [14:1]p_0_in;
  wire [14:0]pix_counter;
  wire \pix_counter[0]_i_1_n_0 ;
  wire \pix_counter[10]_i_1_n_0 ;
  wire \pix_counter[11]_i_1_n_0 ;
  wire \pix_counter[12]_i_1_n_0 ;
  wire \pix_counter[13]_i_1_n_0 ;
  wire \pix_counter[14]_i_10_n_0 ;
  wire \pix_counter[14]_i_11_n_0 ;
  wire \pix_counter[14]_i_1_n_0 ;
  wire \pix_counter[14]_i_3_n_0 ;
  wire \pix_counter[14]_i_5_n_0 ;
  wire \pix_counter[1]_i_1_n_0 ;
  wire \pix_counter[2]_i_1_n_0 ;
  wire \pix_counter[3]_i_1_n_0 ;
  wire \pix_counter[4]_i_1_n_0 ;
  wire \pix_counter[5]_i_1_n_0 ;
  wire \pix_counter[6]_i_1_n_0 ;
  wire \pix_counter[7]_i_1_n_0 ;
  wire \pix_counter[8]_i_1_n_0 ;
  wire \pix_counter[9]_i_1_n_0 ;
  wire \pix_counter_reg[0]_0 ;
  wire \pix_counter_reg[14]_0 ;
  wire produce__ready;
  wire produce__ready_0;
  wire produce__valid;
  wire produce__vsync;
  wire produce__vsync_INST_0_i_1_n_0;
  wire produce__vsync_INST_0_i_2_n_0;
  wire produce__vsync_INST_0_i_3_n_0;
  wire rst;
  wire [3:1]NLW_$4_carry__2_CO_UNCONNECTED;
  wire [3:2]NLW_$4_carry__2_O_UNCONNECTED;

  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \$4_carry 
       (.CI(1'b0),
        .CO({\$4_carry_n_0 ,\$4_carry_n_1 ,\$4_carry_n_2 ,\$4_carry_n_3 }),
        .CYINIT(pix_counter[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[4:1]),
        .S(pix_counter[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \$4_carry__0 
       (.CI(\$4_carry_n_0 ),
        .CO({\$4_carry__0_n_0 ,\$4_carry__0_n_1 ,\$4_carry__0_n_2 ,\$4_carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[8:5]),
        .S(pix_counter[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \$4_carry__1 
       (.CI(\$4_carry__0_n_0 ),
        .CO({\$4_carry__1_n_0 ,\$4_carry__1_n_1 ,\$4_carry__1_n_2 ,\$4_carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[12:9]),
        .S(pix_counter[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \$4_carry__2 
       (.CI(\$4_carry__1_n_0 ),
        .CO({NLW_$4_carry__2_CO_UNCONNECTED[3:1],\$4_carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_$4_carry__2_O_UNCONNECTED[3:2],p_0_in[14:13]}),
        .S({1'b0,1'b0,pix_counter[14:13]}));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h000004AE)) 
    active_i_1
       (.I0(active_reg_0),
        .I1(produce__ready),
        .I2(\pix_counter[14]_i_5_n_0 ),
        .I3(\pix_counter_reg[0]_0 ),
        .I4(rst),
        .O(active_i_1_n_0));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:273" *) 
  FDRE #(
    .INIT(1'b0)) 
    active_reg
       (.C(clk),
        .CE(1'b1),
        .D(active_i_1_n_0),
        .Q(active_reg_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hF7)) 
    \counter[1]_i_2 
       (.I0(active_reg_0),
        .I1(produce__ready),
        .I2(produce__valid),
        .O(active_reg_1));
  LUT5 #(
    .INIT(32'h0051000C)) 
    \pix_counter[0]_i_1 
       (.I0(\pix_counter_reg[0]_0 ),
        .I1(produce__ready),
        .I2(active_reg_0),
        .I3(rst),
        .I4(pix_counter[0]),
        .O(\pix_counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \pix_counter[10]_i_1 
       (.I0(p_0_in[10]),
        .I1(produce__ready),
        .I2(active_reg_0),
        .I3(rst),
        .O(\pix_counter[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \pix_counter[11]_i_1 
       (.I0(p_0_in[11]),
        .I1(produce__ready),
        .I2(active_reg_0),
        .I3(rst),
        .O(\pix_counter[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \pix_counter[12]_i_1 
       (.I0(p_0_in[12]),
        .I1(produce__ready),
        .I2(active_reg_0),
        .I3(rst),
        .O(\pix_counter[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \pix_counter[13]_i_1 
       (.I0(p_0_in[13]),
        .I1(produce__ready),
        .I2(active_reg_0),
        .I3(rst),
        .O(\pix_counter[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0000FFBA)) 
    \pix_counter[14]_i_1 
       (.I0(rst),
        .I1(active_reg_0),
        .I2(produce__ready),
        .I3(\pix_counter_reg[0]_0 ),
        .I4(\pix_counter[14]_i_5_n_0 ),
        .O(\pix_counter[14]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \pix_counter[14]_i_10 
       (.I0(pix_counter[4]),
        .I1(pix_counter[5]),
        .I2(pix_counter[9]),
        .I3(pix_counter[14]),
        .O(\pix_counter[14]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \pix_counter[14]_i_11 
       (.I0(pix_counter[7]),
        .I1(pix_counter[8]),
        .I2(pix_counter[11]),
        .I3(pix_counter[10]),
        .O(\pix_counter[14]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \pix_counter[14]_i_3 
       (.I0(p_0_in[14]),
        .I1(produce__ready),
        .I2(active_reg_0),
        .I3(rst),
        .O(\pix_counter[14]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEFF)) 
    \pix_counter[14]_i_5 
       (.I0(\pix_counter[14]_i_10_n_0 ),
        .I1(\pix_counter[14]_i_11_n_0 ),
        .I2(pix_counter[13]),
        .I3(pix_counter[6]),
        .I4(pix_counter[12]),
        .I5(produce__vsync_INST_0_i_3_n_0),
        .O(\pix_counter[14]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \pix_counter[14]_i_7 
       (.I0(produce__ready),
        .I1(active_reg_0),
        .O(produce__ready_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \pix_counter[1]_i_1 
       (.I0(p_0_in[1]),
        .I1(produce__ready),
        .I2(active_reg_0),
        .I3(rst),
        .O(\pix_counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \pix_counter[2]_i_1 
       (.I0(p_0_in[2]),
        .I1(produce__ready),
        .I2(active_reg_0),
        .I3(rst),
        .O(\pix_counter[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \pix_counter[3]_i_1 
       (.I0(p_0_in[3]),
        .I1(produce__ready),
        .I2(active_reg_0),
        .I3(rst),
        .O(\pix_counter[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \pix_counter[4]_i_1 
       (.I0(p_0_in[4]),
        .I1(produce__ready),
        .I2(active_reg_0),
        .I3(rst),
        .O(\pix_counter[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \pix_counter[5]_i_1 
       (.I0(p_0_in[5]),
        .I1(produce__ready),
        .I2(active_reg_0),
        .I3(rst),
        .O(\pix_counter[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \pix_counter[6]_i_1 
       (.I0(p_0_in[6]),
        .I1(produce__ready),
        .I2(active_reg_0),
        .I3(rst),
        .O(\pix_counter[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \pix_counter[7]_i_1 
       (.I0(p_0_in[7]),
        .I1(produce__ready),
        .I2(active_reg_0),
        .I3(rst),
        .O(\pix_counter[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \pix_counter[8]_i_1 
       (.I0(p_0_in[8]),
        .I1(produce__ready),
        .I2(active_reg_0),
        .I3(rst),
        .O(\pix_counter[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \pix_counter[9]_i_1 
       (.I0(p_0_in[9]),
        .I1(produce__ready),
        .I2(active_reg_0),
        .I3(rst),
        .O(\pix_counter[9]_i_1_n_0 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:274" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\pix_counter[0]_i_1_n_0 ),
        .Q(pix_counter[0]),
        .R(1'b0));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:274" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[10] 
       (.C(clk),
        .CE(\pix_counter_reg[14]_0 ),
        .D(\pix_counter[10]_i_1_n_0 ),
        .Q(pix_counter[10]),
        .R(\pix_counter[14]_i_1_n_0 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:274" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[11] 
       (.C(clk),
        .CE(\pix_counter_reg[14]_0 ),
        .D(\pix_counter[11]_i_1_n_0 ),
        .Q(pix_counter[11]),
        .R(\pix_counter[14]_i_1_n_0 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:274" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[12] 
       (.C(clk),
        .CE(\pix_counter_reg[14]_0 ),
        .D(\pix_counter[12]_i_1_n_0 ),
        .Q(pix_counter[12]),
        .R(\pix_counter[14]_i_1_n_0 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:274" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[13] 
       (.C(clk),
        .CE(\pix_counter_reg[14]_0 ),
        .D(\pix_counter[13]_i_1_n_0 ),
        .Q(pix_counter[13]),
        .R(\pix_counter[14]_i_1_n_0 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:274" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[14] 
       (.C(clk),
        .CE(\pix_counter_reg[14]_0 ),
        .D(\pix_counter[14]_i_3_n_0 ),
        .Q(pix_counter[14]),
        .R(\pix_counter[14]_i_1_n_0 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:274" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[1] 
       (.C(clk),
        .CE(\pix_counter_reg[14]_0 ),
        .D(\pix_counter[1]_i_1_n_0 ),
        .Q(pix_counter[1]),
        .R(\pix_counter[14]_i_1_n_0 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:274" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[2] 
       (.C(clk),
        .CE(\pix_counter_reg[14]_0 ),
        .D(\pix_counter[2]_i_1_n_0 ),
        .Q(pix_counter[2]),
        .R(\pix_counter[14]_i_1_n_0 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:274" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[3] 
       (.C(clk),
        .CE(\pix_counter_reg[14]_0 ),
        .D(\pix_counter[3]_i_1_n_0 ),
        .Q(pix_counter[3]),
        .R(\pix_counter[14]_i_1_n_0 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:274" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[4] 
       (.C(clk),
        .CE(\pix_counter_reg[14]_0 ),
        .D(\pix_counter[4]_i_1_n_0 ),
        .Q(pix_counter[4]),
        .R(\pix_counter[14]_i_1_n_0 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:274" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[5] 
       (.C(clk),
        .CE(\pix_counter_reg[14]_0 ),
        .D(\pix_counter[5]_i_1_n_0 ),
        .Q(pix_counter[5]),
        .R(\pix_counter[14]_i_1_n_0 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:274" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[6] 
       (.C(clk),
        .CE(\pix_counter_reg[14]_0 ),
        .D(\pix_counter[6]_i_1_n_0 ),
        .Q(pix_counter[6]),
        .R(\pix_counter[14]_i_1_n_0 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:274" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[7] 
       (.C(clk),
        .CE(\pix_counter_reg[14]_0 ),
        .D(\pix_counter[7]_i_1_n_0 ),
        .Q(pix_counter[7]),
        .R(\pix_counter[14]_i_1_n_0 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:274" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[8] 
       (.C(clk),
        .CE(\pix_counter_reg[14]_0 ),
        .D(\pix_counter[8]_i_1_n_0 ),
        .Q(pix_counter[8]),
        .R(\pix_counter[14]_i_1_n_0 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:274" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[9] 
       (.C(clk),
        .CE(\pix_counter_reg[14]_0 ),
        .D(\pix_counter[9]_i_1_n_0 ),
        .Q(pix_counter[9]),
        .R(\pix_counter[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \produce__data[11]_INST_0_i_1 
       (.I0(active_reg_0),
        .I1(produce__valid),
        .O(active_reg_2));
  LUT6 #(
    .INIT(64'h0000000000400000)) 
    produce__vsync_INST_0
       (.I0(produce__vsync_INST_0_i_1_n_0),
        .I1(produce__vsync_INST_0_i_2_n_0),
        .I2(pix_counter[13]),
        .I3(pix_counter[11]),
        .I4(pix_counter[8]),
        .I5(produce__vsync_INST_0_i_3_n_0),
        .O(produce__vsync));
  LUT4 #(
    .INIT(16'hFF7F)) 
    produce__vsync_INST_0_i_1
       (.I0(pix_counter[4]),
        .I1(pix_counter[5]),
        .I2(pix_counter[6]),
        .I3(pix_counter[12]),
        .O(produce__vsync_INST_0_i_1_n_0));
  LUT4 #(
    .INIT(16'h0010)) 
    produce__vsync_INST_0_i_2
       (.I0(pix_counter[9]),
        .I1(pix_counter[7]),
        .I2(pix_counter[10]),
        .I3(pix_counter[14]),
        .O(produce__vsync_INST_0_i_2_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    produce__vsync_INST_0_i_3
       (.I0(pix_counter[3]),
        .I1(pix_counter[0]),
        .I2(pix_counter[1]),
        .I3(pix_counter[2]),
        .O(produce__vsync_INST_0_i_3_n_0));
endmodule

(* ORIG_REF_NAME = "lcd_to_vga.upsample" *) 
module \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample 
   (produce__data,
    consume__ready,
    \$7 ,
    SR,
    E,
    produce__valid,
    \line_counter_reg[1] ,
    rst,
    clk,
    \counter_reg[9] ,
    active,
    produce__valid_0,
    consume__vsync,
    consume__valid,
    produce__ready,
    \counter_reg[0] ,
    consume__data,
    \counter_reg[1] );
  output [11:0]produce__data;
  output consume__ready;
  output \$7 ;
  output [0:0]SR;
  output [0:0]E;
  output produce__valid;
  output \line_counter_reg[1] ;
  input rst;
  input clk;
  input \counter_reg[9] ;
  input active;
  input produce__valid_0;
  input consume__vsync;
  input consume__valid;
  input produce__ready;
  input \counter_reg[0] ;
  input [11:0]consume__data;
  input \counter_reg[1] ;

  wire \$1 ;
  wire \$7 ;
  wire [0:0]E;
  wire [0:0]SR;
  wire active;
  wire clk;
  wire [11:0]consume__data;
  wire consume__ready;
  wire consume__valid;
  wire consume__vsync;
  wire consume__vsync$14;
  wire [1:0]counter;
  wire \counter_reg[0] ;
  wire \counter_reg[1] ;
  wire \counter_reg[9] ;
  wire hor_n_15;
  wire [1:0]line_counter;
  wire \line_counter_reg[1] ;
  wire [11:0]produce__data;
  wire produce__ready;
  wire produce__valid;
  wire produce__valid_0;
  wire rst;
  wire ver_n_1;
  wire ver_n_10;
  wire ver_n_11;
  wire ver_n_12;
  wire ver_n_13;
  wire ver_n_14;
  wire ver_n_15;
  wire ver_n_16;
  wire ver_n_17;
  wire ver_n_18;
  wire ver_n_19;
  wire ver_n_8;
  wire ver_n_9;
  wire write_port__en;

  \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.hor  hor
       (.\$1 (\$1 ),
        .\$7 (\$7 ),
        .active(active),
        .clk(clk),
        .consume__ready(consume__ready),
        .consume__ready_0(\counter_reg[9] ),
        .consume__valid(consume__valid),
        .consume__vsync$14(consume__vsync$14),
        .counter(counter),
        .\counter_reg[0]_0 (ver_n_1),
        .\counter_reg[1]_0 (hor_n_15),
        .\counter_reg[1]_1 (\counter_reg[1] ),
        .\data_reg_reg[0]_0 (ver_n_8),
        .\data_reg_reg[10]_0 (ver_n_18),
        .\data_reg_reg[11]_0 (ver_n_19),
        .\data_reg_reg[1]_0 (ver_n_9),
        .\data_reg_reg[2]_0 (ver_n_10),
        .\data_reg_reg[3]_0 (ver_n_11),
        .\data_reg_reg[4]_0 (ver_n_12),
        .\data_reg_reg[5]_0 (ver_n_13),
        .\data_reg_reg[6]_0 (ver_n_14),
        .\data_reg_reg[7]_0 (ver_n_15),
        .\data_reg_reg[8]_0 (ver_n_16),
        .\data_reg_reg[9]_0 (ver_n_17),
        .line_counter(line_counter),
        .produce__data(produce__data),
        .produce__ready(produce__ready),
        .produce__valid(produce__valid),
        .produce__valid_0(produce__valid_0),
        .rst(rst),
        .write_port__en(write_port__en));
  \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.ver  ver
       (.\$1 (\$1 ),
        .E(E),
        .SR(SR),
        .active(active),
        .\addr_reg[7]_0 (hor_n_15),
        .clk(clk),
        .consume__data(consume__data),
        .consume__valid(consume__valid),
        .consume__vsync(consume__vsync),
        .consume__vsync$14(consume__vsync$14),
        .counter(counter),
        .\counter_reg[0] (\counter_reg[0] ),
        .\counter_reg[9] (\counter_reg[9] ),
        .line_counter(line_counter),
        .\line_counter_reg[1]_0 (ver_n_1),
        .\line_counter_reg[1]_1 (\line_counter_reg[1] ),
        .\line_counter_reg[1]_10 (ver_n_16),
        .\line_counter_reg[1]_11 (ver_n_17),
        .\line_counter_reg[1]_12 (ver_n_18),
        .\line_counter_reg[1]_13 (ver_n_19),
        .\line_counter_reg[1]_2 (ver_n_8),
        .\line_counter_reg[1]_3 (ver_n_9),
        .\line_counter_reg[1]_4 (ver_n_10),
        .\line_counter_reg[1]_5 (ver_n_11),
        .\line_counter_reg[1]_6 (ver_n_12),
        .\line_counter_reg[1]_7 (ver_n_13),
        .\line_counter_reg[1]_8 (ver_n_14),
        .\line_counter_reg[1]_9 (ver_n_15),
        .produce__ready(produce__ready),
        .rst(rst),
        .write_port__en(write_port__en));
endmodule

(* ORIG_REF_NAME = "lcd_to_vga.upsample.hor" *) 
module \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.hor 
   (produce__data,
    counter,
    write_port__en,
    \counter_reg[1]_0 ,
    consume__ready,
    \$7 ,
    produce__valid,
    rst,
    \$1 ,
    consume__vsync$14,
    clk,
    consume__ready_0,
    \data_reg_reg[5]_0 ,
    active,
    \data_reg_reg[6]_0 ,
    produce__valid_0,
    \data_reg_reg[0]_0 ,
    \data_reg_reg[1]_0 ,
    \data_reg_reg[2]_0 ,
    \data_reg_reg[3]_0 ,
    \data_reg_reg[4]_0 ,
    \data_reg_reg[7]_0 ,
    \data_reg_reg[8]_0 ,
    \data_reg_reg[9]_0 ,
    \data_reg_reg[10]_0 ,
    \data_reg_reg[11]_0 ,
    consume__valid,
    produce__ready,
    \counter_reg[0]_0 ,
    line_counter,
    \counter_reg[1]_1 );
  output [11:0]produce__data;
  output [1:0]counter;
  output write_port__en;
  output \counter_reg[1]_0 ;
  output consume__ready;
  output \$7 ;
  output produce__valid;
  input rst;
  input \$1 ;
  input consume__vsync$14;
  input clk;
  input consume__ready_0;
  input \data_reg_reg[5]_0 ;
  input active;
  input \data_reg_reg[6]_0 ;
  input produce__valid_0;
  input \data_reg_reg[0]_0 ;
  input \data_reg_reg[1]_0 ;
  input \data_reg_reg[2]_0 ;
  input \data_reg_reg[3]_0 ;
  input \data_reg_reg[4]_0 ;
  input \data_reg_reg[7]_0 ;
  input \data_reg_reg[8]_0 ;
  input \data_reg_reg[9]_0 ;
  input \data_reg_reg[10]_0 ;
  input \data_reg_reg[11]_0 ;
  input consume__valid;
  input produce__ready;
  input \counter_reg[0]_0 ;
  input [1:0]line_counter;
  input \counter_reg[1]_1 ;

  wire \$1 ;
  wire \$7 ;
  wire active;
  wire clk;
  wire consume__ready;
  wire consume__ready_0;
  wire consume__valid;
  wire consume__vsync$14;
  wire [1:0]counter;
  wire \counter[0]_i_1_n_0 ;
  wire \counter[1]_i_1_n_0 ;
  wire \counter_reg[0]_0 ;
  wire \counter_reg[1]_0 ;
  wire \counter_reg[1]_1 ;
  wire [11:0]data_reg;
  wire \data_reg_reg[0]_0 ;
  wire \data_reg_reg[10]_0 ;
  wire \data_reg_reg[11]_0 ;
  wire \data_reg_reg[1]_0 ;
  wire \data_reg_reg[2]_0 ;
  wire \data_reg_reg[3]_0 ;
  wire \data_reg_reg[4]_0 ;
  wire \data_reg_reg[5]_0 ;
  wire \data_reg_reg[6]_0 ;
  wire \data_reg_reg[7]_0 ;
  wire \data_reg_reg[8]_0 ;
  wire \data_reg_reg[9]_0 ;
  wire [1:0]line_counter;
  wire [11:0]produce__data;
  wire produce__ready;
  wire produce__valid;
  wire produce__valid_0;
  wire rst;
  wire sync_reg;
  wire write_port__en;

  LUT6 #(
    .INIT(64'h0000000002000000)) 
    buffer_reg_0_63_0_2_i_11
       (.I0(consume__valid),
        .I1(\counter_reg[1]_0 ),
        .I2(consume__ready_0),
        .I3(produce__ready),
        .I4(active),
        .I5(\counter_reg[0]_0 ),
        .O(write_port__en));
  LUT6 #(
    .INIT(64'h0000000001000000)) 
    consume__ready_INST_0
       (.I0(counter[0]),
        .I1(counter[1]),
        .I2(consume__ready_0),
        .I3(produce__ready),
        .I4(active),
        .I5(\counter_reg[0]_0 ),
        .O(consume__ready));
  LUT6 #(
    .INIT(64'h00000000F00FF00E)) 
    \counter[0]_i_1 
       (.I0(consume__valid),
        .I1(\counter_reg[0]_0 ),
        .I2(\counter_reg[1]_1 ),
        .I3(counter[0]),
        .I4(counter[1]),
        .I5(rst),
        .O(\counter[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00B4)) 
    \counter[1]_i_1 
       (.I0(\counter_reg[1]_1 ),
        .I1(counter[0]),
        .I2(counter[1]),
        .I3(rst),
        .O(\counter[1]_i_1_n_0 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:25" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter[0]_i_1_n_0 ),
        .Q(counter[0]),
        .R(1'b0));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:25" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter[1]_i_1_n_0 ),
        .Q(counter[1]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \data_reg[11]_i_2 
       (.I0(counter[1]),
        .I1(counter[0]),
        .O(\counter_reg[1]_0 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[0] 
       (.C(clk),
        .CE(\$1 ),
        .D(\data_reg_reg[0]_0 ),
        .Q(data_reg[0]),
        .R(rst));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[10] 
       (.C(clk),
        .CE(\$1 ),
        .D(\data_reg_reg[10]_0 ),
        .Q(data_reg[10]),
        .R(rst));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[11] 
       (.C(clk),
        .CE(\$1 ),
        .D(\data_reg_reg[11]_0 ),
        .Q(data_reg[11]),
        .R(rst));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[1] 
       (.C(clk),
        .CE(\$1 ),
        .D(\data_reg_reg[1]_0 ),
        .Q(data_reg[1]),
        .R(rst));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[2] 
       (.C(clk),
        .CE(\$1 ),
        .D(\data_reg_reg[2]_0 ),
        .Q(data_reg[2]),
        .R(rst));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[3] 
       (.C(clk),
        .CE(\$1 ),
        .D(\data_reg_reg[3]_0 ),
        .Q(data_reg[3]),
        .R(rst));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[4] 
       (.C(clk),
        .CE(\$1 ),
        .D(\data_reg_reg[4]_0 ),
        .Q(data_reg[4]),
        .R(rst));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[5] 
       (.C(clk),
        .CE(\$1 ),
        .D(\data_reg_reg[5]_0 ),
        .Q(data_reg[5]),
        .R(rst));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[6] 
       (.C(clk),
        .CE(\$1 ),
        .D(\data_reg_reg[6]_0 ),
        .Q(data_reg[6]),
        .R(rst));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[7] 
       (.C(clk),
        .CE(\$1 ),
        .D(\data_reg_reg[7]_0 ),
        .Q(data_reg[7]),
        .R(rst));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[8] 
       (.C(clk),
        .CE(\$1 ),
        .D(\data_reg_reg[8]_0 ),
        .Q(data_reg[8]),
        .R(rst));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:23" *) 
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[9] 
       (.C(clk),
        .CE(\$1 ),
        .D(\data_reg_reg[9]_0 ),
        .Q(data_reg[9]),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hAAA80008)) 
    \produce__data[0]_INST_0 
       (.I0(produce__valid_0),
        .I1(\data_reg_reg[0]_0 ),
        .I2(counter[0]),
        .I3(counter[1]),
        .I4(data_reg[0]),
        .O(produce__data[0]));
  LUT5 #(
    .INIT(32'hFE02FFFF)) 
    \produce__data[10]_INST_0 
       (.I0(\data_reg_reg[10]_0 ),
        .I1(counter[0]),
        .I2(counter[1]),
        .I3(data_reg[10]),
        .I4(produce__valid_0),
        .O(produce__data[10]));
  LUT5 #(
    .INIT(32'hAAA80008)) 
    \produce__data[11]_INST_0 
       (.I0(produce__valid_0),
        .I1(\data_reg_reg[11]_0 ),
        .I2(counter[0]),
        .I3(counter[1]),
        .I4(data_reg[11]),
        .O(produce__data[11]));
  LUT5 #(
    .INIT(32'hAAA80008)) 
    \produce__data[1]_INST_0 
       (.I0(produce__valid_0),
        .I1(\data_reg_reg[1]_0 ),
        .I2(counter[0]),
        .I3(counter[1]),
        .I4(data_reg[1]),
        .O(produce__data[1]));
  LUT5 #(
    .INIT(32'hAAA80008)) 
    \produce__data[2]_INST_0 
       (.I0(produce__valid_0),
        .I1(\data_reg_reg[2]_0 ),
        .I2(counter[0]),
        .I3(counter[1]),
        .I4(data_reg[2]),
        .O(produce__data[2]));
  LUT5 #(
    .INIT(32'hAAA80008)) 
    \produce__data[3]_INST_0 
       (.I0(produce__valid_0),
        .I1(\data_reg_reg[3]_0 ),
        .I2(counter[0]),
        .I3(counter[1]),
        .I4(data_reg[3]),
        .O(produce__data[3]));
  LUT5 #(
    .INIT(32'hAAA80008)) 
    \produce__data[4]_INST_0 
       (.I0(produce__valid_0),
        .I1(\data_reg_reg[4]_0 ),
        .I2(counter[0]),
        .I3(counter[1]),
        .I4(data_reg[4]),
        .O(produce__data[4]));
  LUT6 #(
    .INIT(64'h50505044FFFFFFFF)) 
    \produce__data[5]_INST_0 
       (.I0(consume__ready_0),
        .I1(\data_reg_reg[5]_0 ),
        .I2(data_reg[5]),
        .I3(counter[1]),
        .I4(counter[0]),
        .I5(active),
        .O(produce__data[5]));
  LUT6 #(
    .INIT(64'h50505044FFFFFFFF)) 
    \produce__data[6]_INST_0 
       (.I0(consume__ready_0),
        .I1(\data_reg_reg[6]_0 ),
        .I2(data_reg[6]),
        .I3(counter[1]),
        .I4(counter[0]),
        .I5(active),
        .O(produce__data[6]));
  LUT5 #(
    .INIT(32'hAAA80008)) 
    \produce__data[7]_INST_0 
       (.I0(produce__valid_0),
        .I1(\data_reg_reg[7]_0 ),
        .I2(counter[0]),
        .I3(counter[1]),
        .I4(data_reg[7]),
        .O(produce__data[7]));
  LUT5 #(
    .INIT(32'hAAA80008)) 
    \produce__data[8]_INST_0 
       (.I0(produce__valid_0),
        .I1(\data_reg_reg[8]_0 ),
        .I2(counter[0]),
        .I3(counter[1]),
        .I4(data_reg[8]),
        .O(produce__data[8]));
  LUT5 #(
    .INIT(32'hFE02FFFF)) 
    \produce__data[9]_INST_0 
       (.I0(\data_reg_reg[9]_0 ),
        .I1(counter[0]),
        .I2(counter[1]),
        .I3(data_reg[9]),
        .I4(produce__valid_0),
        .O(produce__data[9]));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFFFFFF)) 
    produce__valid_INST_0
       (.I0(counter[1]),
        .I1(counter[0]),
        .I2(consume__valid),
        .I3(line_counter[0]),
        .I4(line_counter[1]),
        .I5(produce__valid_0),
        .O(produce__valid));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    sync_reg_i_2
       (.I0(sync_reg),
        .I1(counter[1]),
        .I2(counter[0]),
        .I3(active),
        .I4(produce__ready),
        .I5(consume__ready_0),
        .O(\$7 ));
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
    \line_counter_reg[1]_0 ,
    SR,
    E,
    \line_counter_reg[1]_1 ,
    line_counter,
    consume__vsync$14,
    \line_counter_reg[1]_2 ,
    \line_counter_reg[1]_3 ,
    \line_counter_reg[1]_4 ,
    \line_counter_reg[1]_5 ,
    \line_counter_reg[1]_6 ,
    \line_counter_reg[1]_7 ,
    \line_counter_reg[1]_8 ,
    \line_counter_reg[1]_9 ,
    \line_counter_reg[1]_10 ,
    \line_counter_reg[1]_11 ,
    \line_counter_reg[1]_12 ,
    \line_counter_reg[1]_13 ,
    clk,
    consume__vsync,
    write_port__en,
    rst,
    consume__valid,
    active,
    produce__ready,
    \counter_reg[9] ,
    \addr_reg[7]_0 ,
    \counter_reg[0] ,
    counter,
    consume__data);
  output \$1 ;
  output \line_counter_reg[1]_0 ;
  output [0:0]SR;
  output [0:0]E;
  output \line_counter_reg[1]_1 ;
  output [1:0]line_counter;
  output consume__vsync$14;
  output \line_counter_reg[1]_2 ;
  output \line_counter_reg[1]_3 ;
  output \line_counter_reg[1]_4 ;
  output \line_counter_reg[1]_5 ;
  output \line_counter_reg[1]_6 ;
  output \line_counter_reg[1]_7 ;
  output \line_counter_reg[1]_8 ;
  output \line_counter_reg[1]_9 ;
  output \line_counter_reg[1]_10 ;
  output \line_counter_reg[1]_11 ;
  output \line_counter_reg[1]_12 ;
  output \line_counter_reg[1]_13 ;
  input clk;
  input consume__vsync;
  input write_port__en;
  input rst;
  input consume__valid;
  input active;
  input produce__ready;
  input \counter_reg[9] ;
  input \addr_reg[7]_0 ;
  input \counter_reg[0] ;
  input [1:0]counter;
  input [11:0]consume__data;

  wire \$1 ;
  wire \$10 ;
  wire [7:0]\$8 ;
  wire [0:0]E;
  wire [0:0]SR;
  wire active;
  wire [7:6]addr;
  wire \addr[0]_i_3_n_0 ;
  wire \addr[4]_i_1_n_0 ;
  wire \addr[6]_i_2_n_0 ;
  wire [5:0]addr_reg;
  wire \addr_reg[7]_0 ;
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
  wire consume__valid;
  wire consume__vsync;
  wire consume__vsync$14;
  wire [1:0]counter;
  wire \counter_reg[0] ;
  wire \counter_reg[9] ;
  wire [1:0]line_counter;
  wire \line_counter[0]_i_1_n_0 ;
  wire \line_counter[1]_i_1_n_0 ;
  wire \line_counter[1]_i_2_n_0 ;
  wire \line_counter_reg[1]_0 ;
  wire \line_counter_reg[1]_1 ;
  wire \line_counter_reg[1]_10 ;
  wire \line_counter_reg[1]_11 ;
  wire \line_counter_reg[1]_12 ;
  wire \line_counter_reg[1]_13 ;
  wire \line_counter_reg[1]_2 ;
  wire \line_counter_reg[1]_3 ;
  wire \line_counter_reg[1]_4 ;
  wire \line_counter_reg[1]_5 ;
  wire \line_counter_reg[1]_6 ;
  wire \line_counter_reg[1]_7 ;
  wire \line_counter_reg[1]_8 ;
  wire \line_counter_reg[1]_9 ;
  wire produce__ready;
  wire [11:0]read_port__data;
  wire rst;
  wire sync_flag;
  wire sync_flag_i_1_n_0;
  wire sync_reg_i_2__0_n_0;
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
  wire NLW_buffer_reg_64_127_0_2_DOD_UNCONNECTED;
  wire NLW_buffer_reg_64_127_3_5_DOD_UNCONNECTED;
  wire NLW_buffer_reg_64_127_6_8_DOD_UNCONNECTED;
  wire NLW_buffer_reg_64_127_9_11_DOD_UNCONNECTED;

  LUT6 #(
    .INIT(64'hAAAAABAAAAAAAAAA)) 
    \addr[0]_i_1 
       (.I0(rst),
        .I1(\addr[0]_i_3_n_0 ),
        .I2(addr_reg[5]),
        .I3(addr[7]),
        .I4(addr[6]),
        .I5(\$1 ),
        .O(\$10 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \addr[0]_i_2 
       (.I0(addr_reg[0]),
        .O(\$8 [0]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \addr[0]_i_3 
       (.I0(addr_reg[3]),
        .I1(addr_reg[0]),
        .I2(addr_reg[1]),
        .I3(addr_reg[2]),
        .I4(addr_reg[4]),
        .O(\addr[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \addr[1]_i_1 
       (.I0(addr_reg[1]),
        .I1(addr_reg[0]),
        .O(\$8 [1]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \addr[2]_i_1 
       (.I0(addr_reg[2]),
        .I1(addr_reg[1]),
        .I2(addr_reg[0]),
        .O(\$8 [2]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \addr[3]_i_1 
       (.I0(addr_reg[3]),
        .I1(addr_reg[0]),
        .I2(addr_reg[1]),
        .I3(addr_reg[2]),
        .O(\$8 [3]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \addr[4]_i_1 
       (.I0(addr_reg[4]),
        .I1(addr_reg[3]),
        .I2(addr_reg[0]),
        .I3(addr_reg[1]),
        .I4(addr_reg[2]),
        .O(\addr[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \addr[5]_i_1 
       (.I0(addr_reg[3]),
        .I1(addr_reg[0]),
        .I2(addr_reg[1]),
        .I3(addr_reg[2]),
        .I4(addr_reg[4]),
        .I5(addr_reg[5]),
        .O(\$8 [5]));
  LUT2 #(
    .INIT(4'h6)) 
    \addr[6]_i_1 
       (.I0(addr[6]),
        .I1(\addr[6]_i_2_n_0 ),
        .O(\$8 [6]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \addr[6]_i_2 
       (.I0(addr_reg[5]),
        .I1(addr_reg[4]),
        .I2(addr_reg[2]),
        .I3(addr_reg[1]),
        .I4(addr_reg[0]),
        .I5(addr_reg[3]),
        .O(\addr[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \addr[7]_i_1 
       (.I0(addr[7]),
        .I1(\addr[6]_i_2_n_0 ),
        .I2(addr[6]),
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
        .D(\addr[4]_i_1_n_0 ),
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
  (* RTL_RAM_BITS = "1920" *) 
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
  LUT5 #(
    .INIT(32'hAAA0AAA2)) 
    buffer_reg_0_63_0_2_i_4
       (.I0(write_port__en),
        .I1(addr[6]),
        .I2(line_counter[0]),
        .I3(line_counter[1]),
        .I4(addr[7]),
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
  (* RTL_RAM_BITS = "1920" *) 
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
  (* RTL_RAM_BITS = "1920" *) 
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
  (* RTL_RAM_BITS = "1920" *) 
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
  (* RTL_RAM_BITS = "1920" *) 
  (* RTL_RAM_NAME = "inst/upsample/ver/buffer_reg_128_191_0_2" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "159" *) 
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
  LUT5 #(
    .INIT(32'h00040000)) 
    buffer_reg_128_191_0_2_i_1
       (.I0(addr[6]),
        .I1(addr[7]),
        .I2(line_counter[0]),
        .I3(line_counter[1]),
        .I4(write_port__en),
        .O(buffer_reg_128_191_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1920" *) 
  (* RTL_RAM_NAME = "inst/upsample/ver/buffer_reg_128_191_3_5" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "159" *) 
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
  (* RTL_RAM_BITS = "1920" *) 
  (* RTL_RAM_NAME = "inst/upsample/ver/buffer_reg_128_191_6_8" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "159" *) 
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
  (* RTL_RAM_BITS = "1920" *) 
  (* RTL_RAM_NAME = "inst/upsample/ver/buffer_reg_128_191_9_11" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "159" *) 
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
  (* RTL_RAM_BITS = "1920" *) 
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
  LUT5 #(
    .INIT(32'h00040000)) 
    buffer_reg_64_127_0_2_i_1
       (.I0(addr[7]),
        .I1(addr[6]),
        .I2(line_counter[0]),
        .I3(line_counter[1]),
        .I4(write_port__en),
        .O(buffer_reg_64_127_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1920" *) 
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
  (* RTL_RAM_BITS = "1920" *) 
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
  (* RTL_RAM_BITS = "1920" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'hE)) 
    consume__ready_INST_0_i_2
       (.I0(line_counter[1]),
        .I1(line_counter[0]),
        .O(\line_counter_reg[1]_0 ));
  LUT3 #(
    .INIT(8'hAE)) 
    \counter[9]_i_1 
       (.I0(rst),
        .I1(E),
        .I2(\counter_reg[0] ),
        .O(SR));
  LUT6 #(
    .INIT(64'hFFFE000000000000)) 
    \counter[9]_i_2 
       (.I0(\line_counter_reg[1]_0 ),
        .I1(consume__valid),
        .I2(\addr_reg[7]_0 ),
        .I3(\counter_reg[9] ),
        .I4(active),
        .I5(produce__ready),
        .O(E));
  LUT6 #(
    .INIT(64'h000000000000E000)) 
    \data_reg[11]_i_1 
       (.I0(\line_counter_reg[1]_0 ),
        .I1(consume__valid),
        .I2(active),
        .I3(produce__ready),
        .I4(\counter_reg[9] ),
        .I5(\addr_reg[7]_0 ),
        .O(\$1 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h00C6)) 
    \line_counter[0]_i_1 
       (.I0(\$1 ),
        .I1(line_counter[0]),
        .I2(\line_counter[1]_i_2_n_0 ),
        .I3(rst),
        .O(\line_counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h0000CC6C)) 
    \line_counter[1]_i_1 
       (.I0(\$1 ),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(\line_counter[1]_i_2_n_0 ),
        .I4(rst),
        .O(\line_counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hFFEF)) 
    \line_counter[1]_i_2 
       (.I0(\addr[0]_i_3_n_0 ),
        .I1(addr_reg[5]),
        .I2(addr[7]),
        .I3(addr[6]),
        .O(\line_counter[1]_i_2_n_0 ));
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
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \pix_counter[14]_i_6 
       (.I0(line_counter[1]),
        .I1(line_counter[0]),
        .I2(consume__valid),
        .I3(counter[0]),
        .I4(counter[1]),
        .O(\line_counter_reg[1]_1 ));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[0]_INST_0_i_1 
       (.I0(read_port__data[0]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[0]),
        .O(\line_counter_reg[1]_2 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \produce__data[0]_INST_0_i_2 
       (.I0(buffer_reg_128_191_0_2_n_0),
        .I1(addr[7]),
        .I2(buffer_reg_64_127_0_2_n_0),
        .I3(addr[6]),
        .I4(buffer_reg_0_63_0_2_n_0),
        .O(read_port__data[0]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[10]_INST_0_i_1 
       (.I0(read_port__data[10]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[10]),
        .O(\line_counter_reg[1]_12 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \produce__data[10]_INST_0_i_2 
       (.I0(buffer_reg_128_191_9_11_n_1),
        .I1(addr[7]),
        .I2(buffer_reg_64_127_9_11_n_1),
        .I3(addr[6]),
        .I4(buffer_reg_0_63_9_11_n_1),
        .O(read_port__data[10]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[11]_INST_0_i_2 
       (.I0(read_port__data[11]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[11]),
        .O(\line_counter_reg[1]_13 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \produce__data[11]_INST_0_i_3 
       (.I0(buffer_reg_128_191_9_11_n_2),
        .I1(addr[7]),
        .I2(buffer_reg_64_127_9_11_n_2),
        .I3(addr[6]),
        .I4(buffer_reg_0_63_9_11_n_2),
        .O(read_port__data[11]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[1]_INST_0_i_1 
       (.I0(read_port__data[1]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[1]),
        .O(\line_counter_reg[1]_3 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \produce__data[1]_INST_0_i_2 
       (.I0(buffer_reg_128_191_0_2_n_1),
        .I1(addr[7]),
        .I2(buffer_reg_64_127_0_2_n_1),
        .I3(addr[6]),
        .I4(buffer_reg_0_63_0_2_n_1),
        .O(read_port__data[1]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[2]_INST_0_i_1 
       (.I0(read_port__data[2]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[2]),
        .O(\line_counter_reg[1]_4 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \produce__data[2]_INST_0_i_2 
       (.I0(buffer_reg_128_191_0_2_n_2),
        .I1(addr[7]),
        .I2(buffer_reg_64_127_0_2_n_2),
        .I3(addr[6]),
        .I4(buffer_reg_0_63_0_2_n_2),
        .O(read_port__data[2]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[3]_INST_0_i_1 
       (.I0(read_port__data[3]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[3]),
        .O(\line_counter_reg[1]_5 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \produce__data[3]_INST_0_i_2 
       (.I0(buffer_reg_128_191_3_5_n_0),
        .I1(addr[7]),
        .I2(buffer_reg_64_127_3_5_n_0),
        .I3(addr[6]),
        .I4(buffer_reg_0_63_3_5_n_0),
        .O(read_port__data[3]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[4]_INST_0_i_1 
       (.I0(read_port__data[4]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[4]),
        .O(\line_counter_reg[1]_6 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \produce__data[4]_INST_0_i_2 
       (.I0(buffer_reg_128_191_3_5_n_1),
        .I1(addr[7]),
        .I2(buffer_reg_64_127_3_5_n_1),
        .I3(addr[6]),
        .I4(buffer_reg_0_63_3_5_n_1),
        .O(read_port__data[4]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[5]_INST_0_i_1 
       (.I0(read_port__data[5]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[5]),
        .O(\line_counter_reg[1]_7 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \produce__data[5]_INST_0_i_2 
       (.I0(buffer_reg_128_191_3_5_n_2),
        .I1(addr[7]),
        .I2(buffer_reg_64_127_3_5_n_2),
        .I3(addr[6]),
        .I4(buffer_reg_0_63_3_5_n_2),
        .O(read_port__data[5]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[6]_INST_0_i_1 
       (.I0(read_port__data[6]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[6]),
        .O(\line_counter_reg[1]_8 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \produce__data[6]_INST_0_i_2 
       (.I0(buffer_reg_128_191_6_8_n_0),
        .I1(addr[7]),
        .I2(buffer_reg_64_127_6_8_n_0),
        .I3(addr[6]),
        .I4(buffer_reg_0_63_6_8_n_0),
        .O(read_port__data[6]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[7]_INST_0_i_1 
       (.I0(read_port__data[7]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[7]),
        .O(\line_counter_reg[1]_9 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \produce__data[7]_INST_0_i_2 
       (.I0(buffer_reg_128_191_6_8_n_1),
        .I1(addr[7]),
        .I2(buffer_reg_64_127_6_8_n_1),
        .I3(addr[6]),
        .I4(buffer_reg_0_63_6_8_n_1),
        .O(read_port__data[7]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[8]_INST_0_i_1 
       (.I0(read_port__data[8]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[8]),
        .O(\line_counter_reg[1]_10 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \produce__data[8]_INST_0_i_2 
       (.I0(buffer_reg_128_191_6_8_n_2),
        .I1(addr[7]),
        .I2(buffer_reg_64_127_6_8_n_2),
        .I3(addr[6]),
        .I4(buffer_reg_0_63_6_8_n_2),
        .O(read_port__data[8]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \produce__data[9]_INST_0_i_1 
       (.I0(read_port__data[9]),
        .I1(line_counter[1]),
        .I2(line_counter[0]),
        .I3(consume__data[9]),
        .O(\line_counter_reg[1]_11 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \produce__data[9]_INST_0_i_2 
       (.I0(buffer_reg_128_191_9_11_n_0),
        .I1(addr[7]),
        .I2(buffer_reg_64_127_9_11_n_0),
        .I3(addr[6]),
        .I4(buffer_reg_0_63_9_11_n_0),
        .O(read_port__data[9]));
  LUT6 #(
    .INIT(64'h00000000BBBBF000)) 
    sync_flag_i_1
       (.I0(sync_reg_i_2__0_n_0),
        .I1(\$1 ),
        .I2(consume__vsync),
        .I3(write_port__en),
        .I4(sync_flag),
        .I5(rst),
        .O(sync_flag_i_1_n_0));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\lcd_to_vga.py:69" *) 
  FDRE #(
    .INIT(1'b0)) 
    sync_flag_reg
       (.C(clk),
        .CE(1'b1),
        .D(sync_flag_i_1_n_0),
        .Q(sync_flag),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    sync_reg_i_1
       (.I0(sync_flag),
        .I1(sync_reg_i_2__0_n_0),
        .O(consume__vsync$14));
  LUT6 #(
    .INIT(64'hFFFBFFFFFFFFFFFF)) 
    sync_reg_i_2__0
       (.I0(addr[6]),
        .I1(addr[7]),
        .I2(addr_reg[5]),
        .I3(\addr[0]_i_3_n_0 ),
        .I4(line_counter[0]),
        .I5(line_counter[1]),
        .O(sync_reg_i_2__0_n_0));
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
