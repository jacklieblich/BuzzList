class LikesController < ApplicationController
before_action :require_login

  def create
    @like = current_user.likes.create(likable_type: params[:likable_type], likable_id: params[:likable_id], viewed: false)
  end
  
  def destroy
    @like = Like.find(params[:id])
    @like.destroy
  end
end
