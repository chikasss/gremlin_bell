class Landmark < ApplicationRecord
  belongs_to :route
  #validates :name, presence: true
end
