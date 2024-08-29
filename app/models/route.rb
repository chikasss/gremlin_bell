class Route < ApplicationRecord
  #after_validation :geocode, if: :will_save_change_to_waypoints?

  belongs_to :user

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, as: :favoritable, dependent: :destroy
  has_many :landmarks, dependent: :destroy
  accepts_nested_attributes_for :landmarks, allow_destroy: true
  acts_as_favoritable
  has_many :photos, dependent: :destroy

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

  BIKE_IMAGES = {
    "Sport Bike" => "recomended_bikes/sport_bike.png",
    "Standard" => "recomended_bikes/standard_bike.png",
    "Touring" => "recomended_bikes/touring_bike.png",
    "Dual Sport" => "recomended_bikes/dual_sport_bike.png",
    "ADV" => "recomended_bikes/ADV_bike.png",
    "Adventure" => "recomended_bikes/adventure_bike.png",
    "Naked" => "recomended_bikes/naked_bike.png",
    "Cruiser" => "recomended_bikes/cruiser_bike.png"
  }

  validates :ride_type, inclusion: { in: RIDE_TYPE }
  validates :prefecture, inclusion: { in: PREFECTURES }
  validates :recomended_bikes, presence: true
  before_save :ensure_recomended_bikes_is_array

  def average_rating
    reviews.average(:rating).to_f.round(2)
  end

  private

  def ensure_recomended_bikes_is_array
    if self.recomended_bikes.is_a?(String)
      self.recomended_bikes = self.recomended_bikes.gsub(/[\{\}]/, '').split(',').map(&:strip)
    end

    self.recomended_bikes.reject!(&:blank?)

  end
end
