-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Sun Mar  9 12:27:49 2025
-- Host        : MSI running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/magen/Documents/Programs/gameboy/gameboy.gen/sources_1/bd/display_driver/ip/display_driver_lcd_to_vga_0_0/display_driver_lcd_to_vga_0_0_sim_netlist.vhdl
-- Design      : display_driver_lcd_to_vga_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.hor\ is
  port (
    \produce__data\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \counter_reg[1]_0\ : out STD_LOGIC;
    \counter_reg[0]_0\ : out STD_LOGIC;
    \write_port__en\ : out STD_LOGIC;
    \counter_reg[1]_1\ : out STD_LOGIC;
    \produce__vsync\ : out STD_LOGIC;
    rst : in STD_LOGIC;
    \$1\ : in STD_LOGIC;
    \consume__vsync$14\ : in STD_LOGIC;
    clk : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \consume__valid\ : in STD_LOGIC;
    \produce__ready\ : in STD_LOGIC;
    line_counter : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \counter_reg[0]_1\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.hor\ : entity is "lcd_to_vga.upsample.hor";
end \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.hor\;

architecture STRUCTURE of \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.hor\ is
  signal \counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter[1]_i_1_n_0\ : STD_LOGIC;
  signal \^counter_reg[0]_0\ : STD_LOGIC;
  signal \^counter_reg[1]_0\ : STD_LOGIC;
  signal data_reg : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal sync_reg : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of buffer_reg_0_63_0_2_i_11 : label is "soft_lutpair0";
  attribute src : string;
  attribute src of \counter_reg[0]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:25";
  attribute src of \counter_reg[1]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:25";
  attribute src of \data_reg_reg[0]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:23";
  attribute src of \data_reg_reg[10]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:23";
  attribute src of \data_reg_reg[11]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:23";
  attribute src of \data_reg_reg[1]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:23";
  attribute src of \data_reg_reg[2]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:23";
  attribute src of \data_reg_reg[3]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:23";
  attribute src of \data_reg_reg[4]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:23";
  attribute src of \data_reg_reg[5]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:23";
  attribute src of \data_reg_reg[6]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:23";
  attribute src of \data_reg_reg[7]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:23";
  attribute src of \data_reg_reg[8]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:23";
  attribute src of \data_reg_reg[9]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:23";
  attribute SOFT_HLUTNM of \produce__data[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \produce__data[1]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \produce__vsync_INST_0\ : label is "soft_lutpair1";
  attribute src of sync_reg_reg : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:22";
begin
  \counter_reg[0]_0\ <= \^counter_reg[0]_0\;
  \counter_reg[1]_0\ <= \^counter_reg[1]_0\;
buffer_reg_0_63_0_2_i_11: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^counter_reg[1]_0\,
      I1 => \^counter_reg[0]_0\,
      O => \counter_reg[1]_1\
    );
\counter[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000FF00FE0"
    )
        port map (
      I0 => \consume__valid\,
      I1 => \counter_reg[0]_1\,
      I2 => \produce__ready\,
      I3 => \^counter_reg[0]_0\,
      I4 => \^counter_reg[1]_0\,
      I5 => rst,
      O => \counter[0]_i_1_n_0\
    );
\counter[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0078"
    )
        port map (
      I0 => \produce__ready\,
      I1 => \^counter_reg[0]_0\,
      I2 => \^counter_reg[1]_0\,
      I3 => rst,
      O => \counter[1]_i_1_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter[0]_i_1_n_0\,
      Q => \^counter_reg[0]_0\,
      R => '0'
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \counter[1]_i_1_n_0\,
      Q => \^counter_reg[1]_0\,
      R => '0'
    );
\data_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \$1\,
      D => D(0),
      Q => data_reg(0),
      R => rst
    );
\data_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \$1\,
      D => D(10),
      Q => data_reg(10),
      R => rst
    );
\data_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \$1\,
      D => D(11),
      Q => data_reg(11),
      R => rst
    );
\data_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \$1\,
      D => D(1),
      Q => data_reg(1),
      R => rst
    );
\data_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \$1\,
      D => D(2),
      Q => data_reg(2),
      R => rst
    );
\data_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \$1\,
      D => D(3),
      Q => data_reg(3),
      R => rst
    );
\data_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \$1\,
      D => D(4),
      Q => data_reg(4),
      R => rst
    );
\data_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \$1\,
      D => D(5),
      Q => data_reg(5),
      R => rst
    );
\data_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \$1\,
      D => D(6),
      Q => data_reg(6),
      R => rst
    );
\data_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \$1\,
      D => D(7),
      Q => data_reg(7),
      R => rst
    );
\data_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \$1\,
      D => D(8),
      Q => data_reg(8),
      R => rst
    );
\data_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \$1\,
      D => D(9),
      Q => data_reg(9),
      R => rst
    );
\produce__data[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => data_reg(0),
      I1 => \^counter_reg[1]_0\,
      I2 => \^counter_reg[0]_0\,
      I3 => D(0),
      O => \produce__data\(0)
    );
\produce__data[10]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => data_reg(10),
      I1 => \^counter_reg[1]_0\,
      I2 => \^counter_reg[0]_0\,
      I3 => D(10),
      O => \produce__data\(10)
    );
\produce__data[11]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => data_reg(11),
      I1 => \^counter_reg[1]_0\,
      I2 => \^counter_reg[0]_0\,
      I3 => D(11),
      O => \produce__data\(11)
    );
\produce__data[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => data_reg(1),
      I1 => \^counter_reg[1]_0\,
      I2 => \^counter_reg[0]_0\,
      I3 => D(1),
      O => \produce__data\(1)
    );
\produce__data[2]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => data_reg(2),
      I1 => \^counter_reg[1]_0\,
      I2 => \^counter_reg[0]_0\,
      I3 => D(2),
      O => \produce__data\(2)
    );
\produce__data[3]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => data_reg(3),
      I1 => \^counter_reg[1]_0\,
      I2 => \^counter_reg[0]_0\,
      I3 => D(3),
      O => \produce__data\(3)
    );
\produce__data[4]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => data_reg(4),
      I1 => \^counter_reg[1]_0\,
      I2 => \^counter_reg[0]_0\,
      I3 => D(4),
      O => \produce__data\(4)
    );
\produce__data[5]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => data_reg(5),
      I1 => \^counter_reg[1]_0\,
      I2 => \^counter_reg[0]_0\,
      I3 => D(5),
      O => \produce__data\(5)
    );
\produce__data[6]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => data_reg(6),
      I1 => \^counter_reg[1]_0\,
      I2 => \^counter_reg[0]_0\,
      I3 => D(6),
      O => \produce__data\(6)
    );
\produce__data[7]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => data_reg(7),
      I1 => \^counter_reg[1]_0\,
      I2 => \^counter_reg[0]_0\,
      I3 => D(7),
      O => \produce__data\(7)
    );
\produce__data[8]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => data_reg(8),
      I1 => \^counter_reg[1]_0\,
      I2 => \^counter_reg[0]_0\,
      I3 => D(8),
      O => \produce__data\(8)
    );
\produce__data[9]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => data_reg(9),
      I1 => \^counter_reg[1]_0\,
      I2 => \^counter_reg[0]_0\,
      I3 => D(9),
      O => \produce__data\(9)
    );
\produce__vsync_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => sync_reg,
      I1 => \^counter_reg[0]_0\,
      I2 => \^counter_reg[1]_0\,
      O => \produce__vsync\
    );
sync_flag_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000200"
    )
        port map (
      I0 => \consume__valid\,
      I1 => \^counter_reg[0]_0\,
      I2 => \^counter_reg[1]_0\,
      I3 => \produce__ready\,
      I4 => line_counter(1),
      I5 => line_counter(0),
      O => \write_port__en\
    );
sync_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \$1\,
      D => \consume__vsync$14\,
      Q => sync_reg,
      R => rst
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.ver\ is
  port (
    \$1\ : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 11 downto 0 );
    line_counter : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \line_counter_reg[1]_0\ : out STD_LOGIC;
    \consume__ready\ : out STD_LOGIC;
    \produce__valid\ : out STD_LOGIC;
    \consume__vsync$14\ : out STD_LOGIC;
    clk : in STD_LOGIC;
    \consume__data\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \produce__ready\ : in STD_LOGIC;
    buffer_reg_192_255_6_8_0 : in STD_LOGIC;
    \consume__valid\ : in STD_LOGIC;
    \consume__vsync\ : in STD_LOGIC;
    \write_port__en\ : in STD_LOGIC;
    rst : in STD_LOGIC;
    \addr_reg[7]_0\ : in STD_LOGIC;
    \addr_reg[7]_1\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.ver\ : entity is "lcd_to_vga.upsample.ver";
end \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.ver\;

architecture STRUCTURE of \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.ver\ is
  signal \^$1\ : STD_LOGIC;
  signal \$10\ : STD_LOGIC;
  signal \$8\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal addr : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal \addr[6]_i_2_n_0\ : STD_LOGIC;
  signal addr_reg : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal buffer_reg_0_63_0_2_i_4_n_0 : STD_LOGIC;
  signal buffer_reg_0_63_0_2_n_0 : STD_LOGIC;
  signal buffer_reg_0_63_0_2_n_1 : STD_LOGIC;
  signal buffer_reg_0_63_0_2_n_2 : STD_LOGIC;
  signal buffer_reg_0_63_3_5_n_0 : STD_LOGIC;
  signal buffer_reg_0_63_3_5_n_1 : STD_LOGIC;
  signal buffer_reg_0_63_3_5_n_2 : STD_LOGIC;
  signal buffer_reg_0_63_6_8_n_0 : STD_LOGIC;
  signal buffer_reg_0_63_6_8_n_1 : STD_LOGIC;
  signal buffer_reg_0_63_6_8_n_2 : STD_LOGIC;
  signal buffer_reg_0_63_9_11_n_0 : STD_LOGIC;
  signal buffer_reg_0_63_9_11_n_1 : STD_LOGIC;
  signal buffer_reg_0_63_9_11_n_2 : STD_LOGIC;
  signal buffer_reg_128_191_0_2_i_1_n_0 : STD_LOGIC;
  signal buffer_reg_128_191_0_2_n_0 : STD_LOGIC;
  signal buffer_reg_128_191_0_2_n_1 : STD_LOGIC;
  signal buffer_reg_128_191_0_2_n_2 : STD_LOGIC;
  signal buffer_reg_128_191_3_5_n_0 : STD_LOGIC;
  signal buffer_reg_128_191_3_5_n_1 : STD_LOGIC;
  signal buffer_reg_128_191_3_5_n_2 : STD_LOGIC;
  signal buffer_reg_128_191_6_8_n_0 : STD_LOGIC;
  signal buffer_reg_128_191_6_8_n_1 : STD_LOGIC;
  signal buffer_reg_128_191_6_8_n_2 : STD_LOGIC;
  signal buffer_reg_128_191_9_11_n_0 : STD_LOGIC;
  signal buffer_reg_128_191_9_11_n_1 : STD_LOGIC;
  signal buffer_reg_128_191_9_11_n_2 : STD_LOGIC;
  signal buffer_reg_192_255_0_2_i_1_n_0 : STD_LOGIC;
  signal buffer_reg_192_255_0_2_n_0 : STD_LOGIC;
  signal buffer_reg_192_255_0_2_n_1 : STD_LOGIC;
  signal buffer_reg_192_255_0_2_n_2 : STD_LOGIC;
  signal buffer_reg_192_255_3_5_n_0 : STD_LOGIC;
  signal buffer_reg_192_255_3_5_n_1 : STD_LOGIC;
  signal buffer_reg_192_255_3_5_n_2 : STD_LOGIC;
  signal buffer_reg_192_255_6_8_n_0 : STD_LOGIC;
  signal buffer_reg_192_255_6_8_n_1 : STD_LOGIC;
  signal buffer_reg_192_255_6_8_n_2 : STD_LOGIC;
  signal buffer_reg_192_255_9_11_n_0 : STD_LOGIC;
  signal buffer_reg_192_255_9_11_n_1 : STD_LOGIC;
  signal buffer_reg_192_255_9_11_n_2 : STD_LOGIC;
  signal buffer_reg_64_127_0_2_i_1_n_0 : STD_LOGIC;
  signal buffer_reg_64_127_0_2_n_0 : STD_LOGIC;
  signal buffer_reg_64_127_0_2_n_1 : STD_LOGIC;
  signal buffer_reg_64_127_0_2_n_2 : STD_LOGIC;
  signal buffer_reg_64_127_3_5_n_0 : STD_LOGIC;
  signal buffer_reg_64_127_3_5_n_1 : STD_LOGIC;
  signal buffer_reg_64_127_3_5_n_2 : STD_LOGIC;
  signal buffer_reg_64_127_6_8_n_0 : STD_LOGIC;
  signal buffer_reg_64_127_6_8_n_1 : STD_LOGIC;
  signal buffer_reg_64_127_6_8_n_2 : STD_LOGIC;
  signal buffer_reg_64_127_9_11_n_0 : STD_LOGIC;
  signal buffer_reg_64_127_9_11_n_1 : STD_LOGIC;
  signal buffer_reg_64_127_9_11_n_2 : STD_LOGIC;
  signal \^line_counter\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \line_counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \line_counter[1]_i_1_n_0\ : STD_LOGIC;
  signal \line_counter[1]_i_2_n_0\ : STD_LOGIC;
  signal \line_counter[1]_i_3_n_0\ : STD_LOGIC;
  signal \^line_counter_reg[1]_0\ : STD_LOGIC;
  signal \read_port__data\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal sync_flag : STD_LOGIC;
  signal sync_flag_i_1_n_0 : STD_LOGIC;
  signal sync_flag_i_2_n_0 : STD_LOGIC;
  signal sync_reg_i_2_n_0 : STD_LOGIC;
  signal \write_port__addr\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \write_port__data\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_buffer_reg_0_63_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_reg_0_63_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_reg_0_63_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_reg_0_63_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_reg_128_191_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_reg_128_191_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_reg_128_191_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_reg_128_191_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_reg_192_255_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_reg_192_255_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_reg_192_255_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_reg_192_255_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_reg_64_127_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_reg_64_127_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_reg_64_127_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_reg_64_127_9_11_DOD_UNCONNECTED : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \addr[1]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \addr[2]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \addr[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \addr[4]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \addr[6]_i_2\ : label is "soft_lutpair7";
  attribute src : string;
  attribute src of \addr_reg[0]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:75";
  attribute src of \addr_reg[1]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:75";
  attribute src of \addr_reg[2]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:75";
  attribute src of \addr_reg[3]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:75";
  attribute src of \addr_reg[4]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:75";
  attribute src of \addr_reg[5]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:75";
  attribute src of \addr_reg[6]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:75";
  attribute src of \addr_reg[7]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:75";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_0_63_0_2 : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of buffer_reg_0_63_0_2 : label is 2400;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of buffer_reg_0_63_0_2 : label is "inst/upsample/ver/buffer_reg_0_63_0_2";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of buffer_reg_0_63_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of buffer_reg_0_63_0_2 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of buffer_reg_0_63_0_2 : label is 63;
  attribute ram_offset : integer;
  attribute ram_offset of buffer_reg_0_63_0_2 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of buffer_reg_0_63_0_2 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of buffer_reg_0_63_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_0_63_3_5 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_0_63_3_5 : label is 2400;
  attribute RTL_RAM_NAME of buffer_reg_0_63_3_5 : label is "inst/upsample/ver/buffer_reg_0_63_3_5";
  attribute RTL_RAM_TYPE of buffer_reg_0_63_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_0_63_3_5 : label is 0;
  attribute ram_addr_end of buffer_reg_0_63_3_5 : label is 63;
  attribute ram_offset of buffer_reg_0_63_3_5 : label is 0;
  attribute ram_slice_begin of buffer_reg_0_63_3_5 : label is 3;
  attribute ram_slice_end of buffer_reg_0_63_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_0_63_6_8 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_0_63_6_8 : label is 2400;
  attribute RTL_RAM_NAME of buffer_reg_0_63_6_8 : label is "inst/upsample/ver/buffer_reg_0_63_6_8";
  attribute RTL_RAM_TYPE of buffer_reg_0_63_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_0_63_6_8 : label is 0;
  attribute ram_addr_end of buffer_reg_0_63_6_8 : label is 63;
  attribute ram_offset of buffer_reg_0_63_6_8 : label is 0;
  attribute ram_slice_begin of buffer_reg_0_63_6_8 : label is 6;
  attribute ram_slice_end of buffer_reg_0_63_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_0_63_9_11 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_0_63_9_11 : label is 2400;
  attribute RTL_RAM_NAME of buffer_reg_0_63_9_11 : label is "inst/upsample/ver/buffer_reg_0_63_9_11";
  attribute RTL_RAM_TYPE of buffer_reg_0_63_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_0_63_9_11 : label is 0;
  attribute ram_addr_end of buffer_reg_0_63_9_11 : label is 63;
  attribute ram_offset of buffer_reg_0_63_9_11 : label is 0;
  attribute ram_slice_begin of buffer_reg_0_63_9_11 : label is 9;
  attribute ram_slice_end of buffer_reg_0_63_9_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_128_191_0_2 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_128_191_0_2 : label is 2400;
  attribute RTL_RAM_NAME of buffer_reg_128_191_0_2 : label is "inst/upsample/ver/buffer_reg_128_191_0_2";
  attribute RTL_RAM_TYPE of buffer_reg_128_191_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_128_191_0_2 : label is 128;
  attribute ram_addr_end of buffer_reg_128_191_0_2 : label is 191;
  attribute ram_offset of buffer_reg_128_191_0_2 : label is 0;
  attribute ram_slice_begin of buffer_reg_128_191_0_2 : label is 0;
  attribute ram_slice_end of buffer_reg_128_191_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_128_191_3_5 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_128_191_3_5 : label is 2400;
  attribute RTL_RAM_NAME of buffer_reg_128_191_3_5 : label is "inst/upsample/ver/buffer_reg_128_191_3_5";
  attribute RTL_RAM_TYPE of buffer_reg_128_191_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_128_191_3_5 : label is 128;
  attribute ram_addr_end of buffer_reg_128_191_3_5 : label is 191;
  attribute ram_offset of buffer_reg_128_191_3_5 : label is 0;
  attribute ram_slice_begin of buffer_reg_128_191_3_5 : label is 3;
  attribute ram_slice_end of buffer_reg_128_191_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_128_191_6_8 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_128_191_6_8 : label is 2400;
  attribute RTL_RAM_NAME of buffer_reg_128_191_6_8 : label is "inst/upsample/ver/buffer_reg_128_191_6_8";
  attribute RTL_RAM_TYPE of buffer_reg_128_191_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_128_191_6_8 : label is 128;
  attribute ram_addr_end of buffer_reg_128_191_6_8 : label is 191;
  attribute ram_offset of buffer_reg_128_191_6_8 : label is 0;
  attribute ram_slice_begin of buffer_reg_128_191_6_8 : label is 6;
  attribute ram_slice_end of buffer_reg_128_191_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_128_191_9_11 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_128_191_9_11 : label is 2400;
  attribute RTL_RAM_NAME of buffer_reg_128_191_9_11 : label is "inst/upsample/ver/buffer_reg_128_191_9_11";
  attribute RTL_RAM_TYPE of buffer_reg_128_191_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_128_191_9_11 : label is 128;
  attribute ram_addr_end of buffer_reg_128_191_9_11 : label is 191;
  attribute ram_offset of buffer_reg_128_191_9_11 : label is 0;
  attribute ram_slice_begin of buffer_reg_128_191_9_11 : label is 9;
  attribute ram_slice_end of buffer_reg_128_191_9_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_192_255_0_2 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_192_255_0_2 : label is 2400;
  attribute RTL_RAM_NAME of buffer_reg_192_255_0_2 : label is "inst/upsample/ver/buffer_reg_192_255_0_2";
  attribute RTL_RAM_TYPE of buffer_reg_192_255_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_192_255_0_2 : label is 192;
  attribute ram_addr_end of buffer_reg_192_255_0_2 : label is 199;
  attribute ram_offset of buffer_reg_192_255_0_2 : label is 0;
  attribute ram_slice_begin of buffer_reg_192_255_0_2 : label is 0;
  attribute ram_slice_end of buffer_reg_192_255_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_192_255_3_5 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_192_255_3_5 : label is 2400;
  attribute RTL_RAM_NAME of buffer_reg_192_255_3_5 : label is "inst/upsample/ver/buffer_reg_192_255_3_5";
  attribute RTL_RAM_TYPE of buffer_reg_192_255_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_192_255_3_5 : label is 192;
  attribute ram_addr_end of buffer_reg_192_255_3_5 : label is 199;
  attribute ram_offset of buffer_reg_192_255_3_5 : label is 0;
  attribute ram_slice_begin of buffer_reg_192_255_3_5 : label is 3;
  attribute ram_slice_end of buffer_reg_192_255_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_192_255_6_8 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_192_255_6_8 : label is 2400;
  attribute RTL_RAM_NAME of buffer_reg_192_255_6_8 : label is "inst/upsample/ver/buffer_reg_192_255_6_8";
  attribute RTL_RAM_TYPE of buffer_reg_192_255_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_192_255_6_8 : label is 192;
  attribute ram_addr_end of buffer_reg_192_255_6_8 : label is 199;
  attribute ram_offset of buffer_reg_192_255_6_8 : label is 0;
  attribute ram_slice_begin of buffer_reg_192_255_6_8 : label is 6;
  attribute ram_slice_end of buffer_reg_192_255_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_192_255_9_11 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_192_255_9_11 : label is 2400;
  attribute RTL_RAM_NAME of buffer_reg_192_255_9_11 : label is "inst/upsample/ver/buffer_reg_192_255_9_11";
  attribute RTL_RAM_TYPE of buffer_reg_192_255_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_192_255_9_11 : label is 192;
  attribute ram_addr_end of buffer_reg_192_255_9_11 : label is 199;
  attribute ram_offset of buffer_reg_192_255_9_11 : label is 0;
  attribute ram_slice_begin of buffer_reg_192_255_9_11 : label is 9;
  attribute ram_slice_end of buffer_reg_192_255_9_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_64_127_0_2 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_64_127_0_2 : label is 2400;
  attribute RTL_RAM_NAME of buffer_reg_64_127_0_2 : label is "inst/upsample/ver/buffer_reg_64_127_0_2";
  attribute RTL_RAM_TYPE of buffer_reg_64_127_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_64_127_0_2 : label is 64;
  attribute ram_addr_end of buffer_reg_64_127_0_2 : label is 127;
  attribute ram_offset of buffer_reg_64_127_0_2 : label is 0;
  attribute ram_slice_begin of buffer_reg_64_127_0_2 : label is 0;
  attribute ram_slice_end of buffer_reg_64_127_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_64_127_3_5 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_64_127_3_5 : label is 2400;
  attribute RTL_RAM_NAME of buffer_reg_64_127_3_5 : label is "inst/upsample/ver/buffer_reg_64_127_3_5";
  attribute RTL_RAM_TYPE of buffer_reg_64_127_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_64_127_3_5 : label is 64;
  attribute ram_addr_end of buffer_reg_64_127_3_5 : label is 127;
  attribute ram_offset of buffer_reg_64_127_3_5 : label is 0;
  attribute ram_slice_begin of buffer_reg_64_127_3_5 : label is 3;
  attribute ram_slice_end of buffer_reg_64_127_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_64_127_6_8 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_64_127_6_8 : label is 2400;
  attribute RTL_RAM_NAME of buffer_reg_64_127_6_8 : label is "inst/upsample/ver/buffer_reg_64_127_6_8";
  attribute RTL_RAM_TYPE of buffer_reg_64_127_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_64_127_6_8 : label is 64;
  attribute ram_addr_end of buffer_reg_64_127_6_8 : label is 127;
  attribute ram_offset of buffer_reg_64_127_6_8 : label is 0;
  attribute ram_slice_begin of buffer_reg_64_127_6_8 : label is 6;
  attribute ram_slice_end of buffer_reg_64_127_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_64_127_9_11 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_64_127_9_11 : label is 2400;
  attribute RTL_RAM_NAME of buffer_reg_64_127_9_11 : label is "inst/upsample/ver/buffer_reg_64_127_9_11";
  attribute RTL_RAM_TYPE of buffer_reg_64_127_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_64_127_9_11 : label is 64;
  attribute ram_addr_end of buffer_reg_64_127_9_11 : label is 127;
  attribute ram_offset of buffer_reg_64_127_9_11 : label is 0;
  attribute ram_slice_begin of buffer_reg_64_127_9_11 : label is 9;
  attribute ram_slice_end of buffer_reg_64_127_9_11 : label is 11;
  attribute SOFT_HLUTNM of \consume__ready_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \counter[0]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \line_counter[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \line_counter[1]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \line_counter[1]_i_3\ : label is "soft_lutpair5";
  attribute src of \line_counter_reg[0]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:80";
  attribute src of \line_counter_reg[1]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:80";
  attribute SOFT_HLUTNM of \produce__data[0]_INST_0_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of sync_flag_i_2 : label is "soft_lutpair4";
  attribute src of sync_flag_reg : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:69";
begin
  \$1\ <= \^$1\;
  line_counter(1 downto 0) <= \^line_counter\(1 downto 0);
  \line_counter_reg[1]_0\ <= \^line_counter_reg[1]_0\;
\addr[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => rst,
      I1 => \line_counter[1]_i_2_n_0\,
      O => \$10\
    );
\addr[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => addr_reg(0),
      O => \$8\(0)
    );
\addr[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => addr_reg(1),
      I1 => addr_reg(0),
      O => \$8\(1)
    );
\addr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => addr_reg(2),
      I1 => addr_reg(1),
      I2 => addr_reg(0),
      O => \$8\(2)
    );
\addr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => addr_reg(0),
      I1 => addr_reg(1),
      I2 => addr_reg(2),
      I3 => addr_reg(3),
      O => \$8\(3)
    );
\addr[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => addr_reg(4),
      I1 => addr_reg(0),
      I2 => addr_reg(1),
      I3 => addr_reg(2),
      I4 => addr_reg(3),
      O => \$8\(4)
    );
\addr[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => addr_reg(5),
      I1 => addr_reg(3),
      I2 => addr_reg(2),
      I3 => addr_reg(1),
      I4 => addr_reg(0),
      I5 => addr_reg(4),
      O => \$8\(5)
    );
\addr[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A6AAAAAA"
    )
        port map (
      I0 => addr(6),
      I1 => addr_reg(4),
      I2 => \addr[6]_i_2_n_0\,
      I3 => addr_reg(3),
      I4 => addr_reg(5),
      O => \$8\(6)
    );
\addr[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => addr_reg(0),
      I1 => addr_reg(1),
      I2 => addr_reg(2),
      O => \addr[6]_i_2_n_0\
    );
\addr[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA6AAAAAAAAAAAAA"
    )
        port map (
      I0 => addr(7),
      I1 => addr_reg(5),
      I2 => addr_reg(3),
      I3 => \addr[6]_i_2_n_0\,
      I4 => addr_reg(4),
      I5 => addr(6),
      O => \$8\(7)
    );
\addr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^$1\,
      D => \$8\(0),
      Q => addr_reg(0),
      R => \$10\
    );
\addr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^$1\,
      D => \$8\(1),
      Q => addr_reg(1),
      R => \$10\
    );
\addr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^$1\,
      D => \$8\(2),
      Q => addr_reg(2),
      R => \$10\
    );
\addr_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^$1\,
      D => \$8\(3),
      Q => addr_reg(3),
      R => \$10\
    );
\addr_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^$1\,
      D => \$8\(4),
      Q => addr_reg(4),
      R => \$10\
    );
\addr_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^$1\,
      D => \$8\(5),
      Q => addr_reg(5),
      R => \$10\
    );
\addr_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^$1\,
      D => \$8\(6),
      Q => addr(6),
      R => \$10\
    );
\addr_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^$1\,
      D => \$8\(7),
      Q => addr(7),
      R => \$10\
    );
buffer_reg_0_63_0_2: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => addr_reg(5 downto 0),
      ADDRB(5 downto 0) => addr_reg(5 downto 0),
      ADDRC(5 downto 0) => addr_reg(5 downto 0),
      ADDRD(5 downto 0) => \write_port__addr\(5 downto 0),
      DIA => \write_port__data\(0),
      DIB => \write_port__data\(1),
      DIC => \write_port__data\(2),
      DID => '0',
      DOA => buffer_reg_0_63_0_2_n_0,
      DOB => buffer_reg_0_63_0_2_n_1,
      DOC => buffer_reg_0_63_0_2_n_2,
      DOD => NLW_buffer_reg_0_63_0_2_DOD_UNCONNECTED,
      WCLK => clk,
      WE => buffer_reg_0_63_0_2_i_4_n_0
    );
buffer_reg_0_63_0_2_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \consume__data\(0),
      I1 => \^line_counter\(0),
      I2 => \^line_counter\(1),
      O => \write_port__data\(0)
    );
buffer_reg_0_63_0_2_i_10: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => addr_reg(0),
      I1 => \^line_counter\(0),
      I2 => \^line_counter\(1),
      O => \write_port__addr\(0)
    );
buffer_reg_0_63_0_2_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \consume__data\(1),
      I1 => \^line_counter\(0),
      I2 => \^line_counter\(1),
      O => \write_port__data\(1)
    );
buffer_reg_0_63_0_2_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \consume__data\(2),
      I1 => \^line_counter\(0),
      I2 => \^line_counter\(1),
      O => \write_port__data\(2)
    );
buffer_reg_0_63_0_2_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000020"
    )
        port map (
      I0 => \produce__ready\,
      I1 => buffer_reg_192_255_6_8_0,
      I2 => \consume__valid\,
      I3 => addr(6),
      I4 => \^line_counter_reg[1]_0\,
      I5 => addr(7),
      O => buffer_reg_0_63_0_2_i_4_n_0
    );
buffer_reg_0_63_0_2_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => addr_reg(5),
      I1 => \^line_counter\(0),
      I2 => \^line_counter\(1),
      O => \write_port__addr\(5)
    );
buffer_reg_0_63_0_2_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => addr_reg(4),
      I1 => \^line_counter\(0),
      I2 => \^line_counter\(1),
      O => \write_port__addr\(4)
    );
buffer_reg_0_63_0_2_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => addr_reg(3),
      I1 => \^line_counter\(0),
      I2 => \^line_counter\(1),
      O => \write_port__addr\(3)
    );
buffer_reg_0_63_0_2_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => addr_reg(2),
      I1 => \^line_counter\(0),
      I2 => \^line_counter\(1),
      O => \write_port__addr\(2)
    );
buffer_reg_0_63_0_2_i_9: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => addr_reg(1),
      I1 => \^line_counter\(0),
      I2 => \^line_counter\(1),
      O => \write_port__addr\(1)
    );
buffer_reg_0_63_3_5: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => addr_reg(5 downto 0),
      ADDRB(5 downto 0) => addr_reg(5 downto 0),
      ADDRC(5 downto 0) => addr_reg(5 downto 0),
      ADDRD(5 downto 0) => \write_port__addr\(5 downto 0),
      DIA => \write_port__data\(3),
      DIB => \write_port__data\(4),
      DIC => \write_port__data\(5),
      DID => '0',
      DOA => buffer_reg_0_63_3_5_n_0,
      DOB => buffer_reg_0_63_3_5_n_1,
      DOC => buffer_reg_0_63_3_5_n_2,
      DOD => NLW_buffer_reg_0_63_3_5_DOD_UNCONNECTED,
      WCLK => clk,
      WE => buffer_reg_0_63_0_2_i_4_n_0
    );
buffer_reg_0_63_3_5_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \consume__data\(3),
      I1 => \^line_counter\(0),
      I2 => \^line_counter\(1),
      O => \write_port__data\(3)
    );
buffer_reg_0_63_3_5_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \consume__data\(4),
      I1 => \^line_counter\(0),
      I2 => \^line_counter\(1),
      O => \write_port__data\(4)
    );
buffer_reg_0_63_3_5_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \consume__data\(5),
      I1 => \^line_counter\(0),
      I2 => \^line_counter\(1),
      O => \write_port__data\(5)
    );
buffer_reg_0_63_6_8: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => addr_reg(5 downto 0),
      ADDRB(5 downto 0) => addr_reg(5 downto 0),
      ADDRC(5 downto 0) => addr_reg(5 downto 0),
      ADDRD(5 downto 0) => \write_port__addr\(5 downto 0),
      DIA => \write_port__data\(6),
      DIB => \write_port__data\(7),
      DIC => \write_port__data\(8),
      DID => '0',
      DOA => buffer_reg_0_63_6_8_n_0,
      DOB => buffer_reg_0_63_6_8_n_1,
      DOC => buffer_reg_0_63_6_8_n_2,
      DOD => NLW_buffer_reg_0_63_6_8_DOD_UNCONNECTED,
      WCLK => clk,
      WE => buffer_reg_0_63_0_2_i_4_n_0
    );
buffer_reg_0_63_6_8_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \consume__data\(6),
      I1 => \^line_counter\(0),
      I2 => \^line_counter\(1),
      O => \write_port__data\(6)
    );
buffer_reg_0_63_6_8_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \consume__data\(7),
      I1 => \^line_counter\(0),
      I2 => \^line_counter\(1),
      O => \write_port__data\(7)
    );
buffer_reg_0_63_6_8_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \consume__data\(8),
      I1 => \^line_counter\(0),
      I2 => \^line_counter\(1),
      O => \write_port__data\(8)
    );
buffer_reg_0_63_9_11: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => addr_reg(5 downto 0),
      ADDRB(5 downto 0) => addr_reg(5 downto 0),
      ADDRC(5 downto 0) => addr_reg(5 downto 0),
      ADDRD(5 downto 0) => \write_port__addr\(5 downto 0),
      DIA => \write_port__data\(9),
      DIB => \write_port__data\(10),
      DIC => \write_port__data\(11),
      DID => '0',
      DOA => buffer_reg_0_63_9_11_n_0,
      DOB => buffer_reg_0_63_9_11_n_1,
      DOC => buffer_reg_0_63_9_11_n_2,
      DOD => NLW_buffer_reg_0_63_9_11_DOD_UNCONNECTED,
      WCLK => clk,
      WE => buffer_reg_0_63_0_2_i_4_n_0
    );
buffer_reg_0_63_9_11_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \consume__data\(9),
      I1 => \^line_counter\(0),
      I2 => \^line_counter\(1),
      O => \write_port__data\(9)
    );
buffer_reg_0_63_9_11_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \consume__data\(10),
      I1 => \^line_counter\(0),
      I2 => \^line_counter\(1),
      O => \write_port__data\(10)
    );
buffer_reg_0_63_9_11_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \consume__data\(11),
      I1 => \^line_counter\(0),
      I2 => \^line_counter\(1),
      O => \write_port__data\(11)
    );
buffer_reg_128_191_0_2: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => addr_reg(5 downto 0),
      ADDRB(5 downto 0) => addr_reg(5 downto 0),
      ADDRC(5 downto 0) => addr_reg(5 downto 0),
      ADDRD(5 downto 0) => \write_port__addr\(5 downto 0),
      DIA => \write_port__data\(0),
      DIB => \write_port__data\(1),
      DIC => \write_port__data\(2),
      DID => '0',
      DOA => buffer_reg_128_191_0_2_n_0,
      DOB => buffer_reg_128_191_0_2_n_1,
      DOC => buffer_reg_128_191_0_2_n_2,
      DOD => NLW_buffer_reg_128_191_0_2_DOD_UNCONNECTED,
      WCLK => clk,
      WE => buffer_reg_128_191_0_2_i_1_n_0
    );
buffer_reg_128_191_0_2_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000040000000000"
    )
        port map (
      I0 => addr(6),
      I1 => addr(7),
      I2 => \^line_counter_reg[1]_0\,
      I3 => \consume__valid\,
      I4 => buffer_reg_192_255_6_8_0,
      I5 => \produce__ready\,
      O => buffer_reg_128_191_0_2_i_1_n_0
    );
buffer_reg_128_191_3_5: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => addr_reg(5 downto 0),
      ADDRB(5 downto 0) => addr_reg(5 downto 0),
      ADDRC(5 downto 0) => addr_reg(5 downto 0),
      ADDRD(5 downto 0) => \write_port__addr\(5 downto 0),
      DIA => \write_port__data\(3),
      DIB => \write_port__data\(4),
      DIC => \write_port__data\(5),
      DID => '0',
      DOA => buffer_reg_128_191_3_5_n_0,
      DOB => buffer_reg_128_191_3_5_n_1,
      DOC => buffer_reg_128_191_3_5_n_2,
      DOD => NLW_buffer_reg_128_191_3_5_DOD_UNCONNECTED,
      WCLK => clk,
      WE => buffer_reg_128_191_0_2_i_1_n_0
    );
buffer_reg_128_191_6_8: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => addr_reg(5 downto 0),
      ADDRB(5 downto 0) => addr_reg(5 downto 0),
      ADDRC(5 downto 0) => addr_reg(5 downto 0),
      ADDRD(5 downto 0) => \write_port__addr\(5 downto 0),
      DIA => \write_port__data\(6),
      DIB => \write_port__data\(7),
      DIC => \write_port__data\(8),
      DID => '0',
      DOA => buffer_reg_128_191_6_8_n_0,
      DOB => buffer_reg_128_191_6_8_n_1,
      DOC => buffer_reg_128_191_6_8_n_2,
      DOD => NLW_buffer_reg_128_191_6_8_DOD_UNCONNECTED,
      WCLK => clk,
      WE => buffer_reg_128_191_0_2_i_1_n_0
    );
buffer_reg_128_191_9_11: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => addr_reg(5 downto 0),
      ADDRB(5 downto 0) => addr_reg(5 downto 0),
      ADDRC(5 downto 0) => addr_reg(5 downto 0),
      ADDRD(5 downto 0) => \write_port__addr\(5 downto 0),
      DIA => \write_port__data\(9),
      DIB => \write_port__data\(10),
      DIC => \write_port__data\(11),
      DID => '0',
      DOA => buffer_reg_128_191_9_11_n_0,
      DOB => buffer_reg_128_191_9_11_n_1,
      DOC => buffer_reg_128_191_9_11_n_2,
      DOD => NLW_buffer_reg_128_191_9_11_DOD_UNCONNECTED,
      WCLK => clk,
      WE => buffer_reg_128_191_0_2_i_1_n_0
    );
buffer_reg_192_255_0_2: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => addr_reg(5 downto 0),
      ADDRB(5 downto 0) => addr_reg(5 downto 0),
      ADDRC(5 downto 0) => addr_reg(5 downto 0),
      ADDRD(5 downto 0) => \write_port__addr\(5 downto 0),
      DIA => \write_port__data\(0),
      DIB => \write_port__data\(1),
      DIC => \write_port__data\(2),
      DID => '0',
      DOA => buffer_reg_192_255_0_2_n_0,
      DOB => buffer_reg_192_255_0_2_n_1,
      DOC => buffer_reg_192_255_0_2_n_2,
      DOD => NLW_buffer_reg_192_255_0_2_DOD_UNCONNECTED,
      WCLK => clk,
      WE => buffer_reg_192_255_0_2_i_1_n_0
    );
buffer_reg_192_255_0_2_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000200000000000"
    )
        port map (
      I0 => \produce__ready\,
      I1 => buffer_reg_192_255_6_8_0,
      I2 => \consume__valid\,
      I3 => addr(6),
      I4 => \^line_counter_reg[1]_0\,
      I5 => addr(7),
      O => buffer_reg_192_255_0_2_i_1_n_0
    );
buffer_reg_192_255_3_5: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => addr_reg(5 downto 0),
      ADDRB(5 downto 0) => addr_reg(5 downto 0),
      ADDRC(5 downto 0) => addr_reg(5 downto 0),
      ADDRD(5 downto 0) => \write_port__addr\(5 downto 0),
      DIA => \write_port__data\(3),
      DIB => \write_port__data\(4),
      DIC => \write_port__data\(5),
      DID => '0',
      DOA => buffer_reg_192_255_3_5_n_0,
      DOB => buffer_reg_192_255_3_5_n_1,
      DOC => buffer_reg_192_255_3_5_n_2,
      DOD => NLW_buffer_reg_192_255_3_5_DOD_UNCONNECTED,
      WCLK => clk,
      WE => buffer_reg_192_255_0_2_i_1_n_0
    );
buffer_reg_192_255_6_8: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => addr_reg(5 downto 0),
      ADDRB(5 downto 0) => addr_reg(5 downto 0),
      ADDRC(5 downto 0) => addr_reg(5 downto 0),
      ADDRD(5 downto 0) => \write_port__addr\(5 downto 0),
      DIA => \write_port__data\(6),
      DIB => \write_port__data\(7),
      DIC => \write_port__data\(8),
      DID => '0',
      DOA => buffer_reg_192_255_6_8_n_0,
      DOB => buffer_reg_192_255_6_8_n_1,
      DOC => buffer_reg_192_255_6_8_n_2,
      DOD => NLW_buffer_reg_192_255_6_8_DOD_UNCONNECTED,
      WCLK => clk,
      WE => buffer_reg_192_255_0_2_i_1_n_0
    );
buffer_reg_192_255_9_11: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => addr_reg(5 downto 0),
      ADDRB(5 downto 0) => addr_reg(5 downto 0),
      ADDRC(5 downto 0) => addr_reg(5 downto 0),
      ADDRD(5 downto 0) => \write_port__addr\(5 downto 0),
      DIA => \write_port__data\(9),
      DIB => \write_port__data\(10),
      DIC => \write_port__data\(11),
      DID => '0',
      DOA => buffer_reg_192_255_9_11_n_0,
      DOB => buffer_reg_192_255_9_11_n_1,
      DOC => buffer_reg_192_255_9_11_n_2,
      DOD => NLW_buffer_reg_192_255_9_11_DOD_UNCONNECTED,
      WCLK => clk,
      WE => buffer_reg_192_255_0_2_i_1_n_0
    );
buffer_reg_64_127_0_2: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => addr_reg(5 downto 0),
      ADDRB(5 downto 0) => addr_reg(5 downto 0),
      ADDRC(5 downto 0) => addr_reg(5 downto 0),
      ADDRD(5 downto 0) => \write_port__addr\(5 downto 0),
      DIA => \write_port__data\(0),
      DIB => \write_port__data\(1),
      DIC => \write_port__data\(2),
      DID => '0',
      DOA => buffer_reg_64_127_0_2_n_0,
      DOB => buffer_reg_64_127_0_2_n_1,
      DOC => buffer_reg_64_127_0_2_n_2,
      DOD => NLW_buffer_reg_64_127_0_2_DOD_UNCONNECTED,
      WCLK => clk,
      WE => buffer_reg_64_127_0_2_i_1_n_0
    );
buffer_reg_64_127_0_2_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000040000000000"
    )
        port map (
      I0 => addr(7),
      I1 => addr(6),
      I2 => \^line_counter_reg[1]_0\,
      I3 => \consume__valid\,
      I4 => buffer_reg_192_255_6_8_0,
      I5 => \produce__ready\,
      O => buffer_reg_64_127_0_2_i_1_n_0
    );
buffer_reg_64_127_3_5: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => addr_reg(5 downto 0),
      ADDRB(5 downto 0) => addr_reg(5 downto 0),
      ADDRC(5 downto 0) => addr_reg(5 downto 0),
      ADDRD(5 downto 0) => \write_port__addr\(5 downto 0),
      DIA => \write_port__data\(3),
      DIB => \write_port__data\(4),
      DIC => \write_port__data\(5),
      DID => '0',
      DOA => buffer_reg_64_127_3_5_n_0,
      DOB => buffer_reg_64_127_3_5_n_1,
      DOC => buffer_reg_64_127_3_5_n_2,
      DOD => NLW_buffer_reg_64_127_3_5_DOD_UNCONNECTED,
      WCLK => clk,
      WE => buffer_reg_64_127_0_2_i_1_n_0
    );
buffer_reg_64_127_6_8: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => addr_reg(5 downto 0),
      ADDRB(5 downto 0) => addr_reg(5 downto 0),
      ADDRC(5 downto 0) => addr_reg(5 downto 0),
      ADDRD(5 downto 0) => \write_port__addr\(5 downto 0),
      DIA => \write_port__data\(6),
      DIB => \write_port__data\(7),
      DIC => \write_port__data\(8),
      DID => '0',
      DOA => buffer_reg_64_127_6_8_n_0,
      DOB => buffer_reg_64_127_6_8_n_1,
      DOC => buffer_reg_64_127_6_8_n_2,
      DOD => NLW_buffer_reg_64_127_6_8_DOD_UNCONNECTED,
      WCLK => clk,
      WE => buffer_reg_64_127_0_2_i_1_n_0
    );
buffer_reg_64_127_9_11: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => addr_reg(5 downto 0),
      ADDRB(5 downto 0) => addr_reg(5 downto 0),
      ADDRC(5 downto 0) => addr_reg(5 downto 0),
      ADDRD(5 downto 0) => \write_port__addr\(5 downto 0),
      DIA => \write_port__data\(9),
      DIB => \write_port__data\(10),
      DIC => \write_port__data\(11),
      DID => '0',
      DOA => buffer_reg_64_127_9_11_n_0,
      DOB => buffer_reg_64_127_9_11_n_1,
      DOC => buffer_reg_64_127_9_11_n_2,
      DOD => NLW_buffer_reg_64_127_9_11_DOD_UNCONNECTED,
      WCLK => clk,
      WE => buffer_reg_64_127_0_2_i_1_n_0
    );
\consume__ready_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => \^line_counter\(0),
      I1 => \^line_counter\(1),
      I2 => \produce__ready\,
      I3 => \addr_reg[7]_0\,
      I4 => \addr_reg[7]_1\,
      O => \consume__ready\
    );
\counter[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^line_counter\(1),
      I1 => \^line_counter\(0),
      O => \^line_counter_reg[1]_0\
    );
\data_reg[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000FE00"
    )
        port map (
      I0 => \^line_counter\(1),
      I1 => \^line_counter\(0),
      I2 => \consume__valid\,
      I3 => \produce__ready\,
      I4 => \addr_reg[7]_0\,
      I5 => \addr_reg[7]_1\,
      O => \^$1\
    );
\line_counter[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^line_counter\(0),
      I1 => rst,
      I2 => \line_counter[1]_i_2_n_0\,
      O => \line_counter[0]_i_1_n_0\
    );
\line_counter[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"060C"
    )
        port map (
      I0 => \^line_counter\(0),
      I1 => \^line_counter\(1),
      I2 => rst,
      I3 => \line_counter[1]_i_2_n_0\,
      O => \line_counter[1]_i_1_n_0\
    );
\line_counter[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000080"
    )
        port map (
      I0 => \^$1\,
      I1 => addr(7),
      I2 => addr(6),
      I3 => addr_reg(5),
      I4 => addr_reg(4),
      I5 => \line_counter[1]_i_3_n_0\,
      O => \line_counter[1]_i_2_n_0\
    );
\line_counter[1]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BFFF"
    )
        port map (
      I0 => addr_reg(3),
      I1 => addr_reg(2),
      I2 => addr_reg(1),
      I3 => addr_reg(0),
      O => \line_counter[1]_i_3_n_0\
    );
\line_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \line_counter[0]_i_1_n_0\,
      Q => \^line_counter\(0),
      R => '0'
    );
\line_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \line_counter[1]_i_1_n_0\,
      Q => \^line_counter\(1),
      R => '0'
    );
\produce__data[0]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \read_port__data\(0),
      I1 => \^line_counter\(1),
      I2 => \^line_counter\(0),
      I3 => \consume__data\(0),
      O => D(0)
    );
\produce__data[0]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_reg_192_255_0_2_n_0,
      I1 => buffer_reg_128_191_0_2_n_0,
      I2 => addr(7),
      I3 => buffer_reg_64_127_0_2_n_0,
      I4 => addr(6),
      I5 => buffer_reg_0_63_0_2_n_0,
      O => \read_port__data\(0)
    );
\produce__data[10]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \read_port__data\(10),
      I1 => \^line_counter\(1),
      I2 => \^line_counter\(0),
      I3 => \consume__data\(10),
      O => D(10)
    );
\produce__data[10]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_reg_192_255_9_11_n_1,
      I1 => buffer_reg_128_191_9_11_n_1,
      I2 => addr(7),
      I3 => buffer_reg_64_127_9_11_n_1,
      I4 => addr(6),
      I5 => buffer_reg_0_63_9_11_n_1,
      O => \read_port__data\(10)
    );
\produce__data[11]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \read_port__data\(11),
      I1 => \^line_counter\(1),
      I2 => \^line_counter\(0),
      I3 => \consume__data\(11),
      O => D(11)
    );
\produce__data[11]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_reg_192_255_9_11_n_2,
      I1 => buffer_reg_128_191_9_11_n_2,
      I2 => addr(7),
      I3 => buffer_reg_64_127_9_11_n_2,
      I4 => addr(6),
      I5 => buffer_reg_0_63_9_11_n_2,
      O => \read_port__data\(11)
    );
\produce__data[1]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \read_port__data\(1),
      I1 => \^line_counter\(1),
      I2 => \^line_counter\(0),
      I3 => \consume__data\(1),
      O => D(1)
    );
\produce__data[1]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_reg_192_255_0_2_n_1,
      I1 => buffer_reg_128_191_0_2_n_1,
      I2 => addr(7),
      I3 => buffer_reg_64_127_0_2_n_1,
      I4 => addr(6),
      I5 => buffer_reg_0_63_0_2_n_1,
      O => \read_port__data\(1)
    );
\produce__data[2]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \read_port__data\(2),
      I1 => \^line_counter\(1),
      I2 => \^line_counter\(0),
      I3 => \consume__data\(2),
      O => D(2)
    );
\produce__data[2]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_reg_192_255_0_2_n_2,
      I1 => buffer_reg_128_191_0_2_n_2,
      I2 => addr(7),
      I3 => buffer_reg_64_127_0_2_n_2,
      I4 => addr(6),
      I5 => buffer_reg_0_63_0_2_n_2,
      O => \read_port__data\(2)
    );
\produce__data[3]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \read_port__data\(3),
      I1 => \^line_counter\(1),
      I2 => \^line_counter\(0),
      I3 => \consume__data\(3),
      O => D(3)
    );
\produce__data[3]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_reg_192_255_3_5_n_0,
      I1 => buffer_reg_128_191_3_5_n_0,
      I2 => addr(7),
      I3 => buffer_reg_64_127_3_5_n_0,
      I4 => addr(6),
      I5 => buffer_reg_0_63_3_5_n_0,
      O => \read_port__data\(3)
    );
\produce__data[4]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \read_port__data\(4),
      I1 => \^line_counter\(1),
      I2 => \^line_counter\(0),
      I3 => \consume__data\(4),
      O => D(4)
    );
\produce__data[4]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_reg_192_255_3_5_n_1,
      I1 => buffer_reg_128_191_3_5_n_1,
      I2 => addr(7),
      I3 => buffer_reg_64_127_3_5_n_1,
      I4 => addr(6),
      I5 => buffer_reg_0_63_3_5_n_1,
      O => \read_port__data\(4)
    );
\produce__data[5]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \read_port__data\(5),
      I1 => \^line_counter\(1),
      I2 => \^line_counter\(0),
      I3 => \consume__data\(5),
      O => D(5)
    );
\produce__data[5]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_reg_192_255_3_5_n_2,
      I1 => buffer_reg_128_191_3_5_n_2,
      I2 => addr(7),
      I3 => buffer_reg_64_127_3_5_n_2,
      I4 => addr(6),
      I5 => buffer_reg_0_63_3_5_n_2,
      O => \read_port__data\(5)
    );
\produce__data[6]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \read_port__data\(6),
      I1 => \^line_counter\(1),
      I2 => \^line_counter\(0),
      I3 => \consume__data\(6),
      O => D(6)
    );
\produce__data[6]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_reg_192_255_6_8_n_0,
      I1 => buffer_reg_128_191_6_8_n_0,
      I2 => addr(7),
      I3 => buffer_reg_64_127_6_8_n_0,
      I4 => addr(6),
      I5 => buffer_reg_0_63_6_8_n_0,
      O => \read_port__data\(6)
    );
\produce__data[7]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \read_port__data\(7),
      I1 => \^line_counter\(1),
      I2 => \^line_counter\(0),
      I3 => \consume__data\(7),
      O => D(7)
    );
\produce__data[7]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_reg_192_255_6_8_n_1,
      I1 => buffer_reg_128_191_6_8_n_1,
      I2 => addr(7),
      I3 => buffer_reg_64_127_6_8_n_1,
      I4 => addr(6),
      I5 => buffer_reg_0_63_6_8_n_1,
      O => \read_port__data\(7)
    );
\produce__data[8]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \read_port__data\(8),
      I1 => \^line_counter\(1),
      I2 => \^line_counter\(0),
      I3 => \consume__data\(8),
      O => D(8)
    );
\produce__data[8]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_reg_192_255_6_8_n_2,
      I1 => buffer_reg_128_191_6_8_n_2,
      I2 => addr(7),
      I3 => buffer_reg_64_127_6_8_n_2,
      I4 => addr(6),
      I5 => buffer_reg_0_63_6_8_n_2,
      O => \read_port__data\(8)
    );
\produce__data[9]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \read_port__data\(9),
      I1 => \^line_counter\(1),
      I2 => \^line_counter\(0),
      I3 => \consume__data\(9),
      O => D(9)
    );
\produce__data[9]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_reg_192_255_9_11_n_0,
      I1 => buffer_reg_128_191_9_11_n_0,
      I2 => addr(7),
      I3 => buffer_reg_64_127_9_11_n_0,
      I4 => addr(6),
      I5 => buffer_reg_0_63_9_11_n_0,
      O => \read_port__data\(9)
    );
\produce__valid_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \^line_counter\(1),
      I1 => \^line_counter\(0),
      I2 => \consume__valid\,
      I3 => \addr_reg[7]_1\,
      I4 => \addr_reg[7]_0\,
      O => \produce__valid\
    );
sync_flag_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000DDDDD000"
    )
        port map (
      I0 => \line_counter[1]_i_2_n_0\,
      I1 => sync_flag_i_2_n_0,
      I2 => \consume__vsync\,
      I3 => \write_port__en\,
      I4 => sync_flag,
      I5 => rst,
      O => sync_flag_i_1_n_0
    );
sync_flag_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \^line_counter\(0),
      I1 => \^line_counter\(1),
      I2 => sync_flag,
      O => sync_flag_i_2_n_0
    );
sync_flag_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => sync_flag_i_1_n_0,
      Q => sync_flag,
      R => '0'
    );
sync_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => sync_reg_i_2_n_0,
      I1 => sync_flag,
      I2 => \^line_counter\(1),
      I3 => \^line_counter\(0),
      O => \consume__vsync$14\
    );
sync_reg_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFFFFFFFFFF"
    )
        port map (
      I0 => \addr[6]_i_2_n_0\,
      I1 => addr_reg(3),
      I2 => addr_reg(4),
      I3 => addr_reg(5),
      I4 => addr(6),
      I5 => addr(7),
      O => sync_reg_i_2_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample\ is
  port (
    \produce__data\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \consume__ready\ : out STD_LOGIC;
    \produce__valid\ : out STD_LOGIC;
    \produce__vsync\ : out STD_LOGIC;
    \consume__valid\ : in STD_LOGIC;
    \produce__ready\ : in STD_LOGIC;
    rst : in STD_LOGIC;
    clk : in STD_LOGIC;
    \consume__data\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \consume__vsync\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample\ : entity is "lcd_to_vga.upsample";
end \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample\;

architecture STRUCTURE of \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample\ is
  signal \$1\ : STD_LOGIC;
  signal \consume__vsync$14\ : STD_LOGIC;
  signal hor_n_12 : STD_LOGIC;
  signal hor_n_13 : STD_LOGIC;
  signal hor_n_15 : STD_LOGIC;
  signal line_counter : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ver_n_1 : STD_LOGIC;
  signal ver_n_10 : STD_LOGIC;
  signal ver_n_11 : STD_LOGIC;
  signal ver_n_12 : STD_LOGIC;
  signal ver_n_15 : STD_LOGIC;
  signal ver_n_2 : STD_LOGIC;
  signal ver_n_3 : STD_LOGIC;
  signal ver_n_4 : STD_LOGIC;
  signal ver_n_5 : STD_LOGIC;
  signal ver_n_6 : STD_LOGIC;
  signal ver_n_7 : STD_LOGIC;
  signal ver_n_8 : STD_LOGIC;
  signal ver_n_9 : STD_LOGIC;
  signal \write_port__en\ : STD_LOGIC;
begin
hor: entity work.\display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.hor\
     port map (
      \$1\ => \$1\,
      D(11) => ver_n_1,
      D(10) => ver_n_2,
      D(9) => ver_n_3,
      D(8) => ver_n_4,
      D(7) => ver_n_5,
      D(6) => ver_n_6,
      D(5) => ver_n_7,
      D(4) => ver_n_8,
      D(3) => ver_n_9,
      D(2) => ver_n_10,
      D(1) => ver_n_11,
      D(0) => ver_n_12,
      clk => clk,
      \consume__valid\ => \consume__valid\,
      \consume__vsync$14\ => \consume__vsync$14\,
      \counter_reg[0]_0\ => hor_n_13,
      \counter_reg[0]_1\ => ver_n_15,
      \counter_reg[1]_0\ => hor_n_12,
      \counter_reg[1]_1\ => hor_n_15,
      line_counter(1 downto 0) => line_counter(1 downto 0),
      \produce__data\(11 downto 0) => \produce__data\(11 downto 0),
      \produce__ready\ => \produce__ready\,
      \produce__vsync\ => \produce__vsync\,
      rst => rst,
      \write_port__en\ => \write_port__en\
    );
ver: entity work.\display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.ver\
     port map (
      \$1\ => \$1\,
      D(11) => ver_n_1,
      D(10) => ver_n_2,
      D(9) => ver_n_3,
      D(8) => ver_n_4,
      D(7) => ver_n_5,
      D(6) => ver_n_6,
      D(5) => ver_n_7,
      D(4) => ver_n_8,
      D(3) => ver_n_9,
      D(2) => ver_n_10,
      D(1) => ver_n_11,
      D(0) => ver_n_12,
      \addr_reg[7]_0\ => hor_n_12,
      \addr_reg[7]_1\ => hor_n_13,
      buffer_reg_192_255_6_8_0 => hor_n_15,
      clk => clk,
      \consume__data\(11 downto 0) => \consume__data\(11 downto 0),
      \consume__ready\ => \consume__ready\,
      \consume__valid\ => \consume__valid\,
      \consume__vsync\ => \consume__vsync\,
      \consume__vsync$14\ => \consume__vsync$14\,
      line_counter(1 downto 0) => line_counter(1 downto 0),
      \line_counter_reg[1]_0\ => ver_n_15,
      \produce__ready\ => \produce__ready\,
      \produce__valid\ => \produce__valid\,
      rst => rst,
      \write_port__en\ => \write_port__en\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity display_driver_lcd_to_vga_0_0_lcd_to_vga is
  port (
    \produce__data\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \consume__ready\ : out STD_LOGIC;
    \produce__valid\ : out STD_LOGIC;
    \produce__vsync\ : out STD_LOGIC;
    \consume__valid\ : in STD_LOGIC;
    \produce__ready\ : in STD_LOGIC;
    rst : in STD_LOGIC;
    clk : in STD_LOGIC;
    \consume__data\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \consume__vsync\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of display_driver_lcd_to_vga_0_0_lcd_to_vga : entity is "lcd_to_vga";
end display_driver_lcd_to_vga_0_0_lcd_to_vga;

architecture STRUCTURE of display_driver_lcd_to_vga_0_0_lcd_to_vga is
begin
upsample: entity work.\display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample\
     port map (
      clk => clk,
      \consume__data\(11 downto 0) => \consume__data\(11 downto 0),
      \consume__ready\ => \consume__ready\,
      \consume__valid\ => \consume__valid\,
      \consume__vsync\ => \consume__vsync\,
      \produce__data\(11 downto 0) => \produce__data\(11 downto 0),
      \produce__ready\ => \produce__ready\,
      \produce__valid\ => \produce__valid\,
      \produce__vsync\ => \produce__vsync\,
      rst => rst
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity display_driver_lcd_to_vga_0_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of display_driver_lcd_to_vga_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of display_driver_lcd_to_vga_0_0 : entity is "display_driver_lcd_to_vga_0_0,lcd_to_vga,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of display_driver_lcd_to_vga_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of display_driver_lcd_to_vga_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of display_driver_lcd_to_vga_0_0 : entity is "lcd_to_vga,Vivado 2024.1";
end display_driver_lcd_to_vga_0_0;

architecture STRUCTURE of display_driver_lcd_to_vga_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 120000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  attribute src : string;
  attribute src of clk : signal is "C:\Users\magen\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\LocalCache\local-packages\Python311\site-packages\amaranth\hdl\_ir.py:283";
  attribute src of \consume__valid\ : signal is "C:\Users\magen\Documents\Programs\gameboy\ppu\signature.py:18";
  attribute src of \consume__vsync\ : signal is "C:\Users\magen\Documents\Programs\gameboy\ppu\signature.py:20";
  attribute src of \produce__ready\ : signal is "C:\Users\magen\Documents\Programs\gameboy\ppu\signature.py:19";
  attribute X_INTERFACE_INFO of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute X_INTERFACE_PARAMETER of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute src of rst : signal is "C:\Users\magen\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\LocalCache\local-packages\Python311\site-packages\amaranth\hdl\_ir.py:283";
  attribute src of \consume__data\ : signal is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:185";
begin
inst: entity work.display_driver_lcd_to_vga_0_0_lcd_to_vga
     port map (
      clk => clk,
      \consume__data\(11 downto 0) => \consume__data\(11 downto 0),
      \consume__ready\ => \consume__ready\,
      \consume__valid\ => \consume__valid\,
      \consume__vsync\ => \consume__vsync\,
      \produce__data\(11 downto 0) => \produce__data\(11 downto 0),
      \produce__ready\ => \produce__ready\,
      \produce__valid\ => \produce__valid\,
      \produce__vsync\ => \produce__vsync\,
      rst => rst
    );
end STRUCTURE;
