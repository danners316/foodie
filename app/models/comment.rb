class Comment < ActiveRecord::Base
  attr_accessible :body, :created_at, :recipe_id, :user_id, :username

  belongs_to :user
  belongs_to :recipe

end
