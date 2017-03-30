class AddTypeGoalToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :type_goal, :string
  end
end
