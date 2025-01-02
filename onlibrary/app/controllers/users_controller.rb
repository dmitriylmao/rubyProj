class UsersController < ApplicationController
  def new

  end
  module Roles
    USER = "user"
    ADMIN = "admin"
  end
  def create
    user = User.new(user_params)
    user.role = Roles::USER
    if user.save
      session[:current_user] = user.id
      redirect_to user_dashboard_path
    else
      redirect_to register_path
    end
  end

  def show
    @user = User.find_by_email(params[:email])
  end

  private
  def user_params
    params.require(:user)
          .permit(:username, :email, :password, :password_confirmation)
  end
end
