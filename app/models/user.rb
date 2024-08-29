class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  acts_as_favoritor
  has_many :routes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bikes, dependent: :destroy
  has_many :routes
  has_many :reviews
  has_many :comments, dependent: :destroy
  has_many :messages
  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  has_one_attached :avatar

  validates :username, :first_name, :prefecture, presence: true
  validates :email, uniqueness: true
  validates :username, uniqueness: true, length: { in: 3..20 }

  PREFECTURES = [
    'Hokkaido', 'Aomori', 'Akita', 'Iwate', 'Yamagata', 'Miyagi', 'Niigata', 'Fukushima', 'Tochigi',
    'Gunma', 'Ibaraki', 'Chiba', 'Tokyo', 'Saitama', 'Yamanashi', 'Nagano', 'Toyama', 'Ishikawa', 'Fukui',
    'Gifu', 'Aichi', 'Shizuoka', 'Shiga', 'Mie', 'Kyoto', 'Nara', 'Wakayama', 'Osaka', 'Hyogo', 'Tottori',
    'Okayama', 'Hiroshima', 'Shimane', 'Yamaguchi', 'Tokushima', 'Kagawa', 'Ehime', 'Kochi', 'Fukuoka',
    'Oita', 'Saga', 'Miyazaki', 'Kumamoto', 'Nagasaki', 'Kagoshima', 'Okinawa', 'Kanagawa'
  ]

  PREFECTURES_HASH = {
    Hokkaido: ['Hokkaido'],
    Tohoku: ['Aomori', 'Akita', 'Iwate', 'Yamagata', 'Miyagi', 'Fukushima'],
    Kanto: ['Tochigi', 'Gunma', 'Ibaraki', 'Chiba', 'Tokyo', 'Saitama', 'Kanagawa'],
    Chubu: ['Yamanashi', 'Nagano', 'Toyama', 'Ishikawa', 'Fukui', 'Niigata', 'Gifu', 'Aichi', 'Shizuoka'],
    Kansai: ['Shiga', 'Mie', 'Kyoto', 'Nara', 'Wakayama', 'Osaka', 'Hyogo'],
    Chugoku: ['Tottori', 'Okayama', 'Hiroshima', 'Shimane', 'Yamaguchi'],
    Shikoku: ['Tokushima', 'Kagawa', 'Ehime', 'Kochi'],
    Kyushu: ['Fukuoka', 'Oita', 'Saga', 'Miyazaki', 'Kumamoto', 'Nagasaki', 'Kagoshima'],
    Okinawa: ['Okinawa']
  }

  REGIONS = [
    'Hokkaido', 'Tohoku', 'Kanto', 'Chubu', 'Kansai', 'Chugoku', 'Shikoku', 'Kyushu', 'Okinawa'
  ]
  def capitalize_name
    self.first_name = first_name.capitalize if first_name.present?
    self.last_name = last_name.capitalize if last_name.present?
  end

  def following?(user)
    following.include?(user)
  end

  def favorited_routes
    Route.joins(:favorites)
         .where(favorites: { favoritor_id: id, favoritor_type: 'User' })
  end
end
