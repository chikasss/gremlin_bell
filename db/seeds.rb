# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Deleting Users"
User.destroy_all

puts 'Creating admin user...'

User.create!(
  email: 'admin@mail.com',
  password: 'admin123',
  first_name: 'Admin',
  last_name: 'User',
  about: 'Administrator of the system',
  prefecture: 'Tokyo',
  admin: true
)

puts "Admin created"

puts "Creating Users"

bill = User.create!(
  email: 'bill@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Bill',
  last_name: 'Billiards',
  about: "Hi! My name is Bill. I'm an American that's been living in Hokkaido for 5 years. I've been riding motorcycles for about 15 years. After three attempts, I finally got a Japanese license this year so I'm looking to explore what Japan's roads have to offer! I'm looking forward to checking out your awesome routes and adding some of my own!",
  prefecture: "Hokkaido",
  social_links: { twitter: "twitter.com/notatallarealpageforbill", facebook: "facebook.com/notatallarealpageforbill", instagram: "instagram.com/notatallarealpageforbill", youtube: "youtube.com/notatallarealpageforbill", tiktok: "tiktok.com/notatallarealpageforbill"},
)

hideo = User.create!(
  email: 'hideo@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Hideo',
  last_name: 'Sato',
  about: "Hello. My name is Hideo. I've ridden motorcycles all over Japan. I live in Kanagawa so I know the area very well. Please take a look at my routes. If you have any questions, don't hesitate to ask me. Maybe we can go on a ride together. I recently retired so I have way too much free time.",
  prefecture: "Kanagawa",
  social_links: { twitter: "twitter.com/notatallarealpageforhideo", facebook: "facebook.com/notatallarealpageforhideo", instagram: "instagram.com/notatallarealpageforhideo", youtube: "youtube.com/notatallarealpageforhideo", tiktok: "tiktok.com/notatallarealpageforhideo"},
)

mika = User.create!(
  email: 'mika@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Mika',
  last_name: 'Hayashi',
  about: "Hello. My name is Mika. I just returned to Japan after studying abroad in Australia. I hope to make some friends and go on rides together.",
  prefecture: "Aomori",
  social_links: { twitter: "twitter.com/notatallarealpageformika", facebook: "facebook.com/notatallarealpageformika", instagram: "instagram.com/notatallarealpageformika", youtube: "youtube.com/notatallarealpageformika", tiktok: "tiktok.com/notatallarealpageformika"},
)

eric = User.create!(
  email: 'eric@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Eric',
  last_name: 'Hall',
  about: "Hey, I'm Scott. I own a motorcycle repair shop in Tokyo. I've been riding bikes for more than 20 years. On the weekends, I like to pick direction and just go where the road takes.",
  prefecture: "Tokyo",
  social_links: { twitter: "twitter.com/notatallarealpageforeric", facebook: "facebook.com/notatallarealpageforeric", instagram: "instagram.com/notatallarealpageforeric", youtube: "youtube.com/notatallarealpageforeric", tiktok: "tiktok.com/notatallarealpageforeric"},
)
mary = User.create!(
  email: 'mary@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Mary',
  last_name: 'Smith',
  about: "G'day mate! Just an Aussie cruisin' Japan's countryside.",
  prefecture: "Nagano",
  social_links: { twitter: "twitter.com/notatallarealpageformary", facebook: "facebook.com/notatallarealpageformary", instagram: "instagram.com/notatallarealpageformary", youtube: "youtube.com/notatallarealpageformary", tiktok: "tiktok.com/notatallarealpageformary"},
)


puts "Users created"

puts "Creating bikes"

bill_bikes = Bike.create!(
  name: 'Z900',
  year: 2022,
  brand: 'Kawasaki',
  user: bill
)

hideo_bikes = Bike.create!(
  name: 'XL1200R',
  year: 2004,
  brand: 'Harley Davidson',
  user: hideo
)

mika_bikes = Bike.create!(
  name: 'GL1500',
  year: 1998,
  brand: 'Honda',
  user: mika
)

eric_bikes = Bike.create!(
  name: 'VMAX',
  year: 2002,
  brand: 'Yamaha',
  user: eric
)
mary_bikes = Bike.create!(
  name: 'Trail 125',
  year: 1978,
  brand: 'Honda',
  user: mary
)

puts "Bikes created"

# puts "attaching avatars to Users"

puts "Creating routes"

bill_route = Route.create!(
  title: "Nakayama Pass",
  description: "",
  ride_type: ["Scenic"],
  # waypoints: ,
  videos_url: "https://youtu.be/TZezHtKiq-Y?si=fcgT01QuDZ5EkteT",
  user: bill
)

hideo_route = Route.create!(
  title: "Jozankei",
  description: "",
  ride_type: ["Calm"],
  # waypoints: ,
  videos_url: "https://youtu.be/ddS0POyoErs?si=dvTYyFnwQR7tckzm",
  user: hideo
)

mika_route = Route.create!(
  title: "Ride Along West Coast of Hokkaido",
  description: "",
  ride_type: ["Coastal"],
  # waypoints: ,
  videos_url: "https://youtu.be/NFII_nKKB5c?si=HpAm347NhKU1Di7z",
  user: mika
)

eric_route = Route.create!(
  title: "Highway 38",
  description: "",
  ride_type: ["Scenic"],
  # waypoints: ,
  videos_url: "https://youtu.be/Omf5kd-EK0M?si=B79VP_lMx5YlYbAM",
  user: eric
)

mary_route = Route.create!(
  title: "W800 Street on Mikuni Pass",
  description: "A nice ride with lots of trees surrounding the road. Good ride if you want to just get a good whiff of trees.",
  ride_type: ["calm"],
  # waypoints: ,
  videos_url: "https://youtu.be/UNK4Zwg6W3E?si=Z-nWMjmrvM6if4sQ",
  user: mary
)
mary_route2 = Route.create!(
  title: "W800 Strdfafadsafeet on Mikuni Pass",
  description: "A nfsadfaice ride with lots of trees surrounding the road. Good ride if you want to just get a good whiff of trees.",
  ride_type: ["Calm"],
  # waypoints: ,
  videos_url: "https://youtu.be/UNK4Zwg6W3E?si=Z-nWMjmrvM6if4sQ",
  user: mary
)

puts "Routes created"

puts "Creating comments"

hideo_to_bill_route = Comment.create!(
  description: "Looks incredible! I'm going to check this out next time I'm in the area.",
  route: bill_route,
  user: hideo
)

bill_response_to_hideo = Comment.create!(
  description: "Can't wait to see what you think. Hit me up when you're in the area. Maybe we can ride together.",
  route: bill_route,
  user: bill
)

puts "Comments created"

puts "Creating Reviews"

review_for_bill_route = Review.create!(
  date: DateTime.new(2024,8,1,17),
  title: "Smooth Ride",
  description: "This is actually the first ride I've ever gone on that I discovered on Gremlin Bell and had a blast!",
  rating: 5,
  videos_url: "",
  used_bike: "2002 Yamaha VMAX",
  road_condition: "",
  route: bill_route,
  bike_id: eric.bikes.first.id,
  user: eric
)

puts "Reviews Created"

puts "Seeding Complete"
