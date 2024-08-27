class AddCommentableToComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :commentable, polymorphic: true, index: true
    remove_reference :comments, :route, index: true, foreign_key: true
  end
end
