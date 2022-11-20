class RemoveIntrodutionFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :introdution, :text
  end
end
