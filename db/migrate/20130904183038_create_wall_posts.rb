class CreateWallPosts < ActiveRecord::Migration
  def change
    create_table :wall_posts do |t|
      t.integer :author_id
      t.integer :recipient_id
      t.text :body

      t.timestamps
    end
    add_index :wall_posts, [:author_id, :recipient_id]
  end
end
