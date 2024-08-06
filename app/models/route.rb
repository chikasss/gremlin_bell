class Route < ApplicationRecord
  belongs_to :user
  has_many :reviews
  acts_as_favoritable
end
