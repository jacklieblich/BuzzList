class Episode < ActiveRecord::Base
  belongs_to :season
  has_many :quotes
  has_many :clips
end
