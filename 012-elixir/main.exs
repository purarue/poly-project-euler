defmodule TriangleNumbers do

  # My solution recalculated the triangle number each time, which
  # ended up taking a few minutes
  #
  # The Stream.unfold/drop_while is from:
  # https://github.com/fengb/elixir-euler/blob/master/12-highly-divisible-triangular-number.ex

  # https://blog.drewolson.org/elixir-streams
  @doc """
  Stream of increasing triangle numbers
  """
  def triangles do
    Stream.unfold({2, 1}, fn {num, acc} -> {acc, {num + 1, acc + num}} end)
  end

  @doc """
  If a number below the sqrt(n) + 1 can be divided, add the pair of numbers
  """
  def factors(n) do
    end_range = trunc(:math.sqrt(n)) + 1
    Enum.flat_map(1..end_range, fn x ->
        case rem(n, x) do
          0 -> [x, trunc(n/x)]
          _ -> []
        end
      end) |> MapSet.new |> MapSet.size  # MapSet to remove duplicates if perfect square
  end

end

# TriangleNumbers.triangles |> Enum.take(7) |> IO.inspect

TriangleNumbers.triangles
  |> Stream.drop_while(fn(x) -> TriangleNumbers.factors(x) <= 500 end)
  |> Enum.take(1)
  |> Enum.at(0)
  |> IO.puts
