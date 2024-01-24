import Integer

defmodule Kata do
  def find_outlier(integers) do
    if Enum.count(Enum.filter(integers, &is_even(&1))) > 1 do
      hd(Enum.filter(integers, &is_odd(&1)))
    else
      hd(Enum.filter(integers, &is_even(&1)))
    end
  end
end
