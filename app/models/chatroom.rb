class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user
  belongs_to :recipient, class_name: 'User', optional: true 
  before_validation :set_default_name, on: :create
  # before_save :generate_slug
  validates :slug, uniqueness: true
  validates :name, presence: true

  private

  def generate_slug
    self.slug = name.parameterize if name.present? && slug.blank?
  end

  def set_default_name
    if self.name.blank?
      self.name = "Chatroom with #{recipient.first_name}"
    end
  end
end
