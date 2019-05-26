#!/usr/bin/env ruby

class Integer
    def is_multiple_of?(arr)
        arr = arr.to_a if not arr.is_a? Array
        arr.any? {|i| self % i == 0 }
    end
end

def multiples_below(upper, multiples)
    multiples = multiples.to_a unless multiples.is_a? Array
    
    range   = 2..upper
    results = range.map do |i|
        multiples.map { |m| i if i.is_multiple_of? multiples }
    end
end

puts 15.is_multiple_of_? [3, 5]

puts multiples_below(100, [3, 5])
