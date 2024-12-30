# frozen_string_literal: true

class AdminDashboardController < ApplicationController
  def index
     user_id = session[:current_user]
     user = User.find_by_id(user_id)
     if !user.present? || User.find_by_id(user_id).role != UsersController::Roles::ADMIN
       redirect_to "/register"
     end
  end
end
