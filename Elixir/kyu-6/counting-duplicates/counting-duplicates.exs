defmodule DuplicateCount do
  def count(str) do
    str
    |> String.downcase()
    |> String.split("", trim: true)
    |> Enum.frequencies()
    |> Enum.filter(fn {_, v} -> v >= 2 end)
    |> Enum.count()
  end
end
