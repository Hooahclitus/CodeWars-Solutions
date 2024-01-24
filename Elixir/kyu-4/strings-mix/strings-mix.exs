# Given two strings s1 and s2, we want to visualize how different the two strings are. We will only take into account the lowercase letters (a to z). First let us count the frequency of each lowercase letters in s1 and s2.

# s1 = "A aaaa bb c"
# s2 = "& aaa bbb c d"

# s1 has 4 'a', 2 'b', 1 'c'
# s2 has 3 'a', 3 'b', 1 'c', 1 'd'

# So the maximum for 'a' in s1 and s2 is 4 from s1; the maximum for 'b' is 3 from s2. In the following we will not consider letters when the maximum of their occurrences is less than or equal to 1.

# We can resume the differences between s1 and s2 in the following string: "1:aaaa/2:bbb" where 1 in 1:aaaa stands for string s1 and aaaa because the maximum for a is 4. In the same manner 2:bbb stands for string s2 and bbb because the maximum for b is 3.

defmodule StringMix do
  @alpha Enum.map(?a..?z, &<<&1>>)

  def mix(s1, s2) do
    for c <- @alpha do
      s1 = Enum.filter(String.codepoints(s1), fn x -> c == x end) |> Enum.join("")
      s2 = Enum.filter(String.codepoints(s2), fn x -> c == x end) |> Enum.join("")
      n1 = String.length(s1)
      n2 = String.length(s2)

      cond do
        n1 > n2 -> %{src: "1", chr: s1, len: n1}
        n1 < n2 -> %{src: "2", chr: s2, len: n2}
        true -> %{src: "=", chr: s1, len: n1}
      end
    end
    |> Enum.filter(fn %{len: n} -> n > 1 end)
    |> Enum.sort_by(&{&1.src})
    |> Enum.sort_by(&{&1.len}, :desc)
    |> Enum.map(fn %{chr: chr, src: src} -> src <> ":" <> chr end)
    |> Enum.join("/")
  end
end
