def frequencies(s: String) =
  val cache = scala.collection.mutable.Map[Char, Int]()

  s.foreach(c =>
    if cache.contains(c) then cache.update(c, cache(c) + 1)
    else cache.addOne(c, 1))

  cache.toSeq.sortBy(_._1).toMap
  
def scramble(s1: String, s2: String) =
  val fMap1 = frequencies(s1.filter(s2.toSet))
  val fMap2 = frequencies(s2)

  fMap1.keys.equals(fMap2.keys) match
    case true  => fMap1.map((k, v) => fMap1(k) >= fMap2(k)).forall(_ == true)
    case false => false
