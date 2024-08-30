class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  validates :description, presence: true
  scope :unread_by_user, ->(user) { where(read_at: nil).where.not(user_id: user.id) }
end
