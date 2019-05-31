defmodule WordCloud do
  @moduledoc """
  Write code that takes a long string				  
  and builds its word cloud data in a hash,			  
  where the keys are words and the values			  
  are the number of times the words occurred.			  
  (source https://www.interviewcake.com/question/ruby/word-cloud) 
  """

  @doc """
  Split up a sentence based upon common punctuation.
  e.g. "The, quick brown fox. Jumps? Over! The lazy... (dog)"
  becomes ~w(The quick brown fox Jumps Over The lazy dog).
  """
  def split(str) do
    String.trim(to_string(str)) |> String.split(~r/[\s , . ? !]+/)
  end

  @doc """
  Reduce a wordlist to a map of a word to its frequency of occurence.
  """

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
