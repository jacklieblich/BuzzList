class EpisodesController < ApplicationController
    def show
      @episode = Episode.find(params[:id])
      @quotes = @episode.quotes
      @clips = @episode.clips
    end
end
