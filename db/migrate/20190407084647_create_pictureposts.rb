class CreatePictureposts < ActiveRecord::Migration[5.2]
  def change
    create_table :pictureposts do |t|
      t.text :content
      t.integer :user_id
      t.string :picture

      t.timestamps
    end
  end
end
