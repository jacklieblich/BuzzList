class ListEpisodesController < ApplicationController
before_action :require_login

  def create
    episode = Episode.find(params[:id])
    show = episode.season.show
    list = List.find_or_create_by(user_id: current_user.id, show_id: show.id)
    @list_episode = list.list_episodes.create(episode_id: params[:id], ranking: list.list_episodes.size+1)
    episode = episode.increment(:buzzlisted)
    episode.save
  end
  
  def destroy
    list_episode = ListEpisode.find(params[:id])
    list_episode.destroy
    redirect_to (:back)
  end
  
  def sort
      params[:list_episode].each_with_index do |id, index|
          ListEpisode.update(id, ranking: index+1)
      end
  end
end
