class CreateListEpisodes < ActiveRecord::Migration
  def change
    create_table :list_episodes do |t|
      t.belongs_to :list
      t.belongs_to :episode
      t.integer :ranking

      t.timestamps null: false
    end
  end
end
