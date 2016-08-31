class StaticPagesController < ApplicationController
  require 'will_paginate/array'
  
  def home
    if logged_in?
      @feed_items = PublicActivity::Activity.where.not(owner_id: current_user).paginate(page: params[:all_feed], per_page: 10).order("created_at desc")
      @friend_feed_items = PublicActivity::Activity.where(owner_id: current_user.following_ids, owner_type:"User").paginate(page: params[:my_feed], per_page: 10).order("created_at desc")
      @likes = (current_user.quote_likes.where.not(user_id: current_user) + current_user.clip_likes.where.not(user_id: current_user)).paginate(page: params[:likes], per_page: 4)
      @tagged_in = current_user.passive_tags.paginate(page: params[:shared], per_page: 4)
    else
      @feed_items = PublicActivity::Activity.all.paginate(page: params[:all_feed], per_page: 10).order("created_at desc")
    end
    if params[:search]
      @shows = Show.search(params[:search])
    else
      @shows = Show.order('shows.title').all
    end
  end
end
