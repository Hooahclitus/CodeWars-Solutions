defmodule Rec2sq do
  def squares_in_rect(l, w) do
    cond do
      l == w -> nil
      true -> recur(l, w)
    end
  end

  def recur(l, w) do
    a = l * w
    m = Enum.min([l, w])

    cond do
      0 == a and 0 == m -> []
      1 == a and 1 == m -> [1 | []]
      true -> [m | recur(m, Kernel.trunc((a - m * m) / m))]
    end
  end
end
