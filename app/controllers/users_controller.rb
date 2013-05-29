class UsersController < ApplicationController
  helper :picture

  def index
    @title = "Users"
    @users = User.order(:username)

    respond_to do |format|
      format.html #index.html.erb
    end
  end

  def register
    @title = "Register"
    if request.post?
      @user = User.new(params[:user])
      if @user.save
        redirect_to users_welcome_url, :notice => "User #{@user.username} Creation successful"
      else
        redirect_to users_register_url, :notice => 'User Creation is not successful. Again, Your Info'
      end

    end

  end


  def edit
    @user = User.find(params[:id])
  end

  # PUT /users/1
  def update
    @user = User.find(params[:id])

    @user.update_attributes(params[:user])
        if @user.save
        redirect_to @user, :notice => "User #{@user.username} was successfully updated."
         else
        render 'edit'
        end

  end

  def show
    if current_user
    @user = User.find(params[:id])
    @recipes = @user.recipes.order("created_at DESC").all.paginate(:page => params[:recipes_page], :per_page => 2)
    @feed_items = current_user.feed.order("created_at DESC").paginate(page: params[:feed_page], :per_page => 2)
    @followers = @user.followers
    @following = @user.followed_users.paginate(page: params[:friends_page], :per_page => 5)
    else redirect_to site_index_path,
    :notice => 'You must be logged in to view profiles'
    end


  end

  def welcome
    @title = "Welcome Your Now a Foodie!"
  end





  def home
    @title = "Homepage"
    @user = User.find(session[:user_id])
    @recipes = @user.recipes
    @feed_items = current_user.feed.paginate(page: params[:page])
  end

  def following
    @user = User.find(params[:id])
    @users = @user.followed_users
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to user_index_path :notice => 'User was Destroyed'
  end





end

