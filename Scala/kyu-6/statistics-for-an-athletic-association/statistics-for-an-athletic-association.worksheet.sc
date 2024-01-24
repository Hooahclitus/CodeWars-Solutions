object Stat {

  def toSeconds(s: String): List[Int] = {
    s.replace("|", "")
      .split(", ")
      .toList
      .map(n => if (n.length == 6) n else f"0$n")
      .map(_.grouped(2).map(_.toInt).toList match {
        case h :: m :: s :: Nil => (h * 3600) + (m * 60) + s
        case _                  => 0
      })
      .sorted
  }

  def formatSeconds(s: Int, m: Int = 0, h: Int = 0): String = s match {
    case a if s > 3600 => formatSeconds((s - 3600), m, (h + 1))
    case b if s > 60   => formatSeconds((s - 60), (m + 1), h)
    case c if s == 60  => formatSeconds(0, (m + 1), h)
    case d if m >= 60  => formatSeconds(s, (m - 60), (h + 1))
    case _ =>
      List(
        if (h >= 10) h else f"0$h",
        if (m >= 10) m else f"0$m",
        if (s >= 10) s else f"0$s"
      ).mkString("|")
  }

  def range(ss: List[Int]): String = {
    formatSeconds(ss.max - ss.min)
  }

  def average(ss: List[Int]): String = {
    formatSeconds(ss.sum / ss.length)
  }

  def median(ss: List[Int]): String = ss.length % 2 match {
    case 0 => average(ss.takeRight((ss.length / 2) + 1).take(2))
    case _ => formatSeconds(ss.takeRight((ss.length + 1) / 2).head)
  }

  def stat(strg: String): String = {
    val seconds = toSeconds(strg)

    f"Range: ${range(seconds)} Average: ${average(seconds)} Median: ${median(seconds)}"
  }

}
