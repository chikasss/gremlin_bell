class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.date :date
      t.string :title
      t.text :description
      t.integer :rating
      t.string :videos_url
      t.string :used_bike
      t.string :road_condition
      t.references :route, null: false, foreign_key: true
      t.references :bike, null: false, foreign_key: true

      t.timestamps
    end
  end
end
