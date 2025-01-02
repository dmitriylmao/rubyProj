# frozen_string_literal: true

class BooksController < ApplicationController
  def new

  end

  def index
    @books = Book.all
  end
  def create
    found_book = Book.find_by_name(book_params[:name])
    if !found_book.nil? && found_book.author == book_params[:author]
      found_book.count += book_params[:count].to_i
      if found_book.save
        redirect_to admin_dashboard_path
      else
        redirect_to admin_dashboard_new_book_path
      end
      return
    end
    new_book = Book.new(book_params)
    if new_book.save
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
