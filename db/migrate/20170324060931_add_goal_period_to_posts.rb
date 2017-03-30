class AddGoalPeriodToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :goal_period, :integer
  end
end
