class AddCheckerEmailToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :checker_email, :string
  end
end
