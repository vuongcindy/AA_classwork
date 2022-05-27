class EditUser < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, :name
    remove_index :users, :email
  end
end
