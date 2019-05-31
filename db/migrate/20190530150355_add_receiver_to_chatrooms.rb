class AddReceiverToChatrooms < ActiveRecord::Migration[5.2]
	def change
		add_column :chatrooms, :receiver_id, :integer
		add_foreign_key :chatrooms, :users, column: "receiver_id"
	end
end
