object LoveVsFriendship {

  def loveVsFriendship(s: String): Int = {
    s.map(_ - 96).sum
  }

}
