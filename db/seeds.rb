# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

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

user = User.create!(
  email: 'user@mail.com',
  password: 'user123',
  first_name: 'user',
  last_name: 'User',
  about: 'normal user',
  prefecture: 'Tokyo',
  admin: false
)

route1 = Route.create(
  title: "Scenic Route",
  description: "A beautiful scenic route with incredible views.",
  ride_type: "Mountain",
  waypoints: 5.5,
  videos_url: "https://www.youtube.com/channel/UCVB3cRk7ibGqQ9m1Yda8zvw",
  user_id: user.id
)

# Criação da Forest Trail
route2 = Route.create(
  title: "Forest Trail",
  description: "Challenging trail through dense forest.",
  ride_type: "Trail",
  waypoints: 8.3,
  videos_url: "https://www.youtube.com/channel/UCVB3cRk7ibGqQ9m1Yda8zvw",
  user_id: user.id
)

# Criação da Urban Ride
route3 = Route.create(
  title: "Urban Ride",
  description: "Peaceful ride through city streets.",
  ride_type: "Urban",
  waypoints: 3.2,
  videos_url: "https://www.youtube.com/channel/UCVB3cRk7ibGqQ9m1Yda8zvw",
  user_id: user.id
)

routes = [route1, route2, route3]

# Adicionando reviews
Review.create([
  {
    date: Date.today,
    title: "Amazing Mountain Ride",
    description: "The ride was challenging but the views were worth it!",
    rating: 5,
    videos_url: "http://example.com/review-mountain-ride.mp4",
    used_bike: 'bike.name',
    road_condition: "Good",
    route_id: routes.sample.id,
  },
  {
    date: Date.today - 5,
    title: "Trail Adventure",
    description: "Had a great time navigating the trails, will ride again soon.",
    rating: 4,
    videos_url: "http://example.com/trail-adventure-review.mp4",
    used_bike: 'bike.name',
    road_condition: "Rocky",
    route_id: routes.sample.id,
  }
])
