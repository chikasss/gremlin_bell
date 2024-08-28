class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  # has_many :mentions, class_name: 'User', foreign_key: 'mention_id', dependent: :destroy
  acts_as_favoritor
  # after_create_commit :update_likes_count

  has_many_attached :images

  def favorite(user)
    unless favorited_by?(user)
      user.favorite(self)
      increment!(:likes_count)
      Rails.logger.debug "Likes count incremented: #{likes_count}"
    end
  end
  
  def unfavorite(user)
    if favorited_by?(user)
      user.unfavorite(self)
      decrement!(:likes_count)
      Rails.logger.debug "Likes count decremented: #{likes_count}"
    end
  end
  

  def favorited_by?(user)
    favoritors.exists?(user.id)
  end

  # def update_likes_count
  #   update_column(:likes_count, favorited_by_type('User').count)
  # end
end
