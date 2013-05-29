class Recipe < ActiveRecord::Base
  attr_accessible :ingredients, :step_one, :step_two, :step_three, :name, :username, :user_id, :image, :gluten_free, :dairy_free, :low_fat

  belongs_to :user

  has_many :comments, :order => "created_at", :dependent => :destroy

  has_attached_file :image


  def self.search(search_query)
    if search_query
      find(:all, :conditions => ['ingredients LIKE ?', "%#{ search_query}%"])
    else
      find(:all)
    end
  end

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
  WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end









end
