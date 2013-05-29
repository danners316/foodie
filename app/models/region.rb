class Region < ActiveRecord::Base
   attr_accessible :id, :region_name, :history, :common_spices, :image


  has_many :users
  has_many :recipes, :through => :users



  has_attached_file :image

end
