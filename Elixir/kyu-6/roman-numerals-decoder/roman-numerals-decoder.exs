defmodule Solution do
  def decode(roman) do
    xmap = %{"I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000}

    Enum.map(String.graphemes(roman), &Map.fetch!(xmap, &1))
    |> Enum.reverse()
    |> Enum.scan(0, fn v, acc -> if v < acc, do: -v, else: v end)
    |> Enum.sum()
  end
end
