# ElixirExercises

## Description
This project returns a `map` containing a _word_ as a `key` and the _number of times_ that word appears in a text file as a `value`.

## Running
1. `iex -S mix`

## WordCount
2. `iex> WordCount.count("<file path>")`, 
    for example: `iex()> WordCount.count("./lib/data/text.txt")`

## FizzBuzz
2. `iex> FizzBuzz(<a number>)`,
    for example: `iex> FizzBuzz(15)`

## MyList
* `iex> MyList.each([<list>, <function>)`
  for example: `iex> MyList.each(["joca", "bed"], fn x -> IO.puts(x) end)`
* `iex> MyList.map([<list>, <function>)`
  for example: `iex> MyList.map([1, 2, 3], fn x -> x * 2 end)`
* `iex> MyList.reduce([<list>, <function>)`
  for example: `iex> MyList.reduce([1, 2, 3], 0, fn x, acc -> x + acc end)`
* `iex> MyList.each([<list>, <list>)`
  for example: `iex> MyList.zip(["Agus", "Caleb", "Joca"], [:senior, :junior, :beginner])`
* `iex> MyList.reduce([<list>, <list>, <function>)`
  for example: `iex> MyList.zip_with([1, 2, 5, 6], [3, 4], fn x, y -> x + y end)`

## ChallengeCDMX
1. 1st 

