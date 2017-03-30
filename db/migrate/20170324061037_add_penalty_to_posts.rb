class AddPenaltyToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :penalty, :string
  end
end
