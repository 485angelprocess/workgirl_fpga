-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Sun Mar  9 13:11:46 2025
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
entity \display_driver_lcd_to_vga_0_0_lcd_to_vga.border.hor\ is
  port (
    \produce__ready_0\ : out STD_LOGIC;
    sync_reg_reg_0 : out STD_LOGIC;
    \counter_reg[7]_0\ : out STD_LOGIC;
    \counter_reg[5]_0\ : out STD_LOGIC;
    clk : in STD_LOGIC;
    \produce__ready\ : in STD_LOGIC;
    \pix_counter_reg[14]\ : in STD_LOGIC;
    rst : in STD_LOGIC;
    sync_reg_reg_1 : in STD_LOGIC;
    sync_reg_reg_2 : in STD_LOGIC;
    \$7\ : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \display_driver_lcd_to_vga_0_0_lcd_to_vga.border.hor\ : entity is "lcd_to_vga.border.hor";
end \display_driver_lcd_to_vga_0_0_lcd_to_vga.border.hor\;

architecture STRUCTURE of \display_driver_lcd_to_vga_0_0_lcd_to_vga.border.hor\ is
  signal \$5\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \counter[5]_i_1_n_0\ : STD_LOGIC;
  signal \counter[9]_i_5_n_0\ : STD_LOGIC;
  signal counter_reg : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \^counter_reg[7]_0\ : STD_LOGIC;
  signal \pix_counter[14]_i_8_n_0\ : STD_LOGIC;
  signal \pix_counter[14]_i_9_n_0\ : STD_LOGIC;
  signal sync_reg : STD_LOGIC;
  signal \sync_reg_i_1__0_n_0\ : STD_LOGIC;
  signal \^sync_reg_reg_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \counter[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \counter[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \counter[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \counter[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \counter[4]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \counter[7]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \counter[8]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \counter[9]_i_5\ : label is "soft_lutpair0";
  attribute src : string;
  attribute src of \counter_reg[0]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:217";
  attribute src of \counter_reg[1]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:217";
  attribute src of \counter_reg[2]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:217";
  attribute src of \counter_reg[3]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:217";
  attribute src of \counter_reg[4]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:217";
  attribute src of \counter_reg[5]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:217";
  attribute src of \counter_reg[6]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:217";
  attribute src of \counter_reg[7]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:217";
  attribute src of \counter_reg[8]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:217";
  attribute src of \counter_reg[9]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:217";
  attribute src of sync_reg_reg : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:216";
begin
  \counter_reg[7]_0\ <= \^counter_reg[7]_0\;
  sync_reg_reg_0 <= \^sync_reg_reg_0\;
\consume__ready_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C8C1C8C1C8C1C1C1"
    )
        port map (
      I0 => counter_reg(7),
      I1 => counter_reg(9),
      I2 => counter_reg(8),
      I3 => counter_reg(6),
      I4 => counter_reg(5),
      I5 => counter_reg(4),
      O => \^counter_reg[7]_0\
    );
\counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(0),
      O => \$5\(0)
    );
\counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => counter_reg(0),
      I1 => counter_reg(1),
      O => \$5\(1)
    );
\counter[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => counter_reg(2),
      I1 => counter_reg(0),
      I2 => counter_reg(1),
      O => \$5\(2)
    );
\counter[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => counter_reg(3),
      I1 => counter_reg(1),
      I2 => counter_reg(0),
      I3 => counter_reg(2),
      O => \$5\(3)
    );
\counter[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => counter_reg(4),
      I1 => counter_reg(2),
      I2 => counter_reg(0),
      I3 => counter_reg(1),
      I4 => counter_reg(3),
      O => \$5\(4)
    );
\counter[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => counter_reg(5),
      I1 => counter_reg(4),
      I2 => counter_reg(2),
      I3 => counter_reg(0),
      I4 => counter_reg(1),
      I5 => counter_reg(3),
      O => \counter[5]_i_1_n_0\
    );
\counter[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => counter_reg(6),
      I1 => \counter[9]_i_5_n_0\,
      I2 => counter_reg(5),
      O => \$5\(6)
    );
\counter[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9AAA"
    )
        port map (
      I0 => counter_reg(7),
      I1 => \counter[9]_i_5_n_0\,
      I2 => counter_reg(5),
      I3 => counter_reg(6),
      O => \$5\(7)
    );
\counter[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA6AAAAA"
    )
        port map (
      I0 => counter_reg(8),
      I1 => counter_reg(6),
      I2 => counter_reg(5),
      I3 => \counter[9]_i_5_n_0\,
      I4 => counter_reg(7),
      O => \$5\(8)
    );
\counter[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A6AAAAAAAAAAAAAA"
    )
        port map (
      I0 => counter_reg(9),
      I1 => counter_reg(7),
      I2 => \counter[9]_i_5_n_0\,
      I3 => counter_reg(5),
      I4 => counter_reg(6),
      I5 => counter_reg(8),
      O => \$5\(9)
    );
\counter[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFFFFFFFFFF"
    )
        port map (
      I0 => \counter[9]_i_5_n_0\,
      I1 => counter_reg(5),
      I2 => counter_reg(6),
      I3 => counter_reg(7),
      I4 => counter_reg(8),
      I5 => counter_reg(9),
      O => \counter_reg[5]_0\
    );
\counter[9]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => counter_reg(3),
      I1 => counter_reg(1),
      I2 => counter_reg(0),
      I3 => counter_reg(2),
      I4 => counter_reg(4),
      O => \counter[9]_i_5_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => E(0),
      D => \$5\(0),
      Q => counter_reg(0),
      R => SR(0)
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => E(0),
      D => \$5\(1),
      Q => counter_reg(1),
      R => SR(0)
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => E(0),
      D => \$5\(2),
      Q => counter_reg(2),
      R => SR(0)
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => E(0),
      D => \$5\(3),
      Q => counter_reg(3),
      R => SR(0)
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => E(0),
      D => \$5\(4),
      Q => counter_reg(4),
      R => SR(0)
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => E(0),
      D => \counter[5]_i_1_n_0\,
      Q => counter_reg(5),
      R => SR(0)
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => E(0),
      D => \$5\(6),
      Q => counter_reg(6),
      R => SR(0)
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => E(0),
      D => \$5\(7),
      Q => counter_reg(7),
      R => SR(0)
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => E(0),
      D => \$5\(8),
      Q => counter_reg(8),
      R => SR(0)
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => E(0),
      D => \$5\(9),
      Q => counter_reg(9),
      R => SR(0)
    );
\pix_counter[14]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFAE"
    )
        port map (
      I0 => \^sync_reg_reg_0\,
      I1 => \produce__ready\,
      I2 => \pix_counter_reg[14]\,
      I3 => rst,
      O => \produce__ready_0\
    );
\pix_counter[14]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000000A2"
    )
        port map (
      I0 => sync_reg,
      I1 => sync_reg_reg_1,
      I2 => \^counter_reg[7]_0\,
      I3 => sync_reg_reg_2,
      I4 => \pix_counter[14]_i_8_n_0\,
      I5 => \pix_counter[14]_i_9_n_0\,
      O => \^sync_reg_reg_0\
    );
\pix_counter[14]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFFFFFFFFFF"
    )
        port map (
      I0 => counter_reg(5),
      I1 => counter_reg(4),
      I2 => counter_reg(2),
      I3 => counter_reg(0),
      I4 => counter_reg(1),
      I5 => counter_reg(3),
      O => \pix_counter[14]_i_8_n_0\
    );
\pix_counter[14]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => counter_reg(9),
      I1 => counter_reg(8),
      I2 => counter_reg(7),
      I3 => counter_reg(6),
      O => \pix_counter[14]_i_9_n_0\
    );
\sync_reg_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00F2"
    )
        port map (
      I0 => sync_reg,
      I1 => \^sync_reg_reg_0\,
      I2 => \$7\,
      I3 => rst,
      O => \sync_reg_i_1__0_n_0\
    );
sync_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \sync_reg_i_1__0_n_0\,
      Q => sync_reg,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \display_driver_lcd_to_vga_0_0_lcd_to_vga.border.ver\ is
  port (
    active_reg_0 : out STD_LOGIC;
    active_reg_1 : out STD_LOGIC;
    \produce__ready_0\ : out STD_LOGIC;
    active_reg_2 : out STD_LOGIC;
    \produce__vsync\ : out STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    \produce__ready\ : in STD_LOGIC;
    \pix_counter_reg[0]_0\ : in STD_LOGIC;
    \produce__valid\ : in STD_LOGIC;
    \pix_counter_reg[14]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \display_driver_lcd_to_vga_0_0_lcd_to_vga.border.ver\ : entity is "lcd_to_vga.border.ver";
end \display_driver_lcd_to_vga_0_0_lcd_to_vga.border.ver\;

architecture STRUCTURE of \display_driver_lcd_to_vga_0_0_lcd_to_vga.border.ver\ is
  signal \$4_carry__0_n_0\ : STD_LOGIC;
  signal \$4_carry__0_n_1\ : STD_LOGIC;
  signal \$4_carry__0_n_2\ : STD_LOGIC;
  signal \$4_carry__0_n_3\ : STD_LOGIC;
  signal \$4_carry__1_n_0\ : STD_LOGIC;
  signal \$4_carry__1_n_1\ : STD_LOGIC;
  signal \$4_carry__1_n_2\ : STD_LOGIC;
  signal \$4_carry__1_n_3\ : STD_LOGIC;
  signal \$4_carry__2_n_3\ : STD_LOGIC;
  signal \$4_carry_n_0\ : STD_LOGIC;
  signal \$4_carry_n_1\ : STD_LOGIC;
  signal \$4_carry_n_2\ : STD_LOGIC;
  signal \$4_carry_n_3\ : STD_LOGIC;
  signal active_i_1_n_0 : STD_LOGIC;
  signal \^active_reg_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 14 downto 1 );
  signal pix_counter : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal \pix_counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \pix_counter[10]_i_1_n_0\ : STD_LOGIC;
  signal \pix_counter[11]_i_1_n_0\ : STD_LOGIC;
  signal \pix_counter[12]_i_1_n_0\ : STD_LOGIC;
  signal \pix_counter[13]_i_1_n_0\ : STD_LOGIC;
  signal \pix_counter[14]_i_10_n_0\ : STD_LOGIC;
  signal \pix_counter[14]_i_11_n_0\ : STD_LOGIC;
  signal \pix_counter[14]_i_1_n_0\ : STD_LOGIC;
  signal \pix_counter[14]_i_3_n_0\ : STD_LOGIC;
  signal \pix_counter[14]_i_5_n_0\ : STD_LOGIC;
  signal \pix_counter[1]_i_1_n_0\ : STD_LOGIC;
  signal \pix_counter[2]_i_1_n_0\ : STD_LOGIC;
  signal \pix_counter[3]_i_1_n_0\ : STD_LOGIC;
  signal \pix_counter[4]_i_1_n_0\ : STD_LOGIC;
  signal \pix_counter[5]_i_1_n_0\ : STD_LOGIC;
  signal \pix_counter[6]_i_1_n_0\ : STD_LOGIC;
  signal \pix_counter[7]_i_1_n_0\ : STD_LOGIC;
  signal \pix_counter[8]_i_1_n_0\ : STD_LOGIC;
  signal \pix_counter[9]_i_1_n_0\ : STD_LOGIC;
  signal \produce__vsync_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \produce__vsync_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \produce__vsync_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \NLW_$4_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_$4_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \$4_carry\ : label is 35;
  attribute ADDER_THRESHOLD of \$4_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \$4_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \$4_carry__2\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of active_i_1 : label is "soft_lutpair4";
  attribute src : string;
  attribute src of active_reg : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:273";
  attribute SOFT_HLUTNM of \counter[1]_i_2\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \pix_counter[10]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \pix_counter[11]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \pix_counter[12]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \pix_counter[13]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \pix_counter[14]_i_3\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \pix_counter[14]_i_7\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \pix_counter[1]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \pix_counter[2]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \pix_counter[3]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \pix_counter[4]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \pix_counter[5]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \pix_counter[6]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \pix_counter[7]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \pix_counter[8]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \pix_counter[9]_i_1\ : label is "soft_lutpair9";
  attribute src of \pix_counter_reg[0]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:274";
  attribute src of \pix_counter_reg[10]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:274";
  attribute src of \pix_counter_reg[11]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:274";
  attribute src of \pix_counter_reg[12]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:274";
  attribute src of \pix_counter_reg[13]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:274";
  attribute src of \pix_counter_reg[14]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:274";
  attribute src of \pix_counter_reg[1]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:274";
  attribute src of \pix_counter_reg[2]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:274";
  attribute src of \pix_counter_reg[3]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:274";
  attribute src of \pix_counter_reg[4]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:274";
  attribute src of \pix_counter_reg[5]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:274";
  attribute src of \pix_counter_reg[6]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:274";
  attribute src of \pix_counter_reg[7]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:274";
  attribute src of \pix_counter_reg[8]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:274";
  attribute src of \pix_counter_reg[9]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:274";
  attribute SOFT_HLUTNM of \produce__data[11]_INST_0_i_1\ : label is "soft_lutpair12";
begin
  active_reg_0 <= \^active_reg_0\;
\$4_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \$4_carry_n_0\,
      CO(2) => \$4_carry_n_1\,
      CO(1) => \$4_carry_n_2\,
      CO(0) => \$4_carry_n_3\,
      CYINIT => pix_counter(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(4 downto 1),
      S(3 downto 0) => pix_counter(4 downto 1)
    );
\$4_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \$4_carry_n_0\,
      CO(3) => \$4_carry__0_n_0\,
      CO(2) => \$4_carry__0_n_1\,
      CO(1) => \$4_carry__0_n_2\,
      CO(0) => \$4_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(8 downto 5),
      S(3 downto 0) => pix_counter(8 downto 5)
    );
\$4_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \$4_carry__0_n_0\,
      CO(3) => \$4_carry__1_n_0\,
      CO(2) => \$4_carry__1_n_1\,
      CO(1) => \$4_carry__1_n_2\,
      CO(0) => \$4_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(12 downto 9),
      S(3 downto 0) => pix_counter(12 downto 9)
    );
\$4_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \$4_carry__1_n_0\,
      CO(3 downto 1) => \NLW_$4_carry__2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \$4_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_$4_carry__2_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => p_0_in(14 downto 13),
      S(3 downto 2) => B"00",
      S(1 downto 0) => pix_counter(14 downto 13)
    );
active_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000004AE"
    )
        port map (
      I0 => \^active_reg_0\,
      I1 => \produce__ready\,
      I2 => \pix_counter[14]_i_5_n_0\,
      I3 => \pix_counter_reg[0]_0\,
      I4 => rst,
      O => active_i_1_n_0
    );
active_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => active_i_1_n_0,
      Q => \^active_reg_0\,
      R => '0'
    );
\counter[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F7"
    )
        port map (
      I0 => \^active_reg_0\,
      I1 => \produce__ready\,
      I2 => \produce__valid\,
      O => active_reg_1
    );
\pix_counter[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0051000C"
    )
        port map (
      I0 => \pix_counter_reg[0]_0\,
      I1 => \produce__ready\,
      I2 => \^active_reg_0\,
      I3 => rst,
      I4 => pix_counter(0),
      O => \pix_counter[0]_i_1_n_0\
    );
\pix_counter[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => p_0_in(10),
      I1 => \produce__ready\,
      I2 => \^active_reg_0\,
      I3 => rst,
      O => \pix_counter[10]_i_1_n_0\
    );
\pix_counter[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => p_0_in(11),
      I1 => \produce__ready\,
      I2 => \^active_reg_0\,
      I3 => rst,
      O => \pix_counter[11]_i_1_n_0\
    );
\pix_counter[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => p_0_in(12),
      I1 => \produce__ready\,
      I2 => \^active_reg_0\,
      I3 => rst,
      O => \pix_counter[12]_i_1_n_0\
    );
\pix_counter[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => p_0_in(13),
      I1 => \produce__ready\,
      I2 => \^active_reg_0\,
      I3 => rst,
      O => \pix_counter[13]_i_1_n_0\
    );
\pix_counter[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFBA"
    )
        port map (
      I0 => rst,
      I1 => \^active_reg_0\,
      I2 => \produce__ready\,
      I3 => \pix_counter_reg[0]_0\,
      I4 => \pix_counter[14]_i_5_n_0\,
      O => \pix_counter[14]_i_1_n_0\
    );
\pix_counter[14]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => pix_counter(4),
      I1 => pix_counter(5),
      I2 => pix_counter(9),
      I3 => pix_counter(14),
      O => \pix_counter[14]_i_10_n_0\
    );
\pix_counter[14]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => pix_counter(7),
      I1 => pix_counter(8),
      I2 => pix_counter(11),
      I3 => pix_counter(10),
      O => \pix_counter[14]_i_11_n_0\
    );
\pix_counter[14]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => p_0_in(14),
      I1 => \produce__ready\,
      I2 => \^active_reg_0\,
      I3 => rst,
      O => \pix_counter[14]_i_3_n_0\
    );
\pix_counter[14]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEFF"
    )
        port map (
      I0 => \pix_counter[14]_i_10_n_0\,
      I1 => \pix_counter[14]_i_11_n_0\,
      I2 => pix_counter(13),
      I3 => pix_counter(6),
      I4 => pix_counter(12),
      I5 => \produce__vsync_INST_0_i_3_n_0\,
      O => \pix_counter[14]_i_5_n_0\
    );
\pix_counter[14]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \produce__ready\,
      I1 => \^active_reg_0\,
      O => \produce__ready_0\
    );
\pix_counter[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => p_0_in(1),
      I1 => \produce__ready\,
      I2 => \^active_reg_0\,
      I3 => rst,
      O => \pix_counter[1]_i_1_n_0\
    );
\pix_counter[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => p_0_in(2),
      I1 => \produce__ready\,
      I2 => \^active_reg_0\,
      I3 => rst,
      O => \pix_counter[2]_i_1_n_0\
    );
\pix_counter[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => p_0_in(3),
      I1 => \produce__ready\,
      I2 => \^active_reg_0\,
      I3 => rst,
      O => \pix_counter[3]_i_1_n_0\
    );
\pix_counter[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => p_0_in(4),
      I1 => \produce__ready\,
      I2 => \^active_reg_0\,
      I3 => rst,
      O => \pix_counter[4]_i_1_n_0\
    );
\pix_counter[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => p_0_in(5),
      I1 => \produce__ready\,
      I2 => \^active_reg_0\,
      I3 => rst,
      O => \pix_counter[5]_i_1_n_0\
    );
\pix_counter[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => p_0_in(6),
      I1 => \produce__ready\,
      I2 => \^active_reg_0\,
      I3 => rst,
      O => \pix_counter[6]_i_1_n_0\
    );
\pix_counter[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => p_0_in(7),
      I1 => \produce__ready\,
      I2 => \^active_reg_0\,
      I3 => rst,
      O => \pix_counter[7]_i_1_n_0\
    );
\pix_counter[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => p_0_in(8),
      I1 => \produce__ready\,
      I2 => \^active_reg_0\,
      I3 => rst,
      O => \pix_counter[8]_i_1_n_0\
    );
\pix_counter[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => p_0_in(9),
      I1 => \produce__ready\,
      I2 => \^active_reg_0\,
      I3 => rst,
      O => \pix_counter[9]_i_1_n_0\
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
\pix_counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \pix_counter_reg[14]_0\,
      D => \pix_counter[10]_i_1_n_0\,
      Q => pix_counter(10),
      R => \pix_counter[14]_i_1_n_0\
    );
\pix_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \pix_counter_reg[14]_0\,
      D => \pix_counter[11]_i_1_n_0\,
      Q => pix_counter(11),
      R => \pix_counter[14]_i_1_n_0\
    );
\pix_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \pix_counter_reg[14]_0\,
      D => \pix_counter[12]_i_1_n_0\,
      Q => pix_counter(12),
      R => \pix_counter[14]_i_1_n_0\
    );
\pix_counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \pix_counter_reg[14]_0\,
      D => \pix_counter[13]_i_1_n_0\,
      Q => pix_counter(13),
      R => \pix_counter[14]_i_1_n_0\
    );
\pix_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \pix_counter_reg[14]_0\,
      D => \pix_counter[14]_i_3_n_0\,
      Q => pix_counter(14),
      R => \pix_counter[14]_i_1_n_0\
    );
\pix_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \pix_counter_reg[14]_0\,
      D => \pix_counter[1]_i_1_n_0\,
      Q => pix_counter(1),
      R => \pix_counter[14]_i_1_n_0\
    );
\pix_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \pix_counter_reg[14]_0\,
      D => \pix_counter[2]_i_1_n_0\,
      Q => pix_counter(2),
      R => \pix_counter[14]_i_1_n_0\
    );
\pix_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \pix_counter_reg[14]_0\,
      D => \pix_counter[3]_i_1_n_0\,
      Q => pix_counter(3),
      R => \pix_counter[14]_i_1_n_0\
    );
\pix_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \pix_counter_reg[14]_0\,
      D => \pix_counter[4]_i_1_n_0\,
      Q => pix_counter(4),
      R => \pix_counter[14]_i_1_n_0\
    );
\pix_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \pix_counter_reg[14]_0\,
      D => \pix_counter[5]_i_1_n_0\,
      Q => pix_counter(5),
      R => \pix_counter[14]_i_1_n_0\
    );
\pix_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \pix_counter_reg[14]_0\,
      D => \pix_counter[6]_i_1_n_0\,
      Q => pix_counter(6),
      R => \pix_counter[14]_i_1_n_0\
    );
\pix_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \pix_counter_reg[14]_0\,
      D => \pix_counter[7]_i_1_n_0\,
      Q => pix_counter(7),
      R => \pix_counter[14]_i_1_n_0\
    );
\pix_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \pix_counter_reg[14]_0\,
      D => \pix_counter[8]_i_1_n_0\,
      Q => pix_counter(8),
      R => \pix_counter[14]_i_1_n_0\
    );
\pix_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \pix_counter_reg[14]_0\,
      D => \pix_counter[9]_i_1_n_0\,
      Q => pix_counter(9),
      R => \pix_counter[14]_i_1_n_0\
    );
\produce__data[11]_INST_0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^active_reg_0\,
      I1 => \produce__valid\,
      O => active_reg_2
    );
\produce__vsync_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000400000"
    )
        port map (
      I0 => \produce__vsync_INST_0_i_1_n_0\,
      I1 => \produce__vsync_INST_0_i_2_n_0\,
      I2 => pix_counter(13),
      I3 => pix_counter(11),
      I4 => pix_counter(8),
      I5 => \produce__vsync_INST_0_i_3_n_0\,
      O => \produce__vsync\
    );
\produce__vsync_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => pix_counter(4),
      I1 => pix_counter(5),
      I2 => pix_counter(6),
      I3 => pix_counter(12),
      O => \produce__vsync_INST_0_i_1_n_0\
    );
\produce__vsync_INST_0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => pix_counter(9),
      I1 => pix_counter(7),
      I2 => pix_counter(10),
      I3 => pix_counter(14),
      O => \produce__vsync_INST_0_i_2_n_0\
    );
\produce__vsync_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => pix_counter(3),
      I1 => pix_counter(0),
      I2 => pix_counter(1),
      I3 => pix_counter(2),
      O => \produce__vsync_INST_0_i_3_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.hor\ is
  port (
    \produce__data\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    counter : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \write_port__en\ : out STD_LOGIC;
    \counter_reg[1]_0\ : out STD_LOGIC;
    \consume__ready\ : out STD_LOGIC;
    \$7\ : out STD_LOGIC;
    \produce__valid\ : out STD_LOGIC;
    rst : in STD_LOGIC;
    \$1\ : in STD_LOGIC;
    \consume__vsync$14\ : in STD_LOGIC;
    clk : in STD_LOGIC;
    \consume__ready_0\ : in STD_LOGIC;
    \data_reg_reg[5]_0\ : in STD_LOGIC;
    active : in STD_LOGIC;
    \data_reg_reg[6]_0\ : in STD_LOGIC;
    \produce__valid_0\ : in STD_LOGIC;
    \data_reg_reg[0]_0\ : in STD_LOGIC;
    \data_reg_reg[1]_0\ : in STD_LOGIC;
    \data_reg_reg[2]_0\ : in STD_LOGIC;
    \data_reg_reg[3]_0\ : in STD_LOGIC;
    \data_reg_reg[4]_0\ : in STD_LOGIC;
    \data_reg_reg[7]_0\ : in STD_LOGIC;
    \data_reg_reg[8]_0\ : in STD_LOGIC;
    \data_reg_reg[9]_0\ : in STD_LOGIC;
    \data_reg_reg[10]_0\ : in STD_LOGIC;
    \data_reg_reg[11]_0\ : in STD_LOGIC;
    \consume__valid\ : in STD_LOGIC;
    \produce__ready\ : in STD_LOGIC;
    \counter_reg[0]_0\ : in STD_LOGIC;
    line_counter : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \counter_reg[1]_1\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.hor\ : entity is "lcd_to_vga.upsample.hor";
end \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.hor\;

architecture STRUCTURE of \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.hor\ is
  signal \^counter\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter[1]_i_1_n_0\ : STD_LOGIC;
  signal \^counter_reg[1]_0\ : STD_LOGIC;
  signal data_reg : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal sync_reg : STD_LOGIC;
  attribute src : string;
  attribute src of \counter_reg[0]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:25";
  attribute src of \counter_reg[1]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:25";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \data_reg[11]_i_2\ : label is "soft_lutpair13";
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
  attribute SOFT_HLUTNM of \produce__data[0]_INST_0\ : label is "soft_lutpair13";
  attribute src of sync_reg_reg : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:22";
begin
  counter(1 downto 0) <= \^counter\(1 downto 0);
  \counter_reg[1]_0\ <= \^counter_reg[1]_0\;
buffer_reg_0_63_0_2_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000002000000"
    )
        port map (
      I0 => \consume__valid\,
      I1 => \^counter_reg[1]_0\,
      I2 => \consume__ready_0\,
      I3 => \produce__ready\,
      I4 => active,
      I5 => \counter_reg[0]_0\,
      O => \write_port__en\
    );
\consume__ready_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001000000"
    )
        port map (
      I0 => \^counter\(0),
      I1 => \^counter\(1),
      I2 => \consume__ready_0\,
      I3 => \produce__ready\,
      I4 => active,
      I5 => \counter_reg[0]_0\,
      O => \consume__ready\
    );
\counter[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000F00FF00E"
    )
        port map (
      I0 => \consume__valid\,
      I1 => \counter_reg[0]_0\,
      I2 => \counter_reg[1]_1\,
      I3 => \^counter\(0),
      I4 => \^counter\(1),
      I5 => rst,
      O => \counter[0]_i_1_n_0\
    );
\counter[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B4"
    )
        port map (
      I0 => \counter_reg[1]_1\,
      I1 => \^counter\(0),
      I2 => \^counter\(1),
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
      Q => \^counter\(0),
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
      Q => \^counter\(1),
      R => '0'
    );
\data_reg[11]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^counter\(1),
      I1 => \^counter\(0),
      O => \^counter_reg[1]_0\
    );
\data_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \$1\,
      D => \data_reg_reg[0]_0\,
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
      D => \data_reg_reg[10]_0\,
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
      D => \data_reg_reg[11]_0\,
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
      D => \data_reg_reg[1]_0\,
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
      D => \data_reg_reg[2]_0\,
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
      D => \data_reg_reg[3]_0\,
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
      D => \data_reg_reg[4]_0\,
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
      D => \data_reg_reg[5]_0\,
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
      D => \data_reg_reg[6]_0\,
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
      D => \data_reg_reg[7]_0\,
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
      D => \data_reg_reg[8]_0\,
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
      D => \data_reg_reg[9]_0\,
      Q => data_reg(9),
      R => rst
    );
\produce__data[0]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA80008"
    )
        port map (
      I0 => \produce__valid_0\,
      I1 => \data_reg_reg[0]_0\,
      I2 => \^counter\(0),
      I3 => \^counter\(1),
      I4 => data_reg(0),
      O => \produce__data\(0)
    );
\produce__data[10]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE02FFFF"
    )
        port map (
      I0 => \data_reg_reg[10]_0\,
      I1 => \^counter\(0),
      I2 => \^counter\(1),
      I3 => data_reg(10),
      I4 => \produce__valid_0\,
      O => \produce__data\(10)
    );
\produce__data[11]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA80008"
    )
        port map (
      I0 => \produce__valid_0\,
      I1 => \data_reg_reg[11]_0\,
      I2 => \^counter\(0),
      I3 => \^counter\(1),
      I4 => data_reg(11),
      O => \produce__data\(11)
    );
\produce__data[1]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA80008"
    )
        port map (
      I0 => \produce__valid_0\,
      I1 => \data_reg_reg[1]_0\,
      I2 => \^counter\(0),
      I3 => \^counter\(1),
      I4 => data_reg(1),
      O => \produce__data\(1)
    );
\produce__data[2]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA80008"
    )
        port map (
      I0 => \produce__valid_0\,
      I1 => \data_reg_reg[2]_0\,
      I2 => \^counter\(0),
      I3 => \^counter\(1),
      I4 => data_reg(2),
      O => \produce__data\(2)
    );
\produce__data[3]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA80008"
    )
        port map (
      I0 => \produce__valid_0\,
      I1 => \data_reg_reg[3]_0\,
      I2 => \^counter\(0),
      I3 => \^counter\(1),
      I4 => data_reg(3),
      O => \produce__data\(3)
    );
\produce__data[4]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA80008"
    )
        port map (
      I0 => \produce__valid_0\,
      I1 => \data_reg_reg[4]_0\,
      I2 => \^counter\(0),
      I3 => \^counter\(1),
      I4 => data_reg(4),
      O => \produce__data\(4)
    );
\produce__data[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"50505044FFFFFFFF"
    )
        port map (
      I0 => \consume__ready_0\,
      I1 => \data_reg_reg[5]_0\,
      I2 => data_reg(5),
      I3 => \^counter\(1),
      I4 => \^counter\(0),
      I5 => active,
      O => \produce__data\(5)
    );
\produce__data[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"50505044FFFFFFFF"
    )
        port map (
      I0 => \consume__ready_0\,
      I1 => \data_reg_reg[6]_0\,
      I2 => data_reg(6),
      I3 => \^counter\(1),
      I4 => \^counter\(0),
      I5 => active,
      O => \produce__data\(6)
    );
\produce__data[7]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA80008"
    )
        port map (
      I0 => \produce__valid_0\,
      I1 => \data_reg_reg[7]_0\,
      I2 => \^counter\(0),
      I3 => \^counter\(1),
      I4 => data_reg(7),
      O => \produce__data\(7)
    );
\produce__data[8]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA80008"
    )
        port map (
      I0 => \produce__valid_0\,
      I1 => \data_reg_reg[8]_0\,
      I2 => \^counter\(0),
      I3 => \^counter\(1),
      I4 => data_reg(8),
      O => \produce__data\(8)
    );
\produce__data[9]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE02FFFF"
    )
        port map (
      I0 => \data_reg_reg[9]_0\,
      I1 => \^counter\(0),
      I2 => \^counter\(1),
      I3 => data_reg(9),
      I4 => \produce__valid_0\,
      O => \produce__data\(9)
    );
\produce__valid_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFFFFFF"
    )
        port map (
      I0 => \^counter\(1),
      I1 => \^counter\(0),
      I2 => \consume__valid\,
      I3 => line_counter(0),
      I4 => line_counter(1),
      I5 => \produce__valid_0\,
      O => \produce__valid\
    );
sync_reg_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => sync_reg,
      I1 => \^counter\(1),
      I2 => \^counter\(0),
      I3 => active,
      I4 => \produce__ready\,
      I5 => \consume__ready_0\,
      O => \$7\
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
    \line_counter_reg[1]_0\ : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \line_counter_reg[1]_1\ : out STD_LOGIC;
    line_counter : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \consume__vsync$14\ : out STD_LOGIC;
    \line_counter_reg[1]_2\ : out STD_LOGIC;
    \line_counter_reg[1]_3\ : out STD_LOGIC;
    \line_counter_reg[1]_4\ : out STD_LOGIC;
    \line_counter_reg[1]_5\ : out STD_LOGIC;
    \line_counter_reg[1]_6\ : out STD_LOGIC;
    \line_counter_reg[1]_7\ : out STD_LOGIC;
    \line_counter_reg[1]_8\ : out STD_LOGIC;
    \line_counter_reg[1]_9\ : out STD_LOGIC;
    \line_counter_reg[1]_10\ : out STD_LOGIC;
    \line_counter_reg[1]_11\ : out STD_LOGIC;
    \line_counter_reg[1]_12\ : out STD_LOGIC;
    \line_counter_reg[1]_13\ : out STD_LOGIC;
    clk : in STD_LOGIC;
    \consume__vsync\ : in STD_LOGIC;
    \write_port__en\ : in STD_LOGIC;
    rst : in STD_LOGIC;
    \consume__valid\ : in STD_LOGIC;
    active : in STD_LOGIC;
    \produce__ready\ : in STD_LOGIC;
    \counter_reg[9]\ : in STD_LOGIC;
    \addr_reg[7]_0\ : in STD_LOGIC;
    \counter_reg[0]\ : in STD_LOGIC;
    counter : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \consume__data\ : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.ver\ : entity is "lcd_to_vga.upsample.ver";
end \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.ver\;

architecture STRUCTURE of \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.ver\ is
  signal \^$1\ : STD_LOGIC;
  signal \$10\ : STD_LOGIC;
  signal \$8\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal addr : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal \addr[0]_i_3_n_0\ : STD_LOGIC;
  signal \addr[4]_i_1_n_0\ : STD_LOGIC;
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
  signal \^line_counter_reg[1]_0\ : STD_LOGIC;
  signal \read_port__data\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal sync_flag : STD_LOGIC;
  signal sync_flag_i_1_n_0 : STD_LOGIC;
  signal \sync_reg_i_2__0_n_0\ : STD_LOGIC;
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
  signal NLW_buffer_reg_64_127_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_reg_64_127_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_reg_64_127_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_reg_64_127_9_11_DOD_UNCONNECTED : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \addr[0]_i_2\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \addr[0]_i_3\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \addr[1]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \addr[2]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \addr[3]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \addr[4]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \addr[7]_i_1\ : label is "soft_lutpair17";
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
  attribute RTL_RAM_BITS of buffer_reg_0_63_0_2 : label is 1920;
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
  attribute RTL_RAM_BITS of buffer_reg_0_63_3_5 : label is 1920;
  attribute RTL_RAM_NAME of buffer_reg_0_63_3_5 : label is "inst/upsample/ver/buffer_reg_0_63_3_5";
  attribute RTL_RAM_TYPE of buffer_reg_0_63_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_0_63_3_5 : label is 0;
  attribute ram_addr_end of buffer_reg_0_63_3_5 : label is 63;
  attribute ram_offset of buffer_reg_0_63_3_5 : label is 0;
  attribute ram_slice_begin of buffer_reg_0_63_3_5 : label is 3;
  attribute ram_slice_end of buffer_reg_0_63_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_0_63_6_8 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_0_63_6_8 : label is 1920;
  attribute RTL_RAM_NAME of buffer_reg_0_63_6_8 : label is "inst/upsample/ver/buffer_reg_0_63_6_8";
  attribute RTL_RAM_TYPE of buffer_reg_0_63_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_0_63_6_8 : label is 0;
  attribute ram_addr_end of buffer_reg_0_63_6_8 : label is 63;
  attribute ram_offset of buffer_reg_0_63_6_8 : label is 0;
  attribute ram_slice_begin of buffer_reg_0_63_6_8 : label is 6;
  attribute ram_slice_end of buffer_reg_0_63_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_0_63_9_11 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_0_63_9_11 : label is 1920;
  attribute RTL_RAM_NAME of buffer_reg_0_63_9_11 : label is "inst/upsample/ver/buffer_reg_0_63_9_11";
  attribute RTL_RAM_TYPE of buffer_reg_0_63_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_0_63_9_11 : label is 0;
  attribute ram_addr_end of buffer_reg_0_63_9_11 : label is 63;
  attribute ram_offset of buffer_reg_0_63_9_11 : label is 0;
  attribute ram_slice_begin of buffer_reg_0_63_9_11 : label is 9;
  attribute ram_slice_end of buffer_reg_0_63_9_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_128_191_0_2 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_128_191_0_2 : label is 1920;
  attribute RTL_RAM_NAME of buffer_reg_128_191_0_2 : label is "inst/upsample/ver/buffer_reg_128_191_0_2";
  attribute RTL_RAM_TYPE of buffer_reg_128_191_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_128_191_0_2 : label is 128;
  attribute ram_addr_end of buffer_reg_128_191_0_2 : label is 159;
  attribute ram_offset of buffer_reg_128_191_0_2 : label is 0;
  attribute ram_slice_begin of buffer_reg_128_191_0_2 : label is 0;
  attribute ram_slice_end of buffer_reg_128_191_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_128_191_3_5 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_128_191_3_5 : label is 1920;
  attribute RTL_RAM_NAME of buffer_reg_128_191_3_5 : label is "inst/upsample/ver/buffer_reg_128_191_3_5";
  attribute RTL_RAM_TYPE of buffer_reg_128_191_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_128_191_3_5 : label is 128;
  attribute ram_addr_end of buffer_reg_128_191_3_5 : label is 159;
  attribute ram_offset of buffer_reg_128_191_3_5 : label is 0;
  attribute ram_slice_begin of buffer_reg_128_191_3_5 : label is 3;
  attribute ram_slice_end of buffer_reg_128_191_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_128_191_6_8 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_128_191_6_8 : label is 1920;
  attribute RTL_RAM_NAME of buffer_reg_128_191_6_8 : label is "inst/upsample/ver/buffer_reg_128_191_6_8";
  attribute RTL_RAM_TYPE of buffer_reg_128_191_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_128_191_6_8 : label is 128;
  attribute ram_addr_end of buffer_reg_128_191_6_8 : label is 159;
  attribute ram_offset of buffer_reg_128_191_6_8 : label is 0;
  attribute ram_slice_begin of buffer_reg_128_191_6_8 : label is 6;
  attribute ram_slice_end of buffer_reg_128_191_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_128_191_9_11 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_128_191_9_11 : label is 1920;
  attribute RTL_RAM_NAME of buffer_reg_128_191_9_11 : label is "inst/upsample/ver/buffer_reg_128_191_9_11";
  attribute RTL_RAM_TYPE of buffer_reg_128_191_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_128_191_9_11 : label is 128;
  attribute ram_addr_end of buffer_reg_128_191_9_11 : label is 159;
  attribute ram_offset of buffer_reg_128_191_9_11 : label is 0;
  attribute ram_slice_begin of buffer_reg_128_191_9_11 : label is 9;
  attribute ram_slice_end of buffer_reg_128_191_9_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_64_127_0_2 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_64_127_0_2 : label is 1920;
  attribute RTL_RAM_NAME of buffer_reg_64_127_0_2 : label is "inst/upsample/ver/buffer_reg_64_127_0_2";
  attribute RTL_RAM_TYPE of buffer_reg_64_127_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_64_127_0_2 : label is 64;
  attribute ram_addr_end of buffer_reg_64_127_0_2 : label is 127;
  attribute ram_offset of buffer_reg_64_127_0_2 : label is 0;
  attribute ram_slice_begin of buffer_reg_64_127_0_2 : label is 0;
  attribute ram_slice_end of buffer_reg_64_127_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_64_127_3_5 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_64_127_3_5 : label is 1920;
  attribute RTL_RAM_NAME of buffer_reg_64_127_3_5 : label is "inst/upsample/ver/buffer_reg_64_127_3_5";
  attribute RTL_RAM_TYPE of buffer_reg_64_127_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_64_127_3_5 : label is 64;
  attribute ram_addr_end of buffer_reg_64_127_3_5 : label is 127;
  attribute ram_offset of buffer_reg_64_127_3_5 : label is 0;
  attribute ram_slice_begin of buffer_reg_64_127_3_5 : label is 3;
  attribute ram_slice_end of buffer_reg_64_127_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_64_127_6_8 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_64_127_6_8 : label is 1920;
  attribute RTL_RAM_NAME of buffer_reg_64_127_6_8 : label is "inst/upsample/ver/buffer_reg_64_127_6_8";
  attribute RTL_RAM_TYPE of buffer_reg_64_127_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_64_127_6_8 : label is 64;
  attribute ram_addr_end of buffer_reg_64_127_6_8 : label is 127;
  attribute ram_offset of buffer_reg_64_127_6_8 : label is 0;
  attribute ram_slice_begin of buffer_reg_64_127_6_8 : label is 6;
  attribute ram_slice_end of buffer_reg_64_127_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of buffer_reg_64_127_9_11 : label is "";
  attribute RTL_RAM_BITS of buffer_reg_64_127_9_11 : label is 1920;
  attribute RTL_RAM_NAME of buffer_reg_64_127_9_11 : label is "inst/upsample/ver/buffer_reg_64_127_9_11";
  attribute RTL_RAM_TYPE of buffer_reg_64_127_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of buffer_reg_64_127_9_11 : label is 64;
  attribute ram_addr_end of buffer_reg_64_127_9_11 : label is 127;
  attribute ram_offset of buffer_reg_64_127_9_11 : label is 0;
  attribute ram_slice_begin of buffer_reg_64_127_9_11 : label is 9;
  attribute ram_slice_end of buffer_reg_64_127_9_11 : label is 11;
  attribute SOFT_HLUTNM of \consume__ready_INST_0_i_2\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \line_counter[0]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \line_counter[1]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \line_counter[1]_i_2\ : label is "soft_lutpair17";
  attribute src of \line_counter_reg[0]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:80";
  attribute src of \line_counter_reg[1]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:80";
  attribute SOFT_HLUTNM of \pix_counter[14]_i_6\ : label is "soft_lutpair15";
  attribute src of sync_flag_reg : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\lcd_to_vga.py:69";
begin
  \$1\ <= \^$1\;
  E(0) <= \^e\(0);
  line_counter(1 downto 0) <= \^line_counter\(1 downto 0);
  \line_counter_reg[1]_0\ <= \^line_counter_reg[1]_0\;
\addr[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAABAAAAAAAAAA"
    )
        port map (
      I0 => rst,
      I1 => \addr[0]_i_3_n_0\,
      I2 => addr_reg(5),
      I3 => addr(7),
      I4 => addr(6),
      I5 => \^$1\,
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
\addr[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => addr_reg(3),
      I1 => addr_reg(0),
      I2 => addr_reg(1),
      I3 => addr_reg(2),
      I4 => addr_reg(4),
      O => \addr[0]_i_3_n_0\
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
      INIT => X"6AAA"
    )
        port map (
      I0 => addr_reg(3),
      I1 => addr_reg(0),
      I2 => addr_reg(1),
      I3 => addr_reg(2),
      O => \$8\(3)
    );
\addr[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => addr_reg(4),
      I1 => addr_reg(3),
      I2 => addr_reg(0),
      I3 => addr_reg(1),
      I4 => addr_reg(2),
      O => \addr[4]_i_1_n_0\
    );
\addr[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => addr_reg(3),
      I1 => addr_reg(0),
      I2 => addr_reg(1),
      I3 => addr_reg(2),
      I4 => addr_reg(4),
      I5 => addr_reg(5),
      O => \$8\(5)
    );
\addr[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => addr(6),
      I1 => \addr[6]_i_2_n_0\,
      O => \$8\(6)
    );
\addr[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => addr_reg(5),
      I1 => addr_reg(4),
      I2 => addr_reg(2),
      I3 => addr_reg(1),
      I4 => addr_reg(0),
      I5 => addr_reg(3),
      O => \addr[6]_i_2_n_0\
    );
\addr[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => addr(7),
      I1 => \addr[6]_i_2_n_0\,
      I2 => addr(6),
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
      D => \addr[4]_i_1_n_0\,
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
buffer_reg_0_63_0_2_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA0AAA2"
    )
        port map (
      I0 => \write_port__en\,
      I1 => addr(6),
      I2 => \^line_counter\(0),
      I3 => \^line_counter\(1),
      I4 => addr(7),
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
buffer_reg_128_191_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => addr(6),
      I1 => addr(7),
      I2 => \^line_counter\(0),
      I3 => \^line_counter\(1),
      I4 => \write_port__en\,
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
buffer_reg_64_127_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => addr(7),
      I1 => addr(6),
      I2 => \^line_counter\(0),
      I3 => \^line_counter\(1),
      I4 => \write_port__en\,
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
\consume__ready_INST_0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^line_counter\(1),
      I1 => \^line_counter\(0),
      O => \^line_counter_reg[1]_0\
    );
\counter[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AE"
    )
        port map (
      I0 => rst,
      I1 => \^e\(0),
      I2 => \counter_reg[0]\,
      O => SR(0)
    );
\counter[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFE000000000000"
    )
        port map (
      I0 => \^line_counter_reg[1]_0\,
      I1 => \consume__valid\,
      I2 => \addr_reg[7]_0\,
      I3 => \counter_reg[9]\,
      I4 => active,
      I5 => \produce__ready\,
      O => \^e\(0)
    );
\data_reg[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000E000"
    )
        port map (
      I0 => \^line_counter_reg[1]_0\,
      I1 => \consume__valid\,
      I2 => active,
      I3 => \produce__ready\,
      I4 => \counter_reg[9]\,
      I5 => \addr_reg[7]_0\,
      O => \^$1\
    );
\line_counter[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00C6"
    )
        port map (
      I0 => \^$1\,
      I1 => \^line_counter\(0),
      I2 => \line_counter[1]_i_2_n_0\,
      I3 => rst,
      O => \line_counter[0]_i_1_n_0\
    );
\line_counter[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000CC6C"
    )
        port map (
      I0 => \^$1\,
      I1 => \^line_counter\(1),
      I2 => \^line_counter\(0),
      I3 => \line_counter[1]_i_2_n_0\,
      I4 => rst,
      O => \line_counter[1]_i_1_n_0\
    );
\line_counter[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => \addr[0]_i_3_n_0\,
      I1 => addr_reg(5),
      I2 => addr(7),
      I3 => addr(6),
      O => \line_counter[1]_i_2_n_0\
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
\pix_counter[14]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \^line_counter\(1),
      I1 => \^line_counter\(0),
      I2 => \consume__valid\,
      I3 => counter(0),
      I4 => counter(1),
      O => \line_counter_reg[1]_1\
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
      O => \line_counter_reg[1]_2\
    );
\produce__data[0]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => buffer_reg_128_191_0_2_n_0,
      I1 => addr(7),
      I2 => buffer_reg_64_127_0_2_n_0,
      I3 => addr(6),
      I4 => buffer_reg_0_63_0_2_n_0,
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
      O => \line_counter_reg[1]_12\
    );
\produce__data[10]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => buffer_reg_128_191_9_11_n_1,
      I1 => addr(7),
      I2 => buffer_reg_64_127_9_11_n_1,
      I3 => addr(6),
      I4 => buffer_reg_0_63_9_11_n_1,
      O => \read_port__data\(10)
    );
\produce__data[11]_INST_0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \read_port__data\(11),
      I1 => \^line_counter\(1),
      I2 => \^line_counter\(0),
      I3 => \consume__data\(11),
      O => \line_counter_reg[1]_13\
    );
\produce__data[11]_INST_0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => buffer_reg_128_191_9_11_n_2,
      I1 => addr(7),
      I2 => buffer_reg_64_127_9_11_n_2,
      I3 => addr(6),
      I4 => buffer_reg_0_63_9_11_n_2,
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
      O => \line_counter_reg[1]_3\
    );
\produce__data[1]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => buffer_reg_128_191_0_2_n_1,
      I1 => addr(7),
      I2 => buffer_reg_64_127_0_2_n_1,
      I3 => addr(6),
      I4 => buffer_reg_0_63_0_2_n_1,
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
      O => \line_counter_reg[1]_4\
    );
\produce__data[2]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => buffer_reg_128_191_0_2_n_2,
      I1 => addr(7),
      I2 => buffer_reg_64_127_0_2_n_2,
      I3 => addr(6),
      I4 => buffer_reg_0_63_0_2_n_2,
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
      O => \line_counter_reg[1]_5\
    );
\produce__data[3]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => buffer_reg_128_191_3_5_n_0,
      I1 => addr(7),
      I2 => buffer_reg_64_127_3_5_n_0,
      I3 => addr(6),
      I4 => buffer_reg_0_63_3_5_n_0,
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
      O => \line_counter_reg[1]_6\
    );
\produce__data[4]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => buffer_reg_128_191_3_5_n_1,
      I1 => addr(7),
      I2 => buffer_reg_64_127_3_5_n_1,
      I3 => addr(6),
      I4 => buffer_reg_0_63_3_5_n_1,
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
      O => \line_counter_reg[1]_7\
    );
\produce__data[5]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => buffer_reg_128_191_3_5_n_2,
      I1 => addr(7),
      I2 => buffer_reg_64_127_3_5_n_2,
      I3 => addr(6),
      I4 => buffer_reg_0_63_3_5_n_2,
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
      O => \line_counter_reg[1]_8\
    );
\produce__data[6]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => buffer_reg_128_191_6_8_n_0,
      I1 => addr(7),
      I2 => buffer_reg_64_127_6_8_n_0,
      I3 => addr(6),
      I4 => buffer_reg_0_63_6_8_n_0,
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
      O => \line_counter_reg[1]_9\
    );
\produce__data[7]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => buffer_reg_128_191_6_8_n_1,
      I1 => addr(7),
      I2 => buffer_reg_64_127_6_8_n_1,
      I3 => addr(6),
      I4 => buffer_reg_0_63_6_8_n_1,
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
      O => \line_counter_reg[1]_10\
    );
\produce__data[8]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => buffer_reg_128_191_6_8_n_2,
      I1 => addr(7),
      I2 => buffer_reg_64_127_6_8_n_2,
      I3 => addr(6),
      I4 => buffer_reg_0_63_6_8_n_2,
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
      O => \line_counter_reg[1]_11\
    );
\produce__data[9]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => buffer_reg_128_191_9_11_n_0,
      I1 => addr(7),
      I2 => buffer_reg_64_127_9_11_n_0,
      I3 => addr(6),
      I4 => buffer_reg_0_63_9_11_n_0,
      O => \read_port__data\(9)
    );
sync_flag_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BBBBF000"
    )
        port map (
      I0 => \sync_reg_i_2__0_n_0\,
      I1 => \^$1\,
      I2 => \consume__vsync\,
      I3 => \write_port__en\,
      I4 => sync_flag,
      I5 => rst,
      O => sync_flag_i_1_n_0
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
sync_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => sync_flag,
      I1 => \sync_reg_i_2__0_n_0\,
      O => \consume__vsync$14\
    );
\sync_reg_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFBFFFFFFFFFFFF"
    )
        port map (
      I0 => addr(6),
      I1 => addr(7),
      I2 => addr_reg(5),
      I3 => \addr[0]_i_3_n_0\,
      I4 => \^line_counter\(0),
      I5 => \^line_counter\(1),
      O => \sync_reg_i_2__0_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \display_driver_lcd_to_vga_0_0_lcd_to_vga.border\ is
  port (
    active : out STD_LOGIC;
    active_reg : out STD_LOGIC;
    \counter_reg[7]\ : out STD_LOGIC;
    active_reg_0 : out STD_LOGIC;
    \counter_reg[5]\ : out STD_LOGIC;
    \produce__vsync\ : out STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    \produce__ready\ : in STD_LOGIC;
    sync_reg_reg : in STD_LOGIC;
    \$7\ : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \display_driver_lcd_to_vga_0_0_lcd_to_vga.border\ : entity is "lcd_to_vga.border";
end \display_driver_lcd_to_vga_0_0_lcd_to_vga.border\;

architecture STRUCTURE of \display_driver_lcd_to_vga_0_0_lcd_to_vga.border\ is
  signal \^active\ : STD_LOGIC;
  signal \^counter_reg[7]\ : STD_LOGIC;
  signal hor_n_0 : STD_LOGIC;
  signal hor_n_1 : STD_LOGIC;
  signal ver_n_2 : STD_LOGIC;
begin
  active <= \^active\;
  \counter_reg[7]\ <= \^counter_reg[7]\;
hor: entity work.\display_driver_lcd_to_vga_0_0_lcd_to_vga.border.hor\
     port map (
      \$7\ => \$7\,
      E(0) => E(0),
      SR(0) => SR(0),
      clk => clk,
      \counter_reg[5]_0\ => \counter_reg[5]\,
      \counter_reg[7]_0\ => \^counter_reg[7]\,
      \pix_counter_reg[14]\ => \^active\,
      \produce__ready\ => \produce__ready\,
      \produce__ready_0\ => hor_n_0,
      rst => rst,
      sync_reg_reg_0 => hor_n_1,
      sync_reg_reg_1 => sync_reg_reg,
      sync_reg_reg_2 => ver_n_2
    );
ver: entity work.\display_driver_lcd_to_vga_0_0_lcd_to_vga.border.ver\
     port map (
      active_reg_0 => \^active\,
      active_reg_1 => active_reg,
      active_reg_2 => active_reg_0,
      clk => clk,
      \pix_counter_reg[0]_0\ => hor_n_1,
      \pix_counter_reg[14]_0\ => hor_n_0,
      \produce__ready\ => \produce__ready\,
      \produce__ready_0\ => ver_n_2,
      \produce__valid\ => \^counter_reg[7]\,
      \produce__vsync\ => \produce__vsync\,
      rst => rst
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
    \$7\ : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \produce__valid\ : out STD_LOGIC;
    \line_counter_reg[1]\ : out STD_LOGIC;
    rst : in STD_LOGIC;
    clk : in STD_LOGIC;
    \counter_reg[9]\ : in STD_LOGIC;
    active : in STD_LOGIC;
    \produce__valid_0\ : in STD_LOGIC;
    \consume__vsync\ : in STD_LOGIC;
    \consume__valid\ : in STD_LOGIC;
    \produce__ready\ : in STD_LOGIC;
    \counter_reg[0]\ : in STD_LOGIC;
    \consume__data\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \counter_reg[1]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample\ : entity is "lcd_to_vga.upsample";
end \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample\;

architecture STRUCTURE of \display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample\ is
  signal \$1\ : STD_LOGIC;
  signal \consume__vsync$14\ : STD_LOGIC;
  signal counter : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hor_n_15 : STD_LOGIC;
  signal line_counter : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ver_n_1 : STD_LOGIC;
  signal ver_n_10 : STD_LOGIC;
  signal ver_n_11 : STD_LOGIC;
  signal ver_n_12 : STD_LOGIC;
  signal ver_n_13 : STD_LOGIC;
  signal ver_n_14 : STD_LOGIC;
  signal ver_n_15 : STD_LOGIC;
  signal ver_n_16 : STD_LOGIC;
  signal ver_n_17 : STD_LOGIC;
  signal ver_n_18 : STD_LOGIC;
  signal ver_n_19 : STD_LOGIC;
  signal ver_n_8 : STD_LOGIC;
  signal ver_n_9 : STD_LOGIC;
  signal \write_port__en\ : STD_LOGIC;
begin
hor: entity work.\display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.hor\
     port map (
      \$1\ => \$1\,
      \$7\ => \$7\,
      active => active,
      clk => clk,
      \consume__ready\ => \consume__ready\,
      \consume__ready_0\ => \counter_reg[9]\,
      \consume__valid\ => \consume__valid\,
      \consume__vsync$14\ => \consume__vsync$14\,
      counter(1 downto 0) => counter(1 downto 0),
      \counter_reg[0]_0\ => ver_n_1,
      \counter_reg[1]_0\ => hor_n_15,
      \counter_reg[1]_1\ => \counter_reg[1]\,
      \data_reg_reg[0]_0\ => ver_n_8,
      \data_reg_reg[10]_0\ => ver_n_18,
      \data_reg_reg[11]_0\ => ver_n_19,
      \data_reg_reg[1]_0\ => ver_n_9,
      \data_reg_reg[2]_0\ => ver_n_10,
      \data_reg_reg[3]_0\ => ver_n_11,
      \data_reg_reg[4]_0\ => ver_n_12,
      \data_reg_reg[5]_0\ => ver_n_13,
      \data_reg_reg[6]_0\ => ver_n_14,
      \data_reg_reg[7]_0\ => ver_n_15,
      \data_reg_reg[8]_0\ => ver_n_16,
      \data_reg_reg[9]_0\ => ver_n_17,
      line_counter(1 downto 0) => line_counter(1 downto 0),
      \produce__data\(11 downto 0) => \produce__data\(11 downto 0),
      \produce__ready\ => \produce__ready\,
      \produce__valid\ => \produce__valid\,
      \produce__valid_0\ => \produce__valid_0\,
      rst => rst,
      \write_port__en\ => \write_port__en\
    );
ver: entity work.\display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample.ver\
     port map (
      \$1\ => \$1\,
      E(0) => E(0),
      SR(0) => SR(0),
      active => active,
      \addr_reg[7]_0\ => hor_n_15,
      clk => clk,
      \consume__data\(11 downto 0) => \consume__data\(11 downto 0),
      \consume__valid\ => \consume__valid\,
      \consume__vsync\ => \consume__vsync\,
      \consume__vsync$14\ => \consume__vsync$14\,
      counter(1 downto 0) => counter(1 downto 0),
      \counter_reg[0]\ => \counter_reg[0]\,
      \counter_reg[9]\ => \counter_reg[9]\,
      line_counter(1 downto 0) => line_counter(1 downto 0),
      \line_counter_reg[1]_0\ => ver_n_1,
      \line_counter_reg[1]_1\ => \line_counter_reg[1]\,
      \line_counter_reg[1]_10\ => ver_n_16,
      \line_counter_reg[1]_11\ => ver_n_17,
      \line_counter_reg[1]_12\ => ver_n_18,
      \line_counter_reg[1]_13\ => ver_n_19,
      \line_counter_reg[1]_2\ => ver_n_8,
      \line_counter_reg[1]_3\ => ver_n_9,
      \line_counter_reg[1]_4\ => ver_n_10,
      \line_counter_reg[1]_5\ => ver_n_11,
      \line_counter_reg[1]_6\ => ver_n_12,
      \line_counter_reg[1]_7\ => ver_n_13,
      \line_counter_reg[1]_8\ => ver_n_14,
      \line_counter_reg[1]_9\ => ver_n_15,
      \produce__ready\ => \produce__ready\,
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
    rst : in STD_LOGIC;
    \produce__ready\ : in STD_LOGIC;
    clk : in STD_LOGIC;
    \consume__valid\ : in STD_LOGIC;
    \consume__data\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \consume__vsync\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of display_driver_lcd_to_vga_0_0_lcd_to_vga : entity is "lcd_to_vga";
end display_driver_lcd_to_vga_0_0_lcd_to_vga;

architecture STRUCTURE of display_driver_lcd_to_vga_0_0_lcd_to_vga is
  signal border_n_1 : STD_LOGIC;
  signal border_n_2 : STD_LOGIC;
  signal border_n_3 : STD_LOGIC;
  signal border_n_4 : STD_LOGIC;
  signal \hor/$7\ : STD_LOGIC;
  signal \hor/$9\ : STD_LOGIC;
  signal upsample_n_17 : STD_LOGIC;
  signal \ver/$1\ : STD_LOGIC;
  signal \ver/active\ : STD_LOGIC;
begin
border: entity work.\display_driver_lcd_to_vga_0_0_lcd_to_vga.border\
     port map (
      \$7\ => \hor/$7\,
      E(0) => \ver/$1\,
      SR(0) => \hor/$9\,
      active => \ver/active\,
      active_reg => border_n_1,
      active_reg_0 => border_n_3,
      clk => clk,
      \counter_reg[5]\ => border_n_4,
      \counter_reg[7]\ => border_n_2,
      \produce__ready\ => \produce__ready\,
      \produce__vsync\ => \produce__vsync\,
      rst => rst,
      sync_reg_reg => upsample_n_17
    );
upsample: entity work.\display_driver_lcd_to_vga_0_0_lcd_to_vga.upsample\
     port map (
      \$7\ => \hor/$7\,
      E(0) => \ver/$1\,
      SR(0) => \hor/$9\,
      active => \ver/active\,
      clk => clk,
      \consume__data\(11 downto 0) => \consume__data\(11 downto 0),
      \consume__ready\ => \consume__ready\,
      \consume__valid\ => \consume__valid\,
      \consume__vsync\ => \consume__vsync\,
      \counter_reg[0]\ => border_n_4,
      \counter_reg[1]\ => border_n_1,
      \counter_reg[9]\ => border_n_2,
      \line_counter_reg[1]\ => upsample_n_17,
      \produce__data\(11 downto 0) => \produce__data\(11 downto 0),
      \produce__ready\ => \produce__ready\,
      \produce__valid\ => \produce__valid\,
      \produce__valid_0\ => border_n_3,
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
