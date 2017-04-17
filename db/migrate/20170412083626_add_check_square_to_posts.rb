class AddCheckSquareToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :check_square, :string, array: true, default: []
    
  end
end
