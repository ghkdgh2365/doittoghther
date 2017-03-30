class AddGoalCheckerToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :goal_checker, :string
  end
end
