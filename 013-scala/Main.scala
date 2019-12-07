import scala.io.{Source}

object Main {

  def main(args: Array[String]): Unit = {
    println(
      Source.fromFile("numbers.txt")
        .getLines
        .toList
        .map({n: String => BigInt(n)})
        .reduce(_ + _)
        .toString
        .take(10)
      )
  }
}
