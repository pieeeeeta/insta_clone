class AddColumnToPictureposts < ActiveRecord::Migration[5.2]
  def change
    add_column :pictureposts, :likes_count, :integer
  end
end