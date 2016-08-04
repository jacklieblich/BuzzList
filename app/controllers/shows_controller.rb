class ShowsController < ApplicationController
  
  def index
    if params[:search]
      @shows = Show.search(params[:search])
    else
      @shows = Show.all
    end
  end
    
  def show
      @show = Show.find(params[:id])
      @seasons = @show.seasons
      @episodes = Episode.where(season_id:@seasons).order('buzzlisted DESC')
  end
end
