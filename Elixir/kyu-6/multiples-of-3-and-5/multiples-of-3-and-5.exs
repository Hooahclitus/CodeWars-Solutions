defmodule Challenge do
  def solution(number) do
    unless number < 0 or number == 3 do
      Enum.sum(
        for x <- 1..number,
            (Integer.mod(x, 3) == 0 or Integer.mod(x, 5) == 0) and x != number,
            do: x
      )
    else
      0
    end
  end
end
