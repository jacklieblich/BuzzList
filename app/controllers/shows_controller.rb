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
      
      if params[:items] == 'Quote'
        @items = Quote.where(episode_id: episodes)
        if best
          @items = @items.sort_by { |quote| quote.likes.count }
            
        end
        else
          if params[:items] == 'Clip'
            @items = Clip.where(episode_id: episodes)
            if best
              @items = @items.sort_by { |clip| clip.likes.count }
            end
            else
              params[:items] = 'Episode'
              @items = episodes
              if best
                @items = @items.where(buzzlisted: (1..10000).to_a).order('buzzlisted DESC')
              end
          end
      end
  end
end
