# Gameboy Emulator

Functional FPGA implementation of gameboy operation.

## CPU

The original CPU of the gameboy is a unique implementation, it is close to an intel 8080 or z80 processor.
There are some instruction differences and details.

## PPU

The picture processing unit render sprites and tiles. After retrieving attribute information from memory,
The unit combines pixels from sprite and window fifos, and then displays them on a 160x144

## Display

Because my current hardware has a VGA output, the LCD display is rendered as an 800x600 60Hz display. It is upsampled, with borders on each side.
