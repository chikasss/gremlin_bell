class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user
  belongs_to :recipient, class_name: 'User', optional: true 
  before_validation :set_default_name, on: :create
  validates :slug, uniqueness: true
  validates :name, presence: true

  def unread_messages_count(user)
    messages.unread_by_user(user).count
  end

  private

  def set_default_name
    if self.name.blank?
      self.name = "Chatroom with #{recipient.first_name}"
    end
  end
end
