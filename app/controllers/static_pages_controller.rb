class StaticPagesController < ApplicationController
  def home
    if logged_in?
      if params[:feed] == nil
        @feed_items = PublicActivity::Activity.all.paginate(page: params[:page], per_page: 20).order("created_at desc")
      else
        @feed_items = PublicActivity::Activity.where(owner_id: current_user.following_ids, owner_type:"User").paginate(page: params[:page], per_page: 20).order("created_at desc")
      end
    end
    @shows = Show.all
  end
end
