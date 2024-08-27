class UpdateMessagesForChatrooms < ActiveRecord::Migration[7.1]
  def change
    remove_column :messages, :sender_id, :bigint
    remove_column :messages, :receiver_id, :bigint
    add_column :messages, :read_at, :datetime

    add_reference :messages, :chatroom, foreign_key: true, null: false
    add_reference :messages, :user, foreign_key: true, null: false
  end
end
