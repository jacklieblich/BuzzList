class Clip < ActiveRecord::Base
  belongs_to :episode
  belongs_to :user
  has_many :likes, as: :likable
end
