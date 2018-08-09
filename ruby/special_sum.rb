#!/usr/bin/env ruby

###############################################################################################################################################
# Find the sum of all digits that match the next digit in a given list.                                                                       #
# The list is circular, so the digit after the last digit is the first digit in the list.                                                     #
#                                                                                                                                             #
# For example:                                                                                                                                #
#                                                                                                                                             #
#     1122 produces a sum of 3 (1 + 2) because the first digit (1) matches the second digit and the third digit (2) matches the fourth digit. #
#     1111 produces 4 because each digit (all 1) matches the next.                                                                            #
#     1234 produces 0 because no digit matches the next.                                                                                      #
#     91212129 produces 9 because the only digit that matches the next one is the last digit, 9.                                              #
#                                                                                                                                             #
# Source: http://adventofcode.com/2017/day/1                                                                                                  #
###############################################################################################################################################

def special_sum(num)
  num
    .to_s
    .split('')
    .map(&to_i)
    .instance_eval { self.push(self[0]) }
    .each_cons(2).map { |set| set[0] if set[0] == set[1] }
    .compact
    .sum
end

## Solution in O(n)

###############################################################################################################################################
# # Explaination                                                                                                                              #
#    .to_s                                                                                                                                    #
#    .split('')                                                                                                                               #
#    .map(&to_i) # Splits the number into a list of integers                                                                                  #
#                                                                                                                                             #
#    .instance_eval { self.push(self[0]) }  # Evaluate the next block of code as if self refers to the object                                 #
#                                           # it is being called upon instead of the current package, then push a copy of the first           #
#                                           # element to the end of the list, creating the equivilant of a circular list.                     #
#                                                                                                                                             #
#    .each_cons(2).map { |set| set[0] if set[0] == set[1] }  # Take each possible pair of integers in the array and compare them to the next, #
#                                                            # return a list of all the integers that are followed by themselves in the list  #
#                                                                                                                                             #
#    .compact  # Get rid of nil values.                                                                                                       #
#    .sum      # Sum the values in the array and return.                                                                                      #
###############################################################################################################################################


# Author Alex Larsen (2017)
