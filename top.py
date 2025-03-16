from amaranth import *
from amaranth.lib import wiring

from ppu.vga import VgaDriver, VideoRegion
from ppu.lcd_to_vga import Upsample, Border, Resize

import numpy as np

def display_module():
    display = Module()
    
    display.submodules.vga = vga = VgaDriver(3, 
                        VideoRegion(800, 40, 128, 88), 
                        VideoRegion(600, 1, 4, 23))
    upsample = Upsample(4, width = 160)
    border = Border(80, 12)
    display.submodules.resize = resize = Resize(upsample, border)
    
    wiring.connect(display, vga.consume, resize.produce)
    
    return display