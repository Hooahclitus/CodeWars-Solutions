defmodule Encryptor do
  def rot13([_ | _] = char_list) do
    char_list
    |> (fn [hd | tl] ->
          cond do
            hd >= ?A and hd <= ?Z and hd + 13 > ?Z -> [hd + 13 - ?Z + (?A - 1) | rot13(tl)]
            hd >= ?a and hd <= ?z and hd + 13 > ?z -> [hd + 13 - ?z + (?a - 1) | rot13(tl)]
            hd >= ?A and hd <= ?Z and hd + 13 <= ?Z -> [hd + 13 | rot13(tl)]
            hd >= ?a and hd <= ?z and hd + 13 <= ?z -> [hd + 13 | rot13(tl)]
            true -> [hd | rot13(tl)]
          end
        end).()
    |> List.to_string()
  end

  def rot13([]), do: []
  def rot13(string), do: rot13(String.to_charlist(string))
end
