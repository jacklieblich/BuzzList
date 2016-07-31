class AddRatingToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :rating, :string
  end
end
