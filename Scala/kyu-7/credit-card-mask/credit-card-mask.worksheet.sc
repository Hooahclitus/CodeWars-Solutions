def maskify(strs: String): String = 
    val lastFour = strs.toList.takeRight(4).mkString
    val rest = strs.toList.dropRight(4).map(_ => "#").mkString

    rest + lastFour
