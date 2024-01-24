defmodule Whicharein do
  def in_array(array1, array2) do
    for(x <- array1, y <- array2, y =~ x, into: MapSet.new(), do: x)
    |> Enum.into([])
  end
end
