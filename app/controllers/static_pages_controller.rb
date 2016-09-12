class StaticPagesController < ApplicationController
  require 'will_paginate/array'
  
  def home
    if logged_in?

      @feed_items = PublicActivity::Activity.where(trackable_type: ["Clip", "Quote"]).order("created_at desc").paginate(page: params[:all_feed], per_page: 15)
      @friend_feed_items = PublicActivity::Activity.where(owner_id: current_user.following_ids, owner_type:"User").paginate(page: params[:my_feed], per_page: 15).order("created_at desc")
      @likes = (current_user.quote_likes.where.not(user_id: current_user) + current_user.clip_likes.where.not(user_id: current_user)).sort_by{|like| [like.viewed ? 0 : 1, like.created_at]}.reverse.paginate(page: params[:likes], per_page: 5)
      @tagged_in = current_user.passive_tags.order("viewed, created_at desc").paginate(page: params[:shared], per_page: 5)
    else
      @feed_items = PublicActivity::Activity.where(trackable_type: ["Clip", "Quote"]).order("created_at desc").paginate(page: params[:all_feed], per_page: 20)
    end
    if params[:search]
      @shows = Show.search(params[:search])
    else
      @shows = Show.order('shows.title').all
    end
  end
end
