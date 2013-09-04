class CreateCommentLikes < ActiveRecord::Migration
  def change
    create_table :comment_likes do |t|
      t.integer :user_id
      t.integer :comment_id

      t.timestamps
    end
    add_index :comment_likes, [:user_id, :comment_id]
  end
end
