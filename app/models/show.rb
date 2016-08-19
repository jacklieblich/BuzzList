class Show < ActiveRecord::Base
  has_many :seasons, dependent: :destroy
  has_many :ratings, dependent: :destroy  
  
  def self.search(query)
      where("lower(title) like ?", "%#{query.downcase}%")
  end
  
end
