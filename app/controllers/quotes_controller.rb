class QuotesController < ApplicationController
before_action :require_login
  def new
    @quote = Quote.new
  end
  
  def create
    @quote = current_user.quotes.create(user_params)
    redirect_to Episode.find(@quote.episode_id)
  end
  
  def destroy
    @quote = Quote.find(params[:id])
    #@activities = PublicActivity::Activity.where(trackable: Like.where(likable_id: @quote))
    #PublicActivity::Activity.destroy(@activities.ids)
    @quote.destroy
    redirect_to (:back)
  end
  
  private
  
  def user_params
    params.require(:quote).permit(:content, :user_id, :episode_id, :character)
  end
end
