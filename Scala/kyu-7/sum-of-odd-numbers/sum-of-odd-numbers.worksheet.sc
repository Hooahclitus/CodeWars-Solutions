object Solution {
  
  def rowSumOddNumbers(n: Long): Long =
    val rowStart = Iterator.from(0, 2).take(n.toInt).foldLeft(1)((x, y) => x + y)
    Iterator.from(rowStart, 2).take(n.toInt).sum

}
