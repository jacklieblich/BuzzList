class StaticPagesController < ApplicationController
  def home
    if logged_in?
        @feed_items = PublicActivity::Activity.all.paginate(page: params[:page], per_page: 20).order("created_at desc")
        @friend_feed_items = PublicActivity::Activity.where(owner_id: current_user.following_ids, owner_type:"User").paginate(page: params[:page], per_page: 20).order("created_at desc")
      if params[:search]
        @shows = Show.search(params[:search])
      else
        @shows = Show.order('shows.title').all
      end 
    end
  end
end
