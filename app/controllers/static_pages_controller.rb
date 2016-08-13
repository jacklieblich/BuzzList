class StaticPagesController < ApplicationController
  def home
    if logged_in?
      if current_user.following.any?
        @feed_items = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.following_ids, owner_type: "User")
      else
        @feed_items = PublicActivity::Activity.order("created_at desc")
      end
    end
  end
end
