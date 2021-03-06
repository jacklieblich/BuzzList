class List < ActiveRecord::Base
  include PublicActivity::Model
  tracked except: :destroy, owner: ->(controller, model) { controller && controller.current_user }
  belongs_to :user
  belongs_to :show
  has_many :list_episodes, dependent: :destroy
  has_many :episodes, through: :list_episodes
  has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity', dependent: :destroy
end
