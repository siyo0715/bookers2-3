class RemoveIntrocucutionFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :introducution, :text
  end
end
