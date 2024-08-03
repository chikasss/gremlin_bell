class Message < ApplicationRecord
  belongs_to :sender_id
  belongs_to :receiver_id
end
