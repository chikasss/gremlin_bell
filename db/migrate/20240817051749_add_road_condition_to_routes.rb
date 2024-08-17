class AddRoadConditionToRoutes < ActiveRecord::Migration[7.1]
  def change
    add_column :routes, :road_condition, :string
  end
end
