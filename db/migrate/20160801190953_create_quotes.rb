class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.belongs_to :episode
      t.string :character
      t.text :content
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
