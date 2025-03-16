from ppu.vga import VideoRegion, vga_tb
from ppu.lcd_to_vga import tb_vertical_resample, tb_horizontal_resample
from ppu.sprite import tb_sprite_checker

from test import test_cpu

import unittest

class TestDisplay(unittest.TestCase):
    def test_vga(self):
        vga_tb(3, VideoRegion(10, 2, 2, 2), VideoRegion(10, 2, 2, 2))
    
    def test_vertical_resize(self):
        tb_vertical_resample()
        
    def test_horizontal_resize(self):
        tb_horizontal_resample()
        
class TestSprite(object):
    def test_sprite_check(self):
        tb_sprite_checker()
        
from common.interconnect import tb_interconnect
        
class TestInfrastructure(unittest.TestCase):
    def test_interconnect(self):
        tb_interconnect()
        
def run(t, msg):
    print("Running test")
    print(msg)
    t()
    print(".....OK")
    
def run_test(t):
    for d in dir(t):
        if d.startswith("test"):
            print("Test: {}".format(d))
            getattr(t, d)()
            print("OK")

if __name__ == "__main__":
    test_display = TestDisplay()
    
    run(test_display.test_vga, "VGA gets display from stream")
    run(test_display.test_vertical_resize, "Test vertical upscaling")
    run(test_display.test_horizontal_resize, "Test horizontal upscaling")
    # TODO test for overall rescaling, write when I want to minimize the resizer
    
    test_sprite = TestSprite()
    
    run(test_sprite.test_sprite_check, "Sprite are checked for valid values")
    
    test_infra = TestInfrastructure()
    
    run(test_infra.test_interconnect, "Interconnect routes data")
    
    modules = [test_cpu]
    
    for m in modules:
        for d in dir(m):
            if d.startswith("Test"):
                print("Running test {}".format(d))
                run_test(getattr(m, d)())
    