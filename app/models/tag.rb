class Tag < ActiveRecord::Base
  belongs_to :tagger, class_name: "User"
  belongs_to :tagged, class_name: "User"
  belongs_to :taggable, polymorphic: true

  def mark_viewed
  	update_attribute(:viewed, true)
  end
end
