object SumSquaredDivisors {

  def listSquared(m: Long, n: Long): String = {
    (m.toInt to n.toInt)
      .filter(n => math.sqrt(divSum(n)).isWhole)
      .map(n => s"[${n}, ${divSum(n)}]")
      .mkString("[", ", ", "]")
  }

  def divSum(n: Int): Int = {
    (1 to math.sqrt(n).toInt)
      .foldLeft(Set[Int]())((s, i) =>
        if (n % i == 0) s + (i * i) + math.pow(n / i, 2).toInt else s
      )
      .sum
  }

}
