class AddIntroductionToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introducution, :text
  end
end
