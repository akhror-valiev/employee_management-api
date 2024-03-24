# frozen_string_literal: true

Employee.destroy_all

# Create fake data
50.times do
  Employee.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    contact_number: Faker::PhoneNumber.phone_number[0..19], # Limiting to 20 characters
    address: Faker::Address.full_address
  )
end

puts 'Seed data created!'
