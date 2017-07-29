class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :image, :text
    add_column :users, :sex, :string
    add_column :users, :height, :integer
    add_column :users, :body, :string
    add_column :users, :bloodtype, :string
    add_column :users, :occupation, :string
    add_column :users, :area, :string
    add_column :users, :hometown, :string
    add_column :users, :education, :string
    add_column :users, :tobacco, :string
    add_column :users, :hobby, :string
    add_column :users, :nickname, :string
    add_column :users, :age, :integer
    add_column :users, :sibling, :string
    add_column :users, :nationality, :string
    add_column :users, :language, :string
    add_column :users, :introdution, :text
  end
end
