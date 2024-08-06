# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "deleting Users"
User.destroy_all

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

puts "Bikes created"

# puts "attaching avatars to Users"

puts "Creating routes"

bill_routes = Route.create!(
  title: "Nakayama Pass",
  description: "",
  ride_type: "scenic",
  # waypoints: ,
  videos_url: "https://youtu.be/TZezHtKiq-Y?si=fcgT01QuDZ5EkteT",
  user: bill
)

puts "Routes created"

puts "Seeding Complete"
