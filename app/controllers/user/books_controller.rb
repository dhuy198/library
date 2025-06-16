class User::BooksController < ApplicationController
  before_action :authenticate_user! ,except: [:index]

  def index
    @books = Book.active
    @user = current_user

  end

  def show
    @book = Book.includes(ratings: :user).find(params[:id])
    redirect_to user_books_path, alert: "Book not found." unless @book
  end

  

end
