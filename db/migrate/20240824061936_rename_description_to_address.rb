class RenameDescriptionToAddress < ActiveRecord::Migration[7.1]
  def change
    rename_column :landmarks, :description, :address
  end
end
