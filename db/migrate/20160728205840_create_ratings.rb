class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.belongs_to :show
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
