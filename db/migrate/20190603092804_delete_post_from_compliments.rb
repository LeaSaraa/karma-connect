class DeletePostFromCompliments < ActiveRecord::Migration[5.2]
  def change
    remove_column :compliments, :post_id, :integer
  end
end
