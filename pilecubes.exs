defmodule Pilecubes do
  @moduledoc """
  Your task is to construct a building which will be a pile of n cubes. 
  The cube at the bottom will have a volume of n^3, the cube above will 
  have volume of (n-1)^3 and so on until the top which will have a volume of 1^3.
  You are given the total volume m of the building. Being given m can you find 
  the number n of cubes you will have to build?
  The parameter of the function findNb (find_nb, find-nb, findNb) will be an 
  integer m and you have to return the integer n such as n^3 + (n-1)^3 + ... + 1^3 = m 
  if such a n exists or -1 if there is no such n.
  """

  def find_nb(m) do
    calculate(0, 1, m)
  end

  defp calculate(acc, n, m) when acc == m, do: n - 1

  defp calculate(acc, _, m) when acc > m, do: -1

  defp calculate(acc, n, m) do
    calculate(acc + n * n * n, n + 1, m)
  end
end

ExUnit.start()

defmodule PilecubesTest do
  use ExUnit.Case

  def testFindNb(numtest, m, ans) do
    IO.puts("Test #{numtest}")
    assert Pilecubes.find_nb(m) == ans
  end

  test "find_nb" do
    testFindNb(1, 4_183_059_834_009, 2022)
    testFindNb(2, 24_723_578_342_962, -1)
    testFindNb(3, 135_440_716_410_000, 4824)
    testFindNb(4, 40_539_911_473_216, 3568)
  end
end
