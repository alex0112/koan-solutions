class Array
    def is_sorted? ## Runs in O(n)
        return nil if self.length == 0
        self.each_cons(2) {|set| return false if set[0] > set[1] } ## Compare each element of the array with its neighbor. (One set of two at a time)
        true                                                       ## If any element is greater than the element following it, return false.  The array is not sorted.
    end
end

## Test cases:
p [0, 1, 2, 3, 4, 5].is_sorted?  # => true
p [0, 2, 3, 8, 1, -1].is_sorted? # => false
p [].is_sorted?                  # => nil (but maybe throw an execption in a future itteration)

## Note:  In production systems I normally wouldn't modify a ruby builtin class like Array without a very good reason to do so.
## For a coding challenge though it makes things a bit more elegant.
