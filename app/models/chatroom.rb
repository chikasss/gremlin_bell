class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user
  belongs_to :recipient, class_name: 'User', optional: true 
  before_save :generate_slug
  validates :slug, uniqueness: true

  private

  def generate_slug
    self.slug = name.parameterize if name.present? && slug.blank?
  end
end
