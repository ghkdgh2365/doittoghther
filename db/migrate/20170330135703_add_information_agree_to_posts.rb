class AddInformationAgreeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :information_agree, :boolean
  end
end
