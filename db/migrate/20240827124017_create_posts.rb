class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.string :visibility, default: 'public'
      t.string :image_url
      t.integer :likes_count, default: 0
      t.integer :comments_count, default: 0
      t.string :location
      t.string :tags, array: true, default: []
      t.references :parent_post, foreign_key: { to_table: :posts }
      t.string :status, default: 'published'
      t.string :media_url
      t.string :mentions, array: true, default: []

      t.timestamps
    end
  end
end
