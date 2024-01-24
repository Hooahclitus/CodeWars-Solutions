defmodule SalesmanTravel do
  def travel(r, zip) do
    if is_list(r) == true do
      zip <> ":/"
    else
      Enum.filter(String.split(r, ","), &Regex.match?(~r/\b#{zip}\b/, &1))
      |> Enum.map(&String.replace(&1, zip, ""))
      |> Enum.map(&String.split(&1, " ", trim: true))
      |> (fn xs ->
            [
              Enum.map(xs, fn e -> tl(e) end) |> Enum.map(fn xs -> Enum.join(xs, " ") end),
              Enum.map(xs, fn e -> hd(e) end) | []
            ]
          end).()
      |> Enum.map(fn xs -> Enum.join(xs, ",") end)
      |> Enum.join("/")
      |> (fn s -> zip <> ":" <> s end).()
    end
  end
end
