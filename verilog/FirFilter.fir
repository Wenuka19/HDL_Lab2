circuit FirFilter :
  module FirFilter :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : SInt<16>, out : SInt<16>}

    reg zs : SInt<16>[5], clock with :
      reset => (UInt<1>("h0"), zs) @[FirFilter.scala 11:15]
    zs[0] <= io.in @[FirFilter.scala 12:9]
    zs[1] <= zs[0] @[FirFilter.scala 14:11]
    zs[2] <= zs[1] @[FirFilter.scala 14:11]
    zs[3] <= zs[2] @[FirFilter.scala 14:11]
    zs[4] <= zs[3] @[FirFilter.scala 14:11]
    node _products_T = mul(zs[0], asSInt(UInt<3>("h5"))) @[FirFilter.scala 18:61]
    node _products_T_1 = mul(zs[1], asSInt(UInt<4>("h5"))) @[FirFilter.scala 18:61]
    node _products_T_2 = mul(zs[2], asSInt(UInt<4>("h7"))) @[FirFilter.scala 18:61]
    node _products_T_3 = mul(zs[3], asSInt(UInt<4>("h5"))) @[FirFilter.scala 18:61]
    node _products_T_4 = mul(zs[4], asSInt(UInt<3>("h5"))) @[FirFilter.scala 18:61]
    wire products : SInt<20>[5] @[FirFilter.scala 18:49]
    products[0] <= _products_T @[FirFilter.scala 18:49]
    products[1] <= _products_T_1 @[FirFilter.scala 18:49]
    products[2] <= _products_T_2 @[FirFilter.scala 18:49]
    products[3] <= _products_T_3 @[FirFilter.scala 18:49]
    products[4] <= _products_T_4 @[FirFilter.scala 18:49]
    node _io_out_T = add(products[0], products[1]) @[FirFilter.scala 21:31]
    node _io_out_T_1 = tail(_io_out_T, 1) @[FirFilter.scala 21:31]
    node _io_out_T_2 = asSInt(_io_out_T_1) @[FirFilter.scala 21:31]
    node _io_out_T_3 = add(_io_out_T_2, products[2]) @[FirFilter.scala 21:31]
    node _io_out_T_4 = tail(_io_out_T_3, 1) @[FirFilter.scala 21:31]
    node _io_out_T_5 = asSInt(_io_out_T_4) @[FirFilter.scala 21:31]
    node _io_out_T_6 = add(_io_out_T_5, products[3]) @[FirFilter.scala 21:31]
    node _io_out_T_7 = tail(_io_out_T_6, 1) @[FirFilter.scala 21:31]
    node _io_out_T_8 = asSInt(_io_out_T_7) @[FirFilter.scala 21:31]
    node _io_out_T_9 = add(_io_out_T_8, products[4]) @[FirFilter.scala 21:31]
    node _io_out_T_10 = tail(_io_out_T_9, 1) @[FirFilter.scala 21:31]
    node _io_out_T_11 = asSInt(_io_out_T_10) @[FirFilter.scala 21:31]
    io.out <= _io_out_T_11 @[FirFilter.scala 21:10]

