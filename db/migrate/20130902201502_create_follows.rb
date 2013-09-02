class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :inbound_user_id
      t.integer :outbound_user_id

      t.timestamps
    end
  end
end
