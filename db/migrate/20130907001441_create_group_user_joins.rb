class CreateGroupUserJoins < ActiveRecord::Migration
  def change
    create_table :group_user_joins do |t|
      t.integer :group_id
      t.integer :user_id

      t.timestamps
    end
    add_index :group_user_joins, [:group_id, :user_id]
  end
end
