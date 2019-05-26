#!/usr/bin/env ruby

def count(arr)
  arr.each_with_object(obj = {}) do |el|
    obj[el] ? obj[el] = obj[el] + 1 : obj[el] = 1
  end
end
