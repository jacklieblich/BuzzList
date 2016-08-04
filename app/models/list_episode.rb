class ListEpisode < ActiveRecord::Base
  belongs_to :list
  belongs_to :episode
end
