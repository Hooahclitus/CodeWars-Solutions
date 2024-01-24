object Kata {

  def groupByCommas(n: Int): String =
    java.text.NumberFormat.getIntegerInstance.format(n)

}
