# coding: utf-8
#############################################################################################################################################################################
# Interview Zen                                                                                                                                                             #
# Question                                                                                                                                                                  #
# Given this URL:                                                                                                                                                           #
#                                                                                                                                                                           #
# https://api.simplenexus.com/group_profiles/json/c7598ae3-64c4-4e8e-b625-c73e68444640/loanofficers.json                                                                    #
#                                                                                                                                                                           #
# Write a function that performs a GET request. The response will be in this format:                                                                                        #
#                                                                                                                                                                           #
# {                                                                                                                                                                         #
#   "loanOfficers" : [                                                                                                                                                      #
#       {                                                                                                                                                                   #
#           "sid" : 11745,                                                                                                                                                  #
#           "code" : "S__11745",                                                                                                                                            #
#           "name" : "User 1",                                                                                                                                              #
#           "city" : "Mozapfu",                                                                                                                                             #
#           "state" : "UT",                                                                                                                                                 #
#           "zip" : "20177",                                                                                                                                                #
#           "imageUrl" : "https://simplenexus.com/images/profile_sihlouette.png"                                                                                            #
#       },                                                                                                                                                                  #
#       {                                                                                                                                                                   #
#           "sid" : 11746,                                                                                                                                                  #
#           "code" : "S__11746",                                                                                                                                            #
#           "name" : "User 2",                                                                                                                                              #
#           "city" : "Denver",                                                                                                                                              #
#           "state" : "CO",                                                                                                                                                 #
#           "zip" : "12345",                                                                                                                                                #
#           "imageUrl" : "https://simplenexus.com/images/profile_sihlouette.png"                                                                                            #
#       },                                                                                                                                                                  #
#       {                                                                                                                                                                   #
#           "sid" : 11747,                                                                                                                                                  #
#           "code" : "S__11747",                                                                                                                                            #
#           "name" : "User 3",                                                                                                                                              #
#           "city" : "Denver",                                                                                                                                              #
#           "state" : "CO",                                                                                                                                                 #
#           "zip" : "12345",                                                                                                                                                #
#           "imageUrl" : "https://simplenexus.com/images/profile_sihlouette.png"                                                                                            #
#       }                                                                                                                                                                   #
#   ]                                                                                                                                                                       #
# }                                                                                                                                                                         #
#                                                                                                                                                                           #
# After parsing the response, print out the number of loan officers in each state. For example, given the example response above, your function should print the following: #
#                                                                                                                                                                           #
# UT: 1                                                                                                                                                                     #
# CO: 2                                                                                                                                                                     #
# Your Solution                                                                                                                                                             #
# Language:                                                                                                                                                                 #
#                                                                                                                                                                           #
#                                                                                                                                                                           #
# Submit solution                                                                                                                                                           #
# © 2018 Interview Zen - Privacy Policy - Terms & Conditionssupport@interviewzen.com                                                                                        #
#############################################################################################################################################################################

# example_response = '{
#   "loanOfficers" : [
#       {
#           "sid" : 11745,
#           "code" : "S__11745",
#           "name" : "User 1",
#           "city" : "Mozapfu",
#           "state" : "UT",
#           "zip" : "20177",
#           "imageUrl" : "https://simplenexus.com/images/profile_sihlouette.png"
#       },
#       {
#           "sid" : 11746,
#           "code" : "S__11746",
#           "name" : "User 2",
#           "city" : "Denver",
#           "state" : "CO",
#           "zip" : "12345",
#           "imageUrl" : "https://simplenexus.com/images/profile_sihlouette.png"
#       },
#       {
#           "sid" : 11747,
#           "code" : "S__11747",
#           "name" : "User 3",
#           "city" : "Denver",
#           "state" : "CO",
#           "zip" : "12345",
#           "imageUrl" : "https://simplenexus.com/images/profile_sihlouette.png"
#       }
#   ]
# }'

require 'net/http'
require 'json'

ENDPOINT = URI("https://api.simplenexus.com/group_profiles/json/c7598ae3-64c4-4e8e-b625-c73e68444640/loanofficers.json").freeze

def get_data(endpoint)
    resp = Net::HTTP.get(endpoint)
    JSON.parse(resp)
end

def state_count(data)
    loan_officers = data['loanOfficers']
    loan_officers.each_with_object({}) do |officer, obj|
        state = officer['state']
        obj[state].nil? ? obj[state] = 1 : obj[state] = obj[state] + 1
    end
end

def fmt_count_as_string(obj)
    obj.keys.map { |key| "#{key}: #{obj[key]}\n" }.join('')
end

def report_loan_officers_per_state
    data   = get_data(ENDPOINT)
    count  = state_count(data)
    report = fmt_count_as_string(count)
    
    puts report
end

report_loan_officers_per_state
