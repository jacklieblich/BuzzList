class AddThumbnailToShows < ActiveRecord::Migration
  def change
    add_column :shows, :thumbnail, :string
  end
end
