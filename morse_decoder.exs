defmodule MorseDecoder do
  @letter_sep " "
  @word_sep "   "

  @mappings [
    {".-.-.-", "."},
    {"--..--", ","},
    {"-.-.--", "!"},
    {"..--..", "?"},
    {"...---...", "SOS"},
    {".-", "A"},
    {"-...", "B"},
    {"-.-.", "C"},
    {"-..", "D"},
    {".", "E"},
    {"..-.", "F"},
    {"--.", "G"},
    {"....", "H"},
    {"..", "I"},
    {".---", "J"},
    {"-.-", "K"},
    {".-..", "L"},
    {"--", "M"},
    {"-.", "N"},
    {"---", "O"},
    {".--.", "P"},
    {"--.-", "Q"},
    {".-.", "R"},
    {"...", "S"},
    {"-", "T"},
    {"..-", "U"},
    {"...-", "V"},
    {".--", "W"},
    {"-..-", "X"},
    {"-.--", "Y"},
    {"--..", "Z"}
  ]

  def decode(sequence) do
    sequence
    |> String.trim()
    |> String.split(@word_sep, trim: true)
    |> Enum.map(&translate_word/1)
    |> Enum.join(" ")
  end

  def translate_word(word) when byte_size(word) > 0 do
    word
    |> String.split(@letter_sep, trim: true)
    |> Enum.map(&to_letter/1)
    |> Enum.join("")
  end

  def translate_word(_), do: ""

  Enum.each(@mappings, fn {code, letter} ->
    defp unquote(:to_letter)(unquote(code)), do: unquote(letter)
  end)

  defp to_letter(_), do: ""
end

ExUnit.start()

defmodule TestSolution do
  use ExUnit.Case

  test "example tests" do
    assert MorseDecoder.decode(".... . -.--   .--- ..- -.. .") == "HEY JUDE"
    assert MorseDecoder.decode("...---...") == "SOS"

    assert MorseDecoder.decode(
             "      ...---... -.-.--   - .... .   --.- ..- .. -.-. -.-   -... .-. --- .-- -.   ..-. --- -..-   .--- ..- -- .--. ...   --- ...- . .-.   - .... .   .-.. .- --.. -.--   -.. --- --. .-.-.-     "
           ) == "SOS! THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG."
  end
end
