class Integer
  def contains_how_many(n)
    Array(1..self).select {|i| i if i.to_s.split('').any? {|c| c =~ /#{n.to_s}/ } }.count
  end
end

p 150.contains_how_many 7

