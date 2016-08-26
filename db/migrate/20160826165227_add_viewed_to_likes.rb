class AddViewedToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :viewed, :boolean
  end
end
