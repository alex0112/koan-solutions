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

  describe "count" do
    test "Properly creates a wordmap" do
      assert WordCloud.count(~w(cottleson cottleson cottleson pie)) == %{"cottleson" => 3, "pie" => 1}
    end
  end

  describe "integration of split and count" do
    test "Properly creates a wordmap from a split string." do
      assert WordCloud.split("cottleson cottleson cottleson pie") |> WordCloud.count == %{"cottleson" => 3, "pie" => 1}
    end
  end
  
end
