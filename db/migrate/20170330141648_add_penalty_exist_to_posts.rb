class AddPenaltyExistToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :penalty_exist, :string
  end
end
