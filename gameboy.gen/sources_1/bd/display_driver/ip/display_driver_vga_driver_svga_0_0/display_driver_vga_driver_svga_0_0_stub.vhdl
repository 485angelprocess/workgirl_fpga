-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Sun Mar  9 12:27:49 2025
-- Host        : MSI running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/magen/Documents/Programs/gameboy/gameboy.gen/sources_1/bd/display_driver/ip/display_driver_vga_driver_svga_0_0/display_driver_vga_driver_svga_0_0_stub.vhdl
-- Design      : display_driver_vga_driver_svga_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_driver_vga_driver_svga_0_0 is
  Port ( 
    \consume__valid\ : in STD_LOGIC;
    \consume__vsync\ : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    \consume__ready\ : out STD_LOGIC;
    data : out STD_LOGIC_VECTOR ( 11 downto 0 );
    hsync : out STD_LOGIC;
    vsync : out STD_LOGIC;
    \consume__data\ : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );

end display_driver_vga_driver_svga_0_0;

architecture stub of display_driver_vga_driver_svga_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "\consume__valid\,\consume__vsync\,clk,rst,\consume__ready\,data[11:0],hsync,vsync,\consume__data\[11:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "vga_driver_svga,Vivado 2024.1";
begin
end;
