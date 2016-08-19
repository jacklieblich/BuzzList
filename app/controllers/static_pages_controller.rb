class StaticPagesController < ApplicationController
  def home
    if logged_in?
      if params[:feed] == nil
        @feed_items = PublicActivity::Activity.order("created_at desc").paginate(page: params[:page], per_page: 20)
      else
        @feed_items = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.following_ids, owner_type:"User").paginate(page: params[:page], per_page: 20)
      end
    end
    @shows = Show.all
  end
end
