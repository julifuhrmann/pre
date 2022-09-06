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

berlin = [
  "Inception inception",
  "Move iT!",
  "LW GRAD PARTY",
  "Mega 90er",
  "Till Last One Stands",
  "Nerds UNITE",
  "80er-Kultparty",
  "drinking alone",
  "Great 80s Open Air",
  "ReBOOTERs",
  "Why am I here?!",
  "bestPITCH",
  "Rentners",
  "CS LAN PARTY",
  "Sebi's day in the park",
  "TA appliers",
  "CSS cry-together"
]

people = [
  "Juli",
  "Matias",
  "Tahir",
  "Oonagh",
  "Max",
  "Seb-Lewagon",
  "Boris",
  "Elon",
  "MahatmaGandhi",
  "DwayneJohnson",
  "BillGates",
  "Messi",
  "JBIEBER",
  "ArianaGrande",
  "KylieJenner",
  "Zolema",
  "Carmen"
]

puts "Create 18 users..."

i = 0
18.times do
  email = "#{people[i]}@preparty.fun"

  user = User.new(
    username: people[i],
    email: email,
    password: '123456'
  )
  puts "#{user.email}"
  cloudinary = Cloudinary::Search.expression('folder=users').execute["resources"][i]
  user.avatar.attach(io: URI.open(cloudinary["url"]),
                    filename: cloudinary["filename"],
                    content_type: "image/#{cloudinary["format"]}")
  user.save!
  puts "Creating #{User.count} - #{user.username} - #{user.email}"

  puts "create user's party"

  party = Party.new(
    name: berlin[i],
    date: Faker::Date.forward(days: 14),
    status: rand(0..1),
    user: user,
    description: Faker::Hipster.paragraph(sentence_count: 2),
    address: ["Am Wriezener bhf Friedrichshain 10243 Berlin", "Hauptstraße 15 Rummelsburg 10317 Berlin", "Rudi-Dutschke-Straße 26 Mitte 10969 Berlin"].sample
  )
  cloudinary = Cloudinary::Search.expression('folder=parties').execute["resources"][i]
  party.photo.attach(io: URI.open(cloudinary["url"]),
                      filename: cloudinary["filename"],
                      content_type: "image/#{cloudinary["format"]}")

  party.save!
  puts "Creating #{Party.count} - #{party.user.username} - #{party.name}"
  i += 1
end

puts "finished!"
