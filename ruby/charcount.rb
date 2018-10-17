##########################################################################################################################################
# Write a function that takes a string, and returns a string describing the number of times each character occurs, sorted alphabetically #
# For example, given the string "simplenexus", your function should return the string "e2i1l1m1n1p1s2u1x1"                               #
##########################################################################################################################################

class String
    def count_chars
        chars = self.split('')
        chars.each_with_object({}) do |char, obj| ## Build out a hash of the form char => count, and return it.
            obj[char].nil? ?  obj[char] = 1 : obj[char] = obj[char] + 1
        end
    end
    
    def count_fmt
        count_data   = self.count_chars()
        alphabetized = count_data.keys.sort
        alphabetized.map { |char| "#{char}#{count_data[char]}" }.join('')
    end
end

## Tests:
puts "Test Cases:"
p ("simplenexus".count_fmt == "e2i1l1m1n1p1s2u1x1")
p ("aaaaaaaaaaaa".count_fmt == "a12")
p ("".count_fmt == "")
p ("..**((".count_fmt == "(2*2.2")  # Just leaving these "alphabetized" the way that ruby's `sort` function handles them by default.
p ("1112224".count_fmt == "132341") # The problem doesn't specify if numbers should be treated differently, so I'll leave them be. Admittedly the string produced here is pretty useless.
