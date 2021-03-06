class ShowsController < ApplicationController
  require 'will_paginate/array'

  def show
    @show = Show.find(params[:id])
    @seasons= @show.seasons
    best = false
    if params[:season_id] == nil
      params[:season_id] = @seasons
      best = true
    end

    if params[:source] == 'tag'
      Tag.find(params[:source_id]).mark_viewed
    else if params[:source] == 'like'
      Like.find(params[:source_id]).mark_viewed
    end
    end


    episodes = Episode.where(season_id: params[:season_id])

    if params[:items] == 'media'
      items = Quote.where(episode_id: episodes) + Clip.where(episode_id: episodes)
      items.shuffle!
      @items = items.sort_by { |item| item.likes.count }.reverse
    else
      params[:items] = 'Episode'
      @items = episodes
      if best
        #episode.buzzlisted = 0 on creation to work
        items = @items.sort_by { |episode| episode.buzzlisted }.reverse
        @items = items.first(15)
      end
    end
  end
end