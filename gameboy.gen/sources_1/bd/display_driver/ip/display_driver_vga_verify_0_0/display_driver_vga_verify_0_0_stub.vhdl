-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Sun Mar  9 12:47:26 2025
-- Host        : MSI running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/magen/Documents/Programs/gameboy/gameboy.gen/sources_1/bd/display_driver/ip/display_driver_vga_verify_0_0/display_driver_vga_verify_0_0_stub.vhdl
-- Design      : display_driver_vga_verify_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_driver_vga_verify_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    \produce__data\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \produce__valid\ : out STD_LOGIC;
    \produce__vsync\ : out STD_LOGIC;
    \produce__ready\ : in STD_LOGIC
  );

end display_driver_vga_verify_0_0;

architecture stub of display_driver_vga_verify_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst,\produce__data\[11:0],\produce__valid\,\produce__vsync\,\produce__ready\";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "vga_verify,Vivado 2024.1";
begin
end;
