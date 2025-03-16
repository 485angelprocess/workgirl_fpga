-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Sun Mar  9 12:47:26 2025
-- Host        : MSI running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/magen/Documents/Programs/gameboy/gameboy.gen/sources_1/bd/display_driver/ip/display_driver_vga_verify_0_0/display_driver_vga_verify_0_0_sim_netlist.vhdl
-- Design      : display_driver_vga_verify_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity display_driver_vga_verify_0_0_vga_verify is
  port (
    \produce__data\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \produce__valid_reg_0\ : out STD_LOGIC;
    \produce__vsync\ : out STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    \produce__ready\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of display_driver_vga_verify_0_0_vga_verify : entity is "vga_verify";
end display_driver_vga_verify_0_0_vga_verify;

architecture STRUCTURE of display_driver_vga_verify_0_0_vga_verify is
  signal \$11\ : STD_LOGIC;
  signal \$5\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \$6\ : STD_LOGIC;
  signal \$7\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \$9\ : STD_LOGIC;
  signal fsm_state : STD_LOGIC;
  signal fsm_state_i_1_n_0 : STD_LOGIC;
  signal \pix_counter[8]_i_4_n_0\ : STD_LOGIC;
  signal pix_counter_reg : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \produce__valid_i_1_n_0\ : STD_LOGIC;
  signal \^produce__valid_reg_0\ : STD_LOGIC;
  signal \produce__vsync_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \read_port__addr\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \read_port__addr_rep[8]_i_3_n_0\ : STD_LOGIC;
  signal \read_port__en\ : STD_LOGIC;
  signal \NLW__0__reg_DOADO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 15 downto 3 );
  signal \NLW__0__reg_DOBDO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW__0__reg_DOPADOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW__0__reg_DOPBDOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \_0__reg\ : label is "p0_d3";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of \_0__reg\ : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of \_0__reg\ : label is 1536;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of \_0__reg\ : label is "inst/_0__reg";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of \_0__reg\ : label is "RAM_SP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of \_0__reg\ : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of \_0__reg\ : label is 1023;
  attribute ram_offset : integer;
  attribute ram_offset of \_0__reg\ : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of \_0__reg\ : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of \_0__reg\ : label is 2;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of fsm_state_i_1 : label is "soft_lutpair7";
  attribute src : string;
  attribute src of fsm_state_reg : label is "C:\Program Files\WindowsApps\PythonSoftwareFoundation.Python.3.11_3.11.2544.0_x64__qbz5n2kfra8p0\Lib\contextlib.py:144";
  attribute SOFT_HLUTNM of \pix_counter[1]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \pix_counter[2]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \pix_counter[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \pix_counter[4]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \pix_counter[6]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \pix_counter[7]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \pix_counter[8]_i_3\ : label is "soft_lutpair3";
  attribute src of \pix_counter_reg[0]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\verify.py:32";
  attribute src of \pix_counter_reg[1]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\verify.py:32";
  attribute src of \pix_counter_reg[2]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\verify.py:32";
  attribute src of \pix_counter_reg[3]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\verify.py:32";
  attribute src of \pix_counter_reg[4]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\verify.py:32";
  attribute src of \pix_counter_reg[5]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\verify.py:32";
  attribute src of \pix_counter_reg[6]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\verify.py:32";
  attribute src of \pix_counter_reg[7]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\verify.py:32";
  attribute src of \pix_counter_reg[8]\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\verify.py:32";
  attribute SOFT_HLUTNM of \produce__valid_i_1\ : label is "soft_lutpair7";
  attribute src of \produce__valid_reg\ : label is "C:\Users\magen\Documents\Programs\gameboy\ppu\signature.py:18";
  attribute SOFT_HLUTNM of \produce__vsync_INST_0\ : label is "soft_lutpair3";
  attribute src of \read_port__addr_reg_rep[0]\ : label is "C:\Users\magen\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\LocalCache\local-packages\Python311\site-packages\amaranth\lib\memory.py:240";
  attribute src of \read_port__addr_reg_rep[1]\ : label is "C:\Users\magen\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\LocalCache\local-packages\Python311\site-packages\amaranth\lib\memory.py:240";
  attribute src of \read_port__addr_reg_rep[2]\ : label is "C:\Users\magen\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\LocalCache\local-packages\Python311\site-packages\amaranth\lib\memory.py:240";
  attribute src of \read_port__addr_reg_rep[3]\ : label is "C:\Users\magen\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\LocalCache\local-packages\Python311\site-packages\amaranth\lib\memory.py:240";
  attribute src of \read_port__addr_reg_rep[4]\ : label is "C:\Users\magen\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\LocalCache\local-packages\Python311\site-packages\amaranth\lib\memory.py:240";
  attribute src of \read_port__addr_reg_rep[5]\ : label is "C:\Users\magen\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\LocalCache\local-packages\Python311\site-packages\amaranth\lib\memory.py:240";
  attribute src of \read_port__addr_reg_rep[6]\ : label is "C:\Users\magen\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\LocalCache\local-packages\Python311\site-packages\amaranth\lib\memory.py:240";
  attribute src of \read_port__addr_reg_rep[7]\ : label is "C:\Users\magen\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\LocalCache\local-packages\Python311\site-packages\amaranth\lib\memory.py:240";
  attribute src of \read_port__addr_reg_rep[8]\ : label is "C:\Users\magen\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\LocalCache\local-packages\Python311\site-packages\amaranth\lib\memory.py:240";
  attribute SOFT_HLUTNM of \read_port__addr_rep[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \read_port__addr_rep[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \read_port__addr_rep[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \read_port__addr_rep[4]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \read_port__addr_rep[7]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \read_port__addr_rep[8]_i_2\ : label is "soft_lutpair2";
begin
  \produce__valid_reg_0\ <= \^produce__valid_reg_0\;
\_0__reg\: unisim.vcomponents.RAMB18E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0001000100010001000100010001000100010001000100010001000100010001",
      INIT_01 => X"0001000100010001000100010001000100010001000100010001000100010001",
      INIT_02 => X"0004000400040004000400040004000400010001000100010001000100010001",
      INIT_03 => X"0004000400040004000400040004000400040004000400040004000400040004",
      INIT_04 => X"0004000400040004000400040004000400040004000400040004000400040004",
      INIT_05 => X"0004000400040004000400040004000400040004000400040004000400040004",
      INIT_06 => X"0002000200020002000200020002000200020002000200020004000400040004",
      INIT_07 => X"0002000200020002000200020002000200020002000200020002000200020002",
      INIT_08 => X"0002000200020002000200020002000200020002000200020002000200020002",
      INIT_09 => X"0002000200020002000200020002000200020002000200020002000200020002",
      INIT_0A => X"0001000100010001000100010001000100010001000100010001000100010001",
      INIT_0B => X"0001000100010001000100010001000100010001000100010001000100010001",
      INIT_0C => X"0004000400040004000400040004000400010001000100010001000100010001",
      INIT_0D => X"0004000400040004000400040004000400040004000400040004000400040004",
      INIT_0E => X"0004000400040004000400040004000400040004000400040004000400040004",
      INIT_0F => X"0004000400040004000400040004000400040004000400040004000400040004",
      INIT_10 => X"0002000200020002000200020002000200020002000200020004000400040004",
      INIT_11 => X"0002000200020002000200020002000200020002000200020002000200020002",
      INIT_12 => X"0002000200020002000200020002000200020002000200020002000200020002",
      INIT_13 => X"0002000200020002000200020002000200020002000200020002000200020002",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"00000",
      INIT_B => X"00000",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "PERFORMANCE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"00000",
      SRVAL_B => X"00000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 0
    )
        port map (
      ADDRARDADDR(13) => '0',
      ADDRARDADDR(12 downto 4) => \read_port__addr\(8 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 0) => B"11111111111111",
      CLKARDCLK => clk,
      CLKBWRCLK => '0',
      DIADI(15 downto 0) => B"0000000000000111",
      DIBDI(15 downto 0) => B"1111111111111111",
      DIPADIP(1 downto 0) => B"00",
      DIPBDIP(1 downto 0) => B"11",
      DOADO(15 downto 3) => \NLW__0__reg_DOADO_UNCONNECTED\(15 downto 3),
      DOADO(2 downto 0) => \produce__data\(2 downto 0),
      DOBDO(15 downto 0) => \NLW__0__reg_DOBDO_UNCONNECTED\(15 downto 0),
      DOPADOP(1 downto 0) => \NLW__0__reg_DOPADOP_UNCONNECTED\(1 downto 0),
      DOPBDOP(1 downto 0) => \NLW__0__reg_DOPBDOP_UNCONNECTED\(1 downto 0),
      ENARDEN => \read_port__en\,
      ENBWREN => '0',
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
\_0__reg_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8F"
    )
        port map (
      I0 => \produce__ready\,
      I1 => \^produce__valid_reg_0\,
      I2 => fsm_state,
      O => \read_port__en\
    );
fsm_state_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rst,
      O => fsm_state_i_1_n_0
    );
fsm_state_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => fsm_state_i_1_n_0,
      Q => fsm_state,
      R => '0'
    );
\pix_counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => pix_counter_reg(0),
      O => \$7\(0)
    );
\pix_counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => pix_counter_reg(0),
      I1 => pix_counter_reg(1),
      O => \$7\(1)
    );
\pix_counter[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => pix_counter_reg(1),
      I1 => pix_counter_reg(0),
      I2 => pix_counter_reg(2),
      O => \$7\(2)
    );
\pix_counter[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => pix_counter_reg(2),
      I1 => pix_counter_reg(0),
      I2 => pix_counter_reg(1),
      I3 => pix_counter_reg(3),
      O => \$7\(3)
    );
\pix_counter[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => pix_counter_reg(3),
      I1 => pix_counter_reg(1),
      I2 => pix_counter_reg(0),
      I3 => pix_counter_reg(2),
      I4 => pix_counter_reg(4),
      O => \$7\(4)
    );
\pix_counter[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => pix_counter_reg(4),
      I1 => pix_counter_reg(2),
      I2 => pix_counter_reg(0),
      I3 => pix_counter_reg(1),
      I4 => pix_counter_reg(3),
      I5 => pix_counter_reg(5),
      O => \$7\(5)
    );
\pix_counter[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \produce__vsync_INST_0_i_1_n_0\,
      I1 => pix_counter_reg(6),
      O => \$7\(6)
    );
\pix_counter[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D2"
    )
        port map (
      I0 => pix_counter_reg(6),
      I1 => \produce__vsync_INST_0_i_1_n_0\,
      I2 => pix_counter_reg(7),
      O => \$7\(7)
    );
\pix_counter[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => \produce__vsync_INST_0_i_1_n_0\,
      I1 => \pix_counter[8]_i_4_n_0\,
      I2 => rst,
      O => \$11\
    );
\pix_counter[8]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \produce__ready\,
      I1 => \^produce__valid_reg_0\,
      I2 => fsm_state,
      O => \$6\
    );
\pix_counter[8]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DF20"
    )
        port map (
      I0 => pix_counter_reg(7),
      I1 => \produce__vsync_INST_0_i_1_n_0\,
      I2 => pix_counter_reg(6),
      I3 => pix_counter_reg(8),
      O => \$7\(8)
    );
\pix_counter[8]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0008000000000000"
    )
        port map (
      I0 => pix_counter_reg(8),
      I1 => fsm_state,
      I2 => pix_counter_reg(6),
      I3 => pix_counter_reg(7),
      I4 => \produce__ready\,
      I5 => \^produce__valid_reg_0\,
      O => \pix_counter[8]_i_4_n_0\
    );
\pix_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \$6\,
      D => \$7\(0),
      Q => pix_counter_reg(0),
      R => \$11\
    );
\pix_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \$6\,
      D => \$7\(1),
      Q => pix_counter_reg(1),
      R => \$11\
    );
\pix_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \$6\,
      D => \$7\(2),
      Q => pix_counter_reg(2),
      R => \$11\
    );
\pix_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \$6\,
      D => \$7\(3),
      Q => pix_counter_reg(3),
      R => \$11\
    );
\pix_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \$6\,
      D => \$7\(4),
      Q => pix_counter_reg(4),
      R => \$11\
    );
\pix_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \$6\,
      D => \$7\(5),
      Q => pix_counter_reg(5),
      R => \$11\
    );
\pix_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \$6\,
      D => \$7\(6),
      Q => pix_counter_reg(6),
      R => \$11\
    );
\pix_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \$6\,
      D => \$7\(7),
      Q => pix_counter_reg(7),
      R => \$11\
    );
\pix_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \$6\,
      D => \$7\(8),
      Q => pix_counter_reg(8),
      R => \$11\
    );
\produce__valid_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0B"
    )
        port map (
      I0 => \^produce__valid_reg_0\,
      I1 => fsm_state,
      I2 => rst,
      O => \produce__valid_i_1_n_0\
    );
\produce__valid_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \produce__valid_i_1_n_0\,
      Q => \^produce__valid_reg_0\,
      R => '0'
    );
\produce__vsync_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => pix_counter_reg(6),
      I1 => pix_counter_reg(8),
      I2 => pix_counter_reg(7),
      I3 => \produce__vsync_INST_0_i_1_n_0\,
      O => \produce__vsync\
    );
\produce__vsync_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => pix_counter_reg(4),
      I1 => pix_counter_reg(2),
      I2 => pix_counter_reg(0),
      I3 => pix_counter_reg(1),
      I4 => pix_counter_reg(3),
      I5 => pix_counter_reg(5),
      O => \produce__vsync_INST_0_i_1_n_0\
    );
\read_port__addr_reg_rep[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \read_port__en\,
      D => \$5\(0),
      Q => \read_port__addr\(0),
      R => \$9\
    );
\read_port__addr_reg_rep[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \read_port__en\,
      D => \$5\(1),
      Q => \read_port__addr\(1),
      R => \$9\
    );
\read_port__addr_reg_rep[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \read_port__en\,
      D => \$5\(2),
      Q => \read_port__addr\(2),
      R => \$9\
    );
\read_port__addr_reg_rep[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \read_port__en\,
      D => \$5\(3),
      Q => \read_port__addr\(3),
      R => \$9\
    );
\read_port__addr_reg_rep[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \read_port__en\,
      D => \$5\(4),
      Q => \read_port__addr\(4),
      R => \$9\
    );
\read_port__addr_reg_rep[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \read_port__en\,
      D => \$5\(5),
      Q => \read_port__addr\(5),
      R => \$9\
    );
\read_port__addr_reg_rep[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \read_port__en\,
      D => \$5\(6),
      Q => \read_port__addr\(6),
      R => \$9\
    );
\read_port__addr_reg_rep[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \read_port__en\,
      D => \$5\(7),
      Q => \read_port__addr\(7),
      R => \$9\
    );
\read_port__addr_reg_rep[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \read_port__en\,
      D => \$5\(8),
      Q => \read_port__addr\(8),
      R => \$9\
    );
\read_port__addr_rep[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \read_port__addr\(0),
      O => \$5\(0)
    );
\read_port__addr_rep[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \read_port__addr\(0),
      I1 => \read_port__addr\(1),
      O => \$5\(1)
    );
\read_port__addr_rep[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \read_port__addr\(1),
      I1 => \read_port__addr\(0),
      I2 => \read_port__addr\(2),
      O => \$5\(2)
    );
\read_port__addr_rep[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \read_port__addr\(2),
      I1 => \read_port__addr\(0),
      I2 => \read_port__addr\(1),
      I3 => \read_port__addr\(3),
      O => \$5\(3)
    );
\read_port__addr_rep[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \read_port__addr\(3),
      I1 => \read_port__addr\(1),
      I2 => \read_port__addr\(0),
      I3 => \read_port__addr\(2),
      I4 => \read_port__addr\(4),
      O => \$5\(4)
    );
\read_port__addr_rep[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \read_port__addr\(4),
      I1 => \read_port__addr\(2),
      I2 => \read_port__addr\(0),
      I3 => \read_port__addr\(1),
      I4 => \read_port__addr\(3),
      I5 => \read_port__addr\(5),
      O => \$5\(5)
    );
\read_port__addr_rep[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \read_port__addr_rep[8]_i_3_n_0\,
      I1 => \read_port__addr\(6),
      O => \$5\(6)
    );
\read_port__addr_rep[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D2"
    )
        port map (
      I0 => \read_port__addr\(6),
      I1 => \read_port__addr_rep[8]_i_3_n_0\,
      I2 => \read_port__addr\(7),
      O => \$5\(7)
    );
\read_port__addr_rep[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00100000"
    )
        port map (
      I0 => \read_port__addr_rep[8]_i_3_n_0\,
      I1 => \read_port__addr\(6),
      I2 => \read_port__addr\(8),
      I3 => \read_port__addr\(7),
      I4 => \read_port__en\,
      I5 => rst,
      O => \$9\
    );
\read_port__addr_rep[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DF20"
    )
        port map (
      I0 => \read_port__addr\(7),
      I1 => \read_port__addr_rep[8]_i_3_n_0\,
      I2 => \read_port__addr\(6),
      I3 => \read_port__addr\(8),
      O => \$5\(8)
    );
\read_port__addr_rep[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \read_port__addr\(4),
      I1 => \read_port__addr\(2),
      I2 => \read_port__addr\(0),
      I3 => \read_port__addr\(1),
      I4 => \read_port__addr\(3),
      I5 => \read_port__addr\(5),
      O => \read_port__addr_rep[8]_i_3_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity display_driver_vga_verify_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    \produce__data\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \produce__valid\ : out STD_LOGIC;
    \produce__vsync\ : out STD_LOGIC;
    \produce__ready\ : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of display_driver_vga_verify_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of display_driver_vga_verify_0_0 : entity is "display_driver_vga_verify_0_0,vga_verify,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of display_driver_vga_verify_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of display_driver_vga_verify_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of display_driver_vga_verify_0_0 : entity is "vga_verify,Vivado 2024.1";
end display_driver_vga_verify_0_0;

architecture STRUCTURE of display_driver_vga_verify_0_0 is
  signal \^produce__data\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 120000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  attribute src : string;
  attribute src of clk : signal is "C:\Users\magen\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\LocalCache\local-packages\Python311\site-packages\amaranth\hdl\_ir.py:283";
  attribute src of \produce__ready\ : signal is "C:\Users\magen\Documents\Programs\gameboy\ppu\signature.py:19";
  attribute X_INTERFACE_INFO of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute X_INTERFACE_PARAMETER of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute src of rst : signal is "C:\Users\magen\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\LocalCache\local-packages\Python311\site-packages\amaranth\hdl\_ir.py:283";
begin
  \produce__data\(11) <= \^produce__data\(8);
  \produce__data\(10) <= \^produce__data\(8);
  \produce__data\(9) <= \^produce__data\(8);
  \produce__data\(8) <= \^produce__data\(8);
  \produce__data\(7) <= \^produce__data\(4);
  \produce__data\(6) <= \^produce__data\(4);
  \produce__data\(5) <= \^produce__data\(4);
  \produce__data\(4) <= \^produce__data\(4);
  \produce__data\(3) <= \^produce__data\(0);
  \produce__data\(2) <= \^produce__data\(0);
  \produce__data\(1) <= \^produce__data\(0);
  \produce__data\(0) <= \^produce__data\(0);
inst: entity work.display_driver_vga_verify_0_0_vga_verify
     port map (
      clk => clk,
      \produce__data\(2) => \^produce__data\(8),
      \produce__data\(1) => \^produce__data\(4),
      \produce__data\(0) => \^produce__data\(0),
      \produce__ready\ => \produce__ready\,
      \produce__valid_reg_0\ => \produce__valid\,
      \produce__vsync\ => \produce__vsync\,
      rst => rst
    );
end STRUCTURE;
