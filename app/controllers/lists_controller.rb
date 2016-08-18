class ListsController < ApplicationController

  def index
    @lists = List.where(user_id: current_user.id)
  end
  
  def show
    @list = List.find(params[:id])
    @list_episodes = @list.list_episodes.order('ranking')
  end
  
  def destroy
    @list = List.find(params[:id])
    @activity = PublicActivity::Activity.find_by(trackable: @list)
    @activity.destroy
    @list.destroy
    redirect_to(:back)
  end
  
end