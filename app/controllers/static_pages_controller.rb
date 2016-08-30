class StaticPagesController < ApplicationController
  require 'will_paginate/array'
  
  def home
      @feed_items = PublicActivity::Activity.where.not(owner_id: current_user).paginate(page: params[:page], per_page: 10).order("created_at desc")
      if logged_in?
      @friend_feed_items = PublicActivity::Activity.where(owner_id: current_user.following_ids, owner_type:"User").paginate(page: params[:page], per_page: 10).order("created_at desc")
      @notifications = (current_user.quote_likes + current_user.clip_likes).paginate(page: params[:page], per_page: 4)
      @tagged_in = current_user.passive_tags.paginate(page: params[:page], per_page: 4)
    end
    if params[:search]
      @shows = Show.search(params[:search])
    else
      @shows = Show.order('shows.title').all
    end
  end
end
