class AddSenderToChatrooms < ActiveRecord::Migration[5.2]
  def change
    add_column :chatrooms, :sender_id, :integer
    add_foreign_key :chatrooms, :users, column: "sender_id"
  end
end
