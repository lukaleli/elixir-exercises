defmodule RemoveExclamation do
  def remove(s) do
    {to_clear, last} = String.split_at(s, String.length(s) - 1)
    String.replace(to_clear, "!", "") <> last
  end
end

ExUnit.start()

# TODO: Replace examples and use TDD development by writing your own tests

defmodule TestSolution do
  use ExUnit.Case

  test "Basic tests" do
    assert RemoveExclamation.remove("Hi!") == "Hi!"
    assert RemoveExclamation.remove("Hi!!!") == "Hi!"
    assert RemoveExclamation.remove("!Hi") == "Hi"
    assert RemoveExclamation.remove("!Hi!") == "Hi!"
    assert RemoveExclamation.remove("Hi! Hi!") == "Hi Hi!"
    assert RemoveExclamation.remove("Hi") == "Hi"
  end
end
