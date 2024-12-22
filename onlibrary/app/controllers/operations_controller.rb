# frozen_string_literal: true

class OperationsController < ApplicationController

  def new

  end

  def show
    operations = Operation.where(book: params[:book_id], returned: nil)
    user_ids = operations.pluck(:user)
    @users = User.where(id: user_ids)
    @book = Book.find_by_id(params[:book_id])
  end

  def index
    @book = Book.find_by_id(params[:book_id])
    @user = User.find_by_id(params[:user_id])
  end

  def update
    user = User.find_by_id(params[:user_id])
    book = Book.find_by_id(params[:book_id])

    if user.nil? || book.nil?
      redirect_to admin_dashboard_take_book_path(params[:book_id])
      return
    end

    book.count += 1

    # полагаем, что пользователь не может взять две одинаковые книги
    operations = Operation.where(user: user.id, book: book.id)
    operations.each do |operation|
      operation.update(returned: Time.zone.now)
    end
    book.save
    user.save

    redirect_to admin_dashboard_all_books_path
  end

  def create
    book = Book.find_by_id(params[:book_id])

    user = User.find_by_email(operation_params[:email])

    if user.nil? || book.nil?
      redirect_to admin_dashboard_give_out_book_path(params[:book_id])
      return
    end

    operation = Operation.new
    operation.user = user.id
    operation.book = book.id
    operation.took = Time.zone.now

    if book.count > 0
      begin
        if operation.save
          book.count -= 1
          book.save
          redirect_to admin_dashboard_all_books_path
        else
          redirect_to admin_dashboard_give_out_book_path(book.id)
        end
      rescue
        redirect_to admin_dashboard_give_out_book_path(book.id)
      end
    end
  end

  private
  def operation_params
    params.require(:operation)
          .permit(:email)
  end

end
