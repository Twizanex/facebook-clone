class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :recipient_id
      t.text :body

      t.timestamps
    end
    add_index :messages, [:user_id, :recipient_id]
  end
end
