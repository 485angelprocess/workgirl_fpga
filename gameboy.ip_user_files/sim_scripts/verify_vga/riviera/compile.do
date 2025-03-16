transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xil_defaultlib
vlib riviera/lib_cdc_v1_0_3
vlib riviera/proc_sys_reset_v5_0_15

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib
vmap lib_cdc_v1_0_3 riviera/lib_cdc_v1_0_3
vmap proc_sys_reset_v5_0_15 riviera/proc_sys_reset_v5_0_15

vlog -work xpm  -incr -l xpm -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  -incr \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 -l xpm -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 \
"../../../bd/verify_vga/ip/verify_vga_lcd_to_vga_0_0/sim/verify_vga_lcd_to_vga_0_0.v" \

vcom -work lib_cdc_v1_0_3 -93  -incr \
"../../../../gameboy.gen/sources_1/bd/verify_vga/ipshared/2a4f/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_15 -93  -incr \
"../../../../gameboy.gen/sources_1/bd/verify_vga/ipshared/3a26/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/verify_vga/ip/verify_vga_proc_sys_reset_0_0/sim/verify_vga_proc_sys_reset_0_0.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 -l xpm -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 \
"../../../bd/verify_vga/ip/verify_vga_vga_driver_svga_0_0/sim/verify_vga_vga_driver_svga_0_0.v" \
"../../../bd/verify_vga/ip/verify_vga_vga_verify_0_0/sim/verify_vga_vga_verify_0_0.v" \
"../../../bd/verify_vga/sim/verify_vga.v" \

vlog -work xil_defaultlib \
"glbl.v"

