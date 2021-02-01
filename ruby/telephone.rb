# Given a digit string, return all possible letter combinations that the number could represent.
# A mapping of digit to letters (just like on the telephone buttons)

def num_to_char(num)
  return {
    '1' => %w[a b c],
    '2' => %w[d e f],
    '3' => %w[g h i],
    '4' => %w[j k l],
    '5' => %w[m n o],
    '6' => %w[p % r],
    '7' => %w[t u v],
    '8' => %w[w x y],
    '9' => %w[z],
  }[num]
end

def combos(num_string)
  ## Take a string of numbers and look them up in the table to get the related letters
  ## Then form a combination of all of the possibilities in the same order
  ## E.g. "12" becomes %w[ad ae af bd be bf cd ce cf]
  letters = num_string.chars.map {|num| num_to_char(num) }

  return combine(*letters)

end

def combo_with(a, b)
  ## Get every possible combination of two arrays
  a.flat_map {|char_a| 
    b.map {|char_b| char_a + char_b }
  }
end

def combine(*args)
  ## Given an arbitrary number of arrays, form an array of strings where each string represents a combination of those three arrays
  ## The implementation is recursive, and works by taking the combination of the first two arrays passed to it
  ## It then recursively calls itself with the remaining arguments until there are no further arguments to process.
  
  raise ArgumentError if args.length <= 1

  if args.last.empty? ## I.e. there are no more combos to compute
    return args.first
  end
  
  ## Note: On any recursive call of this function, `first` stores the accumulated array of string combinations

  first, second = args.first, args[1]              ## Grab the first two arrays to combine
  rest          = args.length > 2 ? args.last : [] ## If there are more arrays to combine afterwards, store them here
  accumulated   = combo_with(first, second)        ## Combine all possibilites of the two first arrays

  return combine(accumulated, rest)                ## Continue the process, passing the accumulated array as the first arg
end

p combos("42")

## Notes:
# Start the presentation by working it out "on paper" first, then start coding, then break ideas down in to smaller and smaller functions
# Once the functions are written use write comments
