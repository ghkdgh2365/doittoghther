class RemoveInformationAgreeFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :information_agree, :string
  end
end
