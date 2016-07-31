class Show < ActiveRecord::Base
  has_many :seasons, dependent: :destroy
  has_many :ratings, dependent: :destroy  
  
  def self.search(query)
      where("title like ?", "%#{query}%")
  end
  
end
