object Kata {

  val openBrace = (brace: Char) => brace == '(' || brace == '{' || brace == '['
  val closedBrace = (brace: Char) =>
    brace == ')' || brace == '}' || brace == ']'
  val mapBrace = Map(')' -> '(', '}' -> '{', ']' -> '[')

  def validBraces(s: String): Boolean = {
    braceCheck(s.toList, List[Char]())
  }

  def braceCheck(braces: List[Char], stack: List[Char]): Boolean = {
    (braces, stack) match {
      case (Nil, Nil)                                   => true
      case (hd :: _, s) if closedBrace(hd) && s.isEmpty => false
      case (hd :: tl, s)
          if closedBrace(hd) && (mapBrace(hd) == s.takeRight(1).head) =>
        braceCheck(tl, s.dropRight(1))
      case (hd :: tl, s) if openBrace(hd) => braceCheck(tl, s :+ hd)
      case _                              => false
    }
  }

}
