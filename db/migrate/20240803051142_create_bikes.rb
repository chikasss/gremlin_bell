class CreateBikes < ActiveRecord::Migration[7.1]
  def change
    create_table :bikes do |t|
      t.string :name
      t.integer :year
      t.string :brand
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
