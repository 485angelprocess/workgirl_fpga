/* Generated by Amaranth Yosys 0.40 (PyPI ver 0.40.0.0.post101, git sha1 a1bb0255d) */

(* top =  1  *)
(* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:94" *)
(* generator = "Amaranth" *)
module vga_driver_svga(consume__valid, consume__vsync, clk, rst, consume__ready, data, hsync, vsync, consume__data);
  reg \$auto$verilog_backend.cc:2352:dump_module$1  = 0;
  wire \$1 ;
  reg [1:0] \$10 ;
  reg \$11 ;
  wire \$2 ;
  wire \$3 ;
  wire \$4 ;
  wire \$5 ;
  wire [2:0] \$6 ;
  wire \$7 ;
  wire \$8 ;
  wire \$9 ;
  (* src = "C:\\Users\\magen\\AppData\\Local\\Packages\\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\\LocalCache\\local-packages\\Python311\\site-packages\\amaranth\\hdl\\_ir.py:283" *)
  input clk;
  wire clk;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:38" *)
  wire clk_en;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:38" *)
  wire \clk_en$12 ;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:86" *)
  input [11:0] consume__data;
  wire [11:0] consume__data;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:86" *)
  wire [3:0] \consume__data.b ;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:86" *)
  wire [3:0] \consume__data.g ;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:86" *)
  wire [3:0] \consume__data.r ;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\signature.py:19" *)
  output consume__ready;
  reg consume__ready;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\signature.py:18" *)
  input consume__valid;
  wire consume__valid;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\signature.py:20" *)
  input consume__vsync;
  wire consume__vsync;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:88" *)
  output [11:0] data;
  reg [11:0] data;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:89" *)
  output hsync;
  wire hsync;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:117" *)
  reg input_enable = 1'h0;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:40" *)
  wire ovf;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:98" *)
  wire pix_clk;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:97" *)
  reg [1:0] pix_counter = 2'h0;
  (* src = "C:\\Users\\magen\\AppData\\Local\\Packages\\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\\LocalCache\\local-packages\\Python311\\site-packages\\amaranth\\hdl\\_ir.py:283" *)
  input rst;
  wire rst;
  (* enum_base_type = "VideoState" *)
  (* enum_value_00 = "ACTIVE" *)
  (* enum_value_01 = "FP" *)
  (* enum_value_10 = "SYNC" *)
  (* enum_value_11 = "BP" *)
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:39" *)
  wire [1:0] state;
  (* enum_base_type = "VideoState" *)
  (* enum_value_00 = "ACTIVE" *)
  (* enum_value_01 = "FP" *)
  (* enum_value_10 = "SYNC" *)
  (* enum_value_11 = "BP" *)
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:39" *)
  wire [1:0] \state$16 ;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:118" *)
  wire video_active;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:90" *)
  output vsync;
  wire vsync;
  assign pix_clk = ! (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:100" *) pix_counter;
  assign \$1  = ! (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:121" *) state;
  assign \$2  = ! (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:122" *) \state$16 ;
  assign video_active = \$1  & (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:121" *) \$2 ;
  assign \$3  = input_enable & (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:124" *) video_active;
  assign \$4  = video_active & (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:135" *) input_enable;
  assign hsync = state == (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:145" *) 2'h2;
  assign vsync = \state$16  == (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:146" *) 2'h2;
  assign \$5  = pix_counter == (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:102" *) 2'h2;
  assign \$6  = pix_counter + (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:105" *) 1'h1;
  assign \$7  = consume__ready & (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:128" *) consume__valid;
  assign \$8  = \$7  & (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:128" *) consume__vsync;
  assign \$9  = \state$16  == (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:132" *) 2'h2;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:97" *)
  always @(posedge clk)
    pix_counter <= \$10 ;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:117" *)
  always @(posedge clk)
    input_enable <= \$11 ;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:108" *)
  \vga_driver_svga.hcounter  hcounter (
    .clk(clk),
    .clk_en(pix_clk),
    .\ovf$2 (\clk_en$12 ),
    .rst(rst),
    .state(state)
  );
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:113" *)
  \vga_driver_svga.vcounter  vcounter (
    .clk(clk),
    .clk_en(\clk_en$12 ),
    .rst(rst),
    .state(\state$16 )
  );
  always @* begin
    if (\$auto$verilog_backend.cc:2352:dump_module$1 ) begin end
    consume__ready = 1'h0;
    if (\$3 ) begin
      consume__ready = pix_clk;
    end
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2352:dump_module$1 ) begin end
    (* full_case = 32'd1 *)
    if (\$4 ) begin
      data[3:0] = consume__data[3:0];
      data[7:4] = consume__data[7:4];
      data[11:8] = consume__data[11:8];
    end else begin
      data = 12'h000;
    end
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2352:dump_module$1 ) begin end
    (* full_case = 32'd1 *)
    if (\$5 ) begin
      \$10  = 2'h0;
    end else begin
      \$10  = \$6 [1:0];
    end
    if (rst) begin
      \$10  = 2'h0;
    end
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2352:dump_module$1 ) begin end
    \$11  = input_enable;
    if (\$8 ) begin
      \$11  = 1'h0;
    end
    if (\$9 ) begin
      \$11  = 1'h1;
    end
    if (rst) begin
      \$11  = 1'h0;
    end
  end
  assign clk_en = pix_clk;
  assign ovf = \clk_en$12 ;
  assign \consume__data.r  = consume__data[3:0];
  assign \consume__data.g  = consume__data[7:4];
  assign \consume__data.b  = consume__data[11:8];
endmodule

(* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:44" *)
(* generator = "Amaranth" *)
module \vga_driver_svga.hcounter (rst, clk_en, \ovf$2 , state, clk);
  reg \$auto$verilog_backend.cc:2352:dump_module$2  = 0;
  wire \$1 ;
  wire \$2 ;
  wire \$3 ;
  wire [11:0] \$4 ;
  reg [10:0] \$5 ;
  (* src = "C:\\Users\\magen\\AppData\\Local\\Packages\\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\\LocalCache\\local-packages\\Python311\\site-packages\\amaranth\\hdl\\_ir.py:283" *)
  input clk;
  wire clk;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:38" *)
  input clk_en;
  wire clk_en;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *)
  reg [10:0] counter = 11'h000;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:47" *)
  wire ovf;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:40" *)
  output \ovf$2 ;
  wire \ovf$2 ;
  (* src = "C:\\Users\\magen\\AppData\\Local\\Packages\\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\\LocalCache\\local-packages\\Python311\\site-packages\\amaranth\\hdl\\_ir.py:283" *)
  input rst;
  wire rst;
  (* enum_base_type = "VideoState" *)
  (* enum_value_00 = "ACTIVE" *)
  (* enum_value_01 = "FP" *)
  (* enum_value_10 = "SYNC" *)
  (* enum_value_11 = "BP" *)
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:39" *)
  output [1:0] state;
  reg [1:0] state;
  assign \$3  = counter < (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:58" *) 10'h3f8;
  assign \$4  = counter + (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:67" *) 1'h1;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *)
  always @(posedge clk)
    counter <= \$5 ;
  assign ovf = counter == (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:49" *) 11'h41f;
  assign \ovf$2  = ovf & (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:50" *) clk_en;
  assign \$1  = counter < (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:54" *) 7'h58;
  assign \$2  = counter < (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:56" *) 10'h378;
  always @* begin
    if (\$auto$verilog_backend.cc:2352:dump_module$2 ) begin end
    (* full_case = 32'd1 *)
    if (\$1 ) begin
      state = 2'h3;
    end else if (\$2 ) begin
      state = 2'h0;
    end else if (\$3 ) begin
      state = 2'h1;
    end else begin
      state = 2'h2;
    end
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2352:dump_module$2 ) begin end
    \$5  = counter;
    if (clk_en) begin
      (* full_case = 32'd1 *)
      if (\ovf$2 ) begin
        \$5  = 11'h000;
      end else begin
        \$5  = \$4 [10:0];
      end
    end
    if (rst) begin
      \$5  = 11'h000;
    end
  end
endmodule

(* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:44" *)
(* generator = "Amaranth" *)
module \vga_driver_svga.vcounter (rst, clk_en, state, clk);
  reg \$auto$verilog_backend.cc:2352:dump_module$3  = 0;
  wire \$1 ;
  wire \$2 ;
  wire \$3 ;
  wire [10:0] \$4 ;
  reg [9:0] \$5 ;
  (* src = "C:\\Users\\magen\\AppData\\Local\\Packages\\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\\LocalCache\\local-packages\\Python311\\site-packages\\amaranth\\hdl\\_ir.py:283" *)
  input clk;
  wire clk;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:38" *)
  input clk_en;
  wire clk_en;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *)
  reg [9:0] counter = 10'h000;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:47" *)
  wire ovf;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:40" *)
  wire \ovf$2 ;
  (* src = "C:\\Users\\magen\\AppData\\Local\\Packages\\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\\LocalCache\\local-packages\\Python311\\site-packages\\amaranth\\hdl\\_ir.py:283" *)
  input rst;
  wire rst;
  (* enum_base_type = "VideoState" *)
  (* enum_value_00 = "ACTIVE" *)
  (* enum_value_01 = "FP" *)
  (* enum_value_10 = "SYNC" *)
  (* enum_value_11 = "BP" *)
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:39" *)
  output [1:0] state;
  reg [1:0] state;
  assign \$3  = counter < (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:58" *) 10'h273;
  assign \$4  = counter + (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:67" *) 1'h1;
  (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:46" *)
  always @(posedge clk)
    counter <= \$5 ;
  assign ovf = counter == (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:49" *) 10'h273;
  assign \ovf$2  = ovf & (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:50" *) clk_en;
  assign \$1  = counter < (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:54" *) 5'h17;
  assign \$2  = counter < (* src = "C:\\Users\\magen\\Documents\\Programs\\gameboy\\ppu\\vga.py:56" *) 10'h26f;
  always @* begin
    if (\$auto$verilog_backend.cc:2352:dump_module$3 ) begin end
    (* full_case = 32'd1 *)
    if (\$1 ) begin
      state = 2'h3;
    end else if (\$2 ) begin
      state = 2'h0;
    end else if (\$3 ) begin
      state = 2'h1;
    end else begin
      state = 2'h2;
    end
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2352:dump_module$3 ) begin end
    \$5  = counter;
    if (clk_en) begin
      (* full_case = 32'd1 *)
      if (\ovf$2 ) begin
        \$5  = 10'h000;
      end else begin
        \$5  = \$4 [9:0];
      end
    end
    if (rst) begin
      \$5  = 10'h000;
    end
  end
endmodule
