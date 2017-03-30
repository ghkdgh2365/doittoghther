class AddGoalTypeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :goal_type, :boolean
  end
end
