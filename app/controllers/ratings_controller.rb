class RatingsController < ApplicationController
  before_action :require_login
  
  def create
    @rating = current_user.ratings.create(show_id: params[:show], rating: params[:rating])
  end
  
  def update
    @rating = Rating.find(params[:id])
    @activity = PublicActivity::Activity.find_by(trackable: @rating.id)
    PublicActivity::Activity.destroy(@activity)
    @rating.update_attribute(:rating, params[:rating])
  end
  
end
