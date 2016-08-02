class Clip < ActiveRecord::Base
  belongs_to :episode
  belongs_to :user
end
