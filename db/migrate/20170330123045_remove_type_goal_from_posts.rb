class RemoveTypeGoalFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :type_goal, :string
  end
end
