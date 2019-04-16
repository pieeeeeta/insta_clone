class RenameColumnToUserId < ActiveRecord::Migration[5.2]
  def change
    rename_column :likes, :use_id, :user_id
  end
end
