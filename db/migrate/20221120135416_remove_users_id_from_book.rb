class RemoveUsersIdFromBook < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :users_id, :string
  end
end
