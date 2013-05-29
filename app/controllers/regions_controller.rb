class RegionsController < ApplicationController
  def index
  end

  def show
    @region = Region.find(params[:id])
    @title = "#{@region.region_name}"
    @users = User.find(:all, :conditions => { :region_name => @region.region_name })






  end

  def edit
  @title = "Edit Region"
  @region = Region.find(params[:id])
  end

  def update
    @region = Region.find(params[:id])

    @region.update_attributes(params[:region])
    if @region.save
       redirect_to @region, :notice => 'Region Was edited successfully'
    else
      redirect_to region_edit_url :notice => 'Region Was not edited'
    end
  end
end
