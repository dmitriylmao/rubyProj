# frozen_string_literal: true

class OperationsController < ApplicationController

  def new

  end

  def create
    book = Book.find_by_id(params[:book_id])
    book.count -= 1
    user = User.find_by_email(operation_params[:email])

    if user.nil? || book.nil?
      redirect_to admin_dashboard_give_out_book_path(params[:book_id])
      return
    end

    operation = Operation.new
    operation.user = user.id
    operation.book = book.id
    operation.took = Time.zone.now

    if book.count >= 0 && book.save
      if operation.save
        redirect_to admin_dashboard_all_books_path
      else
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
