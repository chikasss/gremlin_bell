class Bike < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many_attached :photos

  BRAND = [
    "Harley-Davidson", "Triumph", "Kawasaki", "Honda", "Suzuki",
    "Yamaha", "KTM", "Husqvarna", "Mutt", "CF-Moto", "Ducati",
    "Aprillia", "Motoguzzi", "BMW", "Royal Enfield", "Indian",
    "Benelli", "Bimota", "Energica", "Gas Gas", "Zero", "MV Agusta",
    "Arch"
  ]

  validates :brand, inclusion: { in: BRAND }
end
