class ClipsController < ApplicationController
before_action :require_login

  def new
    @clip = Clip.new
    @show = Show.find(params[:show])
  end
  
  def create
    @clip = current_user.clips.create(user_params)
    respond_to do |format|
      format.html { redirect_to Episode.find(@clip.episode_id) }
      format.js
    end
    
  end
  
  def destroy
    @clip = Clip.find(params[:id])
    @id = @clip.id
    @activities = PublicActivity::Activity.where(trackable: Like.where(likable_id: @clip))
    PublicActivity::Activity.destroy(@activities.ids)
    @clip.destroy
  end
  
  private
  
  def user_params
    params.require(:clip).permit(:video_id, :user_id, :episode_id, :title)
  end
end
