class AddKarmaPointsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :karma_points, :integer
  end
end
