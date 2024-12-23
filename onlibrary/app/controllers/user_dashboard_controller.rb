class UserDashboardController < ApplicationController
  before_action :authenticate_user
  def index

  end

  def show
    operations = Operation.where(user: session[:current_user], returned: nil)
    book_ids = operations.pluck(:book)
    @borrowed_books = Book.where(id: book_ids)
  end

  def all_books
    @books = Book.where("count > ?", 0)
  end

  def history
    operations = Operation.where(user: session[:current_user]).where.not(returned: nil)
    book_ids = operations.pluck(:book)
    @returned_books = Book.where(id: book_ids)
    @operations = Operation.where(user: session[:current_user]).where.not(returned: nil).order(returned: :desc)
  end

end