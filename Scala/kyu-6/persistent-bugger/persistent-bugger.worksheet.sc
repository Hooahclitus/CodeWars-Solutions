object Multiplication {

  def persistence(n: Int): Int =
    if (n < 10)
      0
    else
      1 + persistence(n.toString.map(_.toInt - 48).reduce(_ * _))

}
