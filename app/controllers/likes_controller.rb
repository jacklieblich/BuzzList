class LikesController < ApplicationController
before_action :require_login

  def create
    @like = current_user.likes.create(likable_type: params[:type], likable_id: params[:id])
    redirect_to(:back)
  end
  
  def destroy
    @like = Like.find_by(user_id: current_user, likable_type:params[:type], likable_id: params[:id])
    @activity = PublicActivity::Activity.find_by(trackable: @like)
    @activity.destroy
    @like.destroy
    redirect_to(:back)
  end
end
