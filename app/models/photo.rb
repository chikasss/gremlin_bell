class Photo < ApplicationRecord
  belongs_to :route
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
end
