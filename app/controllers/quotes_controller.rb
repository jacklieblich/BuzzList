class QuotesController < ApplicationController
before_action :require_login

  def new
    @quote = Quote.new
    @show = Show.find(params[:show])
    @episode = params[:episode]
  end
  
  def create
    @quote = current_user.quotes.create(quote_params)
    
    respond_to do |format|
      format.html { redirect_to Episode.find(@quote.episode_id) }
      format.js
    end
  end
  
  def destroy
    @quote = Quote.find(params[:id])
    @id = @quote.id
    @quote.destroy
    
    respond_to do |format|
      format.html { redirect_to (:back) }
      format.js
    end
  end
  
  private
  
  def quote_params
    params.require(:quote).permit(:content, :user_id, :character, :episode_id)
  end
end
