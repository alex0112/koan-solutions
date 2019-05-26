defmodule WordCloudTest do
  use ExUnit.Case
  doctest WordCloud

  test "splits on commas" do
    assert WordCloudTest.split()
  end
end
