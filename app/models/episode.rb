class Episode < ActiveRecord::Base
  default_scope { order('episode_number ASC') }
  belongs_to :season
  has_many :quotes
  has_many :clips
  has_many :list_episodes
  has_many :lists, through: :list_episodes
  
  def episode_for_select
    " Episode #{episode_number} #{title}"
  end
end
