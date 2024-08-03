class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.text :description
      t.references :sender_id, null: false, foreign_key: true
      t.references :receiver_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
