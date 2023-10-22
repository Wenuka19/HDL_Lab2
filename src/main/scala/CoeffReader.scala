package hdl_lab2
import scala.io.Source
import chisel3._

object CoeffReader{
  def readFromCSV(filename: String): Seq[SInt] = {
    val source = Source.fromFile(filename)
    val lines = source.getLines().toList
    val coeffs = lines.map { line =>
      val cleanedLine = line.replace("\uFEFF", "") // Remove BOM
      val coeffValue = BigInt(cleanedLine.trim)
      coeffValue.S
    }.toSeq
    source.close()
    coeffs
  }: Seq[SInt]
}