class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  acts_as_favoritor

  has_many_attached :images
  
  def favorite(user)
    unless favorited_by?(user)
      user.favorite(self)
      update_column(:likes_count, likes_count + 1)
    end
  end
  
  def unfavorite(user)
    if favorited_by?(user)
      user.unfavorite(self)
      update_column(:likes_count, likes_count - 1)
    end
  end
  
  def favorited_by?(user)
    Favorite.exists?(favoritor: user, favoritable: self)
  end
end
