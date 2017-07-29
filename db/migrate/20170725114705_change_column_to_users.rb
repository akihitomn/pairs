class ChangeColumnToUsers < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :name, :string
  end

  def down
    change_column :users, :name, :string, null: false
  end
end
