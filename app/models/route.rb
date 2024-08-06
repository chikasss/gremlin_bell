class Route < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many_attached :photos
  
  RIDE_TYPE = ["Mountainous", "Trail", "Urban", "Scenic", "Calm", "Coastal", "Twisty", "Day Trip", "Long and Straight", "Other"].freeze

  validates :ride_type, presence: true
  validates :ride_type, inclusion: { in: RIDE_TYPE }
end
