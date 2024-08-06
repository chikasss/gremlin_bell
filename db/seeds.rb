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
  password: 'admin123',  # Assegure-se de usar uma senha segura e real em produção
  first_name: 'Admin',
  last_name: 'User',
  about: 'Administrator of the system',
  prefecture: 'Tokyo',
  admin: true
)
