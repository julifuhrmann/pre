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
  "drinkin alone @görli",
  "@park with Sebi",
  "Move iT!",
  "Mega 90er",
  "ReBOOTERs",
  "TA appliers",
  "Rentners",
  "Why am I here?!",
  "Till Last One Stands",
  "Nerds UNITE",
  "fête des années 80",
  "Inception inception",
  "Slime-o-maker",
  "bestPITCH",
  "CS LAN PARTY",
  "CSS cry-together",
  "drinks > tickets",
  "Friday Drinks"
]
 
people = [
  "ElonMusk",
  "Sebi",
  "Matias",
  "Oonagh",
  "Boris-LeWagon",
  "Seb-LeWagon",
  "KylieJenner",
  "Messi",
  "Max",
  "BillGates",
  "Olivier",
  "dicaprio",
  "BorisJohnson",
  "Tahir",
  "ArianaGrande",
  "Juli",
  "nina",
  "Adam"
]

description = [
  "You didn't make it to Berghain? Then come be lonely at görli! Every lonely person welcome. Let's be lonely together",
  "The day has come... Sebi is taking us to the park!!!! Bring ur own alcohol though, and cancel your plans for tomorrow!",
  "Silent disco - bring your own headphones & let's dance the night away!",
  "Let's go back in time to the 90s baby!",
  "We made it to demo day, now let's party bitches!! I am having pre drinks in my apartment before heading to the club, all Alumini welcome!",
  "One last party and day of fun before becoming a TA, lets make it one to remember!",
  "Do not be fooled by the name, this is gonna be the best party ever!!! Private location. Top Secret.",
  "Sports party in my garden! Lets get wasted & play football",
  "Party at my place!! Minimum stay - 12 hours!  I host this party every weekend 🕺🏻",
  "Chess party in the park - please bring your own drinks, I will bring the chess!",
  "Get your 80s outfits ready, we are going to the disco! Drinks at my place under the disco ball 🕺🏻",
  "Top secret party. Message for more info",
  "Unlimited slime & drinks to celebrate my departure from parliament!!!!!",
  "Paint party!!! Bring your friends & destroy my garage before we renovate!! Everyone welcome! 🎨",
  "Get your keyboards ready, we're pulling an all-nighter until we've got no tears left to cry!",
  "Description is in the title... bring vodka & lets cry together over CSS",
  "Finally, after a strenuous 9 weeks, it is finallyyyyyy... LETS GET WASTED!",
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
