object Sol {

  def solution(a: Array[Int], b: Array[Int]) = {
    val diffArr =
      for ((a, b) <- a.zip(b))
        yield a.compare(b) match {
          case 1  => math.pow((a - b).abs, 2)
          case -1 => math.pow((b - a).abs, 2)
          case 0  => 0
        }

    (diffArr.sum / diffArr.size)
  }

}
