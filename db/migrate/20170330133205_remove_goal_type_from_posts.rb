class RemoveGoalTypeFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :goal_type, :string
  end
end
