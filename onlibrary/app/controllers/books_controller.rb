# frozen_string_literal: true

class BooksController < ApplicationController
  def new

  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to admin_dashboard_path
    else
      redirect_to admin_dashboard_new_book_path
    end
  end

  private
  def book_params
    params.require(:book)
          .permit(:name, :author, :count)
  end
end
