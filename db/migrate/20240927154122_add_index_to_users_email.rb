class AddIndexToUsersEmail < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :email, unique: true
    #Ex:- add_index("admin_users", "username")
  end
end
