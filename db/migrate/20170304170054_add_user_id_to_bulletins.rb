class AddUserIdToBulletins < ActiveRecord::Migration
  def change
    add_reference :bulletins, :user, index: true, foreign_key: true
  end
end
