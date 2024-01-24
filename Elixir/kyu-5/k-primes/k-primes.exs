defmodule Kpremiers do
  def prime_factors(n, c \\ 2) do
    cond do
      n <= 1 -> []
      rem(n, c) > 0 -> prime_factors(n, c + 1)
      rem(n, c) == 0 -> [c | prime_factors(Kernel.trunc(n / c), c)]
    end
  end

  def count_Kprimes(k, start, nd) do
    for v <- Enum.to_list(start..nd), Enum.count(prime_factors(v)) == k, do: v
  end

  def puzzle(s) do
    Enum.sum(
      for x <- count_Kprimes(1, 0, s),
          y <- count_Kprimes(3, 0, s),
          z <- count_Kprimes(7, 0, s),
          x + y + z == s,
          do: 1
    )
  end
end
