defmodule Kata do
  @map for char <- ?a..?z, do: {<<char>>, char - ?a + 1}, into: %{}

  def high(str) do
    split_string = String.split(str, " ")
    sums = gen_sums(split_string)

    Enum.zip(sums, split_string)
    |> IO.puts()
    |> Enum.find_value(fn {k, v} -> if k == Enum.max(sums), do: v end)
  end

  def gen_sums(ls) do
    Enum.map(ls, &String.graphemes/1)
    |> (fn ls -> for e <- ls, do: Enum.sum(Enum.map(e, &Map.fetch!(@map, &1))) end).()
  end
end
