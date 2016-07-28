class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :episode_number
      t.string :title
      t.text :summary
      t.belongs_to :season

      t.timestamps null: false
    end
  end
end
