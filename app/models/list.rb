class List < ActiveRecord::Base
  include PublicActivity::Model
  tracked except: :destroy, owner: ->(controller, model) { controller && controller.current_user }
  belongs_to :user
  belongs_to :show
  has_many :list_episodes
  has_many :episodes, through: :list_episodes
  
end
