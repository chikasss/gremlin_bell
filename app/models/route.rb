class Route < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many_attached :photos

  RIDE_TYPES = ["Mountain", "Trail", "Urban"]

  validates :ride_type, inclusion: { in: RIDE_TYPES }
end
