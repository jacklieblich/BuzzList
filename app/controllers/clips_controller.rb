class ClipsController < ApplicationController
before_action :require_login

  def new
    @clip = Clip.new
  end
  
  def create
    @clip = current_user.clips.create(user_params)
    redirect_to Episode.find(@clip.episode_id)
  end
  
  def destroy
    @clip = Clip.find(params[:id])
    @activity = PublicActivity::Activity.find_by(trackable: @clip)
    PublicActivity::Activity.destroy(@activity.id)
    @activities = PublicActivity::Activity.where(trackable: Like.where(likable_id: @clip))
    PublicActivity::Activity.destroy(@activities.ids)
    @clip.destroy
    redirect_to (:back)
  end
  
  private
  
  def user_params
    params.require(:clip).permit(:video_id, :user_id, :episode_id, :title)
  end
end
