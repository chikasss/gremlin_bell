class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :routes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bikes, dependent: :destroy
  has_many :routes
  has_many :reviews
  has_many :comments
  acts_as_favoritor

  has_one_attached :avatar
end
