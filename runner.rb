require_relative 'consecutive_logins'

obj = ConsecutiveLogin.new

puts "Here is the the input dates array \n"
pp obj.static_input_dates

puts "Sorted consecutive logins dates \n"
pp obj.output

# output will be shown
# [{:start_date=>"2021-03-16", :end_date=>"2021-03-18", :length=>3},
#  {:start_date=>"2021-03-13", :end_date=>"2021-03-13", :length=>1}]
