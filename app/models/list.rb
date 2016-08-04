class List < ActiveRecord::Base
  belongs_to :user
  belongs_to :show
  has_many :list_episodes
  has_many :episodes, through: :list_episodes
  
end
