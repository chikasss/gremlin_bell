class Route < ApplicationRecord
  #after_validation :geocode, if: :will_save_change_to_waypoints?

  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :landmarks, dependent: :destroy
  acts_as_favoritable
  has_many_attached :photos

  RIDE_TYPE = ["Mountainous", "Trail", "Urban", "Scenic", "Calm", "Coastal", "Twisty", "Day Trip", "Long and Straight", "Other"]
  ROAD_CONDITION = []
  validates :ride_type, inclusion: { in: RIDE_TYPE }

  #uncomment below after you add road_condition for route in seed
  #ROAD_CONDITION = ["Paved", "Gravel", "Dirt", "Poor", "Construction"]
  #validates :road_condition, inclusion: { in: ROAD_CONDITION }

  def average_rating
    reviews.average(:rating).to_f.round(2)
  end

end
