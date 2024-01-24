object Sol {

  def getCount(inputStr: String): Int =
    inputStr.filter(c => Set('a', 'e', 'i', 'o', 'u').contains(c)).size

}
