class AddPhoneNumberToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :phone_number, :string
  end
end
