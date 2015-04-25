class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :book_id
      t.text :content

      t.timestamps null: false
    end

    add_index :comments, :book_id
  end
end
