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
  "Sebi's takes us to the park",
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
  "TA appliers",
  "CSS cry-together",
  "Demo Day",
  "Friday Drinks"
]

people = [
  "Julia",
  "Matias",
  "Tahir",
  "Oonagh",
  "Sebi",
  "Max",
  "Dennis",
  "Olivier",
  "ElonMusk",
  "Claire",
  "Haddas",
  "BillGates",
  "Messi",
  "Emre",
  "Lucine",
  "Leo",
  "Carmen"
]

description = [
  "Paint party!!! Bring your friends & destroy my garage before we renovate!! Everyone welcome! 🎨",
  "Silent disco - bring your own headphones & let's dance the night away!",
  "Le Wagon Grad party! We made it to demo day, now let's party bitches!! I am having pre drinks in my apartment before heading to the club, all Alumini welcome!",
  "Let's go back in time to the 90s baby!",
  "Party at my place!! Minimum stay - 12 hours!  I host this party every weekend 🕺🏻",
  "Chess party in the park - please bring your own drinks, I will bring the chess!",
  "Get your 80s outfits ready, we are going to the disco! Drinks at my place under the disco ball 🕺🏻",
  "Do you wanna drink but not be lonely? Then come and be lonely at my place! Every lonely person welcome. Lets be lonely together",
  "Get your rollerskates ready, as we are going to an 80s open air in Treptower Park!",
  "Unlimited food & drink to drown our sorrows.",
  "Do not be fooled by the name, this is gonna be the best party ever!!! Private location. Top Secret.",
  "Sports party in my garden! Lets get wasted & play football",
  "Top secret party. Message for more info",
  "Let's cry together & drink vodka!!",
  "The day has come... Sebi is taking us to the park!!!! Bring ur own alcohol though, and cancel your plans for tomorrow!",
  "One last party and day of fun before becoming a TA, lets make it one to remember!",
  "Description is in the title... bring vodka & lets cry together over CSS",
  "Finally, after a strenguous 9 weeks, it is finallyyyyyy... DEMO DAY! LETS GET WASTED!",
  "Friday drinks never end, lets get wasted! In a secret location, message for details",
]

puts "Create 17 users..."

i = 0
17.times do
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
    description: description[i],
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
