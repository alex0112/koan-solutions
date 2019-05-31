defmodule WordCloudTest do
  use ExUnit.Case, async: true
  doctest WordCloud

  Enum.each [" ", "!", "?", ".", ","], fn char ->
    @char char
    test "splits on \"#{@char}\"" do
      assert WordCloud.split("a" <> @char <> "a")                   == ["a", "a"]
      assert WordCloud.split("a" <> @char <> @char <> "a")          == ["a", "a"] ## Multiple chars
      assert WordCloud.split(" " <> "a" <> @char <> "a" <> " ")     == ["a", "a"] ## Padded string (whitespace)
    end
  end
end
