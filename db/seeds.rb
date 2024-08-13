# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Deleting Routes"
Route.destroy_all

puts "Deleting Users"
User.destroy_all

puts 'Creating admin user...'

admin = User.create!(
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
  about: "Hi! I'm Ami. I spend most of the warm months on my bike.",
  prefecture: "Kanagawa",
  social_links: { twitter: "twitter.com/notatallarealpageforami", facebook: "facebook.com/notatallarealpageforami", instagram: "instagram.com/notatallarealpageforami", youtube: "youtube.com/notatallarealpageforami", tiktok: "tiktok.com/notatallarealpageforami"},
)

puts "Users created"

puts "Creating bikes"

admin_bikes = Bike.create!(
  name: 'ADMIN',
  year: 2024,
  brand: 'ADMIN',
  user: admin
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

puts "Bikes created"

puts "Attaching bike photos to Bikes"

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723270682/Z900_bill_bike_bnw7yx.webp")

bill_bikes.photos.attach(
  io: file,
  filename: "bill_bike",
  content_type: "image/jpg"
)
bill_bikes.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723270686/XL1200R_hideo_bike_atoc33.png")

hideo_bikes.photos.attach(
  io: file,
  filename: "hideo_bike",
  content_type: "image/jpg"
)
hideo_bikes.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723270682/GL1500_mike_bike_mpcigh.jpg")

mika_bikes.photos.attach(
  io: file,
  filename: "mika_bike",
  content_type: "image/jpg"
)
mika_bikes.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723270683/VMAX_eric_bike_iudh6b.jpg")

eric_bikes.photos.attach(
  io: file,
  filename: "eric_bike",
  content_type: "image/jpg"
)
eric_bikes.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723270680/GL1500_eric_bike2_gkgc2v.jpg")

eric_bikes2.photos.attach(
  io: file,
  filename: "eric_bike2",
  content_type: "image/jpg"
)
eric_bikes2.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723270688/XL1200R_eric_bike3_ln2mkv.jpg")

eric_bikes3.photos.attach(
  io: file,
  filename: "eric_bike3",
  content_type: "image/jpg"
)
eric_bikes3.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723270684/Z900_eric_bike4_kbryde.jpg")

eric_bikes4.photos.attach(
  io: file,
  filename: "eric_bike4",
  content_type: "image/jpg"
)
eric_bikes4.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723270687/Trail125_mary_bike_eekx21.jpg")

mary_bikes.photos.attach(
  io: file,
  filename: "mary_bike",
  content_type: "image/jpg"
)
mary_bikes.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723270685/Z900_mary_bike2_slozex.webp")

mary_bikes2.photos.attach(
  io: file,
  filename: "mary_bike2",
  content_type: "image/jpg"
)
mary_bikes2.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723270683/VMAX_angel_bike_ckebu8.jpg")

angel_bikes.photos.attach(
  io: file,
  filename: "angel_bike",
  content_type: "image/jpg"
)
angel_bikes.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723270681/Z900_vincenzo_bike_syrsgb.jpg")

vincenzo_bikes.photos.attach(
  io: file,
  filename: "vincenzo_bike",
  content_type: "image/jpg"
)
vincenzo_bikes.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723270686/250TR_ami_bike_t81mjv.jpg")

ami_bikes.photos.attach(
  io: file,
  filename: "ami_bike",
  content_type: "image/jpg"
)
ami_bikes.save

puts "Photos attached to Bikes"

puts "Attaching avatars to Users"

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723112805/bill_cgxobm.jpg")

bill.avatar.attach(
  io: file,
  filename: "bill_profile",
  content_type: "image/jpg"
)
bill.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723112805/hideo_qw2ipi.jpg")

hideo.avatar.attach(
  io: file,
  filename: "hideo_profile",
  content_type: "image/jpg"
)
hideo.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723112804/mika_GL1500_m6vy8n.jpg")

mika.avatar.attach(
  io: file,
  filename: "mika_profile",
  content_type: "image/jpg"
)
mika.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723112805/eric_wqvp0k.jpg")

eric.avatar.attach(
  io: file,
  filename: "eric_profile",
  content_type: "image/jpg"
)
eric.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723112804/mary_yyp4sm.jpg")

mary.avatar.attach(
  io: file,
  filename: "mary_profile",
  content_type: "image/jpg"
)
mary.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723112804/angel_gr0bov.jpg")

angel.avatar.attach(
  io: file,
  filename: "angel_profile",
  content_type: "image/jpg"
)
angel.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723112805/vincenzo_bcx2gv.jpg")

vincenzo.avatar.attach(
  io: file,
  filename: "vincenzo_profile",
  content_type: "image/jpg"
)
vincenzo.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723112805/ami_rqcvjg.jpg")

ami.avatar.attach(
  io: file,
  filename: "ami_profile",
  content_type: "image/jpg"
)
ami.save

puts "Avatars attached to Users"

puts "Creating routes"

bill_route = Route.create!(
  title: "Nakayama Pass",
  description: "Do you like making your bike go VROOM in tunnels? This route has a ton of em haha.",
  ride_type: ["Scenic"],
  # waypoints: ,
  videos_url: "https://youtu.be/TZezHtKiq-Y?si=fcgT01QuDZ5EkteT",
  user: bill
)

bill_route2 = Route.create!(
  title: "Ocean Drive",
  description: "Beautiful ride along the coast in Hokkaido.",
  ride_type: ["Coastal"],
  # waypoints: ,
  videos_url: "https://www.youtube.com/watch/DuurJdmyMtQ?si=ECtrX_jTUf4q6woY",
  user: bill
)

hideo_route = Route.create!(
  title: "Jozankei",
  description: "Just a calm ride by the tree covered mountains.",
  ride_type: ["Calm", "Mountainous"],
  # waypoints: ,
  videos_url: "https://youtu.be/ddS0POyoErs?si=dvTYyFnwQR7tckzm",
  user: hideo
)

mika_route = Route.create!(
  title: "Kyushu",
  description: "If you're a fan of the ocean, definitely ride here. ",
  ride_type: ["Coastal"],
  # waypoints: ,
  videos_url: "https://youtu.be/oF6xabrZblA?si=3yfWVI3uHowPjAX4",
  user: mika
)

eric_route = Route.create!(
  title: "Highway 38",
  description: "Calm ride surrounded by nature. I recommend going during the autumn months to enjoy various autumn colors. Cops love hanging around here so best not to speed. Small downside, but the view is worth it.",
  ride_type: ["Scenic", "Mountainous"],
  # waypoints: ,
  videos_url: "https://youtu.be/Omf5kd-EK0M?si=B79VP_lMx5YlYbAM",
  user: eric
)

mary_route = Route.create!(
  title: "W800 Street on Mikuni Pass",
  description: "A nice ride with lots of trees surrounding the road. Good ride if you want to just get a good whiff of trees.",
  ride_type: ["Calm", "Scenic"],
  # waypoints: ,
  videos_url: "https://youtu.be/UNK4Zwg6W3E?si=Z-nWMjmrvM6if4sQ",
  user: mary
)

angel_route = Route.create!(
  title: "Ride in Kyushu",
  description: "This is a nice and relaxing ride I took in the summer in Kyushu with a nice mix of urban and nature.",
  ride_type: ["Calm", "Mountainous", "Urban"],
  # waypoints: ,
  videos_url: "https://youtu.be/Hjx9_m2-ItE?si=FjwsTDV4GBQ0V9on",
  user: angel
)

vincenzo_route = Route.create!(
  title: "Ride Along West Coast of Hokkaido",
  description: "I was visiting a friend up in Hokkaido and we went for a ride along the coast. If you're a fan of the ocean, definitely ride here.",
  ride_type: ["Coastal"],
  # waypoints: ,
  videos_url: "https://youtu.be/NFII_nKKB5c?si=HpAm347NhKU1Di7z",
  user: vincenzo
)

ami_route = Route.create!(
  title: "Noborito to Yokohama",
  description: "This is a fun ride that starts in Kawasaki and runs through into Yokohama.",
  ride_type: ["Urban"],
  # waypoints: ,
  videos_url: "https://youtu.be/OpF7UOxqqSU?si=ZIg4BU_kcRwEwEMR",
  user: ami
)

puts "Attaching photo to Routes"

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723267375/bill_route_fsoo9i.jpg")

bill_route.photos.attach(
  io: file,
  filename: "bill_route",
  content_type: "image/jpg"
)
bill_route.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723267375/bill_route2_xx67qj.jpg")

bill_route2.photos.attach(
  io: file,
  filename: "bill_route2",
  content_type: "image/jpg"
)
bill_route2.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723267375/hideo_route_czusnj.jpg")

hideo_route.photos.attach(
  io: file,
  filename: "hideo_route",
  content_type: "image/jpg"
)
hideo_route.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723267375/mika_route_tlwkpy.jpg")

mika_route.photos.attach(
  io: file,
  filename: "mika_route ",
  content_type: "image/jpg"
)
mika_route.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723267376/eric_route_geqdmx.jpg")

eric_route.photos.attach(
  io: file,
  filename: "eric_route",
  content_type: "image/jpg"
)
eric_route.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723267376/eric_route_geqdmx.jpg")

mary_route.photos.attach(
  io: file,
  filename: "mary_route",
  content_type: "image/jpg"
)
mary_route.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723267375/angel_route_o7kll8.jpg")

angel_route.photos.attach(
  io: file,
  filename: "angel_route",
  content_type: "image/jpg"
)
angel_route.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723267375/vincenzo_route_uh5ipa.jpg")

vincenzo_route.photos.attach(
  io: file,
  filename: "vincenzo_route",
  content_type: "image/jpg"
)
vincenzo_route.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723267375/ami_route_exocln.jpg")

ami_route .photos.attach(
  io: file,
  filename: "ami_route ",
  content_type: "image/jpg"
)
ami_route.save

puts "Routes photos attached"

puts "Creating comments"

hideo_to_bill_route = Comment.create!(
  description: "Looks incredible! I'm going to save this and check it out next time I'm in the area. Thanks!",
  route: bill_route,
  user: hideo
)

bill_response_to_hideo = Comment.create!(
  description: "Can't wait to see what you think. Hit me up when you're in the area. Maybe we can ride together.",
  route: bill_route,
  user: bill
)

angel_to_bill_route = Comment.create!(
  description: "Sadly no tunnels by me, but I totally get what you mean lol",
  route: bill_route,
  user: angel
)

bill_response_to_angel = Comment.create!(
  description: "VROOOOOOOOOOM!!!",
  route: bill_route,
  user: bill
)

vincenzo_to_ami_route = Comment.create!(
  description: "Oh wow! I actually live along this route. I've regularly go to Yokohama on the weekends, but I've never gone this way. Looks like fun. I'll check it out this weekend",
  route: ami_route,
  user: vincenzo
)

ami_response_to_vincenzo = Comment.create!(
  description: "Cool! Let me know how it goes.",
  route: ami_route,
  user: ami
)

vincenzo2_to_ami_route = Comment.create!(
  description: "Just finished the ride. It was great. I ended up finding a cafe I hadn't heard of before so I'm glad I checked it out.",
  route: ami_route,
  user: vincenzo
)

mary_to_hideo_route = Comment.create!(
  description: "I just checked out an onsen in the area. Sadly didn't have my bike with me, but I'll save this for next time.",
  route: hideo_route,
  user: mary
)

hideo_response_to_mary = Comment.create!(
  description: "The onsens are so nice there. Hope you enjoyed it.",
  route: hideo_route,
  user: hideo
)

bill_to_mika_route = Comment.create!(
  description: "I visited Hiraodai Karst last summer. Kushitani Cafe Aso is the best!",
  route: mika_route,
  user: bill
)

mika_response_to_bill = Comment.create!(
  description: "It is! Great spot to take a break.",
  route: mika_route,
  user: mika
)

bill_to_eric_route = Comment.create!(
  description: "This looks great! I know someone that lives in the area. I'm gonna let him know about this.",
  route: eric_route,
  user: bill
)

eric_response_to_bill = Comment.create!(
  description: "Wait! Are you friends with Ray? I remember him mentioning he knew a Bill that lives in Hokkaido",
  route: eric_route,
  user: eric
)

bill_to_eric = Comment.create!(
  description: "Ha! Yes, that's him! We went to college together. We got our motorcycle licenses at the same time too!",
  route: eric_route,
  user: bill
)
eric_response_to_bill2 = Comment.create!(
  description: "Small world!",
  route: eric_route,
  user: eric
)

puts "Comments created"

puts "Creating Reviews"

review_for_bill_route = Review.create!(
  date: DateTime.new(2024,8,1,17),
  title: "Small World!",
  description: "This is actually the first ride I've ever gone on that I discovered on Gremlin Bell and had a blast! Believe it or not, I ran into some other Gremlin Bell users while getting gas during this trip haha",
  rating: 5,
  videos_url: "",
  used_bike: "2002 Yamaha VMAX",
  road_condition: "smooth",
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
  road_condition: "smooth",
  route: mary_route,
  bike_id: eric.bikes.first.id,
  user: eric
)

review_for_ami_route = Review.create!(
  date: DateTime.new(2024,8,10,17),
  title: "A chill ride through the cities",
  description: "I normally ride to Yokohama from my home a different way so I figured I switch it up and take this route. Boy was I glad. I'm a big coffee fan and I ended up stumbling across a cafe while riding this route. The name is cafe+cake Baloo. I'm not normally a cake person, but their strawberry shortcake slapped! Thanks Ami for sharing this route!",
  rating: 5,
  videos_url: "",
  used_bike: "2022 Kawasaki Z900",
  road_condition: "smooth",
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
  road_condition: "smooth",
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
  road_condition: "bumpy",
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
  road_condition: "cops",
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
  road_condition: "smooth",
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
  road_condition: "smooth",
  route: hideo_route,
  bike_id: ami.bikes.first.id,
  user: ami
)

review_for_hideo_route2 = Review.create!(
  date: DateTime.new(2024,8,15,17),
  title: "Calm ride with minimal traffic lights. There was some construction with some new signage going up, but it didn't create any traffic",
  description: "There are tunnels! VROOM!",
  rating: 5,
  videos_url: "",
  used_bike: "2004 Yamaha V-MAX",
  road_condition: "construction",
  route: hideo_route,
  bike_id: angel.bikes.first.id,
  user: angel
)

puts "Reviews Created"

puts "Attaching photos to reviews"

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723122229/Review_Bill_Route_bizkh5.jpg")

review_for_bill_route.photos.attach(
  io: file,
  filename: "bill_route_photo",
  content_type: "image/jpg"
)
review_for_bill_route.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723122228/Review_Mary_Route_vqxmhq.jpg")

review_for_mary_route.photos.attach(
  io: file,
  filename: "mary_route_photo",
  content_type: "image/jpg"
)
review_for_mary_route.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723122228/Review_Ami_Route_amsvyg.jpg")

review_for_ami_route.photos.attach(
  io: file,
  filename: "ami_route_photo",
  content_type: "image/jpg"
)
review_for_ami_route.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723122228/Review_Mika_Route_djznvl.jpg")

review_for_mika_route.photos.attach(
  io: file,
  filename: "mika_route_photo",
  content_type: "image/jpg"
)
review_for_mika_route.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723122229/Review_Eric_Route_xoj12h.jpg")

review_for_eric_route.photos.attach(
  io: file,
  filename: "eric_route_photo",
  content_type: "image/jpg"
)
review_for_eric_route.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723122228/Review_Eric_Route2_rso6zl.jpg")

review_for_eric_route2.photos.attach(
  io: file,
  filename: "eric_route_photo2",
  content_type: "image/jpg"
)
review_for_eric_route2.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723122228/Review_Hideo_Route_pxpwms.jpg")

review_for_hideo_route.photos.attach(
  io: file,
  filename: "hideo_route_photo",
  content_type: "image/jpg"
)
review_for_hideo_route.save

file = URI.open("https://res.cloudinary.com/dkoh816xy/image/upload/v1723122228/Review_Hideo_Route2_zwzx0m.jpg")

review_for_hideo_route2.photos.attach(
  io: file,
  filename: "hideo_route_photo2",
  content_type: "image/jpg"
)
review_for_hideo_route2.save

puts "Photos attached to Reviews"

puts "Seeding Complete"
