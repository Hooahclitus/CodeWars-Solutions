defmodule Kata do
  def rectangle_rotation(m, n) do
    x = m / (2 * :math.sqrt(2))
    y = n / (2 * :math.sqrt(2))

    [r1_hd, r1_tl] = r1 = [2 * floor(x) + 1, 2 * floor(y) + 1]

    r2 = [
      if(x - floor(x) < 0.5, do: r1_hd - 1, else: r1_hd + 1),
      if(y - floor(y) < 0.5, do: r1_tl - 1, else: r1_tl + 1)
    ]

    Enum.reduce(r1, &(&1 * &2)) + Enum.reduce(r2, &(&1 * &2))
  end
end
