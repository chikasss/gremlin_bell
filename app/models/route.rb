class Route < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many_attached :photos

  RIDE_TYPES = ["Mountainous", "Trail", "Urban", "Scenic", "Calm", "Coastal", "Twisty", "Day Trip", "Long and Straight", "Other"]

  validates :ride_type, inclusion: { in: RIDE_TYPES }
end
