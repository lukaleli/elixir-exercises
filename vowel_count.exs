defmodule VowelCount do
  @vowels ~w[a i u e o]

  def get_count(str) do
    str
    |> String.codepoints()
    |> Enum.count(&Enum.member?(@vowels, &1))
  end
end

ExUnit.start()

defmodule VowelCountTest do
  use ExUnit.Case

  test "get_count" do
    assert VowelCount.get_count("abracadabra") == 5
  end
end
