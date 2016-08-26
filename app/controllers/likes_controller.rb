class LikesController < ApplicationController
before_action :require_login

  def create
    @like = current_user.likes.create(likable_type: params[:likable_type], likable_id: params[:likable_id], viewed: false)
  end
  
  def destroy
    @like = Like.find_by(user_id: current_user, likable_type: params[:likable_type], likable_id: params[:likable_id])
    @like.destroy
  end
end
