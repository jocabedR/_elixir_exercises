defmodule WordCountTest do
  use ExUnit.Case

  test "Cleaning a text" do
    text="""
    ,.-/áéíóú!\"#$%&/()=?¡¿}`}{[]´¨˚*Açai, Jalapeño, Frappé, Zoë, Bogotá, Malmö erlang/opt word_count
    """
    assert WordCount.clean(text) == " aeiou acai jalapeno frappe zoe bogota malmo erlang opt word count "
  end

  test "Counting words" do
    words = ["hello", "world", "hello", "world", "hello", "world", "hello"]
    assert WordCount.counting(words, words) == %{"hello" => 4, "world" => 3}
  end

  test "Counting by word" do
    words = ["hello", "world", "hello", "world", "hello", "world", "hello"]
    assert WordCount.countByWord("hello", words) == 4
  end
end
