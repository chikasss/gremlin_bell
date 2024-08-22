class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  validates :description, presence: true

  after_create_commit do
    broadcast_append_to chatroom, target: "messages", partial: "messages/message", locals: { message: self }
  end
end
