class User < ActiveRecord::Base
  attr_accessible :id, :username, :region_name, :password, :password_confirmation, :email, :cooking_history, :favourite_spices, :date_of_birth, :image, :admin
  validates_uniqueness_of :username, :email
  validates_presence_of :email


  has_many :comments, :dependent => :destroy
  belongs_to :region
  has_many :recipes, :dependent => :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  has_attached_file :image,                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
  :path => ":attachment/:id.:extension",
  :bucket => "foodie_europe"



  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end



  def feed
    Recipe.from_users_followed_by(self)
  end


end
