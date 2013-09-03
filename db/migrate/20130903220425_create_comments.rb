class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :author_id
      t.integer :post_id
      t.text :body

      t.timestamps
    end
    add_index :comments, [:author_id, :post_id]
  end
end
