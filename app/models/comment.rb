class Comment < ApplicationRecord
  belongs_to :route_id
  belongs_to :user_id
end
