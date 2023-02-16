# each, map, reduce, zip, zip_with

defmodule MyList do
  @moduledoc """
  Documentation for `MyList`.
  """

  @doc """
  Map.

  ## Examples

      iex> MyList.each(["joca", "bed"], fn x -> IO.puts(x) end)
      #=> joca
      #=> bed
      :ok
  """
  def each([], _), do: :ok
  def each([h | t], fun) do
    fun.(h)
    each(t, fun)
  end

  @doc """
  Map.

  ## Examples

      iex> MyList.map([1, 2, 3], fn x -> x * 2 end)
      [2, 4, 6]
  """
  def map([], _), do: []
  def map([h | t], fun), do: [fun.(h) | map(t, fun)]

  @doc """
  Reduce.

  ## Examples

      iex> MyList.reduce([1, 2, 3], 0, fn x, acc -> x + acc end)
      6
  """
  def reduce([h | t], fun), do: reduce(t, h, fun)
  def reduce([], acc, _), do: acc
  def reduce([h | t], acc, fun), do: reduce(t, fun.(h, acc), fun)

  @doc """
  Zip.

  ## Examples

      iex> MyList.zip(["Agus", "Caleb", "Joca"], [:senior, :junior, :beginner])
      [{"Agus", :senior}, {"Caleb", :junior}, {"Joca", :beginner}]
  """
  def zip([], _), do: []
  def zip(_, []), do: []
  def zip([h1 | t1], [h2 | t2]), do: [{h1,h2} | zip(t1, t2)]

  @doc """
  Zip.

  ## Examples

      iex> MyList.zip_with([1, 2, 5, 6], [3, 4], fn x, y -> x + y end)
      [4, 6]
  """
  def zip_with([], _, _), do: []
  def zip_with(_, [], _), do: []
  def zip_with([xh | xt], [yh | yt], fun), do: [fun.(xh, yh) | zip_with(xt, yt, fun)]
end
