#!/usr/bin/env ruby

################################################################################################
# Calculate maximum profits for a stock:                                                       #
#                                                                                              #
# The indices are the time (in minutes) past trade opening time, which was 9:30am local time.  #
# The values are the price (in US dollars) of one share of Apple stock at that time.           #
# So if the stock cost $500 at 10:30am, that means stock_prices_yesterday[60] = 500.           #
#                                                                                              #
# Write an efficient method that takes stock_prices_yesterday and returns the best profit that #
# could have been  made from one purchase and one sale of one share of Apple stock yesterday.  #
#                                                                                              #
# For example:                                                                                 #
#                                                                                              #
# stock_prices_yesterday = [10, 7, 5, 8, 11, 9]                                                #
#                                                                                              #
# get_max_profit(stock_prices_yesterday)                                                       #
# # returns 6 (buying for $5 and selling for $11)                                              #
################################################################################################

def max_profit(prices)
  prices.each_with_index.map { |price, index| prices[index..-1].map { |compare| price - compare } }.flatten.min.abs
end

p max_profit([10, 7, 5, 8, 11, 9]) ## Returns 6

## Author: Alex Larsen (2018)



    
