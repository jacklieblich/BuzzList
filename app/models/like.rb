class Like < ActiveRecord::Base
	include PublicActivity::Model
	tracked only: :create, owner: ->(controller, model) { controller && controller.current_user }
	belongs_to :likable, polymorphic: true
	belongs_to :user
	has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity', dependent: :destroy
	after_create :destroy_activity
	
	def mark_viewed
		update_attribute(:viewed, true)
	end

	protected

	def destroy_activity
		if likable.user_id == user_id
			PublicActivity::Activity.find_by(owner: user_id, trackable: self).destroy
		end
	end
end
