object Section {

  def c(k: Long) = {
    val sqrtk = math.sqrt(k)

    @annotation.tailrec
    def factorList(k: Long, n: Long = 2, ls: List[Long] = Nil): List[Long] = {
      n * n > k match {
        case false if k % n == 0 => factorList(k / n, n, n :: ls)
        case false               => factorList(k, n + 1, ls)
        case true                => k :: ls
      }
    }

    sqrtk.isWhole match {
      case false => 0
      case true =>
        factorList(sqrtk.toLong)
          .groupBy(identity)
          .map { case (_, v) => 3 * v.size + 1 }
          .product
    }
  }

}
