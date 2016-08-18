class EpisodesController < ApplicationController
    def show
      @episode = Episode.find(params[:id])
      items = @episode.quotes + @episode.clips
      @items = items.sort_by{ |item| item.likes.count }.reverse
    end
end
