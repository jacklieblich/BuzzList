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
      
      if params[:season_id] == nil
        params[:season_id] = @seasons
      end
      
      episodes = Episode.where(season_id: params[:season_id])
      
      if params[:items] == 'quotes'
        @items = Quote.where(episode_id: episodes)
        if params[:season_id].class != String
          @items = @items.sort_by { |quote| quote.likes.count }
            
        end
        else
          if params[:items] == 'clips'
            @items = Clip.where(episode_id: episodes)
            if params[:season_id].class != String
              @items = @items = @items.sort_by { |clip| clip.likes.count }
            end
            else
              @items = episodes
              if params[:season_id].class != String
                @items = @items.order('episodes.buzzlisted DESC').first(10)
              end
          end
      end
  end
end
