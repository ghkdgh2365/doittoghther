class RemoveUserIdFromBulletins < ActiveRecord::Migration
  def change
    remove_column :bulletins, :user_id, :integer
  end
end
