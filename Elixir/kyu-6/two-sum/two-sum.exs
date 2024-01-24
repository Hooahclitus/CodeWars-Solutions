defmodule TwoSum do
  def two_sum(numbers, target) do
    for(
      {x, a} <- Enum.with_index(numbers),
      {y, b} <- Enum.with_index(numbers),
      a != b,
      x + y == target,
      do: {a, b}
    )
    |> Enum.at(0)
  end
end
