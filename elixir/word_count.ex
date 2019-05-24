###################################################################
# Write code that takes a long string				  #
# and builds its word cloud data in a hash,			  #
# where the keys are words and the values			  #
# are the number of times the words occurred.			  #
# (source https://www.interviewcake.com/question/ruby/word-cloud) #
###################################################################

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
