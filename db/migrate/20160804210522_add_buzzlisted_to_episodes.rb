class AddBuzzlistedToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :buzzlisted, :integer
  end
end
