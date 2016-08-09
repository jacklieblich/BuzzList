class StaticPagesController < ApplicationController
  def home
    if logged_in?
    @feed_items = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.following_ids, owner_type: "User")
    end
  end
end
