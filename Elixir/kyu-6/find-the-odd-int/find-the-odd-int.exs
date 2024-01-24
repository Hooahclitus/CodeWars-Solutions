import Integer

defmodule FindOdd do
  def find(list) do
    Enum.frequencies(list)
    |> (fn map -> for {k, v} <- map, is_odd(v), do: k end).()
    |> hd()
  end
end
