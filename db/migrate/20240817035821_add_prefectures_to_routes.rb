class AddPrefecturesToRoutes < ActiveRecord::Migration[7.1]
  def change
    add_column :routes, :prefecture, :string
  end
end
