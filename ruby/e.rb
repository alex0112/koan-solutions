def multiples_of_3_and_5_below(n)
    range = 2..(n-1)
    range.select {|i| (i % 3 == 0) || (i % 5 == 0)}
end

#p multiples_of_3_and_5_below(100)

t = gets.strip.to_i
nums = []
t.times do |i|
  nums.push(gets.strip.to_i)
end

nums.each do |n|
  sum = multiples_of_3_and_5_below(n).sum
  p sum
end
