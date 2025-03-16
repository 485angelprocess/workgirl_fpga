// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Sun Mar  9 12:27:49 2025
// Host        : MSI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/magen/Documents/Programs/gameboy/gameboy.gen/sources_1/bd/display_driver/ip/display_driver_vga_verify_0_0/display_driver_vga_verify_0_0_sim_netlist.v
// Design      : display_driver_vga_verify_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "display_driver_vga_verify_0_0,vga_verify,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "vga_verify,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module display_driver_vga_verify_0_0
   (clk,
    rst,
    produce__data,
    produce__valid,
    produce__vsync,
    produce__ready);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 120000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) (* src = "C:\\Users\\magen\\AppData\\Local\\Packages\\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\\LocalCache\\local-packages\\Python311\\site-packages\\amaranth\\hdl\\_ir.py:283" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) (* src = "C:\\Users\\magen\\AppData\\Local\\Packages\\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\\LocalCache\\local-packages\\Python311\\site-packages\\amaranth\\hdl\\_ir.py:283" *) input rst;
  output [11:0]produce__data;
  output produce__valid;
  output produce__vsync;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\signature.py:19" *) input produce__ready;

  wire clk;
  wire [8:0]\^produce__data ;
  wire produce__ready;
  wire produce__valid;
  wire produce__vsync;
  wire rst;

  assign produce__data[11] = \^produce__data [8];
  assign produce__data[10] = \^produce__data [8];
  assign produce__data[9] = \^produce__data [8];
  assign produce__data[8] = \^produce__data [8];
  assign produce__data[7] = \^produce__data [4];
  assign produce__data[6] = \^produce__data [4];
  assign produce__data[5] = \^produce__data [4];
  assign produce__data[4] = \^produce__data [4];
  assign produce__data[3] = \^produce__data [0];
  assign produce__data[2] = \^produce__data [0];
  assign produce__data[1] = \^produce__data [0];
  assign produce__data[0] = \^produce__data [0];
  display_driver_vga_verify_0_0_vga_verify inst
       (.clk(clk),
        .produce__data({\^produce__data [8],\^produce__data [4],\^produce__data [0]}),
        .produce__ready(produce__ready),
        .produce__valid_reg_0(produce__valid),
        .produce__vsync(produce__vsync),
        .rst(rst));
endmodule

(* ORIG_REF_NAME = "vga_verify" *) 
module display_driver_vga_verify_0_0_vga_verify
   (produce__data,
    produce__valid_reg_0,
    produce__vsync,
    clk,
    produce__ready,
    rst);
  output [2:0]produce__data;
  output produce__valid_reg_0;
  output produce__vsync;
  input clk;
  input produce__ready;
  input rst;

  wire \$11 ;
  wire [8:0]\$5 ;
  wire \$6 ;
  wire [8:0]\$7 ;
  wire \$9 ;
  wire clk;
  wire fsm_state;
  wire fsm_state_i_1_n_0;
  wire \pix_counter[8]_i_4_n_0 ;
  wire [8:0]pix_counter_reg;
  wire [2:0]produce__data;
  wire produce__ready;
  wire produce__valid_i_1_n_0;
  wire produce__valid_reg_0;
  wire produce__vsync;
  wire produce__vsync_INST_0_i_1_n_0;
  wire [8:0]read_port__addr;
  wire \read_port__addr_rep[5]_i_3_n_0 ;
  wire \read_port__addr_rep[5]_i_4_n_0 ;
  wire read_port__en;
  wire rst;
  wire [15:3]NLW__0__reg_DOADO_UNCONNECTED;
  wire [15:0]NLW__0__reg_DOBDO_UNCONNECTED;
  wire [1:0]NLW__0__reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW__0__reg_DOPBDOP_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d3" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "1536" *) 
  (* RTL_RAM_NAME = "inst/_0__reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0001000100010001000100010001000100010001000100010001000100010001),
    .INIT_01(256'h0001000100010001000100010001000100010001000100010001000100010001),
    .INIT_02(256'h0004000400040004000400040004000400010001000100010001000100010001),
    .INIT_03(256'h0004000400040004000400040004000400040004000400040004000400040004),
    .INIT_04(256'h0004000400040004000400040004000400040004000400040004000400040004),
    .INIT_05(256'h0004000400040004000400040004000400040004000400040004000400040004),
    .INIT_06(256'h0002000200020002000200020002000200020002000200020004000400040004),
    .INIT_07(256'h0002000200020002000200020002000200020002000200020002000200020002),
    .INIT_08(256'h0002000200020002000200020002000200020002000200020002000200020002),
    .INIT_09(256'h0002000200020002000200020002000200020002000200020002000200020002),
    .INIT_0A(256'h0002000200020002000200020002000200020002000200020002000200020002),
    .INIT_0B(256'h0002000200020002000200020002000200020002000200020002000200020002),
    .INIT_0C(256'h0001000100010001000100010001000100020002000200020002000200020002),
    .INIT_0D(256'h0001000100010001000100010001000100010001000100010001000100010001),
    .INIT_0E(256'h0001000100010001000100010001000100010001000100010001000100010001),
    .INIT_0F(256'h0004000400040004000400040004000400040004000400040004000400040004),
    .INIT_10(256'h0004000400040004000400040004000400040004000400040004000400040004),
    .INIT_11(256'h0004000400040004000400040004000400040004000400040004000400040004),
    .INIT_12(256'h0002000200020002000400040004000400040004000400040004000400040004),
    .INIT_13(256'h0002000200020002000200020002000200020002000200020002000200020002),
    .INIT_14(256'h0002000200020002000200020002000200020002000200020002000200020002),
    .INIT_15(256'h0002000200020002000200020002000200020002000200020002000200020002),
    .INIT_16(256'h0002000200020002000200020002000200020002000200020002000200020002),
    .INIT_17(256'h0002000200020002000200020002000200020002000200020002000200020002),
    .INIT_18(256'h0002000200020002000200020002000200020002000200020002000200020002),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(0)) 
    _0__reg
       (.ADDRARDADDR({1'b0,read_port__addr,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(clk),
        .CLKBWRCLK(1'b0),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1}),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b1,1'b1}),
        .DOADO({NLW__0__reg_DOADO_UNCONNECTED[15:3],produce__data}),
        .DOBDO(NLW__0__reg_DOBDO_UNCONNECTED[15:0]),
        .DOPADOP(NLW__0__reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW__0__reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(read_port__en),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT3 #(
    .INIT(8'h8F)) 
    _0__reg_i_1
       (.I0(produce__ready),
        .I1(produce__valid_reg_0),
        .I2(fsm_state),
        .O(read_port__en));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT1 #(
    .INIT(2'h1)) 
    fsm_state_i_1
       (.I0(rst),
        .O(fsm_state_i_1_n_0));
  (* src = "C:\\Program Files\\WindowsApps\\PythonSoftwareFoundation.Python.3.11_3.11.2544.0_x64__qbz5n2kfra8p0\\Lib\\contextlib.py:144" *) 
  FDRE #(
    .INIT(1'b0)) 
    fsm_state_reg
       (.C(clk),
        .CE(1'b1),
        .D(fsm_state_i_1_n_0),
        .Q(fsm_state),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \pix_counter[0]_i_1 
       (.I0(pix_counter_reg[0]),
        .O(\$7 [0]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \pix_counter[1]_i_1 
       (.I0(pix_counter_reg[0]),
        .I1(pix_counter_reg[1]),
        .O(\$7 [1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \pix_counter[2]_i_1 
       (.I0(pix_counter_reg[1]),
        .I1(pix_counter_reg[0]),
        .I2(pix_counter_reg[2]),
        .O(\$7 [2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \pix_counter[3]_i_1 
       (.I0(pix_counter_reg[2]),
        .I1(pix_counter_reg[0]),
        .I2(pix_counter_reg[1]),
        .I3(pix_counter_reg[3]),
        .O(\$7 [3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \pix_counter[4]_i_1 
       (.I0(pix_counter_reg[3]),
        .I1(pix_counter_reg[1]),
        .I2(pix_counter_reg[0]),
        .I3(pix_counter_reg[2]),
        .I4(pix_counter_reg[4]),
        .O(\$7 [4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \pix_counter[5]_i_1 
       (.I0(pix_counter_reg[4]),
        .I1(pix_counter_reg[2]),
        .I2(pix_counter_reg[0]),
        .I3(pix_counter_reg[1]),
        .I4(pix_counter_reg[3]),
        .I5(pix_counter_reg[5]),
        .O(\$7 [5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hDF20)) 
    \pix_counter[6]_i_1 
       (.I0(pix_counter_reg[5]),
        .I1(produce__vsync_INST_0_i_1_n_0),
        .I2(pix_counter_reg[4]),
        .I3(pix_counter_reg[6]),
        .O(\$7 [6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hF7FF0800)) 
    \pix_counter[7]_i_1 
       (.I0(pix_counter_reg[6]),
        .I1(pix_counter_reg[4]),
        .I2(produce__vsync_INST_0_i_1_n_0),
        .I3(pix_counter_reg[5]),
        .I4(pix_counter_reg[7]),
        .O(\$7 [7]));
  LUT5 #(
    .INIT(32'hFFFF0002)) 
    \pix_counter[8]_i_1 
       (.I0(\pix_counter[8]_i_4_n_0 ),
        .I1(pix_counter_reg[5]),
        .I2(pix_counter_reg[4]),
        .I3(produce__vsync_INST_0_i_1_n_0),
        .I4(rst),
        .O(\$11 ));
  LUT3 #(
    .INIT(8'h80)) 
    \pix_counter[8]_i_2 
       (.I0(produce__ready),
        .I1(produce__valid_reg_0),
        .I2(fsm_state),
        .O(\$6 ));
  LUT6 #(
    .INIT(64'hF7FFFFFF08000000)) 
    \pix_counter[8]_i_3 
       (.I0(pix_counter_reg[7]),
        .I1(pix_counter_reg[5]),
        .I2(produce__vsync_INST_0_i_1_n_0),
        .I3(pix_counter_reg[4]),
        .I4(pix_counter_reg[6]),
        .I5(pix_counter_reg[8]),
        .O(\$7 [8]));
  LUT6 #(
    .INIT(64'h0080000000000000)) 
    \pix_counter[8]_i_4 
       (.I0(pix_counter_reg[8]),
        .I1(fsm_state),
        .I2(pix_counter_reg[7]),
        .I3(pix_counter_reg[6]),
        .I4(produce__ready),
        .I5(produce__valid_reg_0),
        .O(\pix_counter[8]_i_4_n_0 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\verify.py:32" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[0] 
       (.C(clk),
        .CE(\$6 ),
        .D(\$7 [0]),
        .Q(pix_counter_reg[0]),
        .R(\$11 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\verify.py:32" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[1] 
       (.C(clk),
        .CE(\$6 ),
        .D(\$7 [1]),
        .Q(pix_counter_reg[1]),
        .R(\$11 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\verify.py:32" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[2] 
       (.C(clk),
        .CE(\$6 ),
        .D(\$7 [2]),
        .Q(pix_counter_reg[2]),
        .R(\$11 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\verify.py:32" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[3] 
       (.C(clk),
        .CE(\$6 ),
        .D(\$7 [3]),
        .Q(pix_counter_reg[3]),
        .R(\$11 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\verify.py:32" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[4] 
       (.C(clk),
        .CE(\$6 ),
        .D(\$7 [4]),
        .Q(pix_counter_reg[4]),
        .R(\$11 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\verify.py:32" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[5] 
       (.C(clk),
        .CE(\$6 ),
        .D(\$7 [5]),
        .Q(pix_counter_reg[5]),
        .R(\$11 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\verify.py:32" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[6] 
       (.C(clk),
        .CE(\$6 ),
        .D(\$7 [6]),
        .Q(pix_counter_reg[6]),
        .R(\$11 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\verify.py:32" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[7] 
       (.C(clk),
        .CE(\$6 ),
        .D(\$7 [7]),
        .Q(pix_counter_reg[7]),
        .R(\$11 ));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\verify.py:32" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pix_counter_reg[8] 
       (.C(clk),
        .CE(\$6 ),
        .D(\$7 [8]),
        .Q(pix_counter_reg[8]),
        .R(\$11 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h0B)) 
    produce__valid_i_1
       (.I0(produce__valid_reg_0),
        .I1(fsm_state),
        .I2(rst),
        .O(produce__valid_i_1_n_0));
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\signature.py:18" *) 
  FDRE #(
    .INIT(1'b0)) 
    produce__valid_reg
       (.C(clk),
        .CE(1'b1),
        .D(produce__valid_i_1_n_0),
        .Q(produce__valid_reg_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    produce__vsync_INST_0
       (.I0(pix_counter_reg[7]),
        .I1(pix_counter_reg[8]),
        .I2(pix_counter_reg[6]),
        .I3(pix_counter_reg[5]),
        .I4(pix_counter_reg[4]),
        .I5(produce__vsync_INST_0_i_1_n_0),
        .O(produce__vsync));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    produce__vsync_INST_0_i_1
       (.I0(pix_counter_reg[2]),
        .I1(pix_counter_reg[0]),
        .I2(pix_counter_reg[1]),
        .I3(pix_counter_reg[3]),
        .O(produce__vsync_INST_0_i_1_n_0));
  (* src = "C:\\Users\\magen\\AppData\\Local\\Packages\\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\\LocalCache\\local-packages\\Python311\\site-packages\\amaranth\\lib\\memory.py:240" *) 
  FDRE #(
    .INIT(1'b0)) 
    \read_port__addr_reg_rep[0] 
       (.C(clk),
        .CE(read_port__en),
        .D(\$5 [0]),
        .Q(read_port__addr[0]),
        .R(\$9 ));
  (* src = "C:\\Users\\magen\\AppData\\Local\\Packages\\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\\LocalCache\\local-packages\\Python311\\site-packages\\amaranth\\lib\\memory.py:240" *) 
  FDRE #(
    .INIT(1'b0)) 
    \read_port__addr_reg_rep[1] 
       (.C(clk),
        .CE(read_port__en),
        .D(\$5 [1]),
        .Q(read_port__addr[1]),
        .R(\$9 ));
  (* src = "C:\\Users\\magen\\AppData\\Local\\Packages\\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\\LocalCache\\local-packages\\Python311\\site-packages\\amaranth\\lib\\memory.py:240" *) 
  FDRE #(
    .INIT(1'b0)) 
    \read_port__addr_reg_rep[2] 
       (.C(clk),
        .CE(read_port__en),
        .D(\$5 [2]),
        .Q(read_port__addr[2]),
        .R(\$9 ));
  (* src = "C:\\Users\\magen\\AppData\\Local\\Packages\\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\\LocalCache\\local-packages\\Python311\\site-packages\\amaranth\\lib\\memory.py:240" *) 
  FDRE #(
    .INIT(1'b0)) 
    \read_port__addr_reg_rep[3] 
       (.C(clk),
        .CE(read_port__en),
        .D(\$5 [3]),
        .Q(read_port__addr[3]),
        .R(\$9 ));
  (* src = "C:\\Users\\magen\\AppData\\Local\\Packages\\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\\LocalCache\\local-packages\\Python311\\site-packages\\amaranth\\lib\\memory.py:240" *) 
  FDRE #(
    .INIT(1'b0)) 
    \read_port__addr_reg_rep[4] 
       (.C(clk),
        .CE(read_port__en),
        .D(\$5 [4]),
        .Q(read_port__addr[4]),
        .R(\$9 ));
  (* src = "C:\\Users\\magen\\AppData\\Local\\Packages\\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\\LocalCache\\local-packages\\Python311\\site-packages\\amaranth\\lib\\memory.py:240" *) 
  FDRE #(
    .INIT(1'b0)) 
    \read_port__addr_reg_rep[5] 
       (.C(clk),
        .CE(read_port__en),
        .D(\$5 [5]),
        .Q(read_port__addr[5]),
        .R(\$9 ));
  (* src = "C:\\Users\\magen\\AppData\\Local\\Packages\\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\\LocalCache\\local-packages\\Python311\\site-packages\\amaranth\\lib\\memory.py:240" *) 
  FDRE #(
    .INIT(1'b0)) 
    \read_port__addr_reg_rep[6] 
       (.C(clk),
        .CE(read_port__en),
        .D(\$5 [6]),
        .Q(read_port__addr[6]),
        .R(\$9 ));
  (* src = "C:\\Users\\magen\\AppData\\Local\\Packages\\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\\LocalCache\\local-packages\\Python311\\site-packages\\amaranth\\lib\\memory.py:240" *) 
  FDRE #(
    .INIT(1'b0)) 
    \read_port__addr_reg_rep[7] 
       (.C(clk),
        .CE(read_port__en),
        .D(\$5 [7]),
        .Q(read_port__addr[7]),
        .R(\$9 ));
  (* src = "C:\\Users\\magen\\AppData\\Local\\Packages\\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\\LocalCache\\local-packages\\Python311\\site-packages\\amaranth\\lib\\memory.py:240" *) 
  FDRE #(
    .INIT(1'b0)) 
    \read_port__addr_reg_rep[8] 
       (.C(clk),
        .CE(read_port__en),
        .D(\$5 [8]),
        .Q(read_port__addr[8]),
        .R(\$9 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \read_port__addr_rep[0]_i_1 
       (.I0(read_port__addr[0]),
        .O(\$5 [0]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \read_port__addr_rep[1]_i_1 
       (.I0(read_port__addr[0]),
        .I1(read_port__addr[1]),
        .O(\$5 [1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \read_port__addr_rep[2]_i_1 
       (.I0(read_port__addr[1]),
        .I1(read_port__addr[0]),
        .I2(read_port__addr[2]),
        .O(\$5 [2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \read_port__addr_rep[3]_i_1 
       (.I0(read_port__addr[2]),
        .I1(read_port__addr[0]),
        .I2(read_port__addr[1]),
        .I3(read_port__addr[3]),
        .O(\$5 [3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \read_port__addr_rep[4]_i_1 
       (.I0(read_port__addr[3]),
        .I1(read_port__addr[1]),
        .I2(read_port__addr[0]),
        .I3(read_port__addr[2]),
        .I4(read_port__addr[4]),
        .O(\$5 [4]));
  LUT6 #(
    .INIT(64'hFFFFFFFF00008F00)) 
    \read_port__addr_rep[5]_i_1 
       (.I0(produce__ready),
        .I1(produce__valid_reg_0),
        .I2(fsm_state),
        .I3(\read_port__addr_rep[5]_i_3_n_0 ),
        .I4(\read_port__addr_rep[5]_i_4_n_0 ),
        .I5(rst),
        .O(\$9 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \read_port__addr_rep[5]_i_2 
       (.I0(read_port__addr[4]),
        .I1(read_port__addr[2]),
        .I2(read_port__addr[0]),
        .I3(read_port__addr[1]),
        .I4(read_port__addr[3]),
        .I5(read_port__addr[5]),
        .O(\$5 [5]));
  LUT5 #(
    .INIT(32'h01000000)) 
    \read_port__addr_rep[5]_i_3 
       (.I0(read_port__addr[4]),
        .I1(read_port__addr[5]),
        .I2(read_port__addr[6]),
        .I3(read_port__addr[8]),
        .I4(read_port__addr[7]),
        .O(\read_port__addr_rep[5]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \read_port__addr_rep[5]_i_4 
       (.I0(read_port__addr[2]),
        .I1(read_port__addr[0]),
        .I2(read_port__addr[1]),
        .I3(read_port__addr[3]),
        .O(\read_port__addr_rep[5]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hDF20)) 
    \read_port__addr_rep[6]_i_1 
       (.I0(read_port__addr[5]),
        .I1(\read_port__addr_rep[5]_i_4_n_0 ),
        .I2(read_port__addr[4]),
        .I3(read_port__addr[6]),
        .O(\$5 [6]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hF7FF0800)) 
    \read_port__addr_rep[7]_i_1 
       (.I0(read_port__addr[6]),
        .I1(read_port__addr[4]),
        .I2(\read_port__addr_rep[5]_i_4_n_0 ),
        .I3(read_port__addr[5]),
        .I4(read_port__addr[7]),
        .O(\$5 [7]));
  LUT6 #(
    .INIT(64'hF7FFFFFF08000000)) 
    \read_port__addr_rep[8]_i_1 
       (.I0(read_port__addr[7]),
        .I1(read_port__addr[5]),
        .I2(\read_port__addr_rep[5]_i_4_n_0 ),
        .I3(read_port__addr[4]),
        .I4(read_port__addr[6]),
        .I5(read_port__addr[8]),
        .O(\$5 [8]));
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
