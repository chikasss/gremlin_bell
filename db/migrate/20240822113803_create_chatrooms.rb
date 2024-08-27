class CreateChatrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :chatrooms do |t|
      t.string :name, null: false
      t.references :user, foreign_key: true
      t.references :recipient, foreign_key: { to_table: :users }
      t.boolean :private, default: true
      t.string :slug, null: false

      t.timestamps
    end

    add_index :chatrooms, :slug, unique: true
  end
end
