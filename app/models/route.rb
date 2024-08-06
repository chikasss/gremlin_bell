class Route < ApplicationRecord
  RIDE_TYPE = ["Mountainous", "Trail", "Urban", "Scenic", "Calm", "Coastal", "Twisty", "Day Trip", "Long and Straight", "Other"]
  belongs_to :user
  has_many :reviews
end
