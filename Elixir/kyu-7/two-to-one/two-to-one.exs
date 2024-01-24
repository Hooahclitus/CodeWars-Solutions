defmodule TwoToOne do
  def longest(a, b) do
    Enum.join([a, b])
    |> String.graphemes()
    |> MapSet.new()
    |> Enum.join()
  end
end
