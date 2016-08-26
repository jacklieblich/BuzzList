class Like < ActiveRecord::Base
  include PublicActivity::Model
  tracked only: :create, owner: ->(controller, model) { controller && controller.current_user }
  belongs_to :likable, polymorphic: true
  belongs_to :user
  has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity', dependent: :destroy

  def mark_viewed
  	update_attribute(:viewed, true)
  end
end
