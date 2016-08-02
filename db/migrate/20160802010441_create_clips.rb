class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.belongs_to :user
      t.belongs_to :episode
      t.string :title
      t.string :video_id

      t.timestamps null: false
    end
  end
end
