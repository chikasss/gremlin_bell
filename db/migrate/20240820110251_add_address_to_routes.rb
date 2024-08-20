class AddAddressToRoutes < ActiveRecord::Migration[7.1]
  def change
    add_column :routes, :address, :string
  end
end
