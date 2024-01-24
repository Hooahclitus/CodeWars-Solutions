defmodule SumsParts do
  def parts_sums(ls) do
    Enum.reverse([0 | Enum.scan(Enum.reverse(ls), fn x, y -> x + y end)])
  end
end
