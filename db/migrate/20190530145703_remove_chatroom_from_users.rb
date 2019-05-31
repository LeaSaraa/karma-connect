class RemoveChatroomFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :chatrooms, :user, foreign_key: true
  end
end
