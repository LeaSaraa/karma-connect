class AddNeighbourhoodIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :neighbourhood_id, :integer
  end
end
