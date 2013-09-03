class RemoveLikeColumn < ActiveRecord::Migration
  def change
    remove_column :posts, :like_count
  end
end
