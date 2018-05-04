# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: 'TestAccount1@gmail.com', name: 'Test 1', password: 'Testpassword')
User.create!(email: 'TestAccount2@gmail.com', name: 'Test 2', password: 'Testpassword')
User.create!(email: 'TestAccount3@gmail.com', name: 'Test 3', password: 'Testpassword')
User.create!(email: 'TestAccount4@gmail.com', name: 'Test 4', password: 'Testpassword')
User.create!(email: 'TestAccount5@gmail.com', name: 'Test 5', password: 'Testpassword')
User.create!(email: 'TestAccount6@gmail.com', name: 'Test 6', password: 'Testpassword')
User.create!(email: 'TestAccount7@gmail.com', name: 'Test 7', password: 'Testpassword')
User.create!(email: 'TestAccount8@gmail.com', name: 'Test 8', password: 'Testpassword')


User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end