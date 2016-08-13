class RatingsController < ApplicationController
  before_action :require_login
  
  def create
    @rating = current_user.ratings.create(show_id: params[:show], rating: params[:rating])
    redirect_to Show.find(params[:show])
  end
  
  def update
    @rating = Rating.find(params[:id])
    @activity = PublicActivity::Activity.find_by(trackable: @rating.id)
    PublicActivity::Activity.destroy(@activity)
    @rating.update_attribute(:rating, params[:rating])
    redirect_to Show.find(params[:show])
  end
  
  private
  
  def set_show
      @show = Show.find(params[:id])
  end
end
