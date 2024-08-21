class AddRecomendedBikesToRoutes < ActiveRecord::Migration[7.1]
  def change
    add_column :routes, :recomended_bikes, :text, array: true, default: []
  end
end
