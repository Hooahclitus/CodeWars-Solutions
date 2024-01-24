import scala.annotation.tailrec

object Sol {

  def isPrime(n: Long): Boolean = n match
    case _ if n < 4 => n > 1
    case _ if n % 2 == 0 || n % 3 == 0 => false
    case _ => (5 to math.sqrt(n).toInt by 6).forall(i => n % i != 0 && n % (i + 2) != 0)

  def genPrimes(n: Long): LazyList[Int] =
    2 #:: LazyList.from(3, 2).filter(isPrime).takeWhile(i => i * i < n + 1)

  @tailrec
  def primeFactors(n: Long, primes: LazyList[Int], factors: List[Long] = List.empty): List[Long] = n match
    case _ if isPrime(n) => n :: factors
    case _ if n % primes.head == 0 => primeFactors(n / primes.head, primes, primes.head :: factors)
    case _ => primeFactors(n, primes.tail, factors)

  def properFractions(n: Long): Long = n match
    case _ if n == 1 => 0
    case _ if isPrime(n) => n - 1
    case _ => primeFactors(n, genPrimes(n))
      .groupBy(identity).view.mapValues(_.size)
      .foldLeft(1L){ case (acc, (n, m)) => acc * (n - 1) * math.pow(n, m - 1).toLong }
      
}
