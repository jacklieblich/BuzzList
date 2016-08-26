class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  
  has_many :ratings, dependent: :destroy
  has_many :quotes, dependent: :destroy
  has_many :clips, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :lists, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity', dependent: :destroy
  has_many :active_tags, class_name: "Tag", foreign_key: "tagger_id", dependent: :destroy
  has_many :passive_tags, class_name: "Tag", foreign_key: "tagged_id", dependent: :destroy
  has_many :taggers, through: :active_tags
  has_many :taggeds, through: :passive_tags 
  has_many :quote_likes, through: :quotes, source: :likes
  has_many :clip_likes, through: :clips, source: :likes
  #has_many :tagged_in_clips, through: :taggeds, source: :clips
  #has_many :tagged_in_quotes, through: :taggeds, source: :quotes

   # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
  
  def self.search(query)
      (where("lower(name) like ?", "%#{query.downcase}%") + where("lower(email) like ?", "%#{query.downcase}%")).uniq
  end

end
