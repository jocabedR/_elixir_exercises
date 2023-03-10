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
* each `iex> MyList.each([<list>, <function>)`
  
  for example: `iex> MyList.each(["joca", "bed"], fn x -> IO.puts(x) end)`
* map `iex> MyList.map([<list>, <function>)`
  
  for example: `iex> MyList.map([1, 2, 3], fn x -> x * 2 end)`
* reduce `iex> MyList.reduce([<list>, <function>)`
  
  for example: `iex> MyList.reduce([1, 2, 3], 0, fn x, acc -> x + acc end)`
* zip `iex> MyList.zip([<list>, <list>)`
  
  for example: `iex> MyList.zip(["Agus", "Caleb", "Joca"], [:senior, :junior, :beginner])`
* zip_with `iex> MyList.zip_with([<list>, <list>, <function>)`
  
  for example: `iex> MyList.zip_with([1, 2, 5, 6], [3, 4], fn x, y -> x + y end)`

## ChallengeCDMX
2. 1st Phase: `ChallengeCdmx.firstPhase()`
2. 2nd Phase (just Graph creation): `ChallengeCdmx.secondPhase()`

## InvoiceValidator
2. `InvoiceValidator.validate_dates(<Emition date>, <PAC date>)`,

for example:
```markdown
iex> e = DateTime.from_naive!(~N[2023-02-24 07:05:00], "Mexico/General")
#DateTime<2023-02-24 07:05:00-06:00 CST Mexico/General>
iex> p = DateTime.from_naive!(~N[2023-02-24 07:00:00], "Mexico/General")
#DateTime<2023-02-24 07:00:00-06:00 CST Mexico/General>
iex> InvoiceValidator.validate_dates(e, p)                              
:ok
```

3. Testing(in order): `mix test --trace --seed 0 test/invoice_validator_test.exs`

