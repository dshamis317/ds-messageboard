class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Signed in as #{user.name}"
    else
      redirect_to login_path, alert: "Log-In failed, please try again."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out."
  end
end
