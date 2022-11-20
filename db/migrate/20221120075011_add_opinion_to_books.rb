class AddOpinionToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :name, :text
  end
end
