class AddFollowsIndices < ActiveRecord::Migration
  def change
    add_index :follows, [:inbound_user_id, :outbound_user_id]
  end
end
