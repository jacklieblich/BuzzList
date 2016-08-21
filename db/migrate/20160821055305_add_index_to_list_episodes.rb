class AddIndexToListEpisodes < ActiveRecord::Migration
  def change
    add_index :list_episodes , [:episode_id , :list_id] , unique: true
  end
end
