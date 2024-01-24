object GapInPrimes {
  
  def gap(g: Int, m: Long, n: Long): String =
    val primes = LazyList.from(m.toInt).takeWhile(_ <= n).filter(isPrime)
    primes match
      case LazyList() => ""
      case list => list.zip(primes.tail).find(a => a._2 - a._1 == g).map(a => s"(${a._1},${a._2})").getOrElse("")

  def isPrime(i: Int): Boolean =
    if (i <= 1)
      false
    else if (i == 2)
      true
    else
      !(2 until i).exists(n => i % n == 0)

}  
