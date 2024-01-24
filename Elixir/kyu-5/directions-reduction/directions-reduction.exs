defmodule Directions do
  def reduce(directions) do
    dmap = %{"EAST" => "e", "NORTH" => "n", "SOUTH" => "s", "WEST" => "w"}
    kmap = %{"e" => "EAST", "n" => "NORTH", "s" => "SOUTH", "w" => "WEST"}

    directions
    |> Enum.map(&Map.fetch!(dmap, &1))
    |> reducer()
    |> reducer()
    |> reducer()
    |> Enum.map(&Map.fetch!(kmap, &1))
  end

  def reducer([]), do: []

  def reducer([head | tail] = ls) do
    case ls do
      [_ | []] -> ls
      ["e", "w" | []] -> []
      ["w", "e" | []] -> []
      ["n", "s" | []] -> []
      ["s", "n" | []] -> []
      ["e", "w" | _] -> reducer(tl(tail))
      ["n", "s" | _] -> reducer(tl(tail))
      ["s", "n" | _] -> reducer(tl(tail))
      ["w", "e" | _] -> reducer(tl(tail))
      _ -> [head | reducer(tail)]
    end
  end
end
