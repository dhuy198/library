class User::RatingsController < ApplicationController
  before_action :authenticate_user!
  def edit
    @book = Book.find(params[:book_id])
    @rating = @book.ratings.find_by!(user: current_user)
  end

  def new 
    @book = Book.find(params[:book_id])
    @user = current_user
    @rating = Rating.new
  end

  def create
    @book = Book.find(params[:book_id])
    @user = current_user
    @rating = @book.ratings.find_or_initialize_by(user: current_user)
    if @rating.update(rating_params)
      redirect_to user_book_path(@book)
    else
      render :new
    end
  end

  
  private
  def rating_params
    params.require(:rating).permit(:star)
  end
end
