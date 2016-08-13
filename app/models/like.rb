class Like < ActiveRecord::Base
  include PublicActivity::Model
  tracked except: :destroy, owner: ->(controller, model) { controller && controller.current_user }
  belongs_to :likable, polymorphic: true
  belongs_to :user
  has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity', dependent: :destroy
end
