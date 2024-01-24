defmodule ArabicToRoman do
  def solution(number) do
    numerals = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]

    cond do
      number >= hd(numerals) -> solution(number - hd(numerals), numerals, symbols, hd(symbols))
      number < hd(numerals) -> solution(number, tl(numerals), tl(symbols), "")
    end
  end

  def solution(number, numerals, symbols, result) do
    cond do
      number == 0 ->
        result

      number >= hd(numerals) ->
        solution(number - hd(numerals), numerals, symbols, result <> hd(symbols))

      number < hd(numerals) ->
        solution(number, tl(numerals), tl(symbols), result)
    end
  end
end
