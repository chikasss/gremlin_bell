class Landmark < ApplicationRecord
  belongs :route
  validates :name, presence: true
end
