class AddIndexToLikes < ActiveRecord::Migration
  def change
    add_index :likes, [:user_id, :likable_id, :likable_type], unique: true
  end
end
