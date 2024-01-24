defmodule FindTheDivisors do
  def divisors(integer) do
    ls = for x <- Enum.to_list(2..(integer - 1)), Integer.mod(integer, x) == 0, do: x

    case ls do
      [] -> ~s(#{integer} is prime)
      _ -> ls
    end
  end
end
