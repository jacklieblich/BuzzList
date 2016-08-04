class Episode < ActiveRecord::Base
  belongs_to :season
  has_many :quotes
  has_many :clips
  has_many :list_episodes
  has_many :lists, through: :list_episodes
end
