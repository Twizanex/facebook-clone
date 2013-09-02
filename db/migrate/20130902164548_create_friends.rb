class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :friend1_id, :null => false
      t.integer :friend2_id, :null => false

      t.timestamps
    end
  end
end
