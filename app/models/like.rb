class Like < ActiveRecord::Base
  include PublicActivity::Model
  tracked except: :destroy, owner: ->(controller, model) { controller && controller.current_user }
  belongs_to :likable, polymorphic: true, dependent: :destroy
  belongs_to :user, dependent: :destroy
end
