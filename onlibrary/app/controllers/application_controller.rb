class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  protected
  def authenticate_user
    redirect_to login_path unless current_user
  end

  def authenticate_admin
    redirect_to login_path unless current_admin
  end

  def current_user
    @current_user ||= User.where(role: UsersController::Roles::USER).find_by_id(session[:current_user])
  end

  def current_admin
    @current_admin ||= User.where(role: UsersController::Roles::ADMIN).find_by_id(session[:current_user])
  end
end
