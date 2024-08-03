class CreateRoutes < ActiveRecord::Migration[7.1]
  def change
    create_table :routes do |t|
      t.string :title
      t.text :description
      t.string :ride_type
      t.float :waypoints
      t.string :videos_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
