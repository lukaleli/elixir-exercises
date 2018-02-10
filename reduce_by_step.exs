defmodule ReduceByStep do
  def som(a, b), do: a + b
  def mini(a, b), do: min(a, b)
  def maxi(a, b), do: max(a, b)

  def gcdi(a, b) do
    a = abs(a)
    b = abs(b)

    case b == 0 do
      true -> a
      false -> gcdi(b, rem(a, b))
    end
  end

  def lcmu(a, b) do
    a = abs(a)
    b = abs(b)
    div(a * b, gcdi(a, b))
  end

  def oper_array(fct, arr, init) do
    # your code
    arr
    |> Enum.reduce([init], fn x, acc ->
      [last_result | _] = acc
      [fct.(last_result, x) | acc]
    end)
    |> Enum.reverse()
    |> Enum.drop(1)
  end
end

ExUnit.start()

defmodule ReducebystepTest do
  use ExUnit.Case

  defp testing(numtest, fct, arr, init, ans) do
    IO.puts("Test #{numtest}")
    assert ReduceByStep.oper_array(fct, arr, init) == ans
  end

  test "oper_array" do
    a = [18, 69, -90, -78, 65, 40]

    r = [18, 3, 3, 3, 1, 1]
    testing(1, &ReduceByStep.gcdi/2, a, 18, r)
    r = [18, 414, 2070, 26910, 26910, 107_640]
    testing(2, &ReduceByStep.lcmu/2, a, 18, r)
    r = [18, 87, -3, -81, -16, 24]
    testing(3, &ReduceByStep.som/2, a, 0, r)
    r = [18, 18, -90, -90, -90, -90]
    testing(4, &ReduceByStep.mini/2, a, 18, r)
    r = [18, 69, 69, 69, 69, 69]
    testing(5, &ReduceByStep.maxi/2, a, 18, r)

    a = [53, 83, 54, -58, -20, 56, 57, 10]
    r = [53, 4399, 237_546, 6_888_834, 68_888_340, 964_436_760, 18_324_298_440, 18_324_298_440]
    testing(200, &ReduceByStep.lcmu/2, a, 53, r)
  end
end
