class ShowsController < ApplicationController
  
  def index
    if params[:search]
      @shows = Show.search(params[:search])
    else
      @shows = Show.order('shows.title').all
    end
  end
    
  def show
      @show = Show.find(params[:id])
      @seasons= @show.seasons
      best = false
      
      if params[:season_id] == nil
        params[:season_id] = @seasons
        best = true
      end
      
      episodes = Episode.where(season_id: params[:season_id])
      
      if params[:items] == 'media'
        items = Quote.where(episode_id: episodes) + Clip.where(episode_id: episodes)
        @items = items.sort_by { |item| item.likes.count }.reverse
        else
          params[:items] = 'Episode'
          @items = episodes
          if best
            #episode.buzzlisted = 0 on creation to work
            @items = @items.sort_by { |episode| episode.buzzlisted }.reverse
          end
      end
  end
end
