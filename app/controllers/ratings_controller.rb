class RatingsController < ApplicationController
  before_action :require_login
  
  def create
    @rating = current_user.ratings.create(show_id: params[:show], rating: params[:rating])
    redirect_to Show.find(params[:show])
  end
  
  def update
    @rating = Rating.find(params[:id])
    @rating.update_attribute(:rating, params[:rating])
    redirect_to Show.find(params[:show])
  end
  
  private
  
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in"
      redirect_to login_path
    end
  end
  
  def set_show
      @show = Show.find(params[:id])
  end
end
