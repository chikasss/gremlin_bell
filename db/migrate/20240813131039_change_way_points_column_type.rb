class ChangeWayPointsColumnType < ActiveRecord::Migration[7.1]
  def up
    # Add a temporary column
    add_column :routes, :waypoints_temp, :string, array: true, default: []

    # Convert jsonb arrays and scalar values to string arrays
    execute <<-SQL
      UPDATE routes
      SET waypoints_temp = CASE
        WHEN jsonb_typeof(waypoints) = 'array' THEN
          ARRAY(SELECT jsonb_array_elements_text(waypoints))
        ELSE
          ARRAY[waypoints::text]
      END
    SQL

    # Remove the old column and rename the temporary column
    remove_column :routes, :waypoints
    rename_column :routes, :waypoints_temp, :waypoints
  end

  def down
    # Revert the changes if needed
    add_column :routes, :waypoints_temp, :jsonb, default: []

    # Convert string arrays back to jsonb arrays
    execute <<-SQL
      UPDATE routes
      SET waypoints_temp = jsonb_agg(value::jsonb)
      FROM (SELECT unnest(waypoints) AS value) AS values
      WHERE routes.id = values.id
    SQL

    # Remove the new column and rename the temporary column back to the old name
    remove_column :routes, :waypoints
    rename_column :routes, :waypoints_temp, :waypoints
  end
end
