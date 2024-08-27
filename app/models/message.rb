class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  validates :description, presence: true
  scope :unread_by_user, ->(user) { where(read_at: nil).where.not(user_id: user.id) }

  after_create_commit do
    broadcast_append_to chatroom, target: "messages", partial: "messages/message", locals: { message: self, current_user: self.user }
  end
end
