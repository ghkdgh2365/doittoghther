class AddGoalCategoryToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :goal_category, :string
  end
end
