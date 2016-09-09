class RemoveDecimalUidFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :uid, :decimal
  end
end
