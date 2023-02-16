defmodule WordCount do
  import String

  def clean(text) do
    text
    |> replace("\n", " ")
    |> replace("/", " ")
    |> replace("_", " ")
    |> downcase()
    |> normalize(:nfd)
    |> replace(~r/[^A-Za-z\s]/u, "")
  end

  def read(path) do
    {:ok, text} = File.read(path)
    text
  end

  def count(path) do
    text = read(path)
    text_clean = clean(text)
    words = split(text_clean, " ", trim: true)
    counting(words, words)
  end

  def counting([], _), do: %{}
  def counting([h | t], words), do: Map.merge(%{h => countByWord(h, words)}, counting(t, words))

  def countByWord(word, list, counter \\ 0)
  def countByWord(_, [], counter), do: counter
  def countByWord(word, [h | t], counter) do
     if word == h do
      countByWord(word, t, counter+1)
     else
      countByWord(word, t, counter)
     end
  end
end
