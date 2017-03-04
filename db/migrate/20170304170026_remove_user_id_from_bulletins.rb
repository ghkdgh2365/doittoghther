class RemoveUserIdFromBulletins < ActiveRecord::Migration
  def change
    remove_reference :bulletins, :user, index: true, foreign_key: true
  end
end
