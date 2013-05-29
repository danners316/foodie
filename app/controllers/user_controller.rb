class UserController < ApplicationController
  helper :picture

  def index
  @title = "Users"
  @users = User.order(:username)

    respond_to do |format|
      format.html #index.html.erb
    end
  end

  def show
    @user = User.find(params[:id])
    @title = "Profile for #{@user.username}"

    respond_to do |format|
    format.html # show.html.erb
      end
  end

  def welcome
    @title = "Welcome Your Now a Foodie!"
    end

  def register
    @title = "Register"
    if request.post?
      @user = User.new(params[:user])
      if @user.save
       redirect_to user_welcome_url, :notice => "User #{@user.username} Creation successful"
      else
        redirect_to user_register_url, :notice => 'User Creation is not successful. Again, Your Info'
      end

  end

  end

  def home

    if current_user
      @user = User.find(session[:user_id])
      @title = "#{@user.username}'s Profile"
      @recipes = @user.recipes.paginate(:page => params[:page], :per_page => 2)
      @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 2)
    else
      redirect_to root_path, :notice => 'Please Login To View Your Homepage'

    end


  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end



end

