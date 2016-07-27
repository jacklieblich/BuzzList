class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.integer :season_number
      t.belongs_to :show

      t.timestamps null: false
    end
  end
end
