class AddNameToLandmarks < ActiveRecord::Migration[7.1]
  def change
    add_column :landmarks, :title, :string
  end
end
