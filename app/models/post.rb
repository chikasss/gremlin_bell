class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  # has_many :mentions, class_name: 'User', foreign_key: 'mention_id', dependent: :destroy

  has_many_attached :images
end
