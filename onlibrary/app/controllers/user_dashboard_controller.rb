class UserDashboardController < ApplicationController
  before_action :authenticate_user
  def index

  end

  def show
    #TODO:
    # вернуть список @borrow_books
  end

end