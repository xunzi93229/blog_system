class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    add_index :users, ;eamil, unique: true;
  end
end
