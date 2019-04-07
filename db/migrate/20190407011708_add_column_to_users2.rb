class AddColumnToUsers2 < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :website, :string
    add_column :users, :self_introduction, :text
    add_column :users, :tel, :string
    add_column :users, :gender, :integer
  end
end
