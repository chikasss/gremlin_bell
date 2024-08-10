class Bike < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many_attached :photos
end
