package hdl_lab2
import chisel3._
import chisel3.stage._

class FirFilter(bitWidth: Int,coeffs: Seq[SInt]) extends Module {
  val io = IO(new Bundle {
    val in = Input(SInt(bitWidth.W))
    val out = Output(SInt(bitWidth.W))
  })
  // Create the serial-in, parallel-out shift register
  val zs = Reg(Vec(coeffs.length, SInt(bitWidth.W)))
  zs(0) := io.in
  for (i <- 1 until coeffs.length) {
    zs(i) := zs(i-1)
  }

  // Do the multiplies
  val products = VecInit.tabulate(coeffs.length)(i => zs(i) * coeffs(i))

  // Sum up the products
  io.out := products.reduce(_ + _)
}



object FirFilter extends App {
  val coeffs = CoeffReader.readFromCSV("resources/input_file.csv")
  var myverilog = (new ChiselStage).emitVerilog(
    new FirFilter(16,coeffs),
    Array("--target-dir","verilog/")
  )
}

