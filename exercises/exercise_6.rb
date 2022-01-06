require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

system "clear"
puts "Exercise 6"
puts "----------"

# Your code goes here ...
Store.has_many:employees
Employee.belongs_to:store
@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store2.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store4.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store5.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store6.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
stores = Store.all
for s in stores
  puts "#{s.name} has #{s.employees.count} employee(s)"
end
