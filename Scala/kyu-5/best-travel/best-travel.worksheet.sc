object BestTravel {

  def chooseBestSum(t: Int, k: Int, ls: List[Int]): Int = {
    val filteredSums = ls
      .combinations(k)
      .toList
      .map(ls => ls.sum)
      .filter(n => n <= t)
      .sorted
      .reverse

    (k > ls.length) match {
      case true => -1
      case false =>
        filteredSums.length match {
          case 0 => -1
          case _ => filteredSums.head
        }
    }
  }

}
