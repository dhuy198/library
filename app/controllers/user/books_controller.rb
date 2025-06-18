class User::BooksController < ApplicationController
  before_action :authenticate_user! ,except: [:index]

  def index
    @books = Book.active.page(params[:page]).per(3)
    @user = current_user
    @genres = Genre.joins(:books).merge(Book.active).distinct
    @books_rating = Book.left_joins(:ratings)
      .select('books.*,AVG(ratings.star) AS avg')
      .group('books.id')
      .order('avg DESC')
      .limit(2)

  end

  def show
    @book = Book.includes(ratings: :user).find(params[:id])
    redirect_to user_books_path, alert: "Book not found." unless @book
  end

  

end
