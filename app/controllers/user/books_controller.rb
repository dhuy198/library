class User::BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @books = Book.active
  end

  def show
    @book = Book.find_by(id: params[:id], delete_flag: false)
    redirect_to user_books_path, alert: "Book not found." unless @book
  end

  

end
