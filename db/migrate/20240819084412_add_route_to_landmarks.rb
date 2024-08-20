class AddRouteToLandmarks < ActiveRecord::Migration[7.1]
  def change
    add_reference :landmarks, :route, null: false, foreign_key: true
  end
end
