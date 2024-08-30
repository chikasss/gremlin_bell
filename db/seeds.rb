# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

include MentionProcessor

puts 'Cleaning database...'

Favorite.destroy_all
Route.destroy_all
Bike.destroy_all
Photo.destroy_all
Comment.destroy_all
Review.destroy_all
Message.destroy_all
Chatroom.destroy_all
Post.destroy_all
User.destroy_all

puts "Creating Users"

ryder = User.create!(
  email: 'ryder@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Ryder',
  last_name: 'Tanaka',
  username: 'Ryder_Tanaka',
  about: "Foreign man in a foreign land. Just me, the road, and my hog.",
  prefecture: "Tokyo",
  social_links: { twitter: "twitter.com/notatallarealpageforryder", facebook: "facebook.com/notatallarealpageforryder", instagram: "instagram.com/notatallarealpageforryder", youtube: "youtube.com/notatallarealpageforryder", tiktok: "tiktok.com/notatallarealpageforryder"},
)

bill = User.create!(
  email: 'bill@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Bill',
  last_name: 'Billiards',
  username: 'Bill_Billiards',
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
  username: 'Hideo_Sato',
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
  username: 'Mika_Hayashi',
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
  username: 'Eric_Hall',
  about: "Hey, I'm Eric. I own a motorcycle repair shop in Tokyo. I've been riding bikes for more than 20 years. On the weekends, I like to pick direction and just go where the road takes.",
  prefecture: "Tokyo",
  social_links: { twitter: "twitter.com/notatallarealpageforeric", facebook: "facebook.com/notatallarealpageforeric", instagram: "instagram.com/notatallarealpageforeric", youtube: "youtube.com/notatallarealpageforeric", tiktok: "tiktok.com/notatallarealpageforeric"},
)

mary = User.create!(
  email: 'mary@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Mary',
  last_name: 'Smith',
  username: 'Mary_Smith',
  about: "G'day mate! Just an Aussie cruisin' Japan's countryside.",
  prefecture: "Nagano",
  social_links: { twitter: "twitter.com/notatallarealpageformary", facebook: "facebook.com/notatallarealpageformary", instagram: "instagram.com/notatallarealpageformary", youtube: "youtube.com/notatallarealpageformary", tiktok: "tiktok.com/notatallarealpageformary"},
)

angel = User.create!(
  email: 'angel@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Angel',
  last_name: 'Gibson',
  username: 'Angel_Gibson',
  about: "Hi! I'm Angel. My partner and I have been riding around Fukuoka for 10 years so we know some great areas to ride around.  ",
  prefecture: "Fukuoka",
  social_links: { twitter: "twitter.com/notatallarealpageforangel", facebook: "facebook.com/notatallarealpageforangel", instagram: "instagram.com/notatallarealpageforangel", youtube: "youtube.com/notatallarealpageforangel", tiktok: "tiktok.com/notatallarealpageforangel"},
)

vincenzo = User.create!(
  email: 'vincenzo@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Vincenzo',
  last_name: 'Garcia',
  username: 'Vincenzo_Garcia',
  about: "Hi! I'm Vincenzo. I love riding and drinking coffee. Lets grab a drink during a ride some time.",
  prefecture: "Kanagawa",
  social_links: { twitter: "twitter.com/notatallarealpageforvincenzo", facebook: "facebook.com/notatallarealpageforvincenzo", instagram: "instagram.com/notatallarealpageforvincenzo", youtube: "youtube.com/notatallarealpageforvincenzo", tiktok: "tiktok.com/notatallarealpageforvincenzo"},
)

ami = User.create!(
  email: 'ami@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Ami',
  last_name: 'Ozaki',
  username: 'Ami_Ozaki',
  about: "Hi! I'm Ami. I spend most of the warm months on my bike.",
  prefecture: "Kanagawa",
  social_links: { twitter: "twitter.com/notatallarealpageforami", facebook: "facebook.com/notatallarealpageforami", instagram: "instagram.com/notatallarealpageforami", youtube: "youtube.com/notatallarealpageforami", tiktok: "tiktok.com/notatallarealpageforami"},
)

puts "Users created"

puts 'Creating Chatrooms and Messages'

# Chatroom1
chatroom1 = Chatroom.create!(name: 'Chatroom with Hideo', user: bill, recipient: hideo)
Message.create!(description: "Hey Hideo, how's it going?", chatroom: chatroom1, user: bill)
Message.create!(description: "Hey Bill! It's going well, thanks! How about you?", chatroom: chatroom1, user: hideo)
Message.create!(description: "I'm doing great, just planning my next ride. Any suggestions?", chatroom: chatroom1, user: bill)
Message.create!(description: "Yes, you should check out the routes in Kanagawa. I'll send you some details!", chatroom: chatroom1, user: hideo)

# Chatroom2
chatroom2 = Chatroom.create!(name: 'Chatroom with Ami', user: vincenzo, recipient: ami)
Message.create!(description: "Hi Ami! Are you up for a ride this weekend?", chatroom: chatroom2, user: vincenzo)
Message.create!(description: "Hi Vincenzo! Sure, that sounds fun. Where are we headed?", chatroom: chatroom2, user: ami)
Message.create!(description: "Let's do a coastal route, I know a great spot for coffee.", chatroom: chatroom2, user: vincenzo)

# Chatroom3
chatroom3 = Chatroom.create!(name: 'Chatroom with Eric', user: mary, recipient: eric)
Message.create!(description: "Hey Eric, I need some help with my bike. Got time?", chatroom: chatroom3, user: mary)
Message.create!(description: "Sure Mary, bring it to the shop and I'll take a look.", chatroom: chatroom3, user: eric)
Message.create!(description: "Thanks, I'll be there in the afternoon.", chatroom: chatroom3, user: mary)

# Chatroom4
chatroom4 = Chatroom.create!(name: 'Chatroom with Vincenzo', user: angel, recipient: vincenzo)
Message.create!(description: "Hi Vincenzo, any good routes near Kanagawa?", chatroom: chatroom4, user: angel)
Message.create!(description: "Hey Angel! Absolutely, I'll share a few with you.", chatroom: chatroom4, user: vincenzo)
Message.create!(description: "Thanks! Can't wait to try them out.", chatroom: chatroom4, user: angel)

# Chatroom5
chatroom5 = Chatroom.create!(name: 'Chatroom with Angel', user: eric, recipient: angel)
Message.create!(description: "Hi Angel, how was your last ride?", chatroom: chatroom5, user: eric)
Message.create!(description: "Hey Eric! It was amazing, the weather was perfect!", chatroom: chatroom5, user: angel)
Message.create!(description: "Glad to hear! Let's ride together next time.", chatroom: chatroom5, user: eric)

# Chatroom6
chatroom6 = Chatroom.create!(name: "Chatroom with Mika", user: bill, recipient: mika)
Message.create!(description: "Hi Mika! I heard you recently got back from Australia. Did you bring your bike?", chatroom: chatroom6, user: bill)
Message.create!(description: "Hey Bill! Yes, I did. I'm excited to explore Japan's roads now.", chatroom: chatroom6, user: mika)
Message.create!(description: "Awesome! We should plan a ride together. Any routes in mind?", chatroom: chatroom6, user: bill)
Message.create!(description: "I'd love that! Maybe we can start with some routes in Aomori?", chatroom: chatroom6, user: mika)

# Chatroom7
chatroom7 = Chatroom.create!(name: "Chatroom with Mary", user: hideo, recipient: mary)
Message.create!(description: "Hi Mary, I saw your post about Nagano. How's the riding there?", chatroom: chatroom7, user: hideo)
Message.create!(description: "Hi Hideo! Nagano is beautiful, especially during the autumn. You should definitely check it out.", chatroom: chatroom7, user: mary)
Message.create!(description: "That sounds great! Any specific routes you'd recommend?", chatroom: chatroom7, user: hideo)
Message.create!(description: "Yes, I'll share a couple of my favorites with you!", chatroom: chatroom7, user: mary)

# Chatroom8
chatroom8 = Chatroom.create!(name: "Chatroom with Eric", user: vincenzo, recipient: eric)
Message.create!(description: "Hey Eric! I'm thinking of upgrading my bike. Any recommendations?", chatroom: chatroom8, user: vincenzo)
Message.create!(description: "Hi Vincenzo! It depends on what you're looking for. Are you after speed, comfort, or something else?", chatroom: chatroom8, user: eric)
Message.create!(description: "I'm leaning towards something that's great for long rides but still has some power.", chatroom: chatroom8, user: vincenzo)
Message.create!(description: "In that case, I might have just the bike for you. Let's discuss it at the shop.", chatroom: chatroom8, user: eric)

puts "Chatrooms and messages created!"

puts "Creating bikes"

ryder_bikes = Bike.create!(
  name: 'Road King',
  year: 2009,
  brand: 'Harley-Davidson',
  user: ryder
)

bill_bikes = Bike.create!(
  name: 'Z900',
  year: 2022,
  brand: 'Kawasaki',
  user: bill
)

hideo_bikes = Bike.create!(
  name: 'XL1200R',
  year: 2004,
  brand: 'Harley-Davidson',
  user: hideo
)

mika_bikes = Bike.create!(
  name: 'GL1500',
  year: 1998,
  brand: 'Honda',
  user: mika
)

eric_bikes = Bike.create!(
  name: 'V-MAX',
  year: 2002,
  brand: 'Yamaha',
  user: eric
)

eric_bikes2 = Bike.create!(
  name: 'GL1500',
  year: 1998,
  brand: 'Honda',
  user: eric
)

eric_bikes3 = Bike.create!(
  name: 'XL1200R',
  year: 2004,
  brand: 'Harley-Davidson',
  user: eric
)

eric_bikes4 = Bike.create!(
  name: 'Z900',
  year: 2022,
  brand: 'Kawasaki',
  user: eric
)

mary_bikes = Bike.create!(
  name: 'Trail 125',
  year: 1978,
  brand: 'Honda',
  user: mary
)

mary_bikes2 = Bike.create!(
  name: 'Z900',
  year: 2018,
  brand: 'Kawasaki',
  user: mary
)

angel_bikes = Bike.create!(
  name: 'V-MAX',
  year: 2004,
  brand: 'Yamaha',
  user: angel
)

vincenzo_bikes = Bike.create!(
  name: 'Z900',
  year: 2022,
  brand: 'Kawasaki',
  user: vincenzo
)

ami_bikes = Bike.create!(
  name: '250TR',
  year: 2017,
  brand: 'Kawasaki',
  user: ami
)

puts "Users following each other"

users = User.all

users.each do |user|
  number_of_follows = rand(3..6)
  users_to_follow = users.where.not(id: user.id).sample(number_of_follows)

  users_to_follow.each do |followed|
    user.following << followed unless user.following?(followed)
  end
end

puts "Users are now following each other"

puts "Bikes created"

puts "Attaching bike photos to Bikes"
file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724991125/ryder_bike_flrddg.jpg")

ryder_bikes.photos.attach(
  io: file,
  filename: "ryder_bike",
  content_type: "image/jpg"
)
ryder_bikes.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724927420/Z900_bill_bike_bnw7yx_ydfdhy.webp")

bill_bikes.photos.attach(
  io: file,
  filename: "bill_bike",
  content_type: "image/jpg"
)
bill_bikes.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724927413/XL1200R_hideo_bike_atoc33_elzgs6.png")

hideo_bikes.photos.attach(
  io: file,
  filename: "hideo_bike",
  content_type: "image/jpg"
)
hideo_bikes.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926706/GL1500_mike_bike_mpcigh_ya8fjl.jpg")

mika_bikes.photos.attach(
  io: file,
  filename: "mika_bike",
  content_type: "image/jpg"
)
mika_bikes.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724927410/VMAX_eric_bike_iudh6b_hjejf3.jpg")

eric_bikes.photos.attach(
  io: file,
  filename: "eric_bike",
  content_type: "image/jpg"
)
eric_bikes.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926705/GL1500_eric_bike2_gkgc2v_uzhdzo.jpg")

eric_bikes2.photos.attach(
  io: file,
  filename: "eric_bike2",
  content_type: "image/jpg"
)
eric_bikes2.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724927412/XL1200R_eric_bike3_ln2mkv_e4mg6e.jpg")

eric_bikes3.photos.attach(
  io: file,
  filename: "eric_bike3",
  content_type: "image/jpg"
)
eric_bikes3.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724927422/Z900_eric_bike4_kbryde_czfbuh.jpg")

eric_bikes4.photos.attach(
  io: file,
  filename: "eric_bike4",
  content_type: "image/jpg"
)
eric_bikes4.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724927157/Trail125_mary_bike_eekx21_zfjpzr.jpg")

mary_bikes.photos.attach(
  io: file,
  filename: "mary_bike",
  content_type: "image/jpg"
)
mary_bikes.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724927420/Z900_mary_bike2_slozex_wt922n.webp")

mary_bikes2.photos.attach(
  io: file,
  filename: "mary_bike2",
  content_type: "image/jpg"
)
mary_bikes2.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724927410/VMAX_angel_bike_ckebu8_baex2v.jpg")

angel_bikes.photos.attach(
  io: file,
  filename: "angel_bike",
  content_type: "image/jpg"
)
angel_bikes.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724927422/Z900_vincenzo_bike_syrsgb_yqzkwh.jpg")

vincenzo_bikes.photos.attach(
  io: file,
  filename: "vincenzo_bike",
  content_type: "image/jpg"
)
vincenzo_bikes.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926699/250TR_ami_bike_t81mjv_o43kl6.jpg")

ami_bikes.photos.attach(
  io: file,
  filename: "ami_bike",
  content_type: "image/jpg"
)
ami_bikes.save

puts "Photos attached to Bikes"

puts "Attaching avatars to Users"

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724991118/PXL_20240830_040020893_ceshxe.jpg")

ryder.avatar.attach(
  io: file,
  filename: "ryder_profile",
  content_type: "image/jpg"
)
ryder.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926701/bill_cgxobm_c4syon.jpg")

bill.avatar.attach(
  io: file,
  filename: "bill_profile",
  content_type: "image/jpg"
)
bill.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926715/hideo_qw2ipi_pdcsko.jpg")

hideo.avatar.attach(
  io: file,
  filename: "hideo_profile",
  content_type: "image/jpg"
)
hideo.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926720/mika_GL1500_m6vy8n_edlqyz.jpg")

mika.avatar.attach(
  io: file,
  filename: "mika_profile",
  content_type: "image/jpg"
)
mika.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926704/eric_wqvp0k_nv2vt7.jpg")

eric.avatar.attach(
  io: file,
  filename: "eric_profile",
  content_type: "image/jpg"
)
eric.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926720/mary_yyp4sm_h2gnjj.jpg")

mary.avatar.attach(
  io: file,
  filename: "mary_profile",
  content_type: "image/jpg"
)
mary.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926700/angel_gr0bov_ge9s2p.jpg")

angel.avatar.attach(
  io: file,
  filename: "angel_profile",
  content_type: "image/jpg"
)
angel.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724927171/vincenzo_bcx2gv_gsig0w.jpg")

vincenzo.avatar.attach(
  io: file,
  filename: "vincenzo_profile",
  content_type: "image/jpg"
)
vincenzo.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926700/ami_rqcvjg_egj0ok.jpg")

ami.avatar.attach(
  io: file,
  filename: "ami_profile",
  content_type: "image/jpg"
)
ami.save

puts "Avatars attached to Users"

puts "Creating routes"

recomended_bikes = Route::RECOMENDED_BIKES

bill_route = Route.create!(
  title: "Nakayama Pass",
  description: "Do you like making your bike go VROOM in tunnels? This route has a ton of em haha.",
  ride_type: ["Scenic"],
  waypoints: [["140.93342678338806", "42.79543274892502"], ["141.09836986142776", "42.86675427633369"], ["141.1490391486532", "42.95572467766607"]],
  videos_url: "https://youtu.be/TZezHtKiq-Y?si=fcgT01QuDZ5EkteT",
  prefecture: "Hokkaido",
  road_condition: "Paved",
  user: bill,
  recomended_bikes: recomended_bikes.sample(5).uniq.first(2)
)

bill_route2 = Route.create!(
  title: "Ocean Drive",
  description: "Beautiful ride along the coast in Hokkaido.",
  ride_type: ["Coastal"],
  waypoints: [["141.74839805413814", "44.889475992211054"], ["140.1090450503816", "41.43603698754825"],["139.78044474084138", "42.27220980149337"]],
  videos_url: "https://www.youtube.com/watch/DuurJdmyMtQ?si=ECtrX_jTUf4q6woY",
  prefecture: "Hokkaido",
  road_condition: "Paved",
  user: bill,
  recomended_bikes: recomended_bikes.sample(5).uniq.first(2)
)

mika_route = Route.create!(
  title: "Kyushu",
  description: "If you're a fan of the ocean, definitely ride here. ",
  ride_type: ["Coastal"],
  waypoints: [["131.3981", "31.5105"], ["129.4230", "33.0262"]],
  videos_url: "https://youtu.be/oF6xabrZblA?si=3yfWVI3uHowPjAX4",
  prefecture: "Fukuoka",
  road_condition: "Paved",
  user: mika,
  recomended_bikes: recomended_bikes.sample(5).uniq.first(2)
)

eric_route = Route.create!(
  title: "Highway 38",
  description: "Calm ride surrounded by nature. I recommend going during the autumn months to enjoy various autumn colors. Cops love hanging around here so best not to speed. Small downside, but the view is worth it.",
  ride_type: ["Scenic", "Mountainous"],
  waypoints: [["142.3826", "43.3430"], ["143.1966", "42.9236"]],
  videos_url: "https://youtu.be/Omf5kd-EK0M?si=B79VP_lMx5YlYbAM",
  prefecture: "Hokkaido",
  road_condition: "Dirt",
  user: eric,
  recomended_bikes: recomended_bikes.sample(5).uniq.first(2)
)

hideo_route = Route.create!(
  title: "Jozankei",
  description: "Just a calm ride by the tree covered mountains. Awesome onsens in the area.",
  ride_type: ["Twisty", "Calm", "Mountainous"],
  waypoints: [["141.34922013893006", "42.99612873322272"], ["141.30041947250808", "42.96164203836398"], ["141.12440229400718", "42.917284593230214"]],
  videos_url: "https://youtu.be/ddS0POyoErs?si=dvTYyFnwQR7tckzm",
  prefecture: "Hokkaido",
  road_condition: "Construction",
  user: hideo,
  recomended_bikes: ["Cruiser", "Standard"]
)

mary_route = Route.create!(
  title: "W800 Street on Mikuni Pass",
  description: "A nice ride with lots of trees surrounding the road. Good ride if you want to just get a good whiff of trees.",
  ride_type: ["Calm", "Scenic"],
  waypoints: [["138.7392", "36.8343"], ["138.7104", "36.7627"]],
  videos_url: "https://youtu.be/UNK4Zwg6W3E?si=Z-nWMjmrvM6if4sQ",
  prefecture: "Hokkaido",
  road_condition: "Poor",
  user: mary,
  recomended_bikes: recomended_bikes.sample(5).uniq.first(2)
)

angel_route = Route.create!(
  title: "Ride in Kyushu",
  description: "This is a nice and relaxing ride I took in the summer in Kyushu with a nice mix of urban and nature.",
  ride_type: ["Calm", "Mountainous", "Urban"],
  waypoints: [["138.7392", "36.8343"], ["138.7104", "36.7627"]],
  videos_url: "https://youtu.be/Hjx9_m2-ItE?si=FjwsTDV4GBQ0V9on",
  prefecture: "Oita",
  road_condition: "Paved",
  user: angel,
  recomended_bikes: recomended_bikes.sample(5).uniq.first(2)
)

vincenzo_route = Route.create!(
  title: "West Coast of Hokkaido",
  description: "I was visiting a friend up in Hokkaido and we went for a ride along the coast. If you're a fan of the ocean, definitely ride here.",
  ride_type: ["Coastal"],
  waypoints: [["130.3765", "33.5868"], ["130.3515", "33.5934"]],
  videos_url: "https://youtu.be/NFII_nKKB5c?si=HpAm347NhKU1Di7z",
  prefecture: "Hokkaido",
  road_condition: "Poor",
  user: vincenzo,
  recomended_bikes: recomended_bikes.sample(5).uniq.first(2)
)

ami_route = Route.create!(
  title: "Noborito to Yokohama",
  description: "This is a fun ride that starts in Kawasaki and runs through into Yokohama.",
  ride_type: ["Urban"],
  waypoints: [["139.6537", "35.5812"], ["139.6400", "35.4522"]],
  videos_url: "https://youtu.be/OpF7UOxqqSU?si=ZIg4BU_kcRwEwEMR",
  prefecture: "Kanagawa",
  road_condition: "Gravel",
  user: ami,
  recomended_bikes: recomended_bikes.sample(5).uniq.first(2)
)


puts "Attaching Landmarks to Routes"

hideo_route.landmarks.create!(
  address: "Jozankei Onsen",
  long: 141.1632012271542,
  lat: 42.965142884280105
)

puts "Attaching photos to Routes"

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926724/nakayama_jmgip6_uj0xth.jpg")
Photo.create!(
  image: {
    io: file,
    filename: "bill_route",
    content_type: "image/jpg"
  },
  route: bill_route,
  user: bill_route.user
)

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926728/ocean_y0fdqn_dxirgq.jpg")
Photo.create!(
  image: {
    io: file,
    filename: "bill_route2",
    content_type: "image/jpg"
  },
  route: bill_route2,
  user: bill_route2.user
)

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926717/jozankei_guuq2s_bw4l9e.jpg")
Photo.create!(
  image: {
    io: file,
    filename: "hideo_route",
    content_type: "image/jpg"
  },
  route: hideo_route,
  user: hideo_route.user
)

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724991249/jozankei_fall_sxsjsn.jpg")
Photo.create!(
  image: {
    io: file,
    filename: "hideo_route",
    content_type: "image/jpg"
  },
  route: hideo_route,
  user: hideo_route.user
)

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724992414/Jozankei_Onsen_Winter-1024x665_cy9fw6.jpg")
Photo.create!(
  image: {
    io: file,
    filename: "hideo_route",
    content_type: "image/jpg"
  },
  route: hideo_route,
  user: hideo_route.user
)

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926719/kyusyu_jjfzn0_uk3mqu.jpg")
Photo.create!(
  image: {
    io: file,
    filename: "mika_route",
    content_type: "image/jpg"
  },
  route: mika_route,
  user: mika_route.user
)

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926716/highway38_zanqdw_lekuhu.jpg")
Photo.create!(
  image: {
    io: file,
    filename: "eric_route",
    content_type: "image/jpg"
  },
  route: eric_route,
  user: eric_route.user
)

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926724/mikuni_kyf2gb_ohxojl.jpg")
Photo.create!(
  image: {
    io: file,
    filename: "mary_route",
    content_type: "image/jpg"
  },
  route: mary_route,
  user: mary_route.user
)

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724927157/summer_kyusyu_r5g56r_msa3cb.jpg")
Photo.create!(
  image: {
    io: file,
    filename: "angel_route",
    content_type: "image/jpg"
  },
  route: angel_route,
  user: angel_route.user
)

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724927413/west_coast_hokkaido_b4pv70_uykj6w.jpg")
Photo.create!(
  image: {
    io: file,
    filename: "vincenzo_route",
    content_type: "image/jpg"
  },
  route: vincenzo_route,
  user: vincenzo_route.user
)

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926725/noborito_a9eebx_cdp1gv.jpg")
Photo.create!(
  image: {
    io: file,
    filename: "ami_route",
    content_type: "image/jpg"
  },
  route: ami_route,
  user: ami_route.user
)

puts "Route photos attached successfully!"

puts "Routes created"

puts "Adding random favorites routes for users..."

User.find_each do |user|
  routes = Route.order('RANDOM()').limit(rand(1..3))
  routes.each do |route|
    user.favorite(route)
  end
end

puts "Random favorites routes added successfully!"


puts "Creating comments"

puts "Creating comments"

hideo_to_bill_route = Comment.create!(
  description: "Looks incredible! I'm going to save this and check it out next time I'm in the area. Thanks!",
  commentable: bill_route,
  user: hideo
)

bill_response_to_hideo = Comment.create!(
  description: "Can't wait to see what you think. Hit me up when you're in the area. Maybe we can ride together.",
  commentable: bill_route,
  user: bill
)

angel_to_bill_route = Comment.create!(
  description: "Sadly no tunnels by me, but I totally get what you mean lol",
  commentable: bill_route,
  user: angel
)

bill_response_to_angel = Comment.create!(
  description: "VROOOOOOOOOOM!!!",
  commentable: bill_route,
  user: bill
)

vincenzo_to_ami_route = Comment.create!(
  description: "Oh wow! I actually live along this route. I've regularly go to Yokohama on the weekends, but I've never gone this way. Looks like fun. I'll check it out this weekend",
  commentable: ami_route,
  user: vincenzo
)

ami_response_to_vincenzo = Comment.create!(
  description: "Cool! Let me know how it goes.",
  commentable: ami_route,
  user: ami
)

vincenzo2_to_ami_route = Comment.create!(
  description: "Just finished the ride. It was great. I ended up finding a cafe I hadn't heard of before so I'm glad I checked it out.",
  commentable: ami_route,
  user: vincenzo
)

mary_to_hideo_route = Comment.create!(
  description: "I just checked out an onsen in the area. Sadly didn't have my bike with me, but I'll save this for next time.",
  commentable: hideo_route,
  user: mary
)

hideo_response_to_mary = Comment.create!(
  description: "The onsens are so nice there. Hope you enjoyed it.",
  commentable: hideo_route,
  user: hideo
)

bill_response_to_hideo = Comment.create!(
  description: "I love this ride thanks!",
  commentable: hideo_route,
  user: bill
)

bill_to_mika_route = Comment.create!(
  description: "I visited Hiraodai Karst last summer. Kushitani Cafe Aso is the best!",
  commentable: mika_route,
  user: bill
)

mika_response_to_bill = Comment.create!(
  description: "It is! Great spot to take a break.",
  commentable: mika_route,
  user: mika
)

bill_to_eric_route = Comment.create!(
  description: "This looks great! I know someone that lives in the area. I'm gonna let him know about this.",
  commentable: eric_route,
  user: bill
)

eric_response_to_bill = Comment.create!(
  description: "Wait! Are you friends with Ray? I remember him mentioning he knew a Bill that lives in Hokkaido",
  commentable: eric_route,
  user: eric
)

bill_to_eric = Comment.create!(
  description: "Ha! Yes, that's him! We went to college together. We got our motorcycle licenses at the same time too!",
  commentable: eric_route,
  user: bill
)

eric_response_to_bill2 = Comment.create!(
  description: "Small world!",
  commentable: eric_route,
  user: eric
)

puts 'Comments created!'

puts "Creating Reviews"

review_for_bill_route = Review.create!(
  date: DateTime.new(2024,8,1,17),
  title: "Small World!",
  description: "This is actually the first ride I've ever gone on that I discovered on Gremlin Bell and had a blast! Believe it or not, I ran into some other Gremlin Bell users while getting gas during this trip haha",
  rating: 5,
  videos_url: "",
  used_bike: "2002 Yamaha VMAX",
  road_condition: "Paved",
  route: bill_route,
  bike_id: eric.bikes.first.id,
  user: eric
)

review_for_mary_route = Review.create!(
  date: DateTime.new(2024,8,9,17),
  title: "Smooth Ride",
  description: "I rode here in mid-August and the road had just been freshly paved.",
  rating: 5,
  videos_url: "",
  used_bike: "2002 Yamaha VMAX",
  road_condition: "Paved",
  route: mary_route,
  bike_id: eric.bikes.first.id,
  user: eric
)

review_for_ami_route = Review.create!(
  date: DateTime.new(2024,8,20,17),
  title: "A chill ride through the cities",
  description: "I normally ride to Yokohama from my home a different way so I figured I switch it up and take this route. Boy was I glad. I'm a big coffee fan and I ended up stumbling across a cafe while riding this route. The name is cafe+cake Baloo. I'm not normally a cake person, but their strawberry shortcake slapped! Thanks Ami for sharing this route!",
  rating: 5,
  videos_url: "",
  used_bike: "2022 Kawasaki Z900",
  road_condition: "Construction",
  route: ami_route,
  bike_id: vincenzo.bikes.first.id,
  user: vincenzo
)

review_for_ami_route2 = Review.create!(
  date: DateTime.new(2024,8,10,17),
  title: "Fun ride",
  description: "I was visiting a friend in Kanagawa and he had never ridden a motorcycle. He was a bit nervous, but this ride was nice and easy. (I think I may have convinced him to get a motorcycle license)",
  rating: 5,
  videos_url: "",
  used_bike: "2004 Yamaha V-MAX",
  road_condition: "Paved",
  route: ami_route,
  bike_id: angel.bikes.first.id,
  user: angel
)

review_for_mika_route = Review.create!(
  date: DateTime.new(2024,7,25,17),
  title: "No one else on the roads",
  description: "I went here towards the end of July and I didn't see a single other vehicle. Just me and the road. It was awesome. Thanks Mika.",
  rating: 5,
  videos_url: "",
  used_bike: "2004 Yamaha V-MAX",
  road_condition: "Paved",
  route: mika_route,
  bike_id: angel.bikes.first.id,
  user: angel
)

review_for_eric_route = Review.create!(
  date: DateTime.new(2024,7,10,17),
  title: "Eric wasn't kidding about the cops haha",
  description: "I ran into a few cops along this route, but the scenery is so beautiful that I felt no need to go any faster than the speed limit.",
  rating: 4,
  videos_url: "",
  used_bike: "1998 Honda GL1500",
  road_condition: "Paved",
  route: eric_route,
  bike_id: mika.bikes.first.id,
  user: mika
)

review_for_eric_route2 = Review.create!(
  date: DateTime.new(2024,7,16,17),
  title: "Beautiful during sunrise.",
  description: "Rode here during the early morning. Highly recommend it. The sun peeks right over the mountains, but not directly into your eyes.",
  rating: 5,
  videos_url: "",
  used_bike: "2022 Kawasaki Z900",
  road_condition: "Construction",
  route: eric_route,
  bike_id: vincenzo.bikes.first.id,
  user: vincenzo
)

review_for_hideo_route = Review.create!(
  date: DateTime.new(2024,7,30,17),
  title: "Nice getaway ride",
  description: "Sometimes I just want to get away from city life and this ride definitely does the job. I didn't run into any trucks during my entire ride.",
  rating: 5,
  videos_url: "",
  used_bike: "2017 Kawasaki 250TR",
  road_condition: "Dirt",
  route: hideo_route,
  bike_id: ami.bikes.first.id,
  user: ami
)

review_for_hideo_route2 = Review.create!(
  date: DateTime.new(2024,8,15,17),
  title: "Calm ride with minimal traffic lights.",
  description: "There are tunnels! VROOM! There was some construction with some new signage going up, but it didn't create any traffic",
  rating: 5,
  videos_url: "",
  used_bike: "2004 Yamaha V-MAX",
  road_condition: "Paved",
  route: hideo_route,
  bike_id: angel.bikes.first.id,
  user: angel
)

puts "Reviews Created"

puts "Attaching photos to reviews"

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926730/Review_Bill_Route_bizkh5_kq2cvg.jpg")

review_for_bill_route.photos.attach(
  io: file,
  filename: "bill_route_photo",
  content_type: "image/jpg"
)
review_for_bill_route.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926740/Review_Mary_Route_vqxmhq_dai4rh.jpg")

review_for_mary_route.photos.attach(
  io: file,
  filename: "mary_route_photo",
  content_type: "image/jpg"
)
review_for_mary_route.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926729/Review_Ami_Route_amsvyg_nhcadj.jpg")

review_for_ami_route.photos.attach(
  io: file,
  filename: "ami_route_photo",
  content_type: "image/jpg"
)
review_for_ami_route.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926740/Review_Mika_Route_djznvl_ncyt52.jpg")

review_for_mika_route.photos.attach(
  io: file,
  filename: "mika_route_photo",
  content_type: "image/jpg"
)
review_for_mika_route.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926735/Review_Eric_Route_xoj12h_lezxin.jpg")

review_for_eric_route.photos.attach(
  io: file,
  filename: "eric_route_photo",
  content_type: "image/jpg"
)
review_for_eric_route.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926735/Review_Eric_Route2_rso6zl_ybnovp.jpg")

review_for_eric_route2.photos.attach(
  io: file,
  filename: "eric_route_photo2",
  content_type: "image/jpg"
)
review_for_eric_route2.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926736/Review_Hideo_Route_pxpwms_opazye.jpg")

review_for_hideo_route.photos.attach(
  io: file,
  filename: "hideo_route_photo",
  content_type: "image/jpg"
)
review_for_hideo_route.save

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926739/Review_Hideo_Route2_zwzx0m_yrsnnf.jpg")

review_for_hideo_route2.photos.attach(
  io: file,
  filename: "hideo_route_photo2",
  content_type: "image/jpg"
)
review_for_hideo_route2.save

puts "Photos attached to Reviews"

puts "Creating Posts"

bill = User.find_by(email: 'bill@mail.com')
hideo = User.find_by(email: 'hideo@mail.com')
mika = User.find_by(email: 'mika@mail.com')
eric = User.find_by(email: 'eric@mail.com')
mary = User.find_by(email: 'mary@mail.com')
angel = User.find_by(email: 'angel@mail.com')
vincenzo = User.find_by(email: 'vincenzo@mail.com')
ami = User.find_by(email: 'ami@mail.com')


posts = []

# Post 1
processed = process_mentions("Had an amazing ride today on @[Nakayama Pass]! Thanks @Hideo_Sato for the recommendation!")
posts << post1 =  Post.create!(
  user: bill,
  content: processed[:content],
  mentions: processed[:mentions],
  tags: ["Nakayama Pass", "ride", "recommendation"]
)

# Post 2
processed = process_mentions("Explored @Jozankei today, and it was stunning. @Eric_Hall, you should definitely check it out!")
posts << post2 = Post.create!(
  user: mika,
  content: processed[:content],
  mentions: processed[:mentions],
  tags: ["Jozankei", "explore", "stunning"]
)

# Post 3
processed = process_mentions("If you're looking for a great coastal ride, I highly recommend @[Ocean Drive]! @Mary_Smith, you would love this one!")
posts << post3 = Post.create!(
  user: vincenzo,
  content: processed[:content],
  mentions: processed[:mentions],
  tags: ["Ocean Drive", "coastal", "ride"]
)

# Post 4
processed = process_mentions("Urban vibes on my ride through @[Noborito to Yokohama] today. @Angel_Gibson, let's ride together next time!")
posts << post4 = Post.create!(
  user: ami,
  content: processed[:content],
  mentions: processed[:mentions],
  tags: ["Noborito to Yokohama", "urban", "vibes"]
)

# Post 5
processed = process_mentions("Took a scenic route on @[Highway 38] today. @Vincenzo_Garcia, you have to try this one!")
posts << post5 = Post.create!(
  user: eric,
  content: processed[:content],
  mentions: processed[:mentions],
  tags: ["Highway 38", "scenic", "route", "ride"]
)

# Post 6
processed = process_mentions("Enjoyed a peaceful ride along @[W800 Street on Mikuni Pass]. @Ami_Ozaki, this is one for your list!")
posts << Post.create!(
  user: mary,
  content: processed[:content],
  mentions: processed[:mentions],
  tags: ["W800 Street", "Mikuni Pass", "peaceful", "ride", "route"]
)

# Post 7
processed = process_mentions("Spent the day riding through @[Ride in Kyushu]. @Mika_Hayashi, you would love the views!")
posts << Post.create!(
  user: angel,
  content: processed[:content],
  mentions: processed[:mentions],
  tags: ["Ride in Kyushu", "views", "day ride"]
)

# Post 8
processed = process_mentions("The @[West Coast of Hokkaido] is a must-ride for any biker. @Bill_Billiards, let's go together next time!")
posts << Post.create!(
  user: hideo,
  content: processed[:content],
  mentions: processed[:mentions],
  tags: ["West Coast of Hokkaido", "must-ride", "biker"]
)

# Post 9
processed = process_mentions("Just had an amazing coffee stop during my ride. @Ami_Ozaki, we need to plan a ride soon!")
posts << Post.create!(
  user: vincenzo,
  content: processed[:content],
  mentions: processed[:mentions],
  tags: ["coffee stop", "ride", "plan", "biker"]
)

# Post 10
processed = process_mentions("Another beautiful day riding through @[Kyushu]. @Hideo_Sato, thanks for the tips on this route!")
posts << Post.create!(
  user: bill,
  content: processed[:content],
  mentions: processed[:mentions],
  tags: ["Kyushu", "beautiful day", "tips", "biker", "route"]
)

puts "Posts created"
puts "Creating comments for posts"

Comment.create!(user: hideo, commentable: posts[0], description: "Glad you enjoyed the ride, Bill!")
Comment.create!(user: eric, commentable: posts[1], description: "Sounds awesome, Mika. I'll definitely check it out.")
Comment.create!(user: mary, commentable: posts[2], description: "That looks amazing, Vincenzo! I'm adding it to my list.")
Comment.create!(user: angel, commentable: posts[3], description: "Definitely, Ami! Let's plan something soon.")
Comment.create!(user: vincenzo, commentable: posts[4], description: "Thanks for the tip, Eric. I'll give it a try next weekend.")
Comment.create!(user: ami, commentable: posts[5], description: "I'll definitely check it out, Mary. Thanks for the suggestion!")
Comment.create!(user: mika, commentable: posts[6], description: "Wow, the views must have been incredible, Angel!")
Comment.create!(user: bill, commentable: posts[7], description: "Let's do it, Hideo! Can't wait for our next ride.")
Comment.create!(user: hideo, commentable: posts[8], description: "Coffee and a ride, count me in, Vincenzo!")
Comment.create!(user: mika, commentable: posts[9], description: "Kyushu is always a great ride. Glad you enjoyed it, Bill!")
Comment.create!(user: mary, commentable: posts[1], description: "Jozankei is one of my favorites too, Mika!")
Comment.create!(user: eric, commentable: posts[6], description: "I've been wanting to ride in Kyushu. Thanks for the inspiration, Angel!")
Comment.create!(user: vincenzo, commentable: posts[3], description: "Urban rides are so much fun. Glad you enjoyed it, Ami!")
Comment.create!(user: angel, commentable: posts[5], description: "Mikuni Pass sounds like a peaceful ride. I'll add it to my list!")
Comment.create!(user: ami, commentable: posts[0], description: "Nakayama Pass is a gem! Thanks for sharing, Bill.")

puts 'updating comments count...'

posts.each do |post|
  post.update_column(:comments_count, post.comments.size)
end

puts 'favorite posts...'

users = [bill, hideo, mika, eric, mary, angel, vincenzo, ami]
posts.each_with_index do |post, index|
  user = users[index % users.size]
  user.favorite(post)
  puts "User #{user.username} favoritou o post ID: #{post.id}"
end

users.each do |user|
  posts.sample(7).each do |post|
    unless post.favorited_by?(user)
      user.favorite(post)
      puts "User #{user.username} favoritou o post ID: #{post.id}"
    end
  end
end

posts.each do |post|
  favorites_count = Favorite.where(favoritable: post).count
  post.update_column(:likes_count, favorites_count)
  puts "Post ID: #{post.id}, Likes: #{favorites_count}"
end

puts 'attaching photos to posts...'

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926724/nakayama_jmgip6_uj0xth.jpg")
post1.images.attach(
  io: file,
  filename: "post nakayama_pass",
  content_type: "image/jpg"
)

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926717/jozankei_guuq2s_bw4l9e.jpg")
post2.images.attach(
  io: file,
  filename: "post jozankei",
  content_type: "image/jpg"
)

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926728/ocean_y0fdqn_dxirgq.jpg")
post3.images.attach(
  io: file,
  filename: "post ocean_drive",
  content_type: "image/jpg"
)

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926725/noborito_a9eebx_cdp1gv.jpg")
post4.images.attach(
  io: file,
  filename: "post noborito",
  content_type: "image/jpg"
)

file = URI.open("https://res.cloudinary.com/dpktcdaku/image/upload/v1724926716/highway38_zanqdw_lekuhu.jpg")
post5.images.attach(
  io: file,
  filename: "post highway_38",
  content_type: "image/jpg"
)

puts "Seeding Complete"
