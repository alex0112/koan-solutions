defmodule WordCloudTest do
  use ExUnit.Case, async: true
  doctest WordCloud

  test "splits on spaces" do
    assert WordCloud.split("a a")   == ["a", "a"]
    assert WordCloud.split("a  a")  == ["a", "a"] ## Multiple spaces
    assert WordCloud.split(" a a ") == ["a", "a"] ## Padded string
  end
  
  # test "splits on commas" do
  #   assert WordCloud.split("a,a")   == ["a", "a"]
  #   assert WordCloud.split("a,,a")  == ["a", "a"]
  #   assert WordCloud.split(",a,a,") == ["a", "a"]
  # end
  
end
