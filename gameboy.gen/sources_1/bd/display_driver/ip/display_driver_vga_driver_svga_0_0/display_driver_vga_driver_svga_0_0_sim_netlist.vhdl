-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Sun Mar  9 12:27:49 2025
-- Host        : MSI running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/magen/Documents/Programs/gameboy/gameboy.gen/sources_1/bd/display_driver/ip/display_driver_vga_driver_svga_0_0/display_driver_vga_driver_svga_0_0_sim_netlist.vhdl
-- Design      : display_driver_vga_driver_svga_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \display_driver_vga_driver_svga_0_0_vga_driver_svga.hcounter\ is
  port (
    \counter_reg[5]_0\ : out STD_LOGIC;
    hsync : out STD_LOGIC;
    \counter_reg[10]_0\ : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \pix_counter_reg[1]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    input_enable : in STD_LOGIC;
    rst : in STD_LOGIC;
    pix_counter : in STD_LOGIC_VECTOR ( 1 downto 0 );
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \display_driver_vga_driver_svga_0_0_vga_driver_svga.hcounter\ : entity is "vga_driver_svga.hcounter";
end \display_driver_vga_driver_svga_0_0_vga_driver_svga.hcounter\;

architecture STRUCTURE of \display_driver_vga_driver_svga_0_0_vga_driver_svga.hcounter\ is
  signal \$4\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \$5\ : STD_LOGIC;
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \consume__ready_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \counter[5]_i_1__0_n_0\ : STD_LOGIC;
  signal \counter[8]_i_2_n_0\ : STD_LOGIC;
  signal \counter[8]_i_3_n_0\ : STD_LOGIC;
  signal \counter[9]_i_2_n_0\ : STD_LOGIC;
  signal \counter[9]_i_5_n_0\ : STD_LOGIC;
  signal \counter[9]_i_6_n_0\ : STD_LOGIC;
  signal counter_reg : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal hsync_INST_0_i_1_n_0 : STD_LOGIC;
  signal \^pix_counter_reg[1]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \consume__ready_INST_0_i_7\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \counter[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \counter[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \counter[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \counter[4]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \counter[6]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \counter[8]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \counter[8]_i_3\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \counter[9]_i_5\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \counter[9]_i_6\ : label is "soft_lutpair0";
  attribute src : string;
  attribute src of \counter_reg[0]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:46";
  attribute src of \counter_reg[10]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:46";
  attribute src of \counter_reg[1]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:46";
  attribute src of \counter_reg[2]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:46";
  attribute src of \counter_reg[3]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:46";
  attribute src of \counter_reg[4]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:46";
  attribute src of \counter_reg[5]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:46";
  attribute src of \counter_reg[6]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:46";
  attribute src of \counter_reg[7]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:46";
  attribute src of \counter_reg[8]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:46";
  attribute src of \counter_reg[9]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:46";
begin
  E(0) <= \^e\(0);
  \pix_counter_reg[1]\(0) <= \^pix_counter_reg[1]\(0);
\consume__ready_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000001F"
    )
        port map (
      I0 => counter_reg(5),
      I1 => \counter[8]_i_3_n_0\,
      I2 => counter_reg(6),
      I3 => counter_reg(8),
      I4 => counter_reg(10),
      I5 => \consume__ready_INST_0_i_7_n_0\,
      O => \counter_reg[5]_0\
    );
\consume__ready_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFEFEFEFEFEFEF"
    )
        port map (
      I0 => hsync_INST_0_i_1_n_0,
      I1 => counter_reg(10),
      I2 => input_enable,
      I3 => counter_reg(7),
      I4 => counter_reg(9),
      I5 => counter_reg(8),
      O => \counter_reg[10]_0\
    );
\consume__ready_INST_0_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => counter_reg(7),
      I1 => counter_reg(9),
      O => \consume__ready_INST_0_i_7_n_0\
    );
\counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(0),
      O => \$4\(0)
    );
\counter[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => rst,
      I1 => \^e\(0),
      O => \$5\
    );
\counter[10]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => pix_counter(1),
      I1 => pix_counter(0),
      O => \^pix_counter_reg[1]\(0)
    );
\counter[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => counter_reg(10),
      I1 => counter_reg(7),
      I2 => hsync_INST_0_i_1_n_0,
      I3 => counter_reg(2),
      I4 => counter_reg(1),
      I5 => counter_reg(0),
      O => \$4\(10)
    );
\counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => counter_reg(0),
      I1 => counter_reg(1),
      O => \$4\(1)
    );
\counter[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => counter_reg(0),
      I1 => counter_reg(1),
      I2 => counter_reg(2),
      O => \$4\(2)
    );
\counter[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => counter_reg(3),
      I1 => counter_reg(0),
      I2 => counter_reg(1),
      I3 => counter_reg(2),
      O => \$4\(3)
    );
\counter[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => counter_reg(4),
      I1 => counter_reg(3),
      I2 => counter_reg(0),
      I3 => counter_reg(1),
      I4 => counter_reg(2),
      O => \$4\(4)
    );
\counter[5]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => counter_reg(5),
      I1 => counter_reg(3),
      I2 => counter_reg(4),
      I3 => counter_reg(2),
      I4 => counter_reg(1),
      I5 => counter_reg(0),
      O => \counter[5]_i_1__0_n_0\
    );
\counter[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => counter_reg(6),
      I1 => \counter[8]_i_2_n_0\,
      I2 => counter_reg(4),
      I3 => counter_reg(3),
      I4 => counter_reg(5),
      O => \$4\(6)
    );
\counter[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => counter_reg(7),
      I1 => counter_reg(4),
      I2 => counter_reg(3),
      I3 => counter_reg(6),
      I4 => counter_reg(5),
      I5 => \counter[8]_i_2_n_0\,
      O => \$4\(7)
    );
\counter[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => counter_reg(8),
      I1 => \counter[8]_i_2_n_0\,
      I2 => counter_reg(5),
      I3 => counter_reg(6),
      I4 => \counter[8]_i_3_n_0\,
      I5 => counter_reg(7),
      O => \$4\(8)
    );
\counter[8]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_reg(2),
      I1 => counter_reg(1),
      I2 => counter_reg(0),
      O => \counter[8]_i_2_n_0\
    );
\counter[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => counter_reg(3),
      I1 => counter_reg(4),
      O => \counter[8]_i_3_n_0\
    );
\counter[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => counter_reg(9),
      I1 => \counter[9]_i_2_n_0\,
      I2 => counter_reg(8),
      O => \$4\(9)
    );
\counter[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => counter_reg(7),
      I1 => counter_reg(4),
      I2 => counter_reg(3),
      I3 => counter_reg(6),
      I4 => counter_reg(5),
      I5 => \counter[8]_i_2_n_0\,
      O => \counter[9]_i_2_n_0\
    );
\counter[9]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => \counter[9]_i_5_n_0\,
      I1 => counter_reg(10),
      I2 => counter_reg(8),
      I3 => counter_reg(6),
      I4 => counter_reg(5),
      I5 => \counter[9]_i_6_n_0\,
      O => \^e\(0)
    );
\counter[9]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => counter_reg(9),
      I1 => counter_reg(7),
      I2 => pix_counter(0),
      I3 => pix_counter(1),
      O => \counter[9]_i_5_n_0\
    );
\counter[9]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => counter_reg(0),
      I1 => counter_reg(1),
      I2 => counter_reg(2),
      I3 => counter_reg(4),
      I4 => counter_reg(3),
      O => \counter[9]_i_6_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^pix_counter_reg[1]\(0),
      D => \$4\(0),
      Q => counter_reg(0),
      R => \$5\
    );
\counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^pix_counter_reg[1]\(0),
      D => \$4\(10),
      Q => counter_reg(10),
      R => \$5\
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^pix_counter_reg[1]\(0),
      D => \$4\(1),
      Q => counter_reg(1),
      R => \$5\
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^pix_counter_reg[1]\(0),
      D => \$4\(2),
      Q => counter_reg(2),
      R => \$5\
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^pix_counter_reg[1]\(0),
      D => \$4\(3),
      Q => counter_reg(3),
      R => \$5\
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^pix_counter_reg[1]\(0),
      D => \$4\(4),
      Q => counter_reg(4),
      R => \$5\
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^pix_counter_reg[1]\(0),
      D => \counter[5]_i_1__0_n_0\,
      Q => counter_reg(5),
      R => \$5\
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^pix_counter_reg[1]\(0),
      D => \$4\(6),
      Q => counter_reg(6),
      R => \$5\
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^pix_counter_reg[1]\(0),
      D => \$4\(7),
      Q => counter_reg(7),
      R => \$5\
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^pix_counter_reg[1]\(0),
      D => \$4\(8),
      Q => counter_reg(8),
      R => \$5\
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^pix_counter_reg[1]\(0),
      D => \$4\(9),
      Q => counter_reg(9),
      R => \$5\
    );
hsync_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => counter_reg(10),
      I1 => hsync_INST_0_i_1_n_0,
      I2 => counter_reg(7),
      O => hsync
    );
hsync_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => counter_reg(9),
      I1 => counter_reg(8),
      I2 => counter_reg(5),
      I3 => counter_reg(6),
      I4 => counter_reg(3),
      I5 => counter_reg(4),
      O => hsync_INST_0_i_1_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \display_driver_vga_driver_svga_0_0_vga_driver_svga.vcounter\ is
  port (
    input_enable_reg : out STD_LOGIC;
    vsync : out STD_LOGIC;
    data : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \consume__ready\ : out STD_LOGIC;
    rst : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    input_enable : in STD_LOGIC;
    input_enable_reg_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    input_enable_reg_1 : in STD_LOGIC;
    \consume__data\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    pix_counter : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \consume__ready_0\ : in STD_LOGIC;
    \consume__ready_1\ : in STD_LOGIC;
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \display_driver_vga_driver_svga_0_0_vga_driver_svga.vcounter\ : entity is "vga_driver_svga.vcounter";
end \display_driver_vga_driver_svga_0_0_vga_driver_svga.vcounter\;

architecture STRUCTURE of \display_driver_vga_driver_svga_0_0_vga_driver_svga.vcounter\ is
  signal \$4__0\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \$5\ : STD_LOGIC;
  signal \consume__ready_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \consume__ready_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \consume__ready_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \consume__ready_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \counter[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \counter[8]_i_2__0_n_0\ : STD_LOGIC;
  signal \counter[9]_i_4_n_0\ : STD_LOGIC;
  signal \counter[9]_i_7_n_0\ : STD_LOGIC;
  signal counter_reg : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \^vsync\ : STD_LOGIC;
  signal vsync_INST_0_i_1_n_0 : STD_LOGIC;
  signal vsync_INST_0_i_2_n_0 : STD_LOGIC;
  signal vsync_INST_0_i_3_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \consume__ready_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \consume__ready_INST_0_i_6\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \counter[1]_i_1__0\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \counter[2]_i_1__0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \counter[3]_i_1__0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \counter[4]_i_1__0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \counter[6]_i_1__0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \counter[7]_i_1__0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \counter[8]_i_2__0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \counter[9]_i_7\ : label is "soft_lutpair5";
  attribute src : string;
  attribute src of \counter_reg[0]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:46";
  attribute src of \counter_reg[1]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:46";
  attribute src of \counter_reg[2]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:46";
  attribute src of \counter_reg[3]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:46";
  attribute src of \counter_reg[4]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:46";
  attribute src of \counter_reg[5]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:46";
  attribute src of \counter_reg[6]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:46";
  attribute src of \counter_reg[7]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:46";
  attribute src of \counter_reg[8]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:46";
  attribute src of \counter_reg[9]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:46";
  attribute SOFT_HLUTNM of \data[0]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \data[10]_INST_0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \data[1]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \data[2]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \data[3]_INST_0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \data[4]_INST_0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \data[5]_INST_0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \data[6]_INST_0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \data[7]_INST_0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \data[8]_INST_0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \data[9]_INST_0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of vsync_INST_0_i_1 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of vsync_INST_0_i_2 : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of vsync_INST_0_i_3 : label is "soft_lutpair6";
begin
  vsync <= \^vsync\;
\consume__ready_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => pix_counter(0),
      I1 => pix_counter(1),
      I2 => \consume__ready_INST_0_i_1_n_0\,
      O => \consume__ready\
    );
\consume__ready_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFF4"
    )
        port map (
      I0 => \consume__ready_INST_0_i_2_n_0\,
      I1 => counter_reg(9),
      I2 => \consume__ready_INST_0_i_3_n_0\,
      I3 => \consume__ready_0\,
      I4 => \consume__ready_1\,
      O => \consume__ready_INST_0_i_1_n_0\
    );
\consume__ready_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001111111111111"
    )
        port map (
      I0 => counter_reg(8),
      I1 => counter_reg(7),
      I2 => counter_reg(4),
      I3 => \counter[8]_i_2__0_n_0\,
      I4 => counter_reg(5),
      I5 => counter_reg(6),
      O => \consume__ready_INST_0_i_2_n_0\
    );
\consume__ready_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000055557FFF"
    )
        port map (
      I0 => counter_reg(4),
      I1 => counter_reg(2),
      I2 => counter_reg(0),
      I3 => counter_reg(1),
      I4 => counter_reg(3),
      I5 => \consume__ready_INST_0_i_6_n_0\,
      O => \consume__ready_INST_0_i_3_n_0\
    );
\consume__ready_INST_0_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => counter_reg(8),
      I1 => counter_reg(7),
      I2 => counter_reg(6),
      I3 => counter_reg(9),
      I4 => counter_reg(5),
      O => \consume__ready_INST_0_i_6_n_0\
    );
\counter[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(0),
      O => \$4__0\(0)
    );
\counter[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => counter_reg(0),
      I1 => counter_reg(1),
      O => \$4__0\(1)
    );
\counter[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => counter_reg(2),
      I1 => counter_reg(0),
      I2 => counter_reg(1),
      O => \$4__0\(2)
    );
\counter[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => counter_reg(3),
      I1 => counter_reg(2),
      I2 => counter_reg(0),
      I3 => counter_reg(1),
      O => \counter[3]_i_1__0_n_0\
    );
\counter[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => counter_reg(4),
      I1 => counter_reg(1),
      I2 => counter_reg(0),
      I3 => counter_reg(2),
      I4 => counter_reg(3),
      O => \$4__0\(4)
    );
\counter[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => counter_reg(4),
      I1 => counter_reg(1),
      I2 => counter_reg(0),
      I3 => counter_reg(2),
      I4 => counter_reg(3),
      I5 => counter_reg(5),
      O => \$4__0\(5)
    );
\counter[6]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => counter_reg(6),
      I1 => counter_reg(4),
      I2 => \counter[8]_i_2__0_n_0\,
      I3 => counter_reg(5),
      O => \$4__0\(6)
    );
\counter[7]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => counter_reg(7),
      I1 => counter_reg(4),
      I2 => counter_reg(5),
      I3 => counter_reg(6),
      I4 => \counter[8]_i_2__0_n_0\,
      O => \$4__0\(7)
    );
\counter[8]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \counter[8]_i_2__0_n_0\,
      I1 => counter_reg(6),
      I2 => counter_reg(5),
      I3 => counter_reg(4),
      I4 => counter_reg(7),
      I5 => counter_reg(8),
      O => \$4__0\(8)
    );
\counter[8]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => counter_reg(3),
      I1 => counter_reg(2),
      I2 => counter_reg(0),
      I3 => counter_reg(1),
      O => \counter[8]_i_2__0_n_0\
    );
\counter[9]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AEAAAAAAAAAAAAAA"
    )
        port map (
      I0 => rst,
      I1 => E(0),
      I2 => \counter[9]_i_4_n_0\,
      I3 => counter_reg(4),
      I4 => counter_reg(5),
      I5 => counter_reg(6),
      O => \$5\
    );
\counter[9]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => counter_reg(9),
      I1 => \counter[9]_i_7_n_0\,
      I2 => counter_reg(8),
      O => \$4__0\(9)
    );
\counter[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFFFFFFFFFFFFFF"
    )
        port map (
      I0 => counter_reg(2),
      I1 => counter_reg(3),
      I2 => counter_reg(9),
      I3 => vsync_INST_0_i_3_n_0,
      I4 => counter_reg(0),
      I5 => counter_reg(1),
      O => \counter[9]_i_4_n_0\
    );
\counter[9]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => \counter[8]_i_2__0_n_0\,
      I1 => counter_reg(6),
      I2 => counter_reg(5),
      I3 => counter_reg(4),
      I4 => counter_reg(7),
      O => \counter[9]_i_7_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => E(0),
      D => \$4__0\(0),
      Q => counter_reg(0),
      R => \$5\
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => E(0),
      D => \$4__0\(1),
      Q => counter_reg(1),
      R => \$5\
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => E(0),
      D => \$4__0\(2),
      Q => counter_reg(2),
      R => \$5\
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => E(0),
      D => \counter[3]_i_1__0_n_0\,
      Q => counter_reg(3),
      R => \$5\
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => E(0),
      D => \$4__0\(4),
      Q => counter_reg(4),
      R => \$5\
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => E(0),
      D => \$4__0\(5),
      Q => counter_reg(5),
      R => \$5\
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => E(0),
      D => \$4__0\(6),
      Q => counter_reg(6),
      R => \$5\
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => E(0),
      D => \$4__0\(7),
      Q => counter_reg(7),
      R => \$5\
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => E(0),
      D => \$4__0\(8),
      Q => counter_reg(8),
      R => \$5\
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => E(0),
      D => \$4__0\(9),
      Q => counter_reg(9),
      R => \$5\
    );
\data[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \consume__data\(0),
      I1 => \consume__ready_INST_0_i_1_n_0\,
      O => data(0)
    );
\data[10]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \consume__data\(10),
      I1 => \consume__ready_INST_0_i_1_n_0\,
      O => data(10)
    );
\data[11]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \consume__data\(11),
      I1 => \consume__ready_INST_0_i_1_n_0\,
      O => data(11)
    );
\data[1]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \consume__data\(1),
      I1 => \consume__ready_INST_0_i_1_n_0\,
      O => data(1)
    );
\data[2]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \consume__data\(2),
      I1 => \consume__ready_INST_0_i_1_n_0\,
      O => data(2)
    );
\data[3]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \consume__data\(3),
      I1 => \consume__ready_INST_0_i_1_n_0\,
      O => data(3)
    );
\data[4]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \consume__data\(4),
      I1 => \consume__ready_INST_0_i_1_n_0\,
      O => data(4)
    );
\data[5]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \consume__data\(5),
      I1 => \consume__ready_INST_0_i_1_n_0\,
      O => data(5)
    );
\data[6]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \consume__data\(6),
      I1 => \consume__ready_INST_0_i_1_n_0\,
      O => data(6)
    );
\data[7]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \consume__data\(7),
      I1 => \consume__ready_INST_0_i_1_n_0\,
      O => data(7)
    );
\data[8]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \consume__data\(8),
      I1 => \consume__ready_INST_0_i_1_n_0\,
      O => data(8)
    );
\data[9]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \consume__data\(9),
      I1 => \consume__ready_INST_0_i_1_n_0\,
      O => data(9)
    );
input_enable_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFFAA8A"
    )
        port map (
      I0 => input_enable,
      I1 => \consume__ready_INST_0_i_1_n_0\,
      I2 => input_enable_reg_0(0),
      I3 => input_enable_reg_1,
      I4 => \^vsync\,
      I5 => rst,
      O => input_enable_reg
    );
vsync_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888808AAAAAAAA"
    )
        port map (
      I0 => counter_reg(9),
      I1 => vsync_INST_0_i_1_n_0,
      I2 => vsync_INST_0_i_2_n_0,
      I3 => counter_reg(2),
      I4 => counter_reg(3),
      I5 => vsync_INST_0_i_3_n_0,
      O => \^vsync\
    );
vsync_INST_0_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_reg(6),
      I1 => counter_reg(5),
      I2 => counter_reg(4),
      O => vsync_INST_0_i_1_n_0
    );
vsync_INST_0_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => counter_reg(0),
      I1 => counter_reg(1),
      O => vsync_INST_0_i_2_n_0
    );
vsync_INST_0_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(7),
      I1 => counter_reg(8),
      O => vsync_INST_0_i_3_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity display_driver_vga_driver_svga_0_0_vga_driver_svga is
  port (
    vsync : out STD_LOGIC;
    data : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \consume__ready\ : out STD_LOGIC;
    hsync : out STD_LOGIC;
    rst : in STD_LOGIC;
    clk : in STD_LOGIC;
    \consume__data\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \consume__valid\ : in STD_LOGIC;
    \consume__vsync\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of display_driver_vga_driver_svga_0_0_vga_driver_svga : entity is "vga_driver_svga";
end display_driver_vga_driver_svga_0_0_vga_driver_svga;

architecture STRUCTURE of display_driver_vga_driver_svga_0_0_vga_driver_svga is
  signal \clk_en$12\ : STD_LOGIC;
  signal hcounter_n_0 : STD_LOGIC;
  signal hcounter_n_2 : STD_LOGIC;
  signal input_enable : STD_LOGIC;
  signal input_enable_i_2_n_0 : STD_LOGIC;
  signal pix_clk : STD_LOGIC;
  signal pix_counter : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \pix_counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \pix_counter[1]_i_1_n_0\ : STD_LOGIC;
  signal vcounter_n_0 : STD_LOGIC;
  attribute src : string;
  attribute src of input_enable_reg : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:117";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \pix_counter[0]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \pix_counter[1]_i_1\ : label is "soft_lutpair17";
  attribute src of \pix_counter_reg[0]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:97";
  attribute src of \pix_counter_reg[1]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:97";
begin
hcounter: entity work.\display_driver_vga_driver_svga_0_0_vga_driver_svga.hcounter\
     port map (
      E(0) => \clk_en$12\,
      clk => clk,
      \counter_reg[10]_0\ => hcounter_n_2,
      \counter_reg[5]_0\ => hcounter_n_0,
      hsync => hsync,
      input_enable => input_enable,
      pix_counter(1 downto 0) => pix_counter(1 downto 0),
      \pix_counter_reg[1]\(0) => pix_clk,
      rst => rst
    );
input_enable_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \consume__valid\,
      I1 => \consume__vsync\,
      O => input_enable_i_2_n_0
    );
input_enable_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => vcounter_n_0,
      Q => input_enable,
      R => '0'
    );
\pix_counter[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => pix_counter(1),
      I1 => pix_counter(0),
      I2 => rst,
      O => \pix_counter[0]_i_1_n_0\
    );
\pix_counter[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => pix_counter(1),
      I1 => pix_counter(0),
      I2 => rst,
      O => \pix_counter[1]_i_1_n_0\
    );
\pix_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pix_counter[0]_i_1_n_0\,
      Q => pix_counter(0),
      R => '0'
    );
\pix_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pix_counter[1]_i_1_n_0\,
      Q => pix_counter(1),
      R => '0'
    );
vcounter: entity work.\display_driver_vga_driver_svga_0_0_vga_driver_svga.vcounter\
     port map (
      E(0) => \clk_en$12\,
      clk => clk,
      \consume__data\(11 downto 0) => \consume__data\(11 downto 0),
      \consume__ready\ => \consume__ready\,
      \consume__ready_0\ => hcounter_n_0,
      \consume__ready_1\ => hcounter_n_2,
      data(11 downto 0) => data(11 downto 0),
      input_enable => input_enable,
      input_enable_reg => vcounter_n_0,
      input_enable_reg_0(0) => pix_clk,
      input_enable_reg_1 => input_enable_i_2_n_0,
      pix_counter(1 downto 0) => pix_counter(1 downto 0),
      rst => rst,
      vsync => vsync
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity display_driver_vga_driver_svga_0_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of display_driver_vga_driver_svga_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of display_driver_vga_driver_svga_0_0 : entity is "display_driver_vga_driver_svga_0_0,vga_driver_svga,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of display_driver_vga_driver_svga_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of display_driver_vga_driver_svga_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of display_driver_vga_driver_svga_0_0 : entity is "vga_driver_svga,Vivado 2024.1";
end display_driver_vga_driver_svga_0_0;

architecture STRUCTURE of display_driver_vga_driver_svga_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 120000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  attribute src : string;
  attribute src of clk : signal is "C:\Users\magen\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\LocalCache\local-packages\Python311\site-packages\amaranth\hdl\_ir.py:283";
  attribute src of \consume__valid\ : signal is "C:\Users\magen\Documents\Programs\gameboy\ppu\signature.py:18";
  attribute src of \consume__vsync\ : signal is "C:\Users\magen\Documents\Programs\gameboy\ppu\signature.py:20";
  attribute X_INTERFACE_INFO of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute X_INTERFACE_PARAMETER of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute src of rst : signal is "C:\Users\magen\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\LocalCache\local-packages\Python311\site-packages\amaranth\hdl\_ir.py:283";
  attribute src of \consume__data\ : signal is "C:\Users\magen\Documents\Programs\gameboy\ppu\vga.py:86";
begin
inst: entity work.display_driver_vga_driver_svga_0_0_vga_driver_svga
     port map (
      clk => clk,
      \consume__data\(11 downto 0) => \consume__data\(11 downto 0),
      \consume__ready\ => \consume__ready\,
      \consume__valid\ => \consume__valid\,
      \consume__vsync\ => \consume__vsync\,
      data(11 downto 0) => data(11 downto 0),
      hsync => hsync,
      rst => rst,
      vsync => vsync
    );
end STRUCTURE;
