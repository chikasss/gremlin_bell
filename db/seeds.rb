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

puts 'Creating user...'

user = User.create!(
  email: 'user@mail.com',
  password: 'user123',
  first_name: 'user',
  last_name: 'User',
  about: 'normal user',
  prefecture: 'Tokyo',
  admin: false
)

puts 'Creating Routes..'

Route.create([
  {
    title: "Scenic Route",
    description: "A beautiful scenic route with incredible views.",
    ride_type: "Mountain",
    waypoints: 5.5,
    videos_url: "https://www.youtube.com/channel/UCVB3cRk7ibGqQ9m1Yda8zvw",
    user_id: user.id
  },
  {
    title: "Forest Trail",
    description: "Challenging trail through dense forest.",
    ride_type: "Trail",
    waypoints: 8.3,
    videos_url: "https://www.youtube.com/channel/UCVB3cRk7ibGqQ9m1Yda8zvw",
    user_id: user.id
  },
  {
    title: "Urban Ride",
    description: "Peaceful ride through city streets.",
    ride_type: "Urban",
    waypoints: 3.2,
    videos_url: "https://www.youtube.com/channel/UCVB3cRk7ibGqQ9m1Yda8zvw",
    user_id: user.id
  }
])
