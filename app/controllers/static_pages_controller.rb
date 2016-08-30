class StaticPagesController < ApplicationController
  require 'will_paginate/array'
  
  def home
    if logged_in?
      @feed_items = PublicActivity::Activity.where.not(owner_id: current_user).paginate(page: params[:page], per_page: 10).order("created_at desc")
      @friend_feed_items = PublicActivity::Activity.where(owner_id: current_user.following_ids, owner_type:"User").paginate(page: params[:page], per_page: 10).order("created_at desc")
      @notifications = (current_user.quote_likes + current_user.clip_likes).paginate(page: params[:page], per_page: 4)
      @tagged_in = current_user.passive_tags.paginate(page: params[:page], per_page: 4)
    else
      @feed_items = PublicActivity::Activity.all.paginate(page: params[:page], per_page: 10).order("created_at desc")
    end
    if params[:search]
      @shows = Show.search(params[:search])
    else
      @shows = Show.order('shows.title').all
    end
  end
end
