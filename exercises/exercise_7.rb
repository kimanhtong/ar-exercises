require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
class Employee < ActiveRecord::Base
  validate :require_first_name,
    :require_last_name,
    :hourly_rate_is_integer_between_40_and_200,
    :require_a_store

  def require_first_name
    if !first_name.present?
      errors.add(:first_name,"First name can't be blank")
    end
  end

  def require_last_name
    if !last_name.present?
      errors.add(:last_name,"Last name can't be blank")
    end
  end

  def hourly_rate_is_integer_between_40_and_200
    if !hourly_rate.present?
      errors.add(:hourly_rate,"Employee hourly rate can't be blank")
    else
      if hourly_rate > 200
        errors.add(:hourly_rate,"Employee hourly_rate can't be more than 200")
      end
      if hourly_rate < 40
        errors.add(:hourly_rate,"Employee hourly_rate can't be less than 40")
      end
      if hourly_rate.class != Fixnum && hourly_rate.class != Bignum
        errors.add(:hourly_rate,"Hourly_rate must be an integer")
      end
    end
  end 

  def require_a_store
    if !store.present?
      errors.add(:store,"Employee store can't be blank")
    end
  end
end

class Store < ActiveRecord::Base
  validate :require_name_with_min_of_3_chars,
    :annual_revenue_is_integer_greater_than_or_equal_to_0,
    :require_apparel_info_for_both_men_women

  def require_name_with_min_of_3_chars
    if !name.present?
      errors.add(:name,"Store name can't be blank")
    else
      if name.length() < 3
        errors.add(:name,"Store name should consist of 3 characters at least")
      end
    end
  end

  def annual_revenue_is_integer_greater_than_or_equal_to_0
    if !annual_revenue.present?
      errors.add(:annual_revenue,"Annual revenue can't be blank")
    else
      if annual_revenue < 0
        errors.add(:annual_revenue,"Annual revenue must be >= 0")
      end
      
      if annual_revenue.class != Fixnum && annual_revenue.class != Bignum
        errors.add(:annual_revenue,"Annual revenue must be an integer")
      end
    end
  end

  def require_apparel_info_for_both_men_women
    if mens_apparel.nil?
      errors.add(:mens_apparel,"Information of men's apparel can't be blank")
    end
    if womens_apparel.nil?
      errors.add(:womens_apparel,"Information of women's apparel can't be blank")
    end
  end
end


# Main program

emp1 = Employee.new do |e|
  e.first_name = "Kevin"
  e.last_name = "Smith"
  e.hourly_rate = 150.8
  e.store = Store.find(1)
end
if emp1.valid?
  emp1.save
end

store1 = Store.new do |s|
  s.name = "Ottawa"
  s.annual_revenue = 1000000.5
  s.mens_apparel = true
  s.womens_apparel = false
end

if store1.valid?
  store1.save
end

system "clear"

if emp1.valid?
  puts "Employee #{emp1.first_name} #{emp1.last_name} is saved successfully!"
else
  puts emp1.errors.messages
end

if store1.valid?
  puts "Store #{store1.name} is saved successfully!"
else
  puts store1.errors.messages
end

# Use user's inputs
puts "Now, let's create a new store \n Please type in the store name:"
sname = gets.chomp()

temp_store = Store.new do |s|
  s.name = sname
end

if !temp_store.valid?
  puts "Cannot create the new store due to:"
  puts "#{temp_store.errors.messages[:annual_revenue]}"
  puts "#{temp_store.errors.messages[:mens_apparel]}"
  puts "#{temp_store.errors.messages[:womens_apparel]}"
else
  puts "Created the new store successfully!"
end
