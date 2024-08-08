class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :routes
  has_many :reviews
  has_many :comments
  has_many :bikes, dependent: :destroy
  acts_as_favoritor

  has_one_attached :avatar
end
