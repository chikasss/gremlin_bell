class AddEverythingToUserModel < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :about, :text
    add_column :users, :prefecture, :string
    add_column :users, :social_links, :json
    add_column :users, :avatar, :string
  end
end
