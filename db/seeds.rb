# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts "reset db..."
Request.destroy_all
Party.destroy_all
User.destroy_all

puts "Create 10 users..."

user = User.new(
  email: 'hello@gmail.com',
  password: '123456'
)
user.save!
puts "Creating #{User.count} - #{user.email}"

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  user.save!
  puts "Creating #{User.count} - #{user.email}"
end

puts "finished!"

puts "Create 10 parties..."
10.times do
  party = Party.new(
    name: Faker::Hipster.sentence,
    date: Faker::Date.forward(days: 14),
    status: rand(0..1),
    description: Faker::Hipster.paragraph(sentence_count: 5),
    user: User.all.sample,
    address: Faker::Address
  )
  party.save!
  puts "Creating #{party.id} - #{party.name}"
end

20.times do
  request = Request.new(
    user: User.all.sample,
    party: Party.all.sample,
    status: rand(0..2)
  )
  request.save!
  puts "Creating #{request.id}"
end
puts "create test user test@pre pass: 123456"

puts "Finished!"
