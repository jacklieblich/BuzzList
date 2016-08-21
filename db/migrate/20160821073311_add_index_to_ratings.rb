class AddIndexToRatings < ActiveRecord::Migration
  def change
    add_index :ratings , [:show_id , :user_id] , unique: true
  end
end
