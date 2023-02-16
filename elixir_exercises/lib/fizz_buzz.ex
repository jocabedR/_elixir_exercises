defmodule FizzBuzz do
  def fizzBuzz(1), do: "#{1}"
  def fizzBuzz(x) do
    if rem(x,3) == 0 do
      if rem(x,5) == 0 do
       fizzBuzz(x-1) <> ", " <> "FizzBuzz"
      else
       fizzBuzz(x-1) <> ", " <> "Fizz"
      end
    else
    if rem(x,3) == 0 do
      fizzBuzz(x-1) <> ", " <> "Buzz"
      else
      fizzBuzz(x-1) <> ", " <> "#{x}"
    end
    end
  end
end
