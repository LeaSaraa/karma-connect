class AddSenderToCompliments < ActiveRecord::Migration[5.2]
  def change
    add_column :compliments, :sender_id, :integer
    add_foreign_key :compliments, :users, column: "sender_id"
  end
end
