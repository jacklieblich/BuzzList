class Rating < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
  belongs_to :show
  belongs_to :user
end
