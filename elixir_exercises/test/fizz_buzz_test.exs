defmodule FizzBuzzTest do
  use ExUnit.Case

  test "FizzBuzz Testing" do
    assert FizzBuzz.fizzBuzz(15) == "1, 2, Fizz, 4, 5, Fizz, 7, 8, Fizz, 10, 11, Fizz, 13, 14, FizzBuzz"
  end
end
