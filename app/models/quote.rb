class Quote < ActiveRecord::Base
  include PublicActivity::Model
  tracked except: :destroy, owner: ->(controller, model) { controller && controller.current_user }
  belongs_to :episode
  belongs_to :user
  has_many :likes, as: :likable, dependent: :destroy
  has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity', dependent: :destroy
  has_many :tags, as: :taggable, dependent: :destroy
  after_create :like_self

  protected
  def like_self
  	user.likes.create(likable_type: "Quote", likable_id: id, viewed: true)
  end
end
