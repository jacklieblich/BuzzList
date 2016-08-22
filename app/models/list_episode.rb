class ListEpisode < ActiveRecord::Base
  include PublicActivity::Model
  tracked except: :destroy, owner: ->(controller, model) { controller && controller.current_user }
  belongs_to :list
  belongs_to :episode
  has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity', dependent: :destroy
  before_destroy :decrement_buzzlisted
  after_update :destroy_activity
  
  protected
  
  def decrement_buzzlisted
    episode.decrement(:buzzlisted)
    episode.save
  end

  def destroy_activity
    if ranking == 1
      activity_id = PublicActivity::Activity.find_by(trackable_id: id, trackable_type: "ListEpisode", key: "list_episode.update").id
      list_update_activities = PublicActivity::Activity.where(key:"list_episode.update")
      list_update_activities.each do |activity|
        if activity.trackable.list_id == list_id && activity.id != activity_id
          activity.destroy
        end
      end
    end
  end
end
