module FirFilter(
  input         clock,
  input         reset,
  input  [15:0] io_in,
  output [15:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] zs_0; // @[FirFilter.scala 11:15]
  reg [15:0] zs_1; // @[FirFilter.scala 11:15]
  reg [15:0] zs_2; // @[FirFilter.scala 11:15]
  reg [15:0] zs_3; // @[FirFilter.scala 11:15]
  reg [15:0] zs_4; // @[FirFilter.scala 11:15]
  wire [18:0] _products_T = $signed(zs_0) * -3'sh3; // @[FirFilter.scala 18:61]
  wire [19:0] products_1 = $signed(zs_1) * 4'sh5; // @[FirFilter.scala 18:61]
  wire [19:0] products_2 = $signed(zs_2) * 4'sh7; // @[FirFilter.scala 18:61]
  wire [19:0] products_3 = $signed(zs_3) * 4'sh5; // @[FirFilter.scala 18:61]
  wire [18:0] _products_T_4 = $signed(zs_4) * -3'sh3; // @[FirFilter.scala 18:61]
  wire [19:0] products_0 = {{1{_products_T[18]}},_products_T}; // @[FirFilter.scala 18:{49,49}]
  wire [19:0] _io_out_T_2 = $signed(products_0) + $signed(products_1); // @[FirFilter.scala 21:31]
  wire [19:0] _io_out_T_5 = $signed(_io_out_T_2) + $signed(products_2); // @[FirFilter.scala 21:31]
  wire [19:0] _io_out_T_8 = $signed(_io_out_T_5) + $signed(products_3); // @[FirFilter.scala 21:31]
  wire [19:0] products_4 = {{1{_products_T_4[18]}},_products_T_4}; // @[FirFilter.scala 18:{49,49}]
  wire [19:0] _io_out_T_11 = $signed(_io_out_T_8) + $signed(products_4); // @[FirFilter.scala 21:31]
  assign io_out = _io_out_T_11[15:0]; // @[FirFilter.scala 21:10]
  always @(posedge clock) begin
    zs_0 <= io_in; // @[FirFilter.scala 12:9]
    zs_1 <= zs_0; // @[FirFilter.scala 14:11]
    zs_2 <= zs_1; // @[FirFilter.scala 14:11]
    zs_3 <= zs_2; // @[FirFilter.scala 14:11]
    zs_4 <= zs_3; // @[FirFilter.scala 14:11]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  zs_0 = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  zs_1 = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  zs_2 = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  zs_3 = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  zs_4 = _RAND_4[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
