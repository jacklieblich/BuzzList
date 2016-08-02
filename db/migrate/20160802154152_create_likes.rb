class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :likable, polymorphic: true, index: true
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
