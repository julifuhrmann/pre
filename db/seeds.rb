# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "reset db..."
User.destroy_all
Party.destroy_all

puts "Create 10 users..."

puts "finished!"

10.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  user.save!
  puts "Creating #{User.count} - #{user.email}"
end

puts "Create 10 parties..."
i = 0
10.times do
  party = Party.new(
    name: Faker::Hipster.sentence.name,
    date: Faker::Date.date(rand(Date >= Date.today)),
    status: Faker::Number(rand(0..1)),
    description: Faker::Hipster.paragraph(sentence_count: 5),
    user: User.all.sample,
    address: Faker::Address.address
  )
  i += 1
  party.save!
  puts "Creating #{party.id} - #{party.name}"
end

puts "Finished!"
