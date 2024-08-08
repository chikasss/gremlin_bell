class Review < ApplicationRecord
  belongs_to :route
  belongs_to :user
  belongs_to :bike

  validates :date, :title, :description, :rating, :road_condition, presence: true
end
