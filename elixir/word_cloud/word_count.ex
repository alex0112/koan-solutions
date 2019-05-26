

defmodule Word do

  def split_words(str) do
    String.split(str, ~r/[\s,.;:()[]?!]*\s*/)
  end
  
  def count(wordlist) do
    Enum.reduce(wordlist, %{}, fn word, dict ->
      if dict[word] do
	Map.put(dict, word, dict[word] + 1)
      else
	Map.put(dict, word, 1)
      end
    end)
  end

end
