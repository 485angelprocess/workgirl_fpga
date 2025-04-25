# Workgirl Emulator

Functional FPGA implementation of workgirl operation (functional as in not a faithful hardware copy, but it is not yet operatioanl)

## CPU

The original CPU of the workgirl is a unique implementation, it is close to an intel 8080 or z80 processor.
There are some instruction differences and details.

### Instruction Implementation

Chart of implemented instructions:

| | 0x0 | 0x1 | 0x2 | 0x3 | 0x4 | 0x5 | 0x6 | 0x7 | 0x8 | 0x9 | 0xA | 0xB | 0xC | 0xD | 0xE | 0xF |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
0x0 | &#x2705; noop | &#x2705; load | &#x274C; | &#x2705; Inc_ | &#x2705; Inc_ | &#x2705; Dec_ | &#x2705; load | &#x274C; | &#x274C; | &#x274C; | &#x2705; load | &#x2705; Dec_ | &#x274C; | &#x274C; | &#x2705; load | &#x274C;| 
0x1 | &#x2705; Stop | &#x2705; load | &#x274C; | &#x2705; Inc_ | &#x2705; Inc_ | &#x2705; Dec_ | &#x2705; load | &#x274C; | &#x274C; | &#x274C; | &#x2705; load | &#x2705; Dec_ | &#x274C; | &#x274C; | &#x2705; load | &#x274C;| 
0x2 | &#x274C; | &#x2705; load | &#x274C; | &#x2705; Inc_ | &#x2705; Inc_ | &#x2705; Dec_ | &#x2705; load | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x2705; Dec_ | &#x274C; | &#x274C; | &#x2705; load | &#x274C;| 
0x3 | &#x274C; | &#x2705; load | &#x274C; | &#x2705; Inc_ | &#x274C; | &#x274C; | &#x2705; load | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x2705; Dec_ | &#x274C; | &#x274C; | &#x2705; load | &#x274C;| 
0x4 | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x274C; | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x274C;| 
0x5 | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x274C; | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x274C;| 
0x6 | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x274C; | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x274C; | &#x2705; load | &#x274C;| 
0x7 | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; Halt | &#x274C; | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load | &#x2705; load| 
0x8 | &#x2705; Add_ | &#x2705; Add_ | &#x2705; Add_ | &#x2705; Add_ | &#x2705; Add_ | &#x2705; Add_ | &#x2705; Add_ | &#x2705; Add_ | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C;| 
0x9 | &#x2705; Sub_ | &#x2705; Sub_ | &#x2705; Sub_ | &#x2705; Sub_ | &#x2705; Sub_ | &#x2705; Sub_ | &#x2705; Sub_ | &#x2705; Sub_ | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C;| 
0xA | &#x2705; And_ | &#x2705; And_ | &#x2705; And_ | &#x2705; And_ | &#x2705; And_ | &#x2705; And_ | &#x2705; And_ | &#x2705; And_ | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C;| 
0xB | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C;| 
0xC | &#x274C; | &#x2705; pop_ | &#x274C; | &#x274C; | &#x274C; | &#x2705; push | &#x2705; Add_ | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C;| 
0xD | &#x274C; | &#x2705; pop_ | &#x274C; | &#x274C; | &#x274C; | &#x2705; push | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C;| 
0xE | &#x274C; | &#x2705; pop_ | &#x274C; | &#x274C; | &#x274C; | &#x2705; push | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x274C;| 
0xF | &#x274C; | &#x2705; pop_ | &#x274C; | &#x2705; Disa | &#x274C; | &#x2705; push | &#x274C; | &#x274C; | &#x274C; | &#x274C; | &#x2705; load | &#x2705; Enab | &#x274C; | &#x274C; | &#x274C; | 




## PPU

The picture processing unit render sprites and tiles. After retrieving attribute information from memory,
The unit combines pixels from sprite and window fifos, and then displays them on a 160x144

## Display

Because my current hardware has a VGA output, the LCD display is rendered as an 800x600 60Hz display. It is upsampled, with borders on each side.
