class AddIsConfirmedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :is_confirmed, :integer
  end
end
