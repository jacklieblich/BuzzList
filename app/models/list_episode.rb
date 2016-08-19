class ListEpisode < ActiveRecord::Base
  include PublicActivity::Model
  tracked except: :destroy, owner: ->(controller, model) { controller && controller.current_user }
  belongs_to :list
  belongs_to :episode
  has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity', dependent: :destroy
  before_destroy :decrement_buzzlisted
  
  protected
  
  def decrement_buzzlisted
    episode.decrement(:buzzlisted)
    episode.save
  end
end
