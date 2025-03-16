-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Sun Mar  9 13:11:46 2025
-- Host        : MSI running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/magen/Documents/Programs/gameboy/gameboy.gen/sources_1/bd/display_driver/ip/display_driver_lcd_to_vga_0_0/display_driver_lcd_to_vga_0_0_stub.vhdl
-- Design      : display_driver_lcd_to_vga_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_driver_lcd_to_vga_0_0 is
  Port ( 
    \consume__valid\ : in STD_LOGIC;
    \consume__vsync\ : in STD_LOGIC;
    \produce__ready\ : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    \consume__ready\ : out STD_LOGIC;
    \produce__data\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \produce__valid\ : out STD_LOGIC;
    \produce__vsync\ : out STD_LOGIC;
    \consume__data\ : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );

end display_driver_lcd_to_vga_0_0;

architecture stub of display_driver_lcd_to_vga_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "\consume__valid\,\consume__vsync\,\produce__ready\,clk,rst,\consume__ready\,\produce__data\[11:0],\produce__valid\,\produce__vsync\,\consume__data\[11:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "lcd_to_vga,Vivado 2024.1";
begin
end;
