class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user
  belongs_to :recipient, class_name: 'User'
  before_validation :set_default_name, on: :create
  validates :slug, uniqueness: true
  validates :name, presence: true
  before_validation :generate_unique_slug, on: :create

  def unread_messages_count(user)
    messages.where(read_at: nil).where.not(user_id: user.id).count
  end

  def recipient(current_user = self.user)
    self.user == current_user ? User.find(self.recipient_id) : self.user
  end
  
  private

  def set_default_name
    if self.name.blank?
      self.name = "Chatroom with #{recipient.username}"
    end
  end

  def generate_unique_slug
    return if slug.present?

    recipient = self.recipient
    base_slug = "#{recipient.username}-chat".parameterize
    slug = base_slug
    count = 1

    while Chatroom.exists?(slug: slug)
      slug = "#{base_slug}-#{count}"
      count += 1
    end

    self.slug = slug
  end
end
