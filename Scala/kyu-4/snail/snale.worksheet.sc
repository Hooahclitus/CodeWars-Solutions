object Snail {
  
  def snail(matrix: List[List[Int]]): List[Int] =
    matrix match
      case List()   => List()
      case hd :: tl => hd ++ snail(tl.transpose.reverse)
  
}
