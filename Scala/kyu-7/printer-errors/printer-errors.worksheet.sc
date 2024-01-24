object Kata {

  def printerError(s: String) =
    s"${s.filter(c => ('n' to 'z').contains(c)).length}/${s.length}"

}
