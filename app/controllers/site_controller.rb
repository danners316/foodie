class SiteController < ApplicationController
  def index
    @title = "Welcome To Foodie!"
  end

  def about
    @title = "All About Foodie!"
  end

end
