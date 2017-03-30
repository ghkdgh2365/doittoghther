class AddReceiverPhoneNumberToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :receiver_phone_number, :string
  end
end
