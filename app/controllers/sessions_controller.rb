class SessionsController < ApplicationController
    def create
      @title = 'Login'
      @user = User.new(params[:user])
    user = User.find_by_username_and_password(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to current_user, :notice => "Logged in successfully"
    else
      redirect_to root_path, :notice => "Invalid login/password combination"
          end
  end
  def destroy
    reset_session
    redirect_to root_path, :notice => "You successfully logged
out "
  end
end
