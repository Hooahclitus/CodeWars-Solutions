object Kata {

  def sumSubsequence(ls: List[Int], sum: Int = 0): List[Int] = {
    ls match {
      case hd :: Nil                  => (hd + sum) :: Nil
      case h1 :: h2 :: tl if h1 == h2 => sumSubsequence(h1 :: tl, h2 + sum)
      case h1 :: h2 :: tl if h1 != h2 => (h1 + sum) :: sumSubsequence(h2 :: tl)
    }
  }

  def sumConsecutives(ls: List[Int]): List[Int] = {
    ls match {
      case hd :: Nil                  => hd :: Nil
      case h1 :: h2 :: tl if h1 == h2 => sumConsecutives(sumSubsequence(ls))
      case _                          => ls.head :: sumConsecutives(ls.tail)
    }
  }

}
