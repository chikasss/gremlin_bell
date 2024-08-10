class ChangeWaypointsToJsonb < ActiveRecord::Migration[7.1]
  def up
    add_column :routes, :waypoints_temp, :jsonb, default: []

    execute <<-SQL
      UPDATE routes
      SET waypoints_temp = '[]'
    SQL

    remove_column :routes, :waypoints

    rename_column :routes, :waypoints_temp, :waypoints
  end

  def down
    add_column :routes, :waypoints_temp, :float

    execute <<-SQL
      UPDATE routes
      SET waypoints_temp = '0'
    SQL

    remove_column :routes, :waypoints

    rename_column :routes, :waypoints_temp, :waypoints
  end
end
