class ShowsController < ApplicationController
    
  def show
      @show = Show.find(params[:id])
      @seasons = @show.seasons
  end
end
