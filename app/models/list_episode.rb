class ListEpisode < ActiveRecord::Base
  include PublicActivity::Model
  tracked except: :destroy, owner: ->(controller, model) { controller && controller.current_user }
  belongs_to :list
  belongs_to :episode
end
