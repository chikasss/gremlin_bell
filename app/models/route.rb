class Route < ApplicationRecord
  #after_validation :geocode, if: :will_save_change_to_waypoints?

  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :landmarks, dependent: :destroy
  acts_as_favoritable
  has_many_attached :photos

  RIDE_TYPE = ["Mountainous", "Trail", "Urban", "Scenic", "Calm", "Coastal", "Twisty", "Day Trip", "Long and Straight", "Other"]
  ROAD_CONDITION = ["Paved", "Gravel", "Dirt", "Poor", "Construction"]
  RECOMENDED_BIKES = ["Cruiser", "Touring", "Sport Bike", "Standard", "Dual Sport", "ADV", "Adventure", "Naked"]

  PREFECTURES = [
    'Hokkaido', 'Aomori', 'Akita', 'Iwate', 'Yamagata', 'Miyagi', 'Niigata', 'Fukushima', 'Tochigi',
    'Gunma', 'Ibaraki', 'Chiba', 'Kanagawa', 'Tokyo', 'Saitama', 'Yamanashi', 'Nagano', 'Toyama', 'Ishikawa', 'Fukui',
    'Gifu', 'Aichi', 'Shizuoka', 'Shiga', 'Mie', 'Kyoto', 'Nara', 'Wakayama', 'Osaka', 'Hyogo', 'Tottori',
    'Okayama', 'Hiroshima', 'Shimane', 'Yamaguchi', 'Tokushima', 'Kagawa', 'Ehime', 'Kochi', 'Fukuoka',
    'Oita', 'Saga', 'Miyazaki', 'Kumamoto', 'Nagasaki', 'Kagoshima', 'Okinawa'
  ]

  validates :ride_type, inclusion: { in: RIDE_TYPE }
  validates :prefecture, inclusion: { in: PREFECTURES }
  validates :recomended_bikes, inclusion: { in: RECOMENDED_BIKES }

  def average_rating
    reviews.average(:rating).to_f.round(2)
  end

end
