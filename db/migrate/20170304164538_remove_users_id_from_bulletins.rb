class RemoveUsersIdFromBulletins < ActiveRecord::Migration
  def change
    remove_reference :bulletins, :users, index: true, foreign_key: true
  end
end
