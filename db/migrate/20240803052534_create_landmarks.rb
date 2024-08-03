class CreateLandmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :landmarks do |t|
      t.text :description
      t.float :long
      t.float :lat

      t.timestamps
    end
  end
end
