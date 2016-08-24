class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @feed_items = PublicActivity::Activity.all.paginate(page: params[:page], per_page: 10).order("created_at desc")
      @friend_feed_items = PublicActivity::Activity.where(owner_id: current_user.following_ids, owner_type:"User").paginate(page: params[:page], per_page: 10).order("created_at desc")
      @notifications = PublicActivity::Activity.where(trackable_type: "Like").order("created_at desc").reject {|notification| notification.trackable.likable.user != current_user || notification.owner == current_user}.paginate(page: params[:page], per_page: 5)

    end
    if params[:search]
      @shows = Show.search(params[:search])
    else
      @shows = Show.order('shows.title').all
    end
  end
end
