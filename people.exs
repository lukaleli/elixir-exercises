defmodule People do
  @comma ", "
  @amp " & "

  def list(people) when length(people) > 1 do
    {commas, amp} = people |> Enum.map(& &1.name) |> Enum.split(-2)
    "#{with_comma(commas)}#{with_amp(amp)}"
  end

  def list([person]), do: person.name
  def list([]), do: ""

  defp with_comma([_ | _] = list), do: Enum.join(list, @comma) <> @comma
  defp with_comma([]), do: ""

  defp with_amp(list), do: Enum.join(list, @amp)
end

ExUnit.start()

defmodule TestPeople do
  use ExUnit.Case
  import People, only: [list: 1]

  test "basic tests" do
    assert list([
             %{name: "Bart"},
             %{name: "Lisa"},
             %{name: "Maggie"},
             %{name: "Homer"},
             %{name: "Marge"}
           ]) == "Bart, Lisa, Maggie, Homer & Marge"

    assert list([%{name: "Bart"}, %{name: "Lisa"}, %{name: "Maggie"}]) == "Bart, Lisa & Maggie"
    assert list([%{name: "Bart"}, %{name: "Lisa"}]) == "Bart & Lisa"
    assert list([%{name: "Bart"}]) == "Bart"
    assert list([]) == ""
  end
end
