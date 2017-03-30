class AddSupportAgreeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :support_agree, :boolean
  end
end
