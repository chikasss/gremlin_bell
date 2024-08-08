class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :routes
  has_many :reviews
  has_many :comments
  acts_as_favoritor

  has_many :routes
  has_many :reviews
  has_many :comments
  has_many :bikes, dependent: :destroy
  acts_as_favoritor

  has_one_attached :avatar

  PREFECTURES = [
    'Hokkaido', 'Aomori', 'Akita', 'Iwate', 'Yamagata', 'Miyagi', 'Niigata', 'Fukushima', 'Tochigi',
    'Gunma', 'Ibaraki', 'Chiba', 'Tokyo', 'Saitama', 'Yamanashi', 'Nagano', 'Toyama', 'Ishikawa', 'Fukui',
    'Gifu', 'Aichi', 'Shizuoka', 'Shiga', 'Mie', 'Kyoto', 'Nara', 'Wakayama', 'Osaka', 'Hyogo', 'Tottori',
    'Okayama', 'Hiroshima', 'Shimane', 'Yamaguchi', 'Tokushima', 'Kagawa', 'Ehime', 'Kochi', 'Fukuoka',
    'Oita', 'Saga', 'Miyazaki', 'Kumamoto', 'Nagasaki', 'Kagoshima', 'Okinawa'
  ]

  def capitalize_name
    self.first_name = first_name.capitalize if first_name.present?
    self.last_name = last_name.capitalize if last_name.present?
  end
end
