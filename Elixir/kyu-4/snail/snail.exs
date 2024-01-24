defmodule Snail do
  def snail_add([head | tail]) do
    head ++ Enum.map(tail, &List.last(&1))
  end

  def snail_delete([_ | tail]) do
    Enum.map(tail, &Enum.drop(&1, -1))
  end

  def rotate_matrix(matrix) do
    Enum.reduce(matrix, [], &[Enum.reverse(&1) | &2])
  end

  def snail(matrix) do
    case matrix do
      [[] | []] -> []
      [[mtx] | []] -> [mtx]
      {[mtx | []], ls} -> ls ++ mtx
      {mtx, ls} -> snail({rotate_matrix(snail_delete(mtx)), ls ++ snail_add(mtx)})
      [_ | _] = matrix -> snail({rotate_matrix(snail_delete(matrix)), snail_add(matrix)})
    end
  end
end
