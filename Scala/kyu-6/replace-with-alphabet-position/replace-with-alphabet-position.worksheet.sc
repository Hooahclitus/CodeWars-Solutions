object Kata {

  def alphabetPosition(text: String): String =
    val alpha = ('a' to 'z').zip(1 to 27).toMap
    text.toLowerCase().filter(alpha.contains(_)).map(alpha(_)).mkString(" ") 

}
