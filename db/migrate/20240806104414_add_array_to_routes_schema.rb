class AddArrayToRoutesSchema < ActiveRecord::Migration[7.1]
  def change
    change_table :routes do |t|
      t.remove :ride_type
      t.string :ride_type, array: true
    end
  end
end
