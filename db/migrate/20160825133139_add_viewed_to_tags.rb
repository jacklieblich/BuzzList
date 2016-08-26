class AddViewedToTags < ActiveRecord::Migration
  def change
    add_column :tags, :viewed, :boolean
  end
end
