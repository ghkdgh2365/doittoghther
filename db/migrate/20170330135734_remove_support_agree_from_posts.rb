class RemoveSupportAgreeFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :support_agree, :string
  end
end
